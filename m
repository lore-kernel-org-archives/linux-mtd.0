Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LULA6-0003WB-Nl
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 13:18:01 +0000
Date: Tue, 3 Feb 2009 13:46:53 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Josh Boyer <jwboyer@gmail.com>
Subject: =?ISO-8859-15?Q?Re=3A_=5Bpatch_2=2E6=2E29-rc3=5D_NAND=3A_=A0fix_broken_debug_messages?=
In-Reply-To: <20090203123507.GB2296@yoda.jdub.homelinux.org>
Message-ID: <alpine.LRH.2.00.0902031345180.21407@vixen.sonytel.be>
References: <200902021813.20748.david-b@pacbell.net>
	<20090203123507.GB2296@yoda.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Cc: David Brownell <david-b@pacbell.net>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 Feb 2009, Josh Boyer wrote:
> On Mon, Feb 02, 2009 at 06:13:20PM -0800, David Brownell wrote:
> >From: David Brownell <dbrownell@users.sourceforge.net>
> >Fix incorrect debug messages (*write* not read); someone
> >committed some cut'n'paste bugs.  There might be more,
> >I only noticed these since I was looking for nand_read
> >usage and landed in some very wrong functions.
> >
> >Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> >---
> > drivers/mtd/nand/nand_base.c |    8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >--- a/drivers/mtd/nand/nand_base.c
> >+++ b/drivers/mtd/nand/nand_base.c
> >@@ -1948,7 +1948,7 @@ static int nand_do_write_oob(struct mtd_
> > 	}
> > 
> > 	if (unlikely(ops->ooboffs >= len)) {
> >-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
> >+		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
> > 			"Attempt to start write outside oob\n");
> > 		return -EINVAL;
> > 	}
> >@@ -1958,7 +1958,7 @@ static int nand_do_write_oob(struct mtd_
> > 		     ops->ooboffs + ops->ooblen >
> > 			((mtd->size >> chip->page_shift) -
> > 			 (to >> chip->page_shift)) * len)) {
> >-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
> >+		DEBUG(MTD_DEBUG_LEVEL0, "do_nand_write_oob: "
> 
> This is wrong too.  The function is called 'nand_do_write_oob'.
> 
> Which leads me to wonder why we aren't doing something like:
> 
> 	DEBUG(MTD_DEBUG_LEVEL0, "%s: <message>\n", __func__);

Or use

    #define pr_fmt(fmt)  "%s: " fmt, __func__

at the top of the file, and start using the official pr_*() routines?

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
