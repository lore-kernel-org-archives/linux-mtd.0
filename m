Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaSEP-0002Q5-DD
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 12:12:46 +0000
Received: by bwz5 with SMTP id 5so15630308bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 04:12:43 -0800 (PST)
Subject: Re: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command
	line partitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4D244FD0.4010208@nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122051.20685.46383.sendpatchset@ahunter-work.research.nokia.com>
	<1292421869.2512.56.camel@localhost>  <4D244FD0.4010208@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 14:12:40 +0200
Message-ID: <1294229560.2179.20.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-01-05 at 13:02 +0200, Adrian Hunter wrote:
> On 15/12/10 16:04, ext Artem Bityutskiy wrote:
> > On Mon, 2010-12-13 at 14:20 +0200, Adrian Hunter wrote:
> >>  From d27a88c5f9f18a7c38784c085889c3e1053340cf Mon Sep 17 00:00:00 2001
> >> From: Adrian Hunter<adrian.hunter@nokia.com>
> >> Date: Wed, 30 Dec 2009 07:40:16 +0100
> >> Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line partitioning
> >>
> >> Add the ability to parse MTD partition information from the
> >> kernel command line.
> >>
> >> Note that a pointless BUG_ON is removed, as are redundant
> >> calls to 'del_mtd_partitions()' and 'del_mtd_device()'
> >> because they are also done by 'onenand_release()'.
> >>
> >> Finally note that 'add_mtd_device()' returns 1 on failure
> >> so the error condition was incorrect.
> >>
> >> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
> >
> > I've pushed patches 1 and 7 to l2-mtd-2.6, but patch #2 is not
> > applicable. I think this is because of changes Kyungmin made recently.
> > Could you please re-send patches 2 and 3 on top of the l2 tree?
> 
> I just tried to apply them to l2 and they applied fine as is.
> Has something changed?  Do I have the wrong tree?

Just tried to apply patch 2 which you re-sent on "Wed, 05 Jan 2011
13:02:40 +0200"

[dedekind@koala l2-mtd-2.6]$ git am -i -s ~/tmp/adrian.mbox 
Commit Body is:
--------------------------
mtd: OneNAND: add enable / disable methods to onenand_chip

 From ece28a7fdec36fb40d60d35a5639326871c162f6 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Fri, 19 Feb 2010 15:39:52 +0100
Subject: [PATCH V2 2/7] mtd: OneNAND: add enable / disable methods to
onenand_chip

Add enable / disable methods called from get_device() /
release_device().
These can be used, for example, to allow the driver to prevent the
voltage
regulator from being put to sleep while OneNAND is in use.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
--------------------------
Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all e
Commit Body is:
--------------------------
mtd: OneNAND: add enable / disable methods to onenand_chip

 From ece28a7fdec36fb40d60d35a5639326871c162f6 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Fri, 19 Feb 2010 15:39:52 +0100
Subject: [PATCH V2 2/7] mtd: OneNAND: add enable / disable methods to
onenand_chip

Add enable / disable methods called from get_device() /
release_device().
These can be used, for example, to allow the driver to prevent the
voltage
regulator from being put to sleep while OneNAND is in use.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
--------------------------
Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all y
Applying: mtd: OneNAND: add enable / disable methods to onenand_chip
error: patch failed: drivers/mtd/onenand/onenand_base.c:948
error: drivers/mtd/onenand/onenand_base.c: patch does not apply
error: patch failed: include/linux/mtd/onenand.h:118
error: include/linux/mtd/onenand.h: patch does not apply
Patch failed at 0001 mtd: OneNAND: add enable / disable methods to
onenand_chip
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
[dedekind@koala l2-mtd-2.6]$ patch -p1 < .git/rebase-apply/patch 
patching file drivers/mtd/onenand/onenand_base.c
Hunk #1 FAILED at 948.
Hunk #2 FAILED at 974.
2 out of 2 hunks FAILED -- saving rejects to file
drivers/mtd/onenand/onenand_base.c.rej
patching file include/linux/mtd/onenand.h
Hunk #1 FAILED at 118.
1 out of 1 hunk FAILED -- saving rejects to file
include/linux/mtd/onenand.h.rej
[dedekind@koala l2-mtd-2.6]$ cat drivers/mtd/onenand/onenand_base.c.rej
--- drivers/mtd/onenand/onenand_base.c
+++ drivers/mtd/onenand/onenand_base.c
@@ -948,6 +948,8 @@
                if (this->state == FL_READY) {
                        this->state = new_state;
                        spin_unlock(&this->chip_lock);
+                       if (new_state != FL_PM_SUSPENDED &&
this->enable)
+                               this->enable(mtd);
                        break;
                }
                if (new_state == FL_PM_SUSPENDED) {
@@ -974,6 +976,8 @@
  {
        struct onenand_chip *this = mtd->priv;
  
+       if (this->state != FL_PM_SUSPENDED && this->disable)
+               this->disable(mtd);
        /* Release the chip */
        spin_lock(&this->chip_lock);
        this->state = FL_READY;
[dedekind@koala l2-mtd-2.6]$ cat include/linux/mtd/onenand.h.rej
--- include/linux/mtd/onenand.h
+++ include/linux/mtd/onenand.h
@@ -118,6 +118,8 @@
        int (*chip_probe)(struct mtd_info *mtd);
        int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
        int (*scan_bbt)(struct mtd_info *mtd);
+       int (*enable)(struct mtd_info *mtd);
+       int (*disable)(struct mtd_info *mtd);
  
        struct completion       complete;
        int                     irq;
[dedekind@koala l2-mtd-2.6]$ git log
commit 5fca82e7d3827249e840393fb28d19404d337fbf
Author: Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>
Date:   Tue Jan 4 10:42:35 2011 +0200

    mtd: m25p80: Fix JEDEC ID for AT26DF321
    
    The last byte of the ID should be zero for this chip. Was added in
    commit d0e8c47c58575b9131e786edb488fd029eba443e . Reported by Tomi
    Varjo.
    
    Signed-off-by: Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
