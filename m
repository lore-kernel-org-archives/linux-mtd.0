Received: from msr6.hinet.net ([168.95.4.106] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Sb3G-00014C-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 11:19:58 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id SAA02018
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 18:20:24 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: ECC in Nand_write_page
Date: Thu, 11 Jul 2002 18:19:49 +0800
Message-ID: <003701c228c4$7decfee0$5501a8c0@synso.com.tw>
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

The board I used will display the message, "nand_write_ecc: Failed ECC
write", so I try to trace the function nand_write_ecc, I found it can
not write the ECC code into OOB sometime because the ECC in OOB are not
set as 0xff. There are two conditions to cause the problem, one
condition is the erase does not success, another condition is that the
page  was written before. Nand_write_page could write partial page to
the flash. Does it cause the ECC in OOB was written and ECC can not be
written next time. For example, nand_write_page write 100 byte the first
time and if it want to write 412 bytes to the same page next time, it
will fail. Does anyone have this problem?


Steve Tsai
