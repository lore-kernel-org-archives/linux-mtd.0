Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJpUj-0005HK-Uy
 for linux-mtd@lists.infradead.org; Sat, 01 Mar 2014 19:22:47 +0000
From: Marek Vasut <marex@denx.de>
To: Insop Song <Insop.Song@gainspeed.com>
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
Date: Sat, 1 Mar 2014 20:04:22 +0100
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <20140227073314.GD13420@norris-Latitude-E6410>
 <d695e8d34cac47608353f858d51c3e59@BY2PR07MB011.namprd07.prod.outlook.com>
In-Reply-To: <d695e8d34cac47608353f858d51c3e59@BY2PR07MB011.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201403012004.22436.marex@denx.de>
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

On Saturday, March 01, 2014 at 03:00:04 AM, Insop Song wrote:
> Hi Brian,
> 
> Thank you for your feedback.
> 
> > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > Sent: Wednesday, February 26, 2014 11:33 PM>
> > 
> > On Mon, Jan 06, 2014 at 05:21:17AM +0000, Insop Song wrote:
> > > In order to use Micron n25q512a, MTD, two changes are required as
> > 
> > follows:
> > > - jedec code should be fixed
> > 
> > I have a feeling there are more than one "n25q512a" device, with
> > different IDs.
> > 
> > > - flag status should be read for writing.
> > > 
> > > Check flag status register for Micron n25q512a
> > > 
> > >     - Programing Micron n25q512a requires to check flag status register
> > >     - According to datasheet
> > >     
> > >     	"
> > >     	The flag status register must be read any time a PROGRAM, ERASE,
> > >     	SUSPEND/RESUME command is issued, or after a RESET command
> > 
> > while device
> > 
> > >     	is busy. The cycle is not complete until bit 7 of the flag 
status
> > >     	register output 1.
> > >     	"
> > >     
> > >     - Ref:
> > https://www.micron.com/~/media/Documents/Products/Data%20Sheet/N
> > OR%20F
> > 
> > > lash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf
> > 
> > Hmm, are you sure that all Micron n25q512a need to check the flag status
> > register? I'll check my datasheets when I'm back in the office, but this
> > seems peculiar.
> 
> "Flag status" term can be found in 84 time in the data sheet and I don't
> think the flag status is specific to particular type of n25q512a.

n25q256a works just fine with regular SR check.

[...]

> > > @@ -782,7 +864,7 @@ static const struct spi_device_id m25p_ids[] = {
> > > 
> > >  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
> > >  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> > >  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> > > 
> > > -	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> > > +	{ "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },
> > 
> > You probably want to figure out the distinction between the old table
> > entry and the new one, and assign your new entry a new string
> > accordingly.
> 
> You mean "0x20bb20" (old value) must be still the valid value?

Likely, since someone added it before and if you look at the other Micron 
entries, you see chips with '0x20bb..' as well as '0x20ba' . Micron must have 
done something funny here (again :-( )
[...]
