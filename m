Received: from pasmtpb.tele.dk ([80.160.77.98])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GmFxg-00084b-2t
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 20:41:55 +0000
Received: from tuxedo.home.lan (0x535c82dc.virnxx18.adsl-dhcp.tele.dk
	[83.92.130.220])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 3EE27E31101
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Nov 2006 21:41:31 +0100 (CET)
Date: Mon, 20 Nov 2006 21:41:30 +0100
To: linux-mtd@lists.infradead.org
Subject: [PATCH] do_write_oneword and do_erase_oneblock I/O problems
Message-ID: <20061120204130.GA30829@tuxedo.home.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
From: lars@segv.dk (Lars Munch)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All

I have searched the archives but I could not find an answer to my
problems so here goes:

I am using an SST39VF6401B flash, and hence cfi_cmdset_0002.c on
linux-2.6.19-rc5. Whenever I try to erase or write to the flash I get
I/O errors.

What happens is, first the command is written to the flash, then the
function enters an for(;;) loop waiting chip_ready, immediately after
chip_ready succeeds the chip_good test fails:

        /* Did we succeed? */
        if (!chip_good(map, adr, map_word_ff(map))) {

If I add a small delay after the for(;;) loop and just before the
!chip_good test in do_write_oneword and do_erase_oneblock problems
disappear??  Should we wait here or is there a better way to fix this?

Please see attached patch. Comments?

Thanks
Lars Munch

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="add_delay.patch"

--- linux-2.6.19-rc5/drivers/mtd/chips/cfi_cmdset_0002.c	2006-11-08 03:24:20.000000000 +0100
+++ linux-2.6.19-rc5-ks8695/drivers/mtd/chips/cfi_cmdset_0002.c	2006-11-20 20:01:54.000000000 +0100
@@ -1064,6 +1064,9 @@
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
+
+        UDELAY(map, chip, adr, 1000000/HZ);
+
 	/* Did we succeed? */
 	if (!chip_good(map, adr, datum)) {
 		/* reset on all failures. */
@@ -1588,6 +1591,9 @@
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
+
+	UDELAY(map, chip, adr, 1000000/HZ);
+
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
 		/* reset on all failures. */

--OXfL5xGRrasGEqWY--
