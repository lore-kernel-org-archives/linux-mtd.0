Received: from web20724.mail.yahoo.com ([216.136.226.99])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArPLQ-00080C-Co
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2004 22:30:04 +0000
Message-ID: <20040212223001.53258.qmail@web20724.mail.yahoo.com>
Date: Thu, 12 Feb 2004 14:30:01 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: linuxmtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Understanding JFFS2 behavior
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When mounting a mtd device (chip Am29PL320D, 8MB, erase block 512KB, bus
width 64 bits), I observed the following behavior of JFFS2 and don't
understand what's going on inside JFFS2. 

The available space in the mtd is shrinking quickly and in the end it
leaves 0%. As a matter of fact, the mtd device only has one file
/var/log/messages with length 0. Then I cannot create any file there
because of the lack of disk space.

I know that 5 blocks need to be reserved for garbage colletion. But is this
related the gc? Is the phenomenon normal? BTW, I use the latest mtd/jffs2
code from CVS.

-Shawn.

bash-2.05# mount -t jffs2 /dev/mtdblock1 /mnt
bash-2.05# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/nfs               7044432   5535224   1151364  83% /
/dev/mtdblock1            8192      2052      6140  26% /mnt
bash-2.05# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/nfs               7044432   5535228   1151360  83% /
/dev/mtdblock1            8192      3588      4604  44% /mnt
bash-2.05# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/nfs               7044432   5535232   1151356  83% /
/dev/mtdblock1            8192      4612      3580  57% /mnt
bash-2.05# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/nfs               7044432   5535248   1151340  83% /
/dev/mtdblock1            8192      8192         0 100% /mnt
bash-2.05# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/nfs               7044432   5535248   1151340  83% /
/dev/mtdblock1            8192      8192         0 100% /mnt
bash-2.05# 

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html
