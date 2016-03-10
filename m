Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae6Ys-0001Ic-EV
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 19:47:54 +0000
Received: by mail-pa0-x232.google.com with SMTP id tt10so74428168pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 11:47:34 -0800 (PST)
Date: Thu, 10 Mar 2016 11:47:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 cernekee@gmail.com, sboyd@codeaurora.org, andy.gross@linaro.org,
 dehrenberg@google.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 0/3] mtd: Qualcomm NAND controller driver
Message-ID: <20160310194731.GD2545@google.com>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454489991-14717-1-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 03, 2016 at 02:29:48PM +0530, Archit Taneja wrote:
> Add support for the NAND controller driver for SoC's that contain EBI2.
> For now, the only SoC upstream that has EBI2 is IPQ806x.
> 
> The previous version added a BBT flag that allowed BBMs to be accessed
> in raw mode. Adding a flag isn't the right way to fix it, and the
> proposed fix is to add badblockbits support, and make sure all drivers
> switch to accessing BBM in raw mode. For now, skip nand_bbt usage, and
> implement our own versions of chip->block_bad and chip->mark_bad.
> 
> The first patch in the series contains a nand_base clean up which the
> driver will utilize.
> 
> Based over l2-mtd.git
> 
> The patchset requires the v6 ADM dmaengine patches posted by Andy:
> 
> https://lkml.org/lkml/2015/3/17/19

Pushed to l2-mtd.git, with the following fixup (the layout->oobavail
field has been dropped):

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 78dc790ae619..f550a57e6eea 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1733,7 +1733,6 @@ qcom_nand_create_layout(struct qcom_nand_host *host)
 
 	layout->oobfree[0].offset = (steps - 1) * ecc->bytes + host->bbm_size;
 	layout->oobfree[0].length = steps << 2;
-	layout->oobavail = steps << 2;
 
 	/*
 	 * the oob bytes in the first n - 1 codewords are all grouped together
