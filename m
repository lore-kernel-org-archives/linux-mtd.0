Received: from pd9e41ee3.dip.t-dialin.net ([217.228.30.227] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LL9D-0000uA-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 10:56:07 +0100
Message-Id: <200206210956.g5L9uaG02073@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Steve Tsai" <startec@ms11.hinet.net>,
   "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: NAND FLASH
Date: Fri, 21 Jun 2002 11:56:36 +0200
References: <001901c21908$3f57b2e0$5501a8c0@synso.com.tw>
In-Reply-To: <001901c21908$3f57b2e0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Friday, 21. June 2002 11:44, Steve Tsai wrote:
> Hi,
> I try to use nand flash driver to my board, but it seems fail to do some
> operations. I just can get chip ID, but I can not read data or program
> data. I use GPIO to control CLE and ALE and connect WE, RE and CE to
> procesor. Is it right? Does anyone have sample code to test NAND flash?
1. CE should be a static signal 
2. please read http://www.linux-mtd.infradead.org/tech/nand.html 
3. Use the latest code from mtd-cvs
4. Read one of the board specific nand drivers to setup your own

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
