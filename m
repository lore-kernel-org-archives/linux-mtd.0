Received: from web20009.mail.yahoo.com ([216.136.225.72])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rHaL-0004od-Li
	for <linux-mtd@lists.infradead.org>; Mon, 25 Aug 2003 14:40:41 +0100
Message-ID: <20030825134016.59014.qmail@web20009.mail.yahoo.com>
Date: Mon, 25 Aug 2003 06:40:16 -0700 (PDT)
From: nicolas brin <nino01_2000@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: jffs2 and busybox 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
I'm a Montavista kernel linux 2.4 and PPCBOOT.
I boot with PPCBOOT that run LINUX. With the boot
arguments, I configure kernel running to boot with
root file system in nfs(host machine). I don't have
problem!
Then, I mount my jffs2 partition and I install it my
jffs2 image. further to I configure kernel running to
boot with root file system on my jffs partition.
Kernel display message and when I display busybox
message then it display me that it tell me :rcS don't
exist. then I display a message about tty4 in loop.
I don't know if I forget an option when I configured
the root file system with Montavista tools.

I need to know which options must I choose to build my
root file system that it will install in my flash of
8Mo. And how to run busybox (does it use inittab ...
like PC)?

thks
bye

nicolas  

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
