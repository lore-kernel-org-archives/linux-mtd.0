Received: from [61.186.188.65] (helo=gjx)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NjnF-0006kx-MA
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 02:43:59 +0100
From: "gjx" <xiaoxing001@etang.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Date: Thu, 5 Jun 2003 9:47:15 +0800
Message-Id: <E19NjnF-0006kx-MA@pentafluge.infradead.org>
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Subject: SAMSUNG NAND FLASH
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi

=09I will test a new board with a NAND device chip.As a beginner of=
 MTD,I'm puzzled about how to start, what to do to implement it.=
 Can you give me the steps ?

    Do I need add a hardware specific driver--pb1k_nand.c  in=
 \drivers\mtd\nand\ as edb7312.c. I expect to get a SamSung's=
 nand driver similar to edb7312.c then modify it to merge it into=
 the MTD. Can you send it to me?
    
    In addition to the pb1k_nand.c, what should to modify in the=
 MTD. 

Thanks very much!

My configuration is as follows:
CPU: AU1100 (MIPS)
NAND: Samsung K9F1G08Q0M (1GMb, 8bit interface).
Filesystem: yaffs




 =09=09=09=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1gjx
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1xiaoxing001@etang.com
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12003-06-05
