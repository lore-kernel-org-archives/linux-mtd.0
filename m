Received: from msr68.hinet.net ([168.95.4.168] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t1Dm-0005Ih-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 07:59:47 +0100
Received: from steve2000 (61-217-122-141.HINET-IP.hinet.net [61.217.122.141])
	by msr.hinet.net (8.9.3/8.9.3) with SMTP id OAA01231
	for <linux-mtd@lists.infradead.org>; Thu, 4 Apr 2002 14:59:42 +0800 (CST)
Message-ID: <006e01c1dba6$54865b70$5501a8c0@synso.com.tw>
From: "Steve Tsai" <startec@ms11.hinet.net>
To: <linux-mtd@lists.infradead.org>
Subject: how to use amd_flash.c
Date: Thu, 4 Apr 2002 14:59:54 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

I'd want to use mtd and jffs2 in our ARM7  board.  The flash is MX29LV160B/T
and it is similar to am29LV160, but it does not support CFI. How many files
do I to modify or add to mtd tree? It seems I can modify amd_flash.c to fit
my flash, but I can not probe the chip at booting time. Does anyone know how
to use amd_flash.c? thanks.


Steve Tsai
