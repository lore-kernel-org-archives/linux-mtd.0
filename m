Received: from mail-gx0-f20.google.com ([209.85.217.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUKUi-0006ix-UZ
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 12:35:15 +0000
Received: by gxk13 with SMTP id 13so1619796gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 04:35:11 -0800 (PST)
Date: Tue, 3 Feb 2009 07:35:07 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch 2.6.29-rc3] =?iso-8859-1?Q?NAND?=
	=?iso-8859-1?B?OiCgZml4?= broken debug messages
Message-ID: <20090203123507.GB2296@yoda.jdub.homelinux.org>
References: <200902021813.20748.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200902021813.20748.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 02, 2009 at 06:13:20PM -0800, David Brownell wrote:
>From: David Brownell <dbrownell@users.sourceforge.net>
>
>Fix incorrect debug messages (*write* not read); someone
>committed some cut'n'paste bugs.  There might be more,
>I only noticed these since I was looking for nand_read
>usage and landed in some very wrong functions.
>
>Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
>---
> drivers/mtd/nand/nand_base.c |    8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -1948,7 +1948,7 @@ static int nand_do_write_oob(struct mtd_
> 	}
> 
> 	if (unlikely(ops->ooboffs >= len)) {
>-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
>+		DEBUG(MTD_DEBUG_LEVEL0, "nand_do_write_oob: "
> 			"Attempt to start write outside oob\n");
> 		return -EINVAL;
> 	}
>@@ -1958,7 +1958,7 @@ static int nand_do_write_oob(struct mtd_
> 		     ops->ooboffs + ops->ooblen >
> 			((mtd->size >> chip->page_shift) -
> 			 (to >> chip->page_shift)) * len)) {
>-		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
>+		DEBUG(MTD_DEBUG_LEVEL0, "do_nand_write_oob: "

This is wrong too.  The function is called 'nand_do_write_oob'.

Which leads me to wonder why we aren't doing something like:

	DEBUG(MTD_DEBUG_LEVEL0, "%s: <message>\n", __func__);

josh
