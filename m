Received: from m12-15.163.com ([220.181.12.15] helo=m5-85.163.com)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUtdt-0000Zl-Fd
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 01:34:47 +0000
Date: Mon, 18 Aug 2008 09:17:30 +0800
From: "Bily" <hsssss1111@163.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: how could block device read OOB?
Message-ID: <200808180917288590868@163.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,all,
    Maybe this question is easy,but I just  confused. I use my nand chip as a mtd block device.now I open mtdblock by using the "open()" function. and I want to read the OOB part by use the mtdblock device.now I want to know if I could read the OOB by operating an mtd block device or  only I use the  mtd char device could I solve this problem .Thanks!~ 




Bily
2008-08-18
