Received: from web15306.mail.bjs.yahoo.com ([202.3.77.181])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VMfC-0005og-2s
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 03:39:06 +0100
Message-ID: <20030626023855.50873.qmail@web15306.mail.bjs.yahoo.com>
Date: Thu, 26 Jun 2003 10:38:55 +0800 (CST)
From: =?gb2312?q?Yy=20Yy?= <yy_hust@yahoo.com.cn>
To: nico@cam.org
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Ask a question about mtdblock.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I want to implement mass storage protocol.
I write a kernel thread to handle the requests from
mass storage protocol.
I don't know how to read/write data from flash memory
by mtdblock in my kernel thread.

Should I call sys_open/sys_read/sys_write to mtdblock
device file (/dev/mtdblock0) to get the data.
Or should I call do_cache_write or do_cache_read to
get the data directly.

And suggestions are welcome.
Thanks a lot
                                              Yy

_________________________________________________________
Do You Yahoo!? 
网恋的诠释：真情还是放纵？
http://cn.rd.yahoo.com/mail_cn/tag/?http://cn.surveys.yahoo.com/netlove
