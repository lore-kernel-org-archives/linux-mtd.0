Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZgaJ-0004Xu-9Y
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 18:28:45 +0000
From: Richard Weinberger <richard@nod.at>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 19 Dec 2018 19:28:28 +0100
Message-ID: <1664708.GA0Z09RGF1@blindfold>
In-Reply-To: <BYAPR08MB4533FD42451BCEB47D46FEEDDBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <2816846.emhzHigZ4F@blindfold>
 <BYAPR08MB4533FD42451BCEB47D46FEEDDBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am Mittwoch, 19. Dezember 2018, 19:11:25 CET schrieb Bean Huo (beanhuo):
> >If you overwrite (sub)pages 0 and 1, UBI EC and VID headers are gone.
> >In case of a power-cut before the erase operation, UBI will detect the
> >corrupted EC and VID headers and re-erase the block.
> 
> This is actually what I want. Means always overwrite EC and VID headers, in order to 
> let UBI to re-erase this block just because of this block contains my filling data (resulting from one power-cut after filling pages).
> Otherwise, for the next boot, during attach stage, UBIFS will consider this block to be a corrupted block.
> 
> let me take one example, eg, the last programmed page is page8, and after the filling pages, 
> before mtd->_erase, power-cut hits, so in this block, there will be below data layout, 
> 
> Page0 : EC header
> Page1: VID header
> Page2: not empty, valid data 
> Page3: not empty, valid data
> Page4: not empty, valid data
> Page5: not empty, valid data
> Page6: not empty, valid data
> Page7: not empty, valid data
> Page8: not empty, valid data
> 
> Page9: filled with padding data by the patch
> Page10: empty, keep all 0xff
> Page11: filled with padding data by the patch
> Page12: empty, keep all 0xff
> Page13: filled with padding data by the patch
> 
> As for the older UBIFS (eg, v4.2), there will result in attach failure, but for the latest
> UBIFS, if I don't overwrite EC and VID header, will this condition happen?

Sorry I didn't make myself clear. It is perfectly fine to kill both EC and VID headers.
This is actually what we want.

Thanks,
//richard
