Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9eEw-0001K4-KC
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 22:11:06 +0000
Date: Sat, 21 Apr 2018 00:10:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: NeilBrown <neil@brown.name>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: clear Winbond Extended Address Reg on
 switch to 3-byte addressing.
Message-ID: <20180421001028.544f5d09@bbrezillon>
In-Reply-To: <87efj9pnyk.fsf@notabene.neil.brown.name>
References: <874lkmw54j.fsf@notabene.neil.brown.name>
 <87sh7wrq8p.fsf@notabene.neil.brown.name>
 <20180420215440.7b078f6c@bbrezillon>
 <87efj9pnyk.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 21 Apr 2018 07:28:19 +1000
NeilBrown <neil@brown.name> wrote:

> On Fri, Apr 20 2018, Boris Brezillon wrote:
> 
> > Hi Neil,
> >
> > On Mon, 16 Apr 2018 09:42:30 +1000
> > NeilBrown <neil@brown.name> wrote:
> >  
> >> Winbond spi-nor flash 32MB and larger have an 'Extended Address
> >> Register' as one option for addressing beyond 16MB (Macronix
> >> has the same concept, Spansion has EXTADD bits in the Bank Address
> >> Register).
> >> 
> >> According to section
> >>    8.2.7 Write Extended Address Register (C5h)
> >> 
> >> of the Winbond W25Q256FV data sheet (256M-BIT SPI flash)
> >> 
> >>    The Extended Address Register is only effective when the device is
> >>    in the 3-Byte Address Mode.  When the device operates in the 4-Byte
> >>    Address Mode (ADS=1), any command with address input of A31-A24
> >>    will replace the Extended Address Register values. It is
> >>    recommended to check and update the Extended Address Register if
> >>    necessary when the device is switched from 4-Byte to 3-Byte Address
> >>    Mode.
> >> 
> >> So the documentation suggests clearing the EAR after switching to
> >> 3-byte mode.  Experimentation shows that the EAR is *always* one after
> >> the switch to 3-byte mode, so clearing the EAR is mandatory at
> >> shutdown for a subsequent 3-byte-addressed reboot to work.
> >> 
> >> Note that some SOCs (e.g. MT7621) do not assert a reset line at normal
> >> reboot, so we cannot rely on hardware reset.  The MT7621 does assert a
> >> reset line at watchdog-reset.
> >> 
> >> Signed-off-by: NeilBrown <neil@brown.name>  
> >
> > We should probably backport the fix. Can you add a Fixes and Cc-stable
> > tag?  
> 
> It's a bit weird having Fixes when this isn't a regression, but I guess
> it doesn't hurt.

Well, I thought you wanted this patch to be backported to stable
releases, hence my suggestion. Of course it's not a regression, since
the bug is here from the beginning, but nonetheless it's fixing a bug.

> I chose
>   Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
> as this patch it useless without that one.

Not sure that's how Fixes should be used. IIUC, it should point to the
first commit where the bug was introduced, so I guess it's 0aa87b7563f1
("mtd: m25p80: add support for the windbond w25q256 chip") in this case.

Now, if you want to restrict the kernel releases this patch should be
backported to, you can use the '# vX.Y+' suffix in your Cc-stable tag.

> 
> I also fixed the comment and have resent.

Thanks.
