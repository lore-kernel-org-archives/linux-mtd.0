Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31121C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 11:46:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D06611AD
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 11:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9D06611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uj91My1LFdsN100AQ5t35ppqC421nPJf+5MNnNFJno=; b=xGpTckW2va6P+q
	B1KuD9D5IJ0lelYX/iAYer4dGTzIcrGbNM3DEjWYjOMkujFZkSYjAWJ+fim1/cpfsz6BcYbpTaxd6
	5H6BEvYV2prkUMig8PUoc8HgW7z2Pv2e+yF9xha2wEXT8vrIcibwCyntoBNIqHzFInysQaWFlE6yX
	KSszrk52xEk7YMQDwN3WDXysE0u3XhHHc5macU831t0SeBk/eZpAFSv50C3ki6dXjO17pZtzpf+Dj
	goq56qi+TCsy5q8hRPK3iW9j2NB6JQ+5MOkG8b2ARELjMuVxMzvEg+op3lX/geURxEONFtrE4S1DR
	Q2J9HvLlcp6rP7duGOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkPZF-001nky-BR; Tue, 09 Nov 2021 11:45:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkPZ9-001njz-EY
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 11:45:31 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mkPZ3-0003n8-1T; Tue, 09 Nov 2021 12:45:21 +0100
Date: Tue, 9 Nov 2021 11:45:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
Message-ID: <YYpfSNY9hOPmu165@makrotopia.org>
References: <20210801234509.18774-1-ezequiel@collabora.com>
 <20211026150350.GA5136@localhost>
 <876982414.38679.1635274892099.JavaMail.zimbra@nod.at>
 <20211028133119.GA21237@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028133119.GA21237@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_034527_522972_625DB5B1 
X-CRM114-Status: GOOD (  38.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 28, 2021 at 09:31:19AM -0400, Trevor Woerner wrote:
> On Tue 2021-10-26 @ 09:01:32 PM, Richard Weinberger wrote:
> > Trevor,
> > =

> > ----- Urspr=FCngliche Mail -----
> > > Von: "Trevor Woerner" <twoerner@gmail.com>
> > > An: "Ezequiel Garcia" <ezequiel@collabora.com>
> > > CC: "linux-mtd" <linux-mtd@lists.infradead.org>, "linux-kernel" <linu=
x-kernel@vger.kernel.org>, "richard"
> > > <richard@nod.at>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vigne=
sh Raghavendra" <vigneshr@ti.com>
> > > Gesendet: Dienstag, 26. Oktober 2021 17:03:50
> > > Betreff: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
> > =

> > > On Sun 2021-08-01 @ 08:45:02 PM, Ezequiel Garcia wrote:
> > >> Hi Richard, and everyone else:
> > >> =

> > >> Browsing the internet for "JFFS2 mtd" results in tutorials, articles
> > >> and github.gists0 that point to mtdblock.
> > >> =

> > >> In fact, even the MTD wiki mentions that JFFS2
> > >> needs mtdblock to mount a rootfs:
> > >> =

> > >>   http://www.linux-mtd.infradead.org/faq/jffs2.html
> > >> =

> > >> Moreover, I suspect there may be lots of users
> > >> that still believe mtdblock is somehow needed to
> > >> mount SquashFS.
> > >> =

> > >> I've taken a verbose route and added a pr_warn
> > >> warning if the devices are NAND. I don't think using
> > >> NAND without UBI is too wise, and given the amount
> > >> of outdated tutorials I believe some advertising
> > >> will help.
> > > =

> > > Not all NAND partitions on a device will contain linux root filesyste=
ms. For a
> > > linux root filesystem perhaps using UBI/UBIFS is preferred, yet these=
 messages
> > > print out for each and every NAND partition:
> > > =

> > >	[    0.900827] Creating 8 MTD partitions on "nxp_lpc3220_slc":
> > >	[    0.906431] 0x000000000000-0x000000020000 : "bootrom"
> > >	[    0.913523] mtdblock: MTD device 'bootrom' is NAND, please conside=
r using UBI
> > >	block devices instead.
> > >	[    0.933334] 0x000000020000-0x000000080000 : "uboot"
> > >	[    0.940439] mtdblock: MTD device 'uboot' is NAND, please consider =
using UBI
> > >	block devices instead.
> > >	[    0.963322] 0x000000080000-0x000000440000 : "fbkernel"
> > >	[    0.970655] mtdblock: MTD device 'fbkernel' is NAND, please consid=
er using
> > >	UBI block devices instead.
> > >	[    0.993361] 0x000000440000-0x000000920000 : "fbrootfs"
> > >	[    1.000725] mtdblock: MTD device 'fbrootfs' is NAND, please consid=
er using
> > >	UBI block devices instead.
> > >	[    1.023315] 0x000000920000-0x000000ce0000 : "c_kernel"
> > >	[    1.030722] mtdblock: MTD device 'c_kernel' is NAND, please consid=
er using
> > >	UBI block devices instead.
> > >	[    1.053444] 0x000000ce0000-0x000000d00000 : "c__atags"
> > >	[    1.060742] mtdblock: MTD device 'c__atags' is NAND, please consid=
er using
> > >	UBI block devices instead.
> > >	[    1.083349] 0x000000d00000-0x000001000000 : "c_rootfs"
> > >	[    1.090702] mtdblock: MTD device 'c_rootfs' is NAND, please consid=
er using
> > >	UBI block devices instead.
> > >	[    1.113335] 0x000001000000-0x000020000000 : "mender"
> > >	[    1.131627] mtdblock: MTD device 'mender' is NAND, please consider=
 using UBI
> > >	block devices instead.
> > > =

> > > NAND tends to be something found on older devices, the firmware/bootl=
oaders
> > > of older devices couldn't possibly understand UBI/UBIFS so many of th=
ese
> > > partitions need be "raw" partitions, or use something that predates U=
BI.
> > > =

> > > Ironically my "mender" partition contains a UBI (with multiple UBIFSe=
s inside)
> > > yet I got the same "please use UBI" message as all the others (lol)
> > > =

> > > I'm specifying my partitions in DT with:
> > > =

> > > partitions {
> > >        compatible =3D "fixed-partitions";
> > >        #address-cells =3D <1>;
> > >        #size-cells =3D <1>;
> > > =

> > >        mtd0@0       { label =3D "bootrom";   reg =3D <0x00000000 0x00=
020000>; };
> > >        mtd1@20000   { label =3D "uboot";     reg =3D <0x00020000 0x00=
060000>; };
> > >        mtd2@80000   { label =3D "fbkernel";  reg =3D <0x00080000 0x00=
3c0000>; };
> > >        mtd3@440000  { label =3D "fbrootfs";  reg =3D <0x00440000 0x00=
4e0000>; };
> > >        mtd4@920000  { label =3D "c_kernel";  reg =3D <0x00920000 0x00=
3c0000>; };
> > >        mtd5@ce0000  { label =3D "c__atags";  reg =3D <0x00ce0000 0x00=
020000>; };
> > >        mtd6@d00000  { label =3D "c_rootfs";  reg =3D <0x00d00000 0x00=
300000>; };
> > >        mtd7@1000000 { label =3D "mender";    reg =3D <0x01000000 0x1f=
000000>; };
> > > };
> > > =

> > > which is why, I assume, I'm getting these messages. Is there a UBI-fr=
iendly
> > > way to define them to avoid these messages?
> > =

> > Hmm, maybe it makes sense to advertise it only once and not for each mt=
dblock device.
> =

> Are there known bugs or issues using ubi/jffs2/squashfs on top of mtdbloc=
k? Is
> mtdblock being deprecated? If so I could certainly understand warning use=
rs of
> the situation.

In case of NAND flash, using mtdblock is generally not such a good idea
as you miss out on features which are essential for the vitality of the
flash (wear-leveling and such).

UBI works on top of mtd device, it cannot work on top of mtdblock.

For JFFS2 we got a hack which allows mounting using the mtdblock device
but actually also uses the mtd device under the hood (being able to
mount using mtdblock is a pure convenience feature for easier
compatibility with userspace tools).

So generally, when using mtdblock on top of NAND flash you are doing
less-than-optimal in every case.

> =

> Is there a safe/easy way to update an older device in a way that wipes
> the entire flash while running from flash? If not then having the kernel
> perpetually advertising that I'm not using my flash a certain way isn't v=
ery
> useful, especially if there aren't any underlying reasons why my usage is=
n't
> valid.

There are very good reasons for not using mtdblock on NAND flash, such
as the complete lack of wear-leveling (which is mandatory if you want
that flash to survive a couple of write cycles).

Legacy setups are sometimes not easy to migrate, to do things properly
you may have to replace or modify the way the device loads the kernel
from flash during boot, like I did for a recent SPI-NAND based WiFi
router:
https://github.com/dangowrt/linksys-e8450-openwrt-installer

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
