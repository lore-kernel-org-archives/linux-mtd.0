Message-ID: <4F18DF95.80700@freescale.com>
Date: Fri, 20 Jan 2012 11:29:25 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH 00/10] patch set about the MXS-DMA
References: <1326953767-24155-1-git-send-email-b32955@freescale.com>
 <20120119091034.GH2247@S2101-09.ap.freescale.net>
 <20120119094513.GB2630@pengutronix.de>
In-Reply-To: <20120119094513.GB2630@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, artem.bityutskiy@intel.com,
 vinod.koul@intel.com, b29396@freescale.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@linaro.org>, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>>> [2] patch 6 ~ patch 10: rewrite the last parameter of mxs_dma_prep_slave_sg().
>> For the sake of bitsec, at least patches #7 and #8 need to be one patch.
>> That said, if I apply the series and then check out the commit at patch
>> #7, you need to all mxs-dma client drivers, mxs-mmc, gpmi do not break.
> I'd say patch 6-10 should be squashed, simply. My personal preference is
> to change #9 to simply read the register when needed and do not expand
It's better to add a new field. i also want to add a new field
`bch_version`, because different
BCH version may support different ECC strength. For example, some
version BCH can support to 24 bit,
while the latest BCH may support to 40 bit. So the BCH version may
limits the computing of ECC strength.

Best Regards
Huang Shijie

> the struct, but this is a minor thing.
>
> Regards,
>
>    Wolfram
>
