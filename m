Received: from smtp-102.noc.nerim.net ([62.4.17.102] helo=mallaury.noc.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eBIF-0000Xx-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 09:47:35 +0000
Date: Thu, 30 Jan 2003 11:18:35 +0100
From: Stephane List <stephane.list@lilotux.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Intel Strataflash
Message-ID: <20030130101835.GC11189@lilotux.net>
References: <20030129161457.GA9083@lilotux.net> <Pine.LNX.4.44.0301292233430.4791-100000@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301292233430.4791-100000@imladris.demon.co.uk>
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

Everything is fine with removing the "grep -m" and replacing with the
good values.

Thanks a lot

Stephane

On mer, jan 29, 2003 at 10:36:13 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 29 Jan 2003, Stephane List wrote:
> 
> > PS : I couldn't compile my kernel with the CVS code...
> 
> Details?
> 
> 
> > CONFIG_MTD_CFI_ADV_OPTIONS=y
> 
> Advanced options? Why did you enable this? On this occasion it isn't the 
> problem, because you got the options it hides correct anyway. 
> 
> > #Because the data bus of the CPU is 4 bytes
> > CONFIG_MTD_CFI_B4=y
> 
> Correct.
> 
> > #Because There are 2 flashs connected on the same Data bus.
> > CONFIG_MTD_CFI_I2=y
> 
> Correct.
> 
> > #Because it's an Intel Strataflash
> > CONFIG_MTD_CFI_INTELEXT=m
> 
> Correct.
> 
> > #Because my flash chip data bus is 2 bytes width
> > CONFIG_MTD_PHYSMAP_BUSWIDTH=2
> 
> No, your CPU data bus is 4 bytes width (cf. CFI_B4 above) and has two 
> chips on it so
>  CONFIG_MTD_PHYSMAP_BUSWIDTH=4
> 
> 
> -- 
> dwmw2
> 
> 
> 

-- 
Stephane List
http://slist.lilotux.net
