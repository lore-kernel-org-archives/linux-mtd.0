Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUe8Y-000670-F3
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:14:59 +0000
Received: by bwz1 with SMTP id 1so1673374bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 05:14:53 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimXGmANdV663BP2CLKZTJyzD+QLhQ@mail.gmail.com>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
	<1307421266.11104.10.camel@localhost>
	<BANLkTikKVMQFxtE0S1VL4-SUPWNydgexLw@mail.gmail.com>
	<1307542265.31223.97.camel@localhost>
	<BANLkTimXGmANdV663BP2CLKZTJyzD+QLhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 15:10:34 +0300
Message-ID: <1307621434.7374.78.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 13:50 -0400, Matthew L. Creech wrote:
> On Wed, Jun 8, 2011 at 10:11 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > Yes, it does look like this LEB might be garbage-collected. But it does
> > not have to be.
> >
> > Anyway, what I can suggest you is to do several things.
> >
> > 1. If you have many occasions of such error, try to gather some
> >   information about how the device was used, and if it was uncleanly
> >   power-cut. Remember, I often saw that embedded devices have incorrect
> >   reboot. Whe users reboot it "normally" - it does not try to unmount
> >   the FS-es cleanly and just jumps to som HW reset function.
> >
> >   You can verify this by rebooting normally and checking if UBIFS says
> >   "recovery needed" or not. If it does - the reboot was not normal.
> >
> 
> Yes, it currently reboots uncleanly (though it does do a "sync"
> first).  I noticed this a while back, and the next release firmware
> will have it fixed.  However, it doesn't make a huge difference to us,
> because these devices are probably more likely to experience power
> loss than a software reboot, in the field at least.
> 
> > 2. This error may be due to memory corruptions in some driver (e.g.,
> >   wireless or video), due to issues in the mtd driver, etc. Try to
> >   stress your system with slub/slab full checks enabled, and other
> >   debugging features which you can find in the "hacking" section of
> >   make menuconfig.
> >
> 
> Will do.
> 
> > 3. If my theory is true, then what may help is adding a check it
> >   ubifs recovery function. The recovery ends with an ubifs_leb_change()
> >   call. You need to check the last node there - is it full and correct?
> >   If not, you should print a loud warning and information like leb dump
> >   _before_ the change, and dump of the buffer which we are going to
> >   write with ubifs_leb_change().
> >
> >   You'd probably need to deploy this check to the field if this issue
> >   is not easy to reproduce. If you have then this info you may fix the
> >   bug.
> >
> 
> Great, I'll add this check and see if we get any hits.  Even if it
> takes a while to hit it in the field, this would at least give us a
> way to make some progress in finding the issue.

With my latest code-base, I am able to inject a hack into
ubifs_leb_change() - but this function does not exist in your code-base.
Anyway, I'm currently running power cut emulation testing with the
following hack:


>From df163f4dd8a1604fe3085c4d11281c530837bc53 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 9 Jun 2011 15:08:59 +0300
Subject: [PATCH] UBIFS: temporary: hack to check recovery

We suspect that recovery cuts nodes sometimes. This is the hack which should
catch such things. We hack ubifs_change_leb and scan the leb right after
changing it - if we wrote corrupted data there, scan should fail.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 9228950..9f7dbbf 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -153,6 +153,30 @@ int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
 		ubifs_ro_mode(c, err);
 		dbg_dump_stack();
 	}
+
+	/* Temporary hack to catch incorrect recovery, if we have such */
+	if (!err && (lnum < c->lpt_first || lnum > c->lpt_last)) {
+		void *buf = vmalloc(c->leb_size);
+		struct ubifs_scan_leb *sleb;
+
+		if (!buf)
+			return 0;
+
+		sleb = ubifs_scan(c, lnum, 0, buf, 0);
+		if (!IS_ERR(sleb)) {
+			/* Scan succeeded */
+			vfree(buf);
+			return 0;
+		}
+
+		ubifs_err("scanning after LEB %d change failed, error %d!", lnum, err);
+		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1,
+			       buf, c->leb_size, 1);
+		dump_stack();
+		vfree(buf);
+		return -EINVAL;
+	}
+
 	return err;
 }
 
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
