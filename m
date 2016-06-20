Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEuXX-0005az-Lp
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 08:26:40 +0000
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
To: Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>
References: <20160619130514.GB820@makrotopia.org>
 <20160619214820.GB1222@makrotopia.org>
 <c00ff150-9197-7bcf-8ea7-7ebba979d058@hauke-m.de>
 <6411961.soYuJ4Ixfs@wuerfel>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, mark.rutland@arm.com,
 devicetree@vger.kernel.org, dedekind1@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5767A8A3.4030004@nod.at>
Date: Mon, 20 Jun 2016 10:26:11 +0200
MIME-Version: 1.0
In-Reply-To: <6411961.soYuJ4Ixfs@wuerfel>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.06.2016 um 10:09 schrieb Arnd Bergmann:
> A few more thoughts on various things that came up in the discussion
> so far (so I don't have to reply to each of them separately)
> 
> - The /chosen and /aliases nodes do configure the OS to some degree,
>   and historically we have used them to specify the device names that
>   show up in the kernel (e.g. on MacOS and AIX) as well as the rootfs
>   itself
> 
> - The device tree should give us enough information to identify the
>   root partition by a GUID from the kernel. This works on all block
>   devices (at least with MBR and EFI partition tables, probably many
>   of the lesser known ones as well) and it should really also work
>   on UBI.

It does.

> - MTD partitioning unfortunately does not seem to have a widely used
>   method for identifying partitions from what's stored on the flash,
>   unlike block devices, so whatever we normally have in the partition
>   table has to be stored in DT. This really sucks, but I don't know
>   what else to do about it.

Since blocks on a MTD can render bad you'd lose the table sooner or later.
That's why we cannot store it on the MTD directly.
Defining the table in DT is at least less ugly than using the mtdparts=
kernel parameter.

> - The UBI design was originally meant to cover the entire flash
>   device and provide the partitioning information inside. I have not
>   looked at UBI in a long time (actually not since before embedded
>   PPC moved to DT), but I would hope that this case works without
>   any DT magic.

Of course it works without DT magic.

So, I don't see a urge to have UBI DT bindings.
First I thought having an attach flag would be handy but it turned out
that this behavior can easily achieved by naming. i.e. you a kernel
command line such as "ubi.mtd=UBI" and name the to be attached MTD "UBI"
in your DT.

Thanks,
//richard
