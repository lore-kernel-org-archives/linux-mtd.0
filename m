Received: from ftp.sshw.com ([65.18.154.155]
	helo=skynetaccess.skynetaccess.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALoHB-0006Py-2c
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 18:39:05 +0000
Sender: train@skynetaccess.skynetaccess.net
Message-ID: <3FB8FC8E.B66AAFBB@earthlink.net>
Date: Mon, 17 Nov 2003 11:51:26 -0500
From: Phil Wilshire <philwil@earthlink.net>
MIME-Version: 1.0
To: tharbaugh@lnxi.com, linux-mtd@lists.infradead.org
References: <3FA7AB8B.A287F4@earthlink.net>
	<3FB6E4AA.27A7AAE1@earthlink.net> <1069079731.14277.71.camel@tubarao>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: Jffs2 write Error
Reply-To: philwil@earthlink.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Thane,

Thayne Harbaugh wrote:
> 
> On Sat, 2003-11-15 at 19:44, Phil Wilshire wrote:
> > I have found my original problem.
> >
> > The
> >    do_write_oneword
> > routine in
> >   cfi_cmdset_0002.c
> >
> > was being given values for datum wider than the 16 bits
> > we are allowed to write to the device.
> > The readback being limited to 16 bits, of course , failed to match
> >
> >
> > The data was being given to do_write_oneword by gc.c
> 
> Why is gc.c passing values that aren't appropriate?
I do not know . A quick scan of the software looked OK but the 
values in the actual hardware system were wrong.
It looked like only the call from gc.c produced the bad values.

> 
> > Here is the error output
> >
> > Last[3] is 66, datum is 8000066 addr 3028c
> > Write of 49 bytes at 0x00030264 failed. returned -5, retlen 40
> > jffs2_write_dirent in garbage_collect_dirent failed: -5
> >
> > As you can see 8000066 is impossible to write to a 16 bit device.
> 
> Quite obvious.
Yes i guess so. No one caught it on the first posting though.


> 
> > I put an extra check on the word size in do_write_oneword and the error just went away.
> 
> What check did you put in?  What do you mean by "the error just went

Here is the code I added. This is a hack/fix for just this system.

The diff is against the latest CVS 
============================================================================
--- drivers/mtd/chips/cfi_cmdset_0002.c.orig    Mon Nov 17 11:37:36 2003
+++ drivers/mtd/chips/cfi_cmdset_0002.c Mon Nov 17 11:45:00 2003
@@ -769,7 +769,20 @@
        int ta = 0;
        DECLARE_RETRY_CMD_CNT();

+
        adr += chip->start;
+
+        // PSW added sanity checks here...
+       if (cfi_buswidth_is_1()) {
+               if (datum & 0xffffff00) {
+                       datum &= 0x00ff;
+               }
+       }
+       if (cfi_buswidth_is_2()) {
+               if (datum & 0xffff0000) {
+                       datum &= 0xffff;
+               }
+       }

        cfi_spin_lock(chip->mutex);
        ret = get_chip(map, chip, adr, FL_WRITING);
==============================================================


> away?"  That sounds like a Heisenbug (race) more than a real solution.
Poor wording on my part. The fix was actually correcting the error. The system now works.

I do not claim that this is a real solution. However it does enable the process to work which is
what I was trying to do.

If this helps unstick some others who are having the same problem great.
I would  like to try to find out why gc.c does not 
set up the correct values in datum but I have not managed to trace that yet.

regards
  Phil Wilshire

-- 
SDCS -- System Design & Consulting Services LLC, http://www.sysdcs.com
** Embedded Linux Training **  email me for details  
630 Springhouse Sq., Leesburg VA 20175 t: 703 669 9766 f: 703 669 9768
