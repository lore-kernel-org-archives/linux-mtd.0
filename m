Received: from msr29.hinet.net ([168.95.4.129] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17phRN-0007fk-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 04:48:21 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id LAA24859
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 11:48:17 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: About GC 
Date: Fri, 13 Sep 2002 11:47:58 +0800
Message-ID: <002d01c25ad8$5a39d310$80d1a8c0@synso.com.tw>
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

The recent CVS code has a great improvement at mounting time. It's
great. I test it with the 32Mbytes NAND flash and the mounting time
reduce to 10 seconds(the original time is 50 seconds). After mounting, I
found that the GC thread will take the most CPU time(99.9)  in my system
for a while. How can I make jffs2_garbage_collection_pass to reduce CPU
time?

Steve Tsai
