Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd1y9-00029i-HD
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 20:09:18 +0000
Subject: Re: UBIFS corruptions on NOR-Flash
To: Roshni Shah <roshni.shah@timesys.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55FC6F56.4050107@nod.at>
Date: Fri, 18 Sep 2015 22:08:54 +0200
MIME-Version: 1.0
In-Reply-To: <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.09.2015 um 22:05 schrieb Roshni Shah:
> Its not mainline. I am using this driver from Freescale, which has
> support for Quad/DDR read and support for IMX6 SoloX.
> 
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c?h=imx_3.14.28_1.0.0_ga
> 
> Mainline driver excludes the above support.
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c
> 
> Also, even though the Freescale driver supports Quad / DDR read, I am
> not using that for this test. My device tree just uses regular read.

Can you please retry using a pristine and recent kernel?

Thanks,
//richard
