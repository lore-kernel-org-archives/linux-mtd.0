Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LSIW-0001PO-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 18:34:12 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Steve Tsai" <startec@ms11.hinet.net>,
        "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: NAND FLASH
Date: Fri, 21 Jun 2002 19:29:55 +0200
References: <000001c21946$329fbe10$50021ea3@synso.com.tw>
In-Reply-To: <000001c21946$329fbe10$50021ea3@synso.com.tw>
MIME-Version: 1.0
Message-Id: <02062119295500.01023@linuxtest>
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

On Friday, 21. June 2002 19:07, Steve Tsai wrote:
> Do I use GPIO to control CE? Because I use memory-map-io to connnect to
> nand flash, if CE can not use to address the chip, I have to use other
> design to address the flash chip. Thanks.
Yep you statically apply CE. Then the processing is done, then CE is released.
That's the way, how nand.c handles this. And it handles it correct.

> 1. CE should be a static signal
> 2. please read http://www.linux-mtd.infradead.org/tech/nand.html
> 3. Use the latest code from mtd-cvs
> 4. Read one of the board specific nand drivers to setup your own

-- 
Thomas
________________________________
Thomas Gleixner - autronix automation
http://www.autronix.de gleixner@autronix.de
