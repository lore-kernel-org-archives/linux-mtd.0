Received: from sina35-178.sina.com.cn ([202.108.35.178] helo=vip.sina.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e3TZ-00080R-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 01:26:45 +0000
Message-ID: <001401c2c802$8b31ed30$0200a8c0@ycigrnd.ycig.com>
From: "leeyang" <leeyang@ycig.com>
To: <linux-mtd@lists.infradead.org>
Subject: need suggestion about embedded FS plan
Date: Thu, 30 Jan 2003 09:54:36 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
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

Flash:
Am29LV160B(bus wide 16 bit and 2M bytes)
2 banks of above flash and total is 4Mbytes.
Connected to MPC860 with x16 bus,and no
interleave.

I implemented my embedded system with
initrd+ramdisk before,and it did its work.
But that solution lost everything I made after
power down,such as add a user.And some other 
flaws like that I have to reside 4.5M ram 
for the fs(total mem only 16M).
So I want to try Mtd.

In fact,there is only a little fs need to
be 'SAVE',like /etc direcory,it take rooms less
than %1 of all flash size.And the main parts
/lib,/sbin,/bin...maybe never changed.
So I have an idea,
Put main parts of fs(/lib,/sbin....)on Cramfs
at one of the flash bank.
Put bootloader,kernel and need-save-fs(/etc) on
the other flash bank with jffs2 fs.

Is that possible?Sth ,I am not sure,is if no
/etc in root fs,Maybe it can not boot up!!!

And other problem:
In this case,I have 2 banks,Is that means
I have to set up at least 2 partitions,if use
them all with jffs2?
I have limited falsh size for 5 sectors
(64Kbytes each) GC per partitoins.

BTW:the util source files(esp.mkfs.jffs2)
I check out from cvs,seems can not compile,
Is there a stable one?

Great appreciation to any suggestion!

leeyang
