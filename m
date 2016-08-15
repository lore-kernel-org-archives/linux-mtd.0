Received: from arroyo.ext.ti.com ([198.47.19.12])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZCG8-0002lN-Qs
 for linux-mtd@lists.infradead.org; Mon, 15 Aug 2016 07:24:33 +0000
Subject: Re: [bug report] mtd: nand: omap2: fix return value check in
 omap_nand_probe()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20160803123218.GA19033@mwanda>
 <bd02b812-5dc7-e431-bd8e-94b3edc706b1@ti.com>
 <20160810154834.5bd3c1f9@bbrezillon>
CC: Dan Carpenter <dan.carpenter@oracle.com>, <yongjun_wei@trendmicro.com.cn>,
 "Cooper Jr., Franklin" <fcooper@ti.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <60cb9ab7-9145-2f5d-9d25-11e922ecff9e@ti.com>
Date: Mon, 15 Aug 2016 10:24:05 +0300
MIME-Version: 1.0
In-Reply-To: <20160810154834.5bd3c1f9@bbrezillon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 10/08/16 16:48, Boris Brezillon wrote:
> Hi,
> 
> On Thu, 4 Aug 2016 10:05:09 +0300
> Roger Quadros <rogerq@ti.com> wrote:
> 
>> +Franklin
>>
>> On 03/08/16 15:32, Dan Carpenter wrote:
>>> Hello Wei Yongjun,
>>>
>>> The patch de3bfc4a1616: "mtd: nand: omap2: fix return value check in
>>> omap_nand_probe()" from Jul 14, 2016, leads to the following static
>>> checker warning:
>>>
>>> 	drivers/mtd/nand/omap2.c:2173 omap_nand_probe()
>>> 	error: 'info->dma' dereferencing possible ERR_PTR()
>>>
>>> drivers/mtd/nand/omap2.c
>>>   1921          case NAND_OMAP_PREFETCH_DMA:
>>>   1922                  dma_cap_zero(mask);
>>>   1923                  dma_cap_set(DMA_SLAVE, mask);
>>>   1924                  info->dma = dma_request_chan(pdev->dev.parent, "rxtx");
>>>   1925  
>>>   1926                  if (IS_ERR(info->dma)) {
>>>                                    ^^^^^^^^^
>>>   1927                          dev_err(&pdev->dev, "DMA engine request failed\n");
>>>   1928                          err = PTR_ERR(info->dma);
>>>   1929                          goto return_error;
>>>   1930                  } else {
>>>   1931                          struct dma_slave_config cfg;
>>>   1932  
>>>   1933                          memset(&cfg, 0, sizeof(cfg));
>>>   1934                          cfg.src_addr = info->phys_base;
>>>   1935                          cfg.dst_addr = info->phys_base;
>>>   1936                          cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>   1937                          cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>   1938                          cfg.src_maxburst = 16;
>>>   1939                          cfg.dst_maxburst = 16;
>>>   1940                          err = dmaengine_slave_config(info->dma, &cfg);
>>>   1941                          if (err) {
>>>   1942                                  dev_err(&pdev->dev, "DMA engine slave config failed: %d\n",
>>>   1943                                          err);
>>>   1944                                  goto return_error;
>>>   1945                          }
>>>   1946                          nand_chip->read_buf   = omap_read_buf_dma_pref;
>>>   1947                          nand_chip->write_buf  = omap_write_buf_dma_pref;
>>>   1948                  }
>>>   1949                  break;
>>>   1950  
>>>
>>> [ snip ]
>>>
>>>   2170  
>>>   2171  return_error:
>>>   2172          if (info->dma)
>>>   2173                  dma_release_channel(info->dma);
>>>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> We can't pass error pointers to dma_release_channel().  I can't compile
>>> this code though, so I'm not going to patch it.
> 
> 		if (!IS_ERR_OR_NULL(info->dma))
> 			dma_release_channel(info->dma);
> 
> Should do the trick.
> 
> Franklin, Roger, can you check if I'm right and send a fix?
> 
I'll send a patch by today. Thanks.

cheers,
-roger
