Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta04.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vXpu-0007oe-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 07:13:34 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 10 Apr 2002 23:13:32 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: "David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Reply-To: zeusj@firstlinux.net
Message-Id: <20020411061332.9D9C836F9@sitemail.everyone.net>
Subject: (no subject)
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

Hi, David

I try hard but still cant find the reason why there is something wrong with my jffs2, which shows the following message:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020018: 0x734d instead

there are many of those when boot the kernel.

I divde the 2 flash chips(intel strataflash 28F128J3A, 16M) into 4 partition:

0x00000000-0x00020000 : "Bootloader"
0x00020000-0x00800000 : "Kernel"
0x00800000-0x01000000 : "Rootfs"
0x01000000-0x02000000 : "JFFS2"

and I erase all the 32M flash before kernel up, then burn the bootloader into "Bootloader",burn the kernel image into "Kernel",burn the jffs2.image into "Rootfs",and "JFFS2" is reserved so I can use it after the kernel is up.

I am confused by the message , because it is OK when I use jffs, is this a bug of jffs2?

Thank you for your help

Jim Zeus

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
