Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T52V3-0007Yy-9W
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 22:37:09 +0000
Received: by wibhq4 with SMTP id hq4so1103278wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 15:37:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
References: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
Date: Sat, 25 Aug 2012 00:37:07 +0200
Message-ID: <CACna6rxpTBVkSd7ZeKJafjgQ9U5NAgFYhNfHabsWEjm_6J=dRA@mail.gmail.com>
Subject: Re: [RFC][PATCH] mtd: bcm47part driver for BCM47XX chipsets
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/25 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> This driver provides parser detecting partitions on BCM47XX flash
> memories. It has many differences in comparision to older BCM63XX, like:
> 1) Different CFE with no more trivial MAGICs
> 2) More partitions types (board_data, ML, POT)
> 3) Supporting more than 1 flash on a device
> which resulted in decision of writing new parser.
>
> It uses generic mtd interface and was successfully tested with Netgear
> WNDR4500 router which has 2 flash memories: serial one and NAND one.
> ---
> Example of scanning (from my WNDR4500):
>
> [    3.144000] Creating 3 MTD partitions on "bcm47sflash":
> [    3.148000] 0x000000000000-0x0000001e0000 : "boot"
> [    3.156000] 0x0000001e0000-0x0000001f0000 : "board_data"
> [    3.164000] 0x0000001f0000-0x000000200000 : "nvram"
>
> [    4.632000] Creating 2 MTD partitions on "NAND 128MiB 3,3V 8-bit":
> [    4.636000] 0x00000000001c-0x0000001416a4 : "linux"
> [    4.644000] 0x0000001416a4-0x0000007ba000 : "rootfs"
>
> Right now there aren't any mainline MTD devices driver using this
> parser. It was tested with out-of-tree drivers floating around (for
> example on linux-wireless mailing list).
>
> As this driver uses generic mtd interface, it should be safe to include
> it in kernel without breaking anything in the future.
>
> TODO:
> 1) Add support for more partitinos (ML and POT)
> 2) Optimize: don't scan whole flash (like up to 128 MiB)
> 3) Optimize: don't scan TRX partitions after detecting header

For development I've masked out MTD_WRITEABLE everywhere. It should be
done only for "boot" probably.

--=20
Rafa=C5=82
