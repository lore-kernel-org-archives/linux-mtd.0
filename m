Received: from mail.allot.com ([199.203.223.202] helo=exg.allot.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zIwY-0006U7-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 15:03:27 +0100
Message-ID: <3AFFE80B.DCE1B139@allot.com>
Date: Mon, 14 May 2001 17:13:31 +0300
From: Felix Radensky <felix@allot.com>
MIME-Version: 1.0
To: Linux-mtd <linux-mtd@lists.infradead.org>
Subject: DOC problems on PowerPC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi, all

I was able to solve the DOC problems on PowerPC I've reported yesterday.

All I had to do is to run "eraseall /dev/mtd0", then run "nftl_format
/dev/mtd0"
and  then create partitions with fdisk.

Can someone please explain me the difference between eraseall and
nftl_format.
HOWTO says nothing about it.

By the way, the latest mtd code would not compile, at least on my 2.4.2
kernel
unless you add #include <linux/kmod.h> to chipreg.c.  This is because of

a call to request_module() in do_map_probe(), which IMHO should be
under #ifdef CONFIG_KMOD, and not #ifdef CONFIG_MODULES.
