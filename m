Received: from web54407.mail.yahoo.com ([206.190.49.137])
	by pentafluge.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQme2-0007ck-Kl
	for linux-mtd@lists.infradead.org; Fri, 22 Sep 2006 16:08:51 +0100
Message-ID: <20060922150744.30960.qmail@web54407.mail.yahoo.com>
Date: Fri, 22 Sep 2006 08:07:44 -0700 (PDT)
From: David Anders <dave123_aml@yahoo.com>
Subject: patch to leave cfi in read-array on suspend
To: linux-mtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

greetings,

during some testing with several samsung s3c24xx based
devices it was discovered that often the
cfi_cmdset_0001.c would not leave the chip in
read-array mode on suspend. this is an issue if the
same flash chip is used for the bootloader that needs
to read on resume. attached is a patch generated
against the 2.6.18 kernel and has been tested with
several s3c24xx based devices as well as several sharp
lh79520 devices. your feedback would be appreciated.

Signed-off-by: David Anders <danders@amltd.com>

--- linux-2.6.18/drivers/mtd/chips/cfi_cmdset_0001.c    2006-09-19 23:42:06.000000000 -0400
+++ linux-2.6.18-m5900/drivers/mtd/chips/cfi_cmdset_0001.c      2006-09-22 09:16:21.000000000
-0400
@@ -2224,6 +2224,8 @@
                case FL_CFI_QUERY:
                case FL_JEDEC_QUERY:
                        if (chip->oldstate == FL_READY) {
+                               /* place the chip in a known state before suspend */
+                               map_write(map, CMD(0xFF), cfi->chips[i].start);
                                chip->oldstate = chip->state;
                                chip->state = FL_PM_SUSPENDED;
                                /* No need to wake_up() on this state change -



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
