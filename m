Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORpV4-00039q-0f
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2010 16:42:03 +0000
Message-ID: <4C238ACC.8050004@broadcom.com>
Date: Thu, 24 Jun 2010 09:41:48 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "pjohn@mvista.com" <pjohn@mvista.com>
Subject: Re: [PATCH] mtd-www doc, FAQ, general: spelling fixes
References: <1277332946-14580-1-git-send-email-norris@broadcom.com>
	<1277387522.24980.6.camel@localhost.localdomain>
In-Reply-To: <1277387522.24980.6.camel@localhost.localdomain>
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/24/2010 06:52 AM, Philby John wrote:

> 
>>   Probably because you flash is too small? Try to use JFFS2 then, becasue it
>                      ^^^                                            ^^^^^
> You missed "you", should be "your", and "becasue".
> 
> Regards,
> Philby
> 
> 

Thanks. Here's just a couple more missed edits.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 faq/jffs2.xml |    4 ++--
 faq/ubifs.xml |   14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/faq/jffs2.xml b/faq/jffs2.xml
index 1bc8680..a08af7a 100644
--- a/faq/jffs2.xml
+++ b/faq/jffs2.xml
@@ -277,8 +277,8 @@ There are two cases where this does not work. The first is when JFFS2 is used
 as a root filesystem. For now, this requires the mtdblock device to be
 specified for <CODE>root=</CODE> on the kernel command line. The second case is
 when the mount binary that is being used does not play nicely with the above
-format. The busybox version of mount is known to not work without the mtdblock
-device.
+format. The BusyBox version of <CODE>mount</CODE> is known to not work without
+the mtdblock device.
 </P>
 
 
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 9dd5d3d..ea371f6 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -33,8 +33,8 @@
 	<li><a href="ubifs.html#L_ubifs_extract">How do I extract files from an UBI/UBIFS image?</a></li>
 	<li><a href="ubifs.html#L_powercut">Is UBIFS tolerant to power-cuts?</a></li>
 	<li><a href="ubifs.html#L_smaller_jrn">I need more space - should I make UBIFS journal smaller?</a></li>
-	<li><a href="ubifs.html#L_empty_file">Why my file is empty after an unclean reboot?</a></li>
-	<li><a href="ubifs.html#L_end_hole">Why my file has zeroes at the end after an unclean reboot?</a></li>
+	<li><a href="ubifs.html#L_empty_file">Why is my file empty after an unclean reboot?</a></li>
+	<li><a href="ubifs.html#L_end_hole">Why does my file have zeroes at the end after an unclean reboot?</a></li>
 	<li><a href="ubifs.html#L_bgt_thread">What does the "ubifs_bgt0_0" thread do?</a></li>
 	<li><a href="ubifs.html#L_sudden_ro">UBIFS suddenly became read-only - what is this?</a></li>
 	<li><a href="ubifs.html#L_detect_ro">How do I detect if UBIFS became read-only?</a></li>
@@ -986,12 +986,12 @@ size.</p>
 
 <p>To put it simple, the amount of available space on UBIFS does not really
 depend on the journal size. There is very weak dependency, though, because for
-bigger journal we need bigger log, but it is really something which does not
-make any noticeable difference.</p>
+a bigger journal we need a bigger log, but it really does not make a
+noticeable difference.</p>
 
 
 
-<h2><a name="L_empty_file">Why my file is empty after an unclean reboot?</a></h2>
+<h2><a name="L_empty_file">Why is my file empty after an unclean reboot?</a></h2>
 
 <p>Zero-length files are a special case of corruption which happens when
 an application first truncates a file, then updates it. The truncation is
@@ -1048,7 +1048,7 @@ to implement it.</p>
 
 
 
-<h2><a name="L_end_hole">Why my file has zeroes at the end after an unclean reboot?</a></h2>
+<h2><a name="L_end_hole">Why does my file have zeroes at the end after an unclean reboot?</a></h2>
 
 <p>Power cuts often lead to holes at the end of files. Holes are areas of
 the file which contain no data. For example, if you truncate a file to a larger
@@ -1176,7 +1176,7 @@ I get: "init_constants_early: too few LEBs (12), min. is 17"
 </a></h2>
 
 <p>This error means that you are trying to mount too small UBI volume.
-Probably because you flash is too small? Try to use JFFS2 then, becasue it
+Probably because your flash is too small? Try to use JFFS2, then, because it
 suits small flashes better since it has much lower space overhead. Indeed,
 UBIFS stores much more indexing information on the flash media than JFFS2, so
 it has much higher overhead. Also, UBI has some overhead (see
-- 
1.7.1
