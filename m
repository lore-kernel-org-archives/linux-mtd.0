Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORsav-0004ee-6s
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2010 20:00:17 +0000
Received: by iwn1 with SMTP id 1so252456iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Jun 2010 13:00:15 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 24 Jun 2010 16:00:15 -0400
Message-ID: <AANLkTik882oGTwZZZ31T7YjfyvCmETlZgisjS6teDCB1@mail.gmail.com>
Subject: error handling in replay_log_leb()
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the replay.c/replay_log_leb(), is there any disadvantage to calling
ubifs_recover_log_leb() regardless of whether need_recovery is true or
not?  I'm having an issue with ubifs dealing with a PEB with corrupt
empty space and this condition is handled fine during a mount when
need_recovery is true, but is not handled the same otherwise and
results in a failed mount.  A patch with the proposed change is below.

This question is along the same lines as one I asked yesterday about
ubifs_scan() error handling.

Thanks,
twebb


Index: replay.c
================================================
--- replay.c    (revision 2438)
+++ replay.c    (working copy)
@@ -838,7 +838,7 @@
        dbg_mnt("replay log LEB %d:%d", lnum, offs);
        sleb = ubifs_scan(c, lnum, offs, sbuf);
        if (IS_ERR(sleb) ) {
-               if (PTR_ERR(sleb) != -EUCLEAN || !c->need_recovery)
+               if (PTR_ERR(sleb) != -EUCLEAN)
                        return PTR_ERR(sleb);
                sleb = ubifs_recover_log_leb(c, lnum, offs, sbuf);
                if (IS_ERR(sleb))
