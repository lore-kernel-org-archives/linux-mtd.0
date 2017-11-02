Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAJQa-0002w3-T7
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 17:37:18 +0000
Received: by mail-ot0-x22a.google.com with SMTP id k10so236907otb.0
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 10:36:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171102164555.033dc99b@bbrezillon>
References: <1509621436.16695.3.camel@gmail.com>
 <20171102133954.055ce285@bbrezillon>
 <1509632027.16695.5.camel@gmail.com> <20171102160909.6eee6289@bbrezillon>
 <1509636493.16695.9.camel@gmail.com> <20171102164555.033dc99b@bbrezillon>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 2 Nov 2017 18:36:35 +0100
Message-ID: <CACQ1gAgBc-n_OzOOqy2rYzzRvXUXL6ezTD4FFk6ZZXMtmE4UaQ@mail.gmail.com>
Subject: Re: sam9x5: MTD numbering changed
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Peter Rosin <peda@axentia.se>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-11-02 16:45 GMT+01:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> On Thu, 02 Nov 2017 16:28:13 +0100
> Richard Genoud <richard.genoud@gmail.com> wrote:
>
>> +Nicolas
>> [its email got lost somehow]
>> Le jeudi 02 novembre 2017 =C3=A0 16:09 +0100, Boris Brezillon a =C3=A9cr=
it :
>> > On Thu, 02 Nov 2017 15:13:47 +0100
>> > Richard Genoud <richard.genoud@gmail.com> wrote:
>> >
>> > > Le jeudi 02 novembre 2017 =C3=A0 13:39 +0100, Boris Brezillon a =C3=
=A9crit :
>> > > > +Nicolas
>> > > >
>> > > > Hi Richard,
>> > > >
>> > > > On Thu, 02 Nov 2017 12:17:16 +0100
>> > > > Richard Genoud <richard.genoud@gmail.com> wrote:
>> > > >
>> > > > > Hi,
>> > > > >
>> > > > > I've got an at91sam9g35-cm based board, with 4 partition on the
>> > > > > spi-
>> > > > > dataflas and 5 partitions on the NAND flash.
>> > > > > Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new
>> > > > > NAND
>> > > > > bindings"),
>> > > > > the NAND partitions were mtd0-4 and spi-dataflash partitions
>> > > > > mtd5-
>> > > > > 8.
>> > > > >
>> > > > > Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new
>> > > > > NAND
>> > > > > bindings"),
>> > > > > the spi-dataflash partitions are discovered before the NAND
>> > > > > partitions.
>> > > > > So NAND partition became mtd4-8 and spi-dataflash partition
>> > > > > mtd0-3.
>> > > > >
>> > > > > This broke some script that relied on the mtd numbering.
>> > > > >
>> > > > > Updating those scripts to rely on the mtd device name instead
>> > > > > of
>> > > > > number is not really a problem. The real problem is when an
>> > > > > older
>> > > > > script using mtd numbering is run on the new system : I expect
>> > > > > dead
>> > > > > kittens everywhere !
>> > > >
>> > > > Crap! That was one of the thing I was afraid of when changing the
>> > > > binding: probe order has an impact on ids assigned to MTD devs,
>> > > > and
>> > > > since things are not defined at the same place in the DT, it
>> > > > changes
>> > > > the probe order.
>> > > >
>> > > > >
>> > > > > So, I'd like to know if there's a way to force the older
>> > > > > numbering
>> > > > > ?
>> > > >
>> > > > Reverting the patches is probably the easiest way (and it's
>> > > > easily
>> > > > backportable). Now, if we want to switch to the new bindings at
>> > > > some
>> > > > point we'll need to support DT aliases for mtd devs:
>> > > >
>> > > > aliases {
>> > > >         mtdX =3D &flashpartN;
>> > > >         mtdY =3D &flashdevM;
>> > > > };
>> > > >
>> > > > The problem with this solution is that it only works if all
>> > > > partitions
>> > > > are defined in the DT, which is not always the case (they can be
>> > > > defined
>> > > > on the command line with mtdparts=3D).
>> > >
>> > > Yes, and if they are different from the ones declared in
>> > > at91sam9x5cm.dtsi, they are likely defined with mtdparts=3D, since
>> > > AFAIK,
>> > > we can't remove a declared partitionning.
>> > >
>> > > I'll disable the ebi and switch back to the old binding in my dts
>> > > for
>> > > now.
>> > > >
>> > > > > (I tried poking around the DTS without succ=C3=A8s).
>> > > > >
>> > > > > any idea ?
>> > > >
>> > > > I don't have a perfect solution, but the problem you report
>> > > > clearly
>> > > > shows that relying on MTD numbering is unsafe and should be
>> > > > avoided.
>> > >
>> > > Clearly, but who doesn't ? ;)
>> > >
>> >
>> > Just had a lengthy discussion with Alexandre, and he brought a valid
>> > point: there has never been any guarantee on MTD numbering. Not only
>> > the order of DT nodes have an impact on the probe order, but also the
>> > order in which drivers are linked when creating the kernel image. Yes
>> > these things usually don't change, but I'm not sure it's a good idea
>> > to let user-space apps think it will never change in the future.
>> >
>> > How about fixing the scripts you were referring to instead of
>> > reverting
>> > the change? What's the blocking point?
>>
>> I already fixed the user-space scripts (and actually, they predate the
>> device-tree era, so at that time, relying on MTD numbering wasn't so
>> bad :)).
>> Anyway, here's the blocking point :
>>
>> We have firmwares with an embedded script to update our boards. (more
>> or less a FW + script in a zip file).
>> Those old firmwares are already in the wild and rely on the old MTD
>> numbering (yes, that's bad).
>>
>>
>> So, even if all new scripts are corrected in the new firmwares,
>> downgrading a board with an old firmware/old script will brick the
>> board.
>> So I'll have to detect that and forbid downgrading.
>
> Not sure what you refer to when you're talking about 'FW', but I'd
> expect it to contain a kernel [+ a dtb] + a rootfs, so if you're using
> an old "FW+update-script", you will still have the old numbering and
> the old script will work just fine, and if you switch to a newer version
> of the "FW+update-script" based on a 4.13 kernel+dtb you will anyway
> have the updated script. Am I missing something?

Ok, let's have an example.
New firmware : kernel
4.14+dtb+rootfs+uboot+uboot_env+at91bootstrap+new update script.
Old firmware : kernel 4.11 + dtb + rootfs + uboot +
uboot_env+at91bootstrap+old update script.

Let's suppose there's the new firmware on the board (let's call it
4.14 firmware) :
MTD0 is the dataflash partition 0 (at91bootstrap)
MTD1 is the dataflash part1 (uboot)
MTD2 is the dataflash part2 (ubootenv)
MTD3 is the dataflash part3 (free space)
MTD4 is the NAND part 0 (dtb)
MTD5 is the NAND part 1 (kernel)
MTD6 is the NAND part 2 (UBI) <- in this one, there're 3 ubifs volumes
: rootfs/rootfs2/data

The thing is, the update script runs in user-space and updates the
kernel, dtb, uboot, bootstrap and flashes the rootfs2.
(on next boot, the rootfs2/rootfs will be atomically swapped)
So, when downgrading, the old update script is executed on the board,
under the 4.14 firmware, thinking that MTD0 is the NAND part0 (dtb),
while it is actually the dataflash part0 (bootstrap).
=3D> the bootstrap is erased and replaced by the dtb (well, actually, it
won't even be like that since there will be a mismatch between
nandwrite/flash_part).

It's not a huge big deal since I have another way to flash all
partitions from uboot, but this can't be done remotely.


>
>>
>> That's not the end of the world, but if I can find a trick to prevent
>> it, I'll be happier !
>>
>>
