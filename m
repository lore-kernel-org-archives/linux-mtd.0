Received: from mail-bw0-f209.google.com ([209.85.218.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4A13-0002nN-Gi
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 09:45:14 +0000
Received: by bwz1 with SMTP id 1so8297210bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Apr 2010 02:45:09 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20100418232906.GB16563@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133513.20107.72328.stgit@shiryu.yomgui.biz>
	<20100408091215.GD21805@pengutronix.de>
	<20100412022458.GB3274@pengutronix.de>
	<h2ub8e9195f1004160317y9018618ax2b2df9f3d7ee3f98@mail.gmail.com>
	<20100418232906.GB16563@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 20 Apr 2010 11:44:49 +0200
Message-ID: <u2yb8e9195f1004200244p6d3a8ef9m9f1f904e8be24158@mail.gmail.com>
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

Hi Wolfram,

>> > Okay, my remark was rubbish, yet the comment in the source was a bit c=
onfusing,
>> > too. It is correct, though maybe the term 'region' is a bit overloaded=
. What
>> > about replacing both comments with something a bit simpler like this:
>> >
>> > /*
>> > =C2=A0* These flashes report two seperate eraseblock regions based on =
the
>> > =C2=A0* sector_erase-size and block_erase-size, although they both ope=
rate on the
>> > =C2=A0* same memory. This is not allowed according to CFI, so we just =
pick the
>> > =C2=A0* sector_erase-size.
>> > =C2=A0*/
>> >
>
> Any opinion about this change?

I'm of course ok with this change, I integrated it in my patch.

> > This is according to the datasheets. You pick the block-data size here
>> > (ususally using command 0x50). Why is that? I tried sector_size on a
>> > SST39WF1601 and it works fine so far, testing with mtd_stresstest. (Si=
denote: I
>> > have to use JEDEC-probing though, as my flashes don't report 0x701 but=
 0x002
>> > (AMD standard) as their primary command set. But they still need their=
 custom
>> > unlock address :( )
>>
>> The 39VF3201 chip I use is on a brcm63xx board, running OpenWRT. It
>> reports 2 erase regions (as indicated in the datasheet):
>>
>> Number of Erase Block Regions: 2
>> =C2=A0 Erase Region #0: BlockSize 0x1000 bytes, 1024 blocks
>> =C2=A0 Erase Region #1: BlockSize 0x10000 bytes, 64 blocks
>
> Yes, same here.
>
>> But the function parse_cfe_partitions() in
>> drivers/mtd/maps/bcm963xx-flash.c [1] tries to read the partition
>> table at $(master->erasesize) (cf. line 67).
>> If I use the sector_erase-size, parse_cfe_partitions() tries to read
>> at 0x1000, and fails because the partition table is actually at
>> 0x10000 on my flash.
>
> I see the problem, but think it should be fixed differently (in the drive=
r?).
> cfi_cmdset_0002.c uses CMD 0x30 for erasing (line 1604 in mtd/master). Th=
e SST
> datasheet now tells that the chip then expects the sector address (table =
6 or
> figure 11). Given that I wonder if erasing truly works unless I missed
> something (at least it fails with mtd_stresstest for me if I change my
> jedec_probe to use 0x10000 instead of 0x1000).

Ok, you were right, the problem is in the driver.
I tried to use the hardcoded value 0x10000 instead of mtd->erasesize,
and use the sector_erase-size.
mtd_stresstest now runs smoothly, so I need to ask bcm963xx-flash.c
authors why they use this variable.

I continue my tests and discussions with the bcm963xx-flash.c authors
and get back when I've got a clean solution.

Thanks for your investigations !

Regards.
--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
