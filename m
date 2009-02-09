Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWRqc-0001mW-4x
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 08:50:49 +0000
Date: Mon, 9 Feb 2009 09:50:22 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Dzuy Nguyen <dzuy@infinity-studios.com>
Subject: Re: jffs2: Too few erase blocks (1)
In-Reply-To: <498FC4BB.7060903@infinity-studios.com>
Message-ID: <Pine.LNX.4.64.0902090947080.19761@lnxricardw.se.axis.com>
References: <498FC4BB.7060903@infinity-studios.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 9 Feb 2009, Dzuy Nguyen wrote:

> I've allocated a small (64K) "user_config" partition in my flash for
> persistence storage:
>
> mtd0: 00020000 00010000 "u-boot"
> mtd1: 00010000 00010000 "Config"
> mtd2: 00100000 00010000 "vmlinux"
> mtd3: 002a0000 00010000 "rootfs"
> mtd4: 00010000 00010000 "user_config"
> mtd5: 00020000 00010000 "ART"
>
> When I tried to mount -t jffs2 /dev/mtdblock4, I get
>
> jffs2: Too few erase blocks (1)
>
> I understand that my erasesize is 64K, which gives me only 1 block,
> and jffs2 needs more than 1 block, but the kernel defaults the erasesize
> to 64K.

The kernel does that probably because that is the size of the blocks on=20
your flash chip. It is not so much a default as detection of the=20
properties of the chip.

> If I made a jffs2 file with eraseblock=3D8, would this work or would I ha=
ve
> to set it at the kernel?

You need to allocate more space if you want to use jffs2 quite simply. The=
=20
exact number is not exact; 8 should be ok, meaning you need to partition=20
your flash so you have 64K * 8 =3D 512K in your user_config partition.

If you can't afford that much space, you could consider writing your user=
=20
configurations to a file and just dumping the file with dd into your flash=
=20
partition. Not at all as flexible, but doable in a pinch.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
