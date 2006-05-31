Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlRGk-0004RK-Vz
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 10:02:00 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J040070EUZ41EH0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 31 May 2006 10:01:52 -0400 (EDT)
Date: Wed, 31 May 2006 10:01:52 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1149062982.32620.67.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149062982.32620.67.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 May 2006, Artem B. Bityutskiy wrote:

> 1. Having an mtd->field field and capabilities flags a bad idea. Why?
> 
> 1a: Who initializes this mtd->flags field?

The chip driver providing anMTD interface to said chip.

> If I want to add 20 new
> capabilities, how many places do I have to change? As many as there are
> drivers in MTD? Insane.

Don't be ridiculous.  There is no way you can find 20 capabilities total 
for a generic MTD interface.

> 2a. In general, the capabilities thing is application-dependent. And it
> must stay in application's area, not deep in drivers.

Not true.  The capabilities are function of the hardware not the 
application.

> 3a: If I'm a user of MTD, and I want to add 20 new capability, do I have
> to change MTD itself? It's not my business to do this.

If you want to add new capabilities, you only have to care about users 
of those capabilities and of course users that worked without them 
before will just continue to work if they ignore them.

> 4a. How wide is the mtd->flags field? 32 bits? So, you restrict me by 32
> capabilities? And if I need more, I have to combine the existing ones?
> Why is it better then using mtd->type?

Who said capabilities have to be only single bits?

And even if the capability field as you insist to see it has only 32 
bits, what prevents you from extending it in the unlikely event more 
bits might be needed?

> So, this is not an extensible solution.

Artem you're more brilliant than that.

> 2. OK, what do you offer instead (the question nobody asked yet)?
> 
> Forget about mtd->flags. Leave alone mtd->type. Add an
> include/linux/mtd/flash_capabilities.h header which looks like this:
> 
> /* If the flash allows to clear individual bits */
> #define mtd_can_clear_bits(mtd) (mtd->type == MTD_NORFLASH)
> /* If the goat may be milked */
> #define mtd_can_milk_a_goat(mtd) (bah)
> ....
> etc.
> 
> So, you have your set of capabilities. You use this header in JFFS2 and
> clean it up. Your task is solved.

And the runtime code is both larger and slower.  And the source is 
even more obfuscated.  Isn't that great?


Nicolas
