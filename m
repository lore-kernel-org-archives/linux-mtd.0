Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeoNI-0007Xo-4A
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 11:35:27 +0000
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NeoNG-0001F0-W3
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 06:35:23 -0500
Date: Tue, 9 Feb 2010 06:34:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] Web site:  A few grammatical fixes in Docs/General.
Message-ID: <alpine.LFD.2.00.1002090631540.6317@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  in addition to a few picky fixes on that page, toward the bottom of
that page, one reads:

"This is wrong in most cases. The mtdblock In other words, please, do
                                          ^^^ ???
not use mtdblock unless you know exactly what you are doing.

  there seems to be something missing there, i'll leave it to people
higher up the food chain to decide what to do there.


diff --git a/doc/general.xml b/doc/general.xml
index 8368b2e..14ba8ff 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -30,7 +30,7 @@ AG-AND, ECC'd NOR, etc.</p>
 <p>MTD subsystem does not deal with block devices like MMC, eMMC, SD,
 CompactFlash, etc. These devices are not raw flashes but they have a Flash
 Translation layer inside, which makes them look like block devices. These
-devices are subject of the Linux block subsystem, not MTD. Please, refer
+devices are the subject of the Linux block subsystem, not MTD. Please, refer to
 <a href="../faq/general.html#L_mtd_vs_hdd">this</a> FAQ section for a short
 list of the main differences between block and MTD devices. And the
 <a href="ubifs.html#L_raw_vs_ftl">raw flash vs. FTL devices</a> UBIFS section
@@ -46,15 +46,15 @@ discusses this in more details.</p>
 	them as bad or checking if an eraseblock is bad, getting information
 	about MTD devices, etc.</li>

-	<li>The <code>sysfs</code> interface is relatively and it provides full
-	information about each MTD device in the system. This interface is
+	<li>The <code>sysfs</code> interface is relatively newer and it provides
+	full information about each MTD device in the system. This interface is
 	easily extensible and developers are encouraged to use the
 	<code>sysfs</code> interface instead of older <code>ioctl</code> or
 	<code>/proc/mtd</code> interfaces, when possible.</li>

 	<li>The <code>/proc/mtd</code> proc file system file provides general
 	MTD information. This is a legacy interface and the sysfs interface
-	provide more information.</li>
+	provides more information.</li>
 </ul>

 <p>MTD subsystem supports bare <a href="nand.html">NAND</a> flashes with
@@ -77,7 +77,7 @@ starting from kernel version <code>2.6.29</code> and they live in the
 <code>drivers/mtd/tests</code> directory of the linux kernel source codes. You
 may compile the tests as kernel modules by enabling them in the kernel
 configuration menu by marking: "<b>Device Drivers</b>" ->
-"<b>Memory Technology Devices (MTD)</b>" -> "<b>MTD tests support</b>" (or
+"<b>Memory Technology Device (MTD) support</b>" -> "<b>MTD tests support</b>" (or
 the <code>MTD_TESTS</code> symbol in the <code>.config</code> file).</p>

 <p>If you have a pre-<code>2.6.29</code> kernel, you may find the tests


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
