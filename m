Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BsAN-0004ni-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2002 07:42:28 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gAD8D1207376
	for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2002 09:13:01 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A50@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Problem writing to flash with writeb()
Date: Wed, 13 Nov 2002 09:12:59 +0100
MIME-Version: 1.0
Content-Type: text/plain
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

Thanks for the hint.

I was really blind.

Wolfram

> -----Original Message-----
> From: J B [mailto:mad_flasher@hotmail.com]
> Sent: Dienstag, 12. November 2002 20:02
> To: Wolfram.Gettert@fci.com; linux-mtd@lists.infradead.org
> Subject: Re: Problem writing to flash with writeb()
> 
> 
> 
> >   	physmap_map.map_priv_1 = (unsigned 
> >long)ioremap_nocache(WINDOW_ADDR,WINDOW_SIZE);
> >
> >	...
> >
> >	//Read Manufacturer and Device code
> >	physmap_write8(&physmap_map,0x90,physmap_map.map_priv_1);
> 
> Are you sure you want to pass physmap_map.map_priv_1 as the 
> address?  That 
> would imply that the address you are writing 0x90 to is (2 * 
> physmap_map.map_priv_1) because physmap_writeX will add 
> map->map_priv_1 to 
> whatever address you pass it.  If that is bigger than 
> WINDOW_SIZE, I don't 
> think the command will actually reach the flash chip because 
> the address 
> isn't mapped to a flash chip.  I am assuming you are using a 
> cfi compliant 
> flash chip and 0x90 is putting it into "Read Identifier 
> Codes".  Try using 0 
> for the address instead, which is what you did below.
> 
> >If I do it like this:
> >
> >	p = physmap_map.map_priv_1;
> >	p[0] = 0x90;
> 
> Looks like this is the equivalent of:
> physmap_write8(&physmap_map,0x90,0);
> 
> 
> I could be very wrong however.  I still consider myself a 
> newbie, so sorry 
> if this doesn't make any sense.  Hope it helps though.
> 
> 
> Josh
> 
> _________________________________________________________________
> The new MSN 8: smart spam protection and 2 months FREE*  
> http://join.msn.com/?page=features/junkmail
> 
