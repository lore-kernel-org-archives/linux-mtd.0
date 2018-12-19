Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZgJz-0005kx-FU
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 18:11:52 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Zoltan Szubbocsev (zszubbocsev)"
 <zszubbocsev@micron.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "Boris
 Brezillon" <boris.brezillon@bootlin.com>
Subject: RE: [EXT] Re: [PATCH V1] mtd: core: Micron SLC NAND filling block
Date: Wed, 19 Dec 2018 18:11:25 +0000
Message-ID: <BYAPR08MB4533FD42451BCEB47D46FEEDDBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533AC4A07E48EC37576C060DBBE0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <2816846.emhzHigZ4F@blindfold>
In-Reply-To: <2816846.emhzHigZ4F@blindfold>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Richard
thanks for your review.

>Am Mittwoch, 19. Dezember 2018, 12:03:06 CET schrieb Bean Huo (beanhuo):
>> +#define PARTIAL_FILLING_CHECKUP 1 /* Used to turn on/off partial fillin=
g
>> +		 block checkup before erasing this block.*/ #define
>> +LAST_CHECKPU_PAGE 13 struct ubifs_filling_head {
>> +	__le32 magic;
>> +	__le32 crc;
>> +	__le64 sqnum;
>> +	__le32 len;
>> +	__u8 node_type;
>> +	__u8 group_type;
>> +	__u8 padding[2];
>> +	__le32 pad_len;
>> +} __packed;
>
>I don't think this is needed anymore.
>

Thanks, I agree with you, and will be removed in next version.

>If you overwrite (sub)pages 0 and 1, UBI EC and VID headers are gone.
>In case of a power-cut before the erase operation, UBI will detect the
>corrupted EC and VID headers and re-erase the block.

This is actually what I want. Means always overwrite EC and VID headers, in=
 order to=20
let UBI to re-erase this block just because of this block contains my filli=
ng data (resulting from one power-cut after filling pages).
Otherwise, for the next boot, during attach stage, UBIFS will consider this=
 block to be a corrupted block.

let me take one example, eg, the last programmed page is page8, and after t=
he filling pages,=20
before mtd->_erase, power-cut hits, so in this block, there will be below d=
ata layout,=20

Page0 : EC header
Page1: VID header
Page2: not empty, valid data=20
Page3: not empty, valid data
Page4: not empty, valid data
Page5: not empty, valid data
Page6: not empty, valid data
Page7: not empty, valid data
Page8: not empty, valid data

Page9: filled with padding data by the patch
Page10: empty, keep all 0xff
Page11: filled with padding data by the patch
Page12: empty, keep all 0xff
Page13: filled with padding data by the patch

As for the older UBIFS (eg, v4.2), there will result in attach failure, but=
 for the latest
UBIFS, if I don't overwrite EC and VID header, will this condition happen?

>For a fastmap attach the story is different, it does not track unmap/erase
>operations. Therefore it will not notice that the block was scheduled for =
erase
>and got corrupted by overwriting the first pages.
>Users on top of UBIFS will face either ECC errors or UBIFS complains about
>corrupted empty space.
>This fastmap issue got fixed with:
>781932375ffc ("ubi: fastmap: Correctly handle interrupted erasures in EBA"=
)
>
>So your ubifs_filling_head struct seems to work around an already fixed UB=
I
>bug. :-)
>

Thanks for your info.
"ubi: fastmap: Correctly handle interrupted erasures in EBA" patch is merge=
d from v4.18.
So, I still need to firstly rebase patch to latest kernel, then let's have =
a look.

>Thanks,
>//richard
>

//Bean
