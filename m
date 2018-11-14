Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMrCV-0005Q8-IU
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 09:11:09 +0000
Date: Wed, 14 Nov 2018 10:10:55 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>,
 <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <Cristian.Birsan@microchip.com>
Subject: Re: [RFC] mtd: spi-nor: add support to non-uniform SFDP SPI NOR
 flash memories
Message-ID: <20181114101055.2653cd53@bbrezillon>
In-Reply-To: <a38ad0f7-e51a-158e-e074-2b1cdabecd16@microchip.com>
References: <e902a586-9e15-544c-ab4d-37d6ee28cdff@nokia.com>
 <a38ad0f7-e51a-158e-e074-2b1cdabecd16@microchip.com>
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

On Wed, 14 Nov 2018 08:00:44 +0000
<Tudor.Ambarus@microchip.com> wrote:

> Hi, Alexander,
> 
> On 11/13/2018 06:58 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> > Hello Tudor and all,
> > 
> > first of all, thank you for your work on SFDP support in Linux!
> > 
> > Unfortunately, I'm debugging a regression caused by 5390a8df769ec
> > "mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories"
> > in [out of tree] support for S25FS128S.
> > 
> > The culprit is the following part of your patch:
> > 
> > 	/*
> > 	 * For non-uniform SPI flash memory, set mtd->erasesize to the
> > 	 * maximum erase sector size. No need to set nor->erase_opcode.
> > 	 */
> > 	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
> > 		if (map->erase_type[i].size) {
> > 			erase = &map->erase_type[i];
> > 			break;
> > 		}
> > 	}
> > 
> > The problem in our case is, we have existing partitioning with 128k partitions
> > (the Flash itself supports 256k and 64k erasesize, depending on configuration).
> > The chip is configured for 64k erasesize, non-uniform mapping.
> > 
> > The mapping itself is being detected correctly, but when it comes to the code
> > snippet above, it selects the biggest erasesize from all sizes advertised in
> > SFDP, including 256k, which is not applicable to the current configuration.  
> 
> The fix would be to save the supported erase types when parsing the SFDP SMPT
> table and use those instead.
> 
> > 
> > Finally when mtd registers the partitions, they are forced read-only:
> > 
> > 	partition "..." doesn't start on an erase block boundary -- force read-only
> > 
> > So this change is not backwards compatible to the existing partitionings.  
> 
> Maybe you have a partition that is not divisible by 256k?

Yes, but apparently it was working before the non-uniform erase
changes, so this is a regression. And I fear this is not the only thing
that breaks when mtd->erasesize changes: UBI relies on mtd->erasesize
to figure out its LEB/PEB size, so exiting UBI partitions won't work
anymore on this flash.

> 
> > 
> > I cannot come with the justification for the above decision myself, so
> > I have to ask you guys, what is the reason for setting mtd->erasesize to
> > the *maximum* erase sector size?  
> 
> "Major" _valid_ erase sector size. It's an API requirement described at the
> mtd_info struct definition. I guess it's for performance reasons. You would like
> to use the biggest valid erase commands instead of multiple smaller. Also, one
> might require the erase starting address to be aligned with major erase size,
> for performance reasons as well.

I don't think this is related to perfs (at least not only), it's just
that some flashes have different erase size across the device, and some
MTD users don't want to deal with that, so instead, they use the
biggest erase size assuming this biggest erasesize is a multiple of the
smaller ones and will always work. That's typically what UBI does.
