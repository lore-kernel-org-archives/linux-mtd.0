Received: from ns1.avamax.com
	ident=[Nr5vDeL1yv+iotSxIyOCiRovoS6NUIpI])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgFI9-00050F-9z
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 03:32:33 +0000
Received: from leonnb (pc26 [10.10.20.26])
	by mioserv.miotech.com.tw (8.11.6/8.11.0) with SMTP id i0D3UHn30061
	for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2004 11:30:17 +0800
Message-ID: <002201c3d985$8ff790f0$1a140a0a@leonnb>
From: =?big5?B?qky3TrW+?= <lnys@avamax.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 13 Jan 2004 11:30:16 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: nand flash driver problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
            I am using JFFS2+MTD nand driver(uClinux Full Source
Distribution 20030909) to mount Samsung 16MB Nand flash. It looks ok except
writing time(It costs about 40seconds for copying a 200KB file to Nand
flash). Even I patch uClinux by New JFFS2+MTD nand
driver(mtd-snapshot-20031217) , I still get the same result.  But I measure
the actually time that Nand flash erasing and writing one page is no more
than 1ms.
             I also do another test for reading or writing Nand flash by MTD
block driver and it is ok (I mean reading or writing 200KB data from/to Nand
flash is not more than 1 second).  So I don't know what the problem is. Do
anyone meet the similar problem or any idea?

Thanks
Lys
