# ft-historical

This is generally meant to be a clone-able copy of exchange data for freqtrade backtesting, primarily meant for use by Github Actions.

```
      - name: Checkout Exchange Data
        uses: actions/checkout@main
        with:
          fetch-depth: 1
          repository: xaemiphor/ft-historical
          ref: "data/${{ matrix.exchange || 'binanceus' }}/${{ matrix.stake | 'USDT' }}/${{ matrix.timerange || '202412' }}"
          path: user_data/data/${{ matrix.exchange || 'binanceus' }}
```

Additionally, can be used locally
```
git clone --depth 1 --branch data/${EXCHANGE:-binanceus}/${STAKE:-USDT}/${TIMERANGE:-202412} https://github.com/xaemiphor/ft-historical.git user_data/data/${EXCHANGE:-binanceus}-${TIMERANGE:-202412}
```

The automation runs daily at UTC 00:00 to update the current month.
