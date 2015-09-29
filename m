Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgzgn-0004q1-Fy
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 18:31:46 +0000
Received: by padhy16 with SMTP id hy16so13196754pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 11:31:24 -0700 (PDT)
Date: Tue, 29 Sep 2015 11:31:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Graham Moore <grmoore@opensource.altera.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Alan Tull <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>
Subject: Re: [PATCH] mtd: nand: denali: max_banks calculation changed in
 revision 5.1
Message-ID: <20150929183121.GC31505@google.com>
References: <1437489571-916-1-git-send-email-grmoore@opensource.altera.com>
 <560AA7B6.3010505@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560AA7B6.3010505@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 10:01:10AM -0500, Graham Moore wrote:
> Howdy folks,
> 
> Any comment on this patch?

A tiny comment below.

> Is anyone else using Denali NAND rev 5.1
> controller?

I have no devices to test, but CC'ing Enrico, who sent a denali patch
recently.

In general, MTD has a lot of drivers for various hardware, and I have
few of them to test. If anyone is interested in getting CC's (so they
can test, review, and otherwise help expedite the process), I'd be happy
to ack an addition to MAINTAINERS, perhaps as 'R:' (reviewer)...

> Thanks,
> Graham
> 
> On 07/21/2015 09:39 AM, Graham Moore wrote:
> >Read Denali hardware revision number and use it to
> >calculate max_banks,  The encoding of max_banks changed
> >in Denali revision 5.1.
> >
> >Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> >---
> >  drivers/mtd/nand/denali.c |   11 ++++++++++-
> >  drivers/mtd/nand/denali.h |    2 ++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> >index 870c7fc..a98b41e 100644
> >--- a/drivers/mtd/nand/denali.c
> >+++ b/drivers/mtd/nand/denali.c
> >@@ -458,8 +458,17 @@ static void find_valid_banks(struct denali_nand_info *denali)
> >  static void detect_max_banks(struct denali_nand_info *denali)
> >  {
> >  	uint32_t features = ioread32(denali->flash_reg + FEATURES);
> >+	/*
> >+	 * Read the revision register, so we can calculate the max_banks
> >+	 * properly: the encoding changed from rev 5.0 to 5.1
> >+	 */
> >+	u32 revision = MAKE_COMPARABLE_REVISION(
> >+				ioread32(denali->flash_reg + REVISION));
> >
> >-	denali->max_banks = 2 << (features & FEATURES__N_BANKS);
> >+	if (revision < REVISION_5_1)
> >+		denali->max_banks = 2 << (features & FEATURES__N_BANKS);
> >+	else
> >+		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
> >  }
> >
> >  static void detect_partition_feature(struct denali_nand_info *denali)
> >diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> >index 145bf88..4bf13bb 100644
> >--- a/drivers/mtd/nand/denali.h
> >+++ b/drivers/mtd/nand/denali.h
> >@@ -178,6 +178,8 @@
> >
> >  #define REVISION				0x370
> >  #define     REVISION__VALUE				0xffff
> >+#define MAKE_COMPARABLE_REVISION(x)		swab16(x & REVISION__VALUE)

It's probably best to add parentheses around the 'x'.

> >+#define REVISION_5_1				0x00000501
> >
> >  #define ONFI_DEVICE_FEATURES			0x380
> >  #define     ONFI_DEVICE_FEATURES__VALUE			0x003f
> >
> 

I can fix that up and apply, if no objections.

Brian
