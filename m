Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NPd1l-0005Gt-Bl
	for linux-mtd@lists.infradead.org; Tue, 29 Dec 2009 14:26:30 +0000
Received: by ewy21 with SMTP id 21so2584794ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Dec 2009 06:26:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <dbdb2ea60912220614r656df531sae2be73e8f7f8163@mail.gmail.com>
References: <dbdb2ea60912220614r656df531sae2be73e8f7f8163@mail.gmail.com>
Date: Tue, 29 Dec 2009 09:26:22 -0500
Message-ID: <dbdb2ea60912290626mc9a8ca4h48adf7bb1cfe815d@mail.gmail.com>
Subject: Re: ubiattach taking very long time
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Does it make any sense that a ubiattach would take > 20 secs? =A0The
> flash I'm using is Samsung 4GiB MLC NAND flash. =A0I'm running 2.6.28
> kernel. =A0Here's the capture...
>
> [ =A0 =A01.753280] Creating 6 MTD partitions on "Samsung 32Gibx8":
> [ =A0 =A01.758855] 0x000000000000-0x000000080000 : "bootloader-alt"
> [ =A0 =A01.765676] 0x000000080000-0x000000100000 : "environment-alt"
> [ =A0 =A01.772290] 0x000000100000-0x000000400000 : "kernel-alt"
> [ =A0 =A01.778403] 0x000000400000-0x000000800000 : "kernelrecovery-alt"
> [ =A0 =A01.785252] 0x000000800000-0x000004000000 : "maintenance"
> [ =A0 =A01.791577] 0x000004000000-0x000100000000 : "system"
> [ =A0 =A01.799725] UBI: attaching mtd5 to ubi0
> [ =A0 =A01.803630] UBI: physical eraseblock size: =A0 524288 bytes (512 K=
iB)
> [ =A0 =A01.809901] UBI: logical eraseblock size: =A0 =A0516096 bytes
> [ =A0 =A01.815365] UBI: smallest flash I/O unit: =A0 =A04096
> [ =A0 =A01.820067] UBI: VID header offset: =A0 =A0 =A0 =A0 =A04096 (align=
ed 4096)
> [ =A0 =A01.826109] UBI: data offset: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08192
> [ =A0 23.124750] UBI: attached mtd5 to ubi0
> [ =A0 23.128505] UBI: MTD device name: =A0 =A0 =A0 =A0 =A0 =A0"system"
> [ =A0 23.133702] UBI: MTD device size: =A0 =A0 =A0 =A0 =A0 =A04032 MiB
> [ =A0 23.138757] UBI: number of good PEBs: =A0 =A0 =A0 =A08064
> [ =A0 23.143495] UBI: number of bad PEBs: =A0 =A0 =A0 =A0 0
> [ =A0 23.147945] UBI: max. allowed volumes: =A0 =A0 =A0 128
> [ =A0 23.152592] UBI: wear-leveling threshold: =A0 =A0256
> [ =A0 23.157211] UBI: number of internal volumes: 1
> [ =A0 23.161689] UBI: number of user volumes: =A0 =A0 4
> [ =A0 23.166135] UBI: available PEBs: =A0 =A0 =A0 =A0 =A0 =A0 4
> [ =A0 23.170612] UBI: total number of reserved PEBs: 8060
> [ =A0 23.175584] UBI: number of PEBs reserved for bad PEB handling: 80
> [ =A0 23.181715] UBI: max/mean erase counter: 2/0
> [ =A0 23.186120] UBI: background thread "ubi_bgt0d" started, PID 421
>

Does anyone have any suggestions on this problem?  I feel certain that
I must have something configured wrong that results in the long attach
time, but everything else seems to work just fine.

Thanks,
twebb
