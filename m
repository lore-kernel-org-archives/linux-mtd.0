Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQ8iE-0007nj-Sh
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 10:29:28 +0000
Date: Fri, 23 Nov 2018 11:29:03 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix erase_type array to indicate current
 map conf
Message-ID: <20181123112903.56393f28@bbrezillon>
In-Reply-To: <20181123111729.1d5b6e57@bbrezillon>
References: <20181122123552.15756-1-tudor.ambarus@microchip.com>
 <3d8a2b83-282d-7cb2-3c8b-addae3c2af7f@nokia.com>
 <20181123111729.1d5b6e57@bbrezillon>
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

On Fri, 23 Nov 2018 11:17:29 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Fri, 23 Nov 2018 09:42:55 +0000
> "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
> wrote:
> 
> > Hello Tudor,
> > 
> > On 22/11/2018 13:36, Tudor.Ambarus@microchip.com wrote:
> > > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > > 
> > > Bug reported for the out-of-tree S25FS128S flash memory.
> > > 
> > > BFPT table advertises all the erase types supported by all the
> > > possible map configurations. Update the erase_type array to indicate
> > > which erase types are applicable to the current map configuration.
> > > 
> > > Backward compatibility test done on sst26vf064b.
> > > 
> > > Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> > > Reported-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> > > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>  
> > 
> > I've tested this patch and it fixes the erasesize for S25FS128S and
> > our 128k partitions are writeable again with this patch.
> > 
> > Nevertheless, I think this is coincidence. I don't think that it
> > makes sense to OR all the erase types from all regions in one
> > bitmask and derive any uniform erasesize out of it.
> > This makes little sense for me in case of non-uniform maps.
> > 
> > I believe, the culprit here is one level higher, in the MTD partitioning
> > code (mtdpart.c) which has to be taught about non-uniform maps
> > but there is no infrastructure for this currently.
> 
> Keep in mind that mtdpart is only one part of the issue. As I said
> previously, some MTD users (UBI) expect a single eraseblock size, so
> it's not only mtdpart that you'd need to fix, but basically all MTD
> users that don't check ->eraseregions.

Just checked, and it seems mtdpart already supports eraseregions [1].
It picks the biggest erasesize of the regions covered by the partition,
which is exactly what we want. So all we'd have to do is make spi-nor.c
define those regions.

[1]https://elixir.bootlin.com/linux/v4.20-rc3/source/drivers/mtd/mtdpart.c#L482
