Received: from msr31.hinet.net ([168.95.4.131] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LKyc-0000t1-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 10:45:10 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id RAA29736
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 17:45:06 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: NAND FLASH
Date: Fri, 21 Jun 2002 17:44:32 +0800
Message-ID: <001901c21908$3f57b2e0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
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

Hi,
I try to use nand flash driver to my board, but it seems fail to do some
operations. I just can get chip ID, but I can not read data or program
data. I use GPIO to control CLE and ALE and connect WE, RE and CE to
procesor. Is it right? Does anyone have sample code to test NAND flash?
Thank.

Steve TSai
