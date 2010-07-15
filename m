Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZMTU-0001yX-Qa
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2010 11:19:34 +0000
Received: by pwj7 with SMTP id 7so272790pwj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jul 2010 04:19:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <000201cb23ff$b11ab020$13501060$%hs@samsung.com>
References: <0L5J00FOLHZI2I@ms13.samsung.com>
	<AANLkTinuTRyHdCUhP5dOocIFAUxrgvIhtGbBk3WUJfsS@mail.gmail.com>
	<000201cb23ff$b11ab020$13501060$%hs@samsung.com>
Date: Thu, 15 Jul 2010 13:19:29 +0200
Message-ID: <AANLkTilSY5bFc9OlnktxRoKh-zv69pRrGo1L0u_zCMHN@mail.gmail.com>
Subject: Re: Possible bug in onenand_base ?
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: v.dalal@samsung.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Rohit,

2010/7/15 Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>:
> Hi Eric,
>
>>
>>-----Original Message-----
>>From: Enric Balletb=C3=B2 i Serra [mailto:eballetbo@gmail.com]
>>Sent: Wednesday, July 14, 2010 8:08 PM
>>To: linux-mtd@lists.infradead.org
>>Cc: dedekind1@gmail.com; v.dalal@samsung.com; rohit.hs@samsung.com
>>Subject: Re: Possible bug in onenand_base ?
>>
>>Hello,
>>
>>2010/7/14 ROHIT H.S <rohit.hs@samsung.com>
>>>
>>> Hi Artem,
>>>
>>> Rohit Hagargundgi , author of mtd: Flex-OneNAND support has left the or=
ganization.
>>>
>>> Any Flex OneNAND specific issues will be taken care by us from now onwa=
rds.
>>>
>>> >On Thu, 2010-07-08 at 12:11 +0200, Enric Balletb=C3=B2 i Serra wrote:
>>>
>>> >> Hello,
>>>
>>> > >
>>>
>>> > >2010/7/8 Artem Bityutskiy <dedekind1 at gmail.com>:
>>>
>>> > >> On Thu, 2010-07-08 at 11:55 +0200, Enric Balletb=C3=B2 i Serra wro=
te:
>>>
>>> > >>> Hello,
>>> > >>>
>>>
>>> > >> >I made new tests regarding this issue. Looks like the problem is =
> >> reading from the OneNAND device.
>>> > >>
>>>
>>> > > >Did you try older kernel and then bisecting who is responsible for=
 the
>>> > > >breakage?
>>>
>>> > >
>>>
>>> > >Yes, before commit
>>> > >5988af2319781bc8e0ce418affec4e09cfa77907 (mtd: Flex-OneNAND support)
>>> > >http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommit;h=3D5988af2319781bc8e0ce418affec4e09cfa77907
>>> > >my OneNAND is working, after the commit, the OneNAND support is brok=
en.
>>>
>>>
>>> >Ok, we could revert it, but it is better to fix it. CCing the author o=
f
>>>
>>> the commit.
>>>
>>> We tested Samsung Muxed OneNAND(DDP) on Apollon Board with
>>>
>>> kernel 2.6.35-rc4 and did not face any problems with DDP OneNand read/w=
rite.
>>>
>>> We didn't face any problem with the below code as pointed by Eric in
>>>
>>> file:: onenand_base.c
>>> 378: default:
>>> block =3D onenand_block(this, addr);
>>> page =3D (int) (addr - onenand_addr(this, block)) >> this->page_shift;
>>>
>>>
>>> We didn't changed anything in onenand_base.c and have runned nandtest u=
tility. Below are the results.
>>> mtd3 and mtd4 are our OneNAND paritions.
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> # nandtest /dev/mtd3
>>> ECC corrections: 0
>>> ECC failures : 0
>>> Bad blocks : 1
>>> BBT blocks : 0
>>> Bad block at 0x00bc0000
>>> 00fe0000: checking...
>>> Finished pass 1 successfully
>>> # nandtest /dev/mtd4
>>> ECC corrections: 0
>>> ECC failures : 0
>>> Bad blocks : 0
>>> BBT blocks : 0
>>> 01fe0000: checking...
>>> Finished pass 1 successfully
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> We don't have Nymonix OneNAND DDP chip as used by Eric. So can't say wh=
y issue
>>>
>>> is coming up in that.
>>>
>>> Eric we need more details about the internal organization of Nymonix ch=
ips which you are using.
>>>
>>> Reciprocating the envirnoment is not possible but atleast we will try t=
o
>>>
>>> figure out if there is any difference in internal organization.
>>
>>I have two different OneNAND from Numonyx and nandtest fails on all of th=
em.
>>
>>The first one is a 2-Gbit OneNAND device from Numonyx composed of one
>>dice with 2KB
>>page, the device is equipped with two DataRAMs ( two planes)
>>
>>[ =C2=A0 25.964904] OneNAND Manufacturer: Numonyx (0x20)
>>[ =C2=A0 25.964904] Muxed OneNAND 256MB 1.8V 16-bit (0x40)
>>[ =C2=A0 25.969787] OneNAND version =3D 0x0031
>>[ =C2=A0 25.973388] Chip support all block unlock
>>[ =C2=A0 25.973388] Chip has 2 plane
>>
>>The second one is a 4-Gbit DDP OneNAND device from Numonyx composed of
>>two 2-Gbit 2KB
>>page dice stacked together, the device is equipped with two DataRAMs,
>>
>>[ =C2=A0 29.368347] OneNAND Manufacturer: Numonyx (0x20)
>>[ =C2=A0 29.368347] Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
>>[ =C2=A0 29.373657] OneNAND version =3D 0x0031
>>[ =C2=A0 29.377258] Chip support all block unlock
>>[ =C2=A0 29.377258] Chip has 2 plane
>>
>>Note that these two devices have 2 planes, maybe this is difference.
>>
>>Have you tested with a OneNAND with 2 planes ?
>
>
> Yes, we have tested 2 planes Muxed OneNAND DDP device from Samsung(KFN4G1=
6Q2A) and
> did not face any problem with read/write from latest linux kernel.
>
> Below is the device information captured from U-boot,
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> U-Boot 2010.06 (Jul 15 2010 - 10:27:31)
>
> OMAP2420-GP revision 5
> Samsung Apollon SDP Base Board + mDDR
> DRAM: =C2=A064 MiB
> Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
> OneNAND version =3D 0x0121
> Chip support all block unlock
> Chip has 2 plane
> block =3D 2048, wp status =3D 0x2
> Scanning device for bad blocks
> onenand_bbt_wait: ecc error =3D 0x2222, controller =3D 0x2400
> Bad eraseblock 2485 at 0x136a0000
> OneNAND: 512 MiB
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> We haven't faced any issue with Samsung 2 plane DDP OneNAND device.
> Can you please provide us the Numonyx 2 plane OneNAND Chip spec which you
> are using.
>

Unfortunately I can't send the Numonyx datasheet because is under NDA.
Maybe someone from Numonyx can send us the datasheet. I think they
should seriously consider provide this information to help all
developers.

OTOH I investigated a little more, and I think I found something interestin=
g.

Comparing the KFN4G16Q2A with the Numonyx device I see are very
similar, so I compared the OneNAND configuration on Apollon board and
the IGEP v2 board. I see a significant diference, the IGEP v2 board
sets the CONFIG_MTD_ONENAND_2X_PROGRAM. Here are the results

# nandtest /dev/mtd4
ECC corrections: 0
ECC failures   : 0
Bad blocks     : 2
BBT blocks     : 0
Bad block at 0x0a100000
Bad block at 0x0a120000
0fa60000: checking...
Finished pass 1 successfully

Surprise, works now !

Whitout CONFIG_MTD_ONENAND_2X_PROGRAM the mtd info shows
# mtd_debug info /dev/mtd4
mtd.type =3D MTD_NANDFLASH
mtd.flags =3D MTD_CAP_NANDFLASH
mtd.size =3D 262668288 (250M)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 2048 (2K)
mtd.oobsize =3D 64
regions =3D 0

With CONFIG_MTD_ONENAND_2X_PROGRAM the mtd info shows
# mtd_debug info /dev/mtd4
mtd.type =3D MTD_NANDFLASH
mtd.flags =3D MTD_CAP_NANDFLASH
mtd.size =3D 262668288 (250M)
mtd.erasesize =3D 262144 (256K)
mtd.writesize =3D 4096 (4K)
mtd.oobsize =3D 64
regions =3D 0

In conclusion, seems the problem is handling the 2X program feature
and I suspect you can reproduce the issue enabling the
CONFIG_MTD_ONENAND_2X_PROGRAM in the apollon defconfig. Please, can
you test with your board ?

Thanks and best regards,
-- Enric
