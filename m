Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2icI-0007Af-G7
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2010 10:17:43 +0000
Received: by bwz10 with SMTP id 10so2518813bwz.4
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Apr 2010 03:17:39 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20100412022458.GB3274@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133513.20107.72328.stgit@shiryu.yomgui.biz>
	<20100408091215.GD21805@pengutronix.de>
	<20100412022458.GB3274@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 16 Apr 2010 12:17:19 +0200
Message-ID: <h2ub8e9195f1004160317y9018618ax2b2df9f3d7ee3f98@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/4/12 Wolfram Sang <w.sang@pengutronix.de>:
>> > + =C2=A0 =C2=A0 * one eraseblock-length per physical memory region
>> > + =C2=A0 =C2=A0 * we pretend the part said it had just one region ;)
>> > + =C2=A0 =C2=A0 **/
>> > + =C2=A0 cfi->cfiq->NumEraseRegions =3D 1;
>> > + =C2=A0 cfi->cfiq->EraseRegionInfo[0] =3D cfi->cfiq->EraseRegionInfo[=
1];
>>
>> Why is this last line needed? The comment says they are the same?
>
> Okay, my remark was rubbish, yet the comment in the source was a bit conf=
using,
> too. It is correct, though maybe the term 'region' is a bit overloaded. W=
hat
> about replacing both comments with something a bit simpler like this:
>
> /*
> =C2=A0* These flashes report two seperate eraseblock regions based on the
> =C2=A0* sector_erase-size and block_erase-size, although they both operat=
e on the
> =C2=A0* same memory. This is not allowed according to CFI, so we just pic=
k the
> =C2=A0* sector_erase-size.
> =C2=A0*/
>
> This is according to the datasheets. You pick the block-data size here
> (ususally using command 0x50). Why is that? I tried sector_size on a
> SST39WF1601 and it works fine so far, testing with mtd_stresstest. (Siden=
ote: I
> have to use JEDEC-probing though, as my flashes don't report 0x701 but 0x=
002
> (AMD standard) as their primary command set. But they still need their cu=
stom
> unlock address :( )

The 39VF3201 chip I use is on a brcm63xx board, running OpenWRT. It
reports 2 erase regions (as indicated in the datasheet):

Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x1000 bytes, 1024 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 64 blocks

But the function parse_cfe_partitions() in
drivers/mtd/maps/bcm963xx-flash.c [1] tries to read the partition
table at $(master->erasesize) (cf. line 67).
If I use the sector_erase-size, parse_cfe_partitions() tries to read
at 0x1000, and fails because the partition table is actually at
0x10000 on my flash.


[1] https://dev.openwrt.org/browser/trunk/target/linux/brcm63xx/patches-2.6=
.32/040-bcm963xx_flashmap.patch
--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
