Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qTu6-0006Jt-00
	for mtd-list@infradead.org; Tue, 31 Oct 2000 05:24:10 +0000
Received: from [63.196.9.2] (helo=ftp.neontech.com)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13qTu5-0006Jn-00
	for mtd@infradead.org; Tue, 31 Oct 2000 05:24:09 +0000
Date: Mon, 30 Oct 2000 21:27:07 -0800
From: Qiuyuan Liu <q.liu@acm.org>
To: mtd@infradead.org
Subject: building mtd
Message-Id: <39FE582B0.1786Q.LIU@mail.neontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

It seems not easy to have it built.

In the previous email, I said I got an issue on bitsy.h. After I
commented the relative stuff, I had the whole make finished.

Now, where is what I built?

Let me comfirm this:
1. I installed kernel 2.2.17 source on 
linux -> /usr/src/linux-2.2.17
I just ran make menuconfig, and make dep

1.1 Should I finish the make to get vmlinuz?
1.2 should I make modules_install to have the newly made kernel running?

2. I used cvs checked out the latest mtd code, and put it in 
/home/qliu/mtd/,  and ran make under mtd

2.1 should I make symbolic links under 
/usr/src/linux to it, I don't yet.
2.2 should I make the kernel with the mtd modules to have the mtd
modules built into the kernel?
2.3 or I can make and load the mtd modules independently on the kernel
2.2.14 that came with Red Hat Linux 6.2?

2.4 btw, what version of kernel was put in Red Hat Linux 7.0?

3. As the README file says, the result made should have 4 kernel
modules: mtd.o, .., where are they?

Thank you,
Qiuyuan


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
