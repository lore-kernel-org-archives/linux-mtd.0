Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e0Ka-0007XY-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 22:05:17 +0000
Date: Wed, 29 Jan 2003 22:36:13 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Stephane List <stephane.list@lilotux.net>
cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <20030129161457.GA9083@lilotux.net>
Message-ID: <Pine.LNX.4.44.0301292233430.4791-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: Intel Strataflash
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 29 Jan 2003, Stephane List wrote:

> PS : I couldn't compile my kernel with the CVS code...

Details?


> CONFIG_MTD_CFI_ADV_OPTIONS=y

Advanced options? Why did you enable this? On this occasion it isn't the 
problem, because you got the options it hides correct anyway. 

> #Because the data bus of the CPU is 4 bytes
> CONFIG_MTD_CFI_B4=y

Correct.

> #Because There are 2 flashs connected on the same Data bus.
> CONFIG_MTD_CFI_I2=y

Correct.

> #Because it's an Intel Strataflash
> CONFIG_MTD_CFI_INTELEXT=m

Correct.

> #Because my flash chip data bus is 2 bytes width
> CONFIG_MTD_PHYSMAP_BUSWIDTH=2

No, your CPU data bus is 4 bytes width (cf. CFI_B4 above) and has two 
chips on it so
 CONFIG_MTD_PHYSMAP_BUSWIDTH=4


-- 
dwmw2
