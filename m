Received: from msr45.hinet.net ([168.95.4.145] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LRtp-0001No-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 18:08:41 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: <gleixner@autronix.de>,
        "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND FLASH
Date: Sat, 22 Jun 2002 01:07:56 +0800
Message-ID: <000001c21946$329fbe10$50021ea3@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200206210956.g5L9uaG02073@thomas.tec.autronix.de>
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

Do I use GPIO to control CE? Because I use memory-map-io to connnect to
nand flash, if CE can not use to address the chip, I have to use other
design to address the flash chip. Thanks.

Steve Tsai

> Hi,
> I try to use nand flash driver to my board, but it seems fail to do 
> some operations. I just can get chip ID, but I can not read data or 
> program data. I use GPIO to control CLE and ALE and connect WE, RE and

> CE to procesor. Is it right? Does anyone have sample code to test NAND

> flash?
1. CE should be a static signal 
2. please read http://www.linux-mtd.infradead.org/tech/nand.html 
3. Use the latest code from mtd-cvs
4. Read one of the board specific nand drivers to setup your own
