Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZ35d-0006lr-Bd
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2010 14:37:41 +0000
Received: by pwj7 with SMTP id 7so3261564pwj.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jul 2010 07:37:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0L5J00FOLHZI2I@ms13.samsung.com>
References: <0L5J00FOLHZI2I@ms13.samsung.com>
Date: Wed, 14 Jul 2010 16:37:30 +0200
Message-ID: <AANLkTinuTRyHdCUhP5dOocIFAUxrgvIhtGbBk3WUJfsS@mail.gmail.com>
Subject: Re: Possible bug in onenand_base ?
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: rohit.hs@samsung.com, v.dalal@samsung.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

2010/7/14 ROHIT H.S <rohit.hs@samsung.com>
>
> Hi Artem,
>
> Rohit Hagargundgi , author of mtd: Flex-OneNAND support has left the orga=
nization.
>
> Any Flex OneNAND specific issues will be taken care by us from now onward=
s.
>
> >On Thu, 2010-07-08 at 12:11 +0200, Enric Balletb=C3=B2 i Serra wrote:
>
> >> Hello,
>
> > >
>
> > >2010/7/8 Artem Bityutskiy <dedekind1 at gmail.com>:
>
> > >> On Thu, 2010-07-08 at 11:55 +0200, Enric Balletb=C3=B2 i Serra wrote=
:
>
> > >>> Hello,
> > >>>
>
> > >> >I made new tests regarding this issue. Looks like the problem is > =
>> reading from the OneNAND device.
> > >>
>
> > > >Did you try older kernel and then bisecting who is responsible for t=
he
> > > >breakage?
>
> > >
>
> > >Yes, before commit
> > >5988af2319781bc8e0ce418affec4e09cfa77907 (mtd: Flex-OneNAND support)
> > >http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommit;h=3D5988af2319781bc8e0ce418affec4e09cfa77907
> > >my OneNAND is working, after the commit, the OneNAND support is broken=
.
>
>
> >Ok, we could revert it, but it is better to fix it. CCing the author of
>
> the commit.
>
> We tested Samsung Muxed OneNAND(DDP) on Apollon Board with
>
> kernel 2.6.35-rc4 and did not face any problems with DDP OneNand read/wri=
te.
>
> We didn't face any problem with the below code as pointed by Eric in
>
> file:: onenand_base.c
> 378: default:
> block =3D onenand_block(this, addr);
> page =3D (int) (addr - onenand_addr(this, block)) >> this->page_shift;
>
>
> We didn't changed anything in onenand_base.c and have runned nandtest uti=
lity. Below are the results.
> mtd3 and mtd4 are our OneNAND paritions.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> # nandtest /dev/mtd3
> ECC corrections: 0
> ECC failures : 0
> Bad blocks : 1
> BBT blocks : 0
> Bad block at 0x00bc0000
> 00fe0000: checking...
> Finished pass 1 successfully
> # nandtest /dev/mtd4
> ECC corrections: 0
> ECC failures : 0
> Bad blocks : 0
> BBT blocks : 0
> 01fe0000: checking...
> Finished pass 1 successfully
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> We don't have Nymonix OneNAND DDP chip as used by Eric. So can't say why =
issue
>
> is coming up in that.
>
> Eric we need more details about the internal organization of Nymonix chip=
s which you are using.
>
> Reciprocating the envirnoment is not possible but atleast we will try to
>
> figure out if there is any difference in internal organization.

I have two different OneNAND from Numonyx and nandtest fails on all of them=
.

The first one is a 2-Gbit OneNAND device from Numonyx composed of one
dice with 2KB
page, the device is equipped with two DataRAMs ( two planes)

[   25.964904] OneNAND Manufacturer: Numonyx (0x20)
[   25.964904] Muxed OneNAND 256MB 1.8V 16-bit (0x40)
[   25.969787] OneNAND version =3D 0x0031
[   25.973388] Chip support all block unlock
[   25.973388] Chip has 2 plane

The second one is a 4-Gbit DDP OneNAND device from Numonyx composed of
two 2-Gbit 2KB
page dice stacked together, the device is equipped with two DataRAMs,

[   29.368347] OneNAND Manufacturer: Numonyx (0x20)
[   29.368347] Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
[   29.373657] OneNAND version =3D 0x0031
[   29.377258] Chip support all block unlock
[   29.377258] Chip has 2 plane

Note that these two devices have 2 planes, maybe this is difference.

Have you tested with a OneNAND with 2 planes ?

Best regards,
-- Enric
