Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MUPC-0000oQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 13:56:50 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 15MUUi-0004m1-00
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2001 14:02:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: Problems with nftl (fwd)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Jul 2001 14:02:32 +0100
Message-ID: <18352.995374952@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The patch makes a little more sense in context. Resent with permission...

--
dwmw2

------- Forwarded Message

Date: Tue, 17 Jul 2001 12:17:40 +0200
To: dwmw2@infradead.org
Subject: Problems with nftl
From: cemil@regio.net (Cemil Degirmenci)

Sorry that i mail directly to you, but the mailinglist refused my mail with 
the reason "unknown local part".

I have some Problems with nftl_format.
In Consolemodus there is no problem with it.
I can use nftl_format in less than 20 Seconds, fdisk it, and make 
a ext2 Filesystem on it.
But when i start my XFree, its very slow, and eats about 99% of CPU.
A nftl_format needs 10minutes under X, and takes a lot of CPU-capacity.
Moving my mouse is not possible during the process.
Here are some infos, i dont know if you need them:

The MTD-Version i use:
mtd-snapshot-20010716.tar.bz2

The way i patched my 2.4.6-Kernel:
sh patchin.sh /usr/src/linux

I have activated the follwing Options in Kernel:
- -Memory Technology Device (MTD) support 
- -Debugging 
- -MTD partitioning support 
- -Direct char device access to MTD devices
- -FTL (Flash Translation Layer) support
- -NFTL (NAND Flash Translation Layer) support
- -Write support for NFTL (BETA)

         Self-contained MTD device drivers
- -Test driver using RAM 
(4096) MTDRAM device size in KiB
(128) MTDRAM erase block size in KiB 
(0) SRAM Hexadecimal Absolute position or 0
<*>   M-Systems Disk-On-Chip 2000 and Millennium

The Next Thing:
What would be the best way of booting the chip? a patched lilo? Grub?
Is there an good howto for it?
I want to Install a complett Server on it using httpd or dhcp, whatever.

thanks,
- -- 
Cemil Degirmenci                //   http://cemil.debian-linux.de
Am Eisenberg 13                 //   Tel.       06638-9180010   
36341 Lauterbach                //   Mobil.     0177-2541153
Germany                         //   E-Mail     cemil@security-focus.de


------- End of Forwarded Message
