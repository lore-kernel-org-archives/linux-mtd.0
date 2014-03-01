Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJpUj-0005HJ-Hh
 for linux-mtd@lists.infradead.org; Sat, 01 Mar 2014 19:22:48 +0000
From: Marek Vasut <marex@denx.de>
To: Insop Song <Insop.Song@gainspeed.com>
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
Date: Sat, 1 Mar 2014 20:22:10 +0100
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201402272101.59845.marex@denx.de>
 <106fa8b5760a4a88be8cb469fab79186@BY2PR07MB011.namprd07.prod.outlook.com>
In-Reply-To: <106fa8b5760a4a88be8cb469fab79186@BY2PR07MB011.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201403012022.10111.marex@denx.de>
Cc: "Priyanka.Jain@freescale.com" <Priyanka.Jain@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, March 01, 2014 at 03:44:46 AM, Insop Song wrote:
> Hi Marek,
> 
> > From: Marek Vasut [mailto:marex@denx.de]
> > Sent: Thursday, February 27, 2014 12:02 PM
> > 
> > On Thursday, February 27, 2014 at 08:33:14 AM, Brian Norris wrote:
> > > + Marek
> > 
> > Thanks, I really need to subscribe to this ML ;-/
> > 
> > > Hi Insop,
> > > 
> > > On Mon, Jan 06, 2014 at 05:21:17AM +0000, Insop Song wrote:
> > > > In order to use Micron n25q512a, MTD, two changes are required as
> > > > follows: - jedec code should be fixed
> > > 
> > > I have a feeling there are more than one "n25q512a" device, with
> > > different IDs.
> > 
> > ACK, I have similar feeling. Jain, can you tell us the precise marking on
> > your N25Q512A chip (that is, every single letter on the top of the chip
> > package exactly as it is engraved there ) please? Or make a photo ...
> > 
> > Insop, can you please do the same ?
> > 
> > [...]
> 
> 25Q512A
> 13640

OK, I think I figured it out already.

Look at [1] and [2] . The former is 1V8 option, the later is 3V3 option of the 
same N25Q512A SPI NOR. If you look for 'JEDEC-standard 2-byte signature' in the 
datasheets, you will notice there's one that is 'BB20h' for the 1V8 part and 
'BA20h' for the 3V3 part. So I suppose that's the mystery here and this is the 
explanation.

[1] 
www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1_8v_65nm.pdf

[2] 
www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf

> > > > @@ -782,7 +864,7 @@ static const struct spi_device_id m25p_ids[] = {
> > > > 
> > > >  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
> > > >  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> > > >  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> > > > 
> > > > -	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> > > > +	{ "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },
> > > 
> > > You probably want to figure out the distinction between the old table
> > > entry and the new one, and assign your new entry a new string
> > > accordingly.
> > 
> > ACK. The datasheet actually claims this change is correct, see [1] (page
> > 40, table 21), but as we know, Micron really does shitty job when it
> > comes to using the JEDEC IDs for it's chips.
> 
> "n25q512a1" okay?
> Or any other suggestion?

According the chapter 'Part Number Ordering Information', the naming scheme here 
should be the same as in case of the n25q128a11/n25q128a13 , since the two 
trailing numbers mean:

1: 1 ... Byte addressability; HOLD pin; Micron XIP
2: 1 ... Vcc = 1.7 to 2.0V
   3 ... Vcc = 2.7 to 3.6V

> > > >  	/* PMC */
> > > >  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) 
},
> > > > 
> > > > @@ -996,6 +1078,13 @@ static int m25p_probe(struct spi_device *spi)
> > > > 
> > > >  	spi_set_drvdata(spi, flash);
> > > >  	
> > > >  	/*
> > > > 
> > > > +	 * Micron n25q512a requires to check flag status register
> > > > +	 */
> > > > +	flash->flag_status = false;
> > > > +	if (strcmp(id->name, "n25q512a") == 0)
> > > > +		flash->flag_status = true;;
> > > 
> > > This doesn't look good at all. If any other flash start to need this,
> > > we don't want to code each ID string here. That's fragile and
> > > non-scaleable. If we need this option, you need to add another flag to
> > > the m25p_ids[] table, I guess...
> > 
> > This waiting for some bit in FSR looks like it can be wrapped into
> > wait_till_ready(), no ?
> > 
> > What I cannot find in the datasheet though is any evidence which would
> > clearly mandate the use of FSR bit 0x80 to test if the chip is ready for
> > next operation instead of using the regular STATUS register bit . Insop,
> > can you please elaborate on why using the FSR is needed ?
> 
> If I don't check FSR(Flag Status Register), then I was not able to program
> this flash. I've used C SDK from Aardvark I2C/SPI Host Adapter to program
> directly, and we had to check FSR. Also in linux driver, I had to put the
> check otherwise, I am not able to write the flash. I think it is mandatory
> though datasheet is not so clear about it.

What kind of problems do you get when you try to write the flash ? I am trying 
to crosscheck this with the N25Q256A I have in here, which also has the FSR, but 
I have no issues programming the chip either in Linux or in U-Boot.

To me, it looks like FSR bit 7 and SR bit 7 should toggle exactly at the same 
time and exactly for the same events. Can you try for example reading them both 
and checking that the bit 7 really toggles at different times please?

Best regards,
Marek Vasut
