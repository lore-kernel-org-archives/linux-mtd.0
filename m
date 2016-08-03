Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUvLw-0005pF-1x
 for linux-mtd@lists.infradead.org; Wed, 03 Aug 2016 12:32:52 +0000
Date: Wed, 3 Aug 2016 15:32:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: yongjun_wei@trendmicro.com.cn
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [bug report] mtd: nand: omap2: fix return value check in
 omap_nand_probe()
Message-ID: <20160803123218.GA19033@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Wei Yongjun,

The patch de3bfc4a1616: "mtd: nand: omap2: fix return value check in
omap_nand_probe()" from Jul 14, 2016, leads to the following static
checker warning:

	drivers/mtd/nand/omap2.c:2173 omap_nand_probe()
	error: 'info->dma' dereferencing possible ERR_PTR()

drivers/mtd/nand/omap2.c
  1921          case NAND_OMAP_PREFETCH_DMA:
  1922                  dma_cap_zero(mask);
  1923                  dma_cap_set(DMA_SLAVE, mask);
  1924                  info->dma = dma_request_chan(pdev->dev.parent, "rxtx");
  1925  
  1926                  if (IS_ERR(info->dma)) {
                                   ^^^^^^^^^
  1927                          dev_err(&pdev->dev, "DMA engine request failed\n");
  1928                          err = PTR_ERR(info->dma);
  1929                          goto return_error;
  1930                  } else {
  1931                          struct dma_slave_config cfg;
  1932  
  1933                          memset(&cfg, 0, sizeof(cfg));
  1934                          cfg.src_addr = info->phys_base;
  1935                          cfg.dst_addr = info->phys_base;
  1936                          cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
  1937                          cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
  1938                          cfg.src_maxburst = 16;
  1939                          cfg.dst_maxburst = 16;
  1940                          err = dmaengine_slave_config(info->dma, &cfg);
  1941                          if (err) {
  1942                                  dev_err(&pdev->dev, "DMA engine slave config failed: %d\n",
  1943                                          err);
  1944                                  goto return_error;
  1945                          }
  1946                          nand_chip->read_buf   = omap_read_buf_dma_pref;
  1947                          nand_chip->write_buf  = omap_write_buf_dma_pref;
  1948                  }
  1949                  break;
  1950  

[ snip ]

  2170  
  2171  return_error:
  2172          if (info->dma)
  2173                  dma_release_channel(info->dma);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We can't pass error pointers to dma_release_channel().  I can't compile
this code though, so I'm not going to patch it.

  2174          if (nand_chip->ecc.priv) {
  2175                  nand_bch_free(nand_chip->ecc.priv);
  2176                  nand_chip->ecc.priv = NULL;
  2177          }
  2178          return err;
  2179  }

regards,
dan carpenter
