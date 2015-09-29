Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh11T-0007XR-Qx
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 19:57:12 +0000
Received: by pacex6 with SMTP id ex6so15136505pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 12:56:51 -0700 (PDT)
Date: Tue, 29 Sep 2015 12:56:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Graham Moore <grmoore@opensource.altera.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Alan Tull <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>
Subject: Re: [PATCH] mtd: nand: denali: max_banks calculation changed in
 revision 5.1
Message-ID: <20150929195648.GG31505@google.com>
References: <1437489571-916-1-git-send-email-grmoore@opensource.altera.com>
 <560AA7B6.3010505@opensource.altera.com>
 <20150929183121.GC31505@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150929183121.GC31505@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 11:31:21AM -0700, Brian Norris wrote:
> On Tue, Sep 29, 2015 at 10:01:10AM -0500, Graham Moore wrote:
> > On 07/21/2015 09:39 AM, Graham Moore wrote:
> > >diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> > >index 870c7fc..a98b41e 100644
> > >--- a/drivers/mtd/nand/denali.h
> > >+++ b/drivers/mtd/nand/denali.h
> > >@@ -178,6 +178,8 @@
> > >
> > >  #define REVISION				0x370
> > >  #define     REVISION__VALUE				0xffff
> > >+#define MAKE_COMPARABLE_REVISION(x)		swab16(x & REVISION__VALUE)
> 
> It's probably best to add parentheses around the 'x'.
> 
> > >+#define REVISION_5_1				0x00000501
> > >
> > >  #define ONFI_DEVICE_FEATURES			0x380
> > >  #define     ONFI_DEVICE_FEATURES__VALUE			0x003f
> > >
> > 
> 
> I can fix that up and apply, if no objections.

Pushed to l2-mtd.git with that fixup.
