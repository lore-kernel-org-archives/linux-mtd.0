Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfMM-0005L1-Cd
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:14:06 +0000
Date: Sun, 19 Jun 2016 18:13:36 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Message-ID: <20160619161334.GH820@makrotopia.org>
References: <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org> <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org> <57669BEA.5030306@nod.at>
 <20160619140952.GC820@makrotopia.org> <5766AD99.1040809@nod.at>
 <20160619152445.GG820@makrotopia.org> <5766BAB8.9090707@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5766BAB8.9090707@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sun, Jun 19, 2016 at 05:31:04PM +0200, Richard Weinberger wrote:
> Am 19.06.2016 um 17:24 schrieb Daniel Golle:
> >> You mean marking a MTD partition in DT and UBI will attach from it?
> >> That makes sense.
> > 
> > Yes. Currently we just use a naming convention (the first MTD partition
> > named 'ubi' will be auto-attached), that's obviously not very clean...
> 
> I was about to reply to my own mail that you can still attach by name.
> Boris reminded me of that, I forgot that feature.^^
> Why is it not clean?

That's nice and I also didn't know that.
It's still not perfect because I got to add it to the cmdline (in DT),
and should have it only on devices where a partition with that given
name actually exists. A flag for the mtd partition would still be
nicer.

> 
> >>
> >> To sum up, I asked a lot of questions to understand your use case(s).
> >> Everything you described can be done with existing facilities.
> >> But I agree that at least some UBI DT machinery would be nice to have
> >> although we need to check with DT folks first.
> >> At least marking an MTD partition should be fine, hopefully.
> > 
> > Great. That'd already greatly improve things.
> 
> How is that better than attach by name? You mark the to be attached
> MTD by its name...

See above. We'd then still need to have that ubi.mtd=name in the
cmdline for NAND devices using UBI and *not* have it for other devices
within the same family which may use SPI or NOR flash without UBI.
I'd prefer to have one place inside the device-tree for everything
flash-storage related, eg.
&nand {
	status = "okay";
	partition@0 {
		label = "boot";
		reg = <0x00000000 0x00e00000>;
		read-only;
	};

	partition@e00000 {
		label = "data";
		compatible = "ubi,device";
		reg = <0x00e00000 0x07200000>;
	};
};

> 
> > I can see that sooner or later we will need some way to reference UBI
> > volumes in DT, independently of the whole rootfs selection. Vendors do
> > use UBI volumes also for things like WiFi EEPROM data. Currentlhy, we
> > extract that in user-space and save a copy in /lib/firmware/... for
> > things more crazy than plain offsets inside MTD partitions.
> 
> Really, please append a decent root= kernel parameter.

Maybe we just focus to solve one problem at a time :)
Anyway, it'd be great if 'root=' was possible and flexible enough.
However, as we support several filesystem types (ubifs vs. squashfs)
this is not straight forward.

ubi.mtd=mtdname root=ubiX:volname rootfstype=ubifs
vs.
ubi.mtd=mtdname ubiblock=... root=/dev/ubiblockX_Y

And we wouldn't want two seperate DT files for those cases nor can we
rely in bootloader support or any other means to differentiate them.

That was part of the initial motivation for having those
not-so-fancy patches in first place... (And yes, others have initramfs
pre-init systems, things like real_root=... in their cmdline and other
also not-that-fancy solutions to the problem)


Cheers


Daniel

> 
> Thanks,
> //richard
