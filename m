Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS0eQ-0008Sf-BY
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 14:17:16 +0000
Date: Wed, 28 Nov 2018 15:17:02 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: fix erase_type array to indicate
 current map conf
Message-ID: <20181128151702.5f8b1bf2@bbrezillon>
In-Reply-To: <2ae2459e-f5e7-f621-fd63-0982a1e59e86@nokia.com>
References: <20181126124531.17548-1-tudor.ambarus@microchip.com>
 <2ae2459e-f5e7-f621-fd63-0982a1e59e86@nokia.com>
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

Hi Alexander,

On Mon, 26 Nov 2018 13:04:45 +0000
"Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
wrote:

> Hello Tudor and all,
> 
> On 26/11/2018 13:45, Tudor.Ambarus@microchip.com wrote:
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > BFPT advertises all the erase types supported by all the possible
> > map configurations. Mask out the erase types that are not supported
> > by the current map configuration.
> > 
> > Backward compatibility test done on sst26vf064b.
> > 
> > Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> > Reported-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>  
> 
> I've verified the erasesize, partitioning and erase function of the S25FS128S
> and all the above is at least back to pre-SFDP state.
> 
> So the patch works as intended and it's
> Tested-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> There is still a regression with write when S25FS128S is used with SFDP
> because SFDP of the S25FS128S is just broken. It advertises 512 bytes
> of write page size but factory delivery configuration wraps the address
> on 256 bytes boundary. I found no way to fetch this configuration in a
> vendor-neutral way (or JEDEC-conform way). Which means, S25FS128S
> could be the first user of SPI_NOR_SKIP_SFDP flag :\.

You might be interested in my work around SPI NOR fixups[1]. I added a
few fixup hooks that can be implemented by manufacturer drivers (a new
concept) or on a per-chip basis. Looks like you'd need to implement a
->post_bfpt() fixup hook for this particular chip (see what's been done
for this Macronix chip [2]).

Regards,

Boris

[1]https://github.com/bbrezillon/linux-0day/commits/spi-nor/manuf-drv
[2]https://github.com/bbrezillon/linux-0day/commit/b29625fdc55fa8ccfd4299904d727b44f8382c18
