Received: from msr59.hinet.net ([168.95.4.159] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1810MY-0004p7-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 09:14:07 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id QAA15925
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 16:13:53 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Memory usage?
Date: Mon, 14 Oct 2002 16:13:41 +0800
Message-ID: <000101c27359$9ec6d6b0$80d1a8c0@synso.com.tw>
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

Does JFFS2 will allocate large memory to read big file? I have  a 128M
bytes nand flash on my board and there is a large file about 12M bytes.
After I use the  testing program to read the file, the free memory
reduce to 312Kbytes (from 10660Kbytes). How can I reduce the memory
usage of JFFS2? Thanks.

Steve Tsai


 
