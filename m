Received: from pd9e41f2b.dip.t-dialin.net ([217.228.31.43] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177DnG-0007Gq-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 12:15:06 +0100
Message-Id: <200205131118.g4DBImU04255@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: manningc2@actrix.gen.nz, David Woodhouse <dwmw2@infradead.org>,
   franck.fleter@netbricks.com
Subject: Re: Boot from NAND flash ???
Date: Mon, 13 May 2002 12:18:48 +0100
Cc: linux-mtd@lists.infradead.org
References: <3CDF6922.9A0A870F@netbricks.com> <16389.1021282176@redhat.com> <20020513101623.DE1A14235@tiger.actrix.co.nz>
In-Reply-To: <20020513101623.DE1A14235@tiger.actrix.co.nz>
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

On Monday, 13. May 2002 12:11, Charles Manning wrote:

> There are however two mechanisms to get around this:
> * Some people and micros implement a "data pump" state machine to extract
> an executable sequence from a NAND device.
> * Some of the newer NAND devices can be accessed directly from the bus and
> can do the job of a boot ROM.
>
> There is however a limitation to both of these. The NAND can only be
> accessed sequentially (it is not random access like NOR) which limits the
> types of instruction the boot code can perform. In particular it can't
> branch or fetch from elsewhere in ROM.

There's another important limitation. Who guarantees you, that your 
"boot-page" does not get bad or is a bad block already. That's the reason, 
why DOC has 4 blocks with the same code. 

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
