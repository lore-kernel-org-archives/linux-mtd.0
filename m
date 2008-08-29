Received: from m12-14.163.com ([220.181.12.14])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYthL-00038V-25
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 02:26:52 +0000
Date: Fri, 29 Aug 2008 10:09:31 +0800
From: "Bily" <hsssss1111@163.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: the mtdblock node 
Message-ID: <200808291009310624894@163.com>
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

hi,all
    I start to use linux-2.6 recently.and It seems some differences between linux-2.4 and linux-2.6;now i read the code in mtdblock;and It seems that the kernel will not create the mtdblock node in /dev/mtdblock/,but linux-2.4 will by using the function "device_create". and I want to know if what I think is right? and if the kernel will really not create the mtdblock node ,then how could i do to use the mtdblock and to mount the mtdblock ? how to change my init script? thanks!~




Bily
2008-08-29
