Received: from msr69.hinet.net ([168.95.4.169] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ATME-0007aT-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 11:28:38 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: FW: Zlib compress 
Date: Wed, 22 May 2002 18:28:24 +0800
Message-ID: <002a01c2017b$682474a0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <23111.1021290954@redhat.com>
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

David,

I can not use alignment trap with SamsungS3C4510 which is a ARM7TDMI
processor, because ARM7TDMI does not have coprocessor 15 using in
alignment trap codes. Now I try to use get_unaligned to fix the
alignment problem in my platform and I can write the file into the
flash, but when I read the file, I got decompressing error, then
unalignment exception. How many codes do I need to modify?  


inflate returned -5
Unhandled fault: alignment exception (13) at 0x00000001
fault-common.c 96
Internal error: Oops: 0
CPU: 0
pc : [<00028ad0>]    lr : [<00053c7c>]    Not tainted
sp : 002a5b3c  ip : 001e7a88  fp : 002a5b54
r10: 003bd000  r9 : 00373000  r8 : 003bd000
r7 : 00373000  r6 : 00001000  r5 : 002a5bc8  r4 : 002399e8
r3 : 00000239  r2 : 00239a00  r1 : 00239a00  r0 : 00008e40
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 0
Process telnet (pid: 19, stackpage=002a5000)
Stack:
002a5b20:                            00053c7c  00028ad0 20000013
ffffffff 002399

Steve Tsai
