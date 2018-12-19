Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZcpF-0008MB-Uk
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 14:27:55 +0000
From: Richard Weinberger <richard@nod.at>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "Zoltan Szubbocsev (zszubbocsev)" <zszubbocsev@micron.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 19 Dec 2018 15:27:32 +0100
Message-ID: <2816846.emhzHigZ4F@blindfold>
In-Reply-To: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
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

Am Mittwoch, 19. Dezember 2018, 12:03:06 CET schrieb Bean Huo (beanhuo):
> +#define PARTIAL_FILLING_CHECKUP 1 /* Used to turn on/off partial filling
> +		 block checkup before erasing this block.*/
> +#define LAST_CHECKPU_PAGE 13
> +struct ubifs_filling_head {
> +	__le32 magic;
> +	__le32 crc;
> +	__le64 sqnum;
> +	__le32 len;
> +	__u8 node_type;
> +	__u8 group_type;
> +	__u8 padding[2];
> +	__le32 pad_len;
> +} __packed;

I don't think this is needed anymore.

If you overwrite (sub)pages 0 and 1, UBI EC and VID headers are gone.
In case of a power-cut before the erase operation, UBI will detect the
corrupted EC and VID headers and re-erase the block.
For a fastmap attach the story is different, it does not track unmap/erase
operations. Therefore it will not notice that the block was scheduled for
erase and got corrupted by overwriting the first pages.
Users on top of UBIFS will face either ECC errors or UBIFS complains
about corrupted empty space.
This fastmap issue got fixed with:
781932375ffc ("ubi: fastmap: Correctly handle interrupted erasures in EBA")

So your ubifs_filling_head struct seems to work around an already fixed UBI
bug. :-)

Thanks,
//richard
