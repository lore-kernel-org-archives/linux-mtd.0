Received: from cmbr-osip1-19171.huxcomm.net ([207.32.19.171]
	helo=localhost.localdomain)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MM4ap-0004pH-HO
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 18:31:46 +0000
To: w.sang.at.pengutronix.de@localhost.localdomain (Wolfram Sang),
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1244276049.3751.1176.camel@macbook.infradead.org>
	<20090606111926.GA3279@pengutronix.de>
From: Ken MacLeod <ken@bitsko.slc.ut.us>
Date: Wed, 01 Jul 2009 13:22:19 -0500
In-Reply-To: <20090606111926.GA3279@pengutronix.de> (Wolfram Sang's message of
	"Sat\, 6 Jun 2009 13\:19\:26 +0200")
Message-ID: <m3iqicnu04.fsf@bitsko.slc.ut.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

w.sang at pengutronix.de (Wolfram Sang) writes:

> On Sat, Jun 06, 2009 at 09:14:08AM +0100, David Woodhouse wrote:
>
>> It _would_ be possible to hook up RAM through the existing of_physmap
>> driver, I think -- although it would be slightly less efficient that
>> way.
>> 
>> Maybe cleaner from the device-tree POV though. And if we want to put a
>> special case in the _code_ to make it more efficient, we can do that.
>
> During development, I also checked physmap_of.c and found this binding:
>
>         {
>                 .type           = "rom",
>                 .compatible     = "direct-mapped"
>         },
>
> which made some sense to me and I thought about .type = "ram". However, I then
> found this in the code:
>
> /* Helper function to handle probing of the obsolete "direct-mapped"
>  * compatible binding, which has an extra "probe-type" property
>  * describing the type of flash probe necessary. */
> static struct mtd_info * __devinit obsolete_probe(struct of_device *dev,

I was just looking into the same thing but I used:

	{
		.compatible	= "mtd-ram",
		.data		= (void *)"map_ram",
	},

This causes of_flash_probe to set up the map and then call
do_map_probe("map_ram", ...), instead of calling the "obsolete" code
path.

This seems to be working for me.  It looks like partition support
would be included too but I haven't tried that.

  -- Ken
