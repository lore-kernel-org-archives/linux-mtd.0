Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JimEp-0008JP-PS
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:58:00 +0000
Subject: Re: choosing a file system to use on NAND/UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080407073227.GA6317@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron> <20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron> <20080407073227.GA6317@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 10:56:46 +0300
Message-Id: <1207555006.8040.76.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On Mon, 2008-04-07 at 17:32 +1000, Hamish Moffatt wrote:
> UBI attach time appears to be about 6 seconds.

Looks really a lot. We had 2 seconds for 1GiB flash on OLPC, but OLPC
has fast flash and fast CPU. I guess you have slow flash.

> [    0.960000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung=
 NAND 512MiB 3,3V 8-bit)
> [    0.970000] Scanning device for bad blocks
> [    1.020000] Bad eraseblock 494 at 0x03dc0000
> [    1.110000] Bad eraseblock 1300 at 0x0a280000
> [    1.240000] Bad eraseblock 2554 at 0x13f40000
> [    1.280000] Bad eraseblock 2923 at 0x16d60000
> [    1.330000] Bad eraseblock 3349 at 0x1a2a0000
> [    1.370000] Bad eraseblock 3790 at 0x1d9c0000
> [    1.410000] cmdlinepart partition parsing not available
> [    7.210000] UBI: attached mtd9 to ubi0
> [    7.210000] UBI: MTD device name:            "gen_nand.0"
> [    7.220000] UBI: MTD device size:            512 MiB
> [    7.220000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    7.230000] UBI: logical eraseblock size:    129024 bytes
> [    7.240000] UBI: number of good PEBs:        4090
> [    7.240000] UBI: number of bad PEBs:         6
> [    7.250000] UBI: smallest flash I/O unit:    2048
> [    7.250000] UBI: VID header offset:          512 (aligned 512)
> [    7.260000] UBI: data offset:                2048
> [    7.260000] UBI: max. allowed volumes:       128
> [    7.270000] UBI: wear-leveling threshold:    4096
> [    7.270000] UBI: number of internal volumes: 1
> [    7.270000] UBI: number of user volumes:     4
> [    7.280000] UBI: available PEBs:             0
> [    7.280000] UBI: total number of reserved PEBs: 4090
> [    7.290000] UBI: number of PEBs reserved for bad PEB handling: 40
> [    7.290000] UBI: max/mean erase counter: 41/1
> [    7.300000] UBI: background thread "ubi_bgt0d" started, PID 619
>=20
> Mounting the 128MiB root volume (ubifs) is taking 0.35 seconds:
>=20
> # time mount -o ro -t ubifs ubi0:rootA /mnt
> [  404.390000] UBIFS: mounted UBI device 0, volume 0
> [  404.400000] UBIFS: mounted read-only
> [  404.400000] UBIFS: minimal I/O unit size:   2048 bytes
> [  404.400000] UBIFS: logical eraseblock size: 129024 bytes (126 KiB)
> [  404.410000] UBIFS: file system size:        132894720 bytes (129780 Ki=
B, 126 MiB, 1030 LEBs)
> [  404.420000] UBIFS: journal size:            9033728 bytes (8822 KiB, 8=
 MiB, 71 LEBs)
> [  404.430000] UBIFS: data journal heads:      1
> [  404.430000] UBIFS: default compressor:      zlib
> real    0m 0.34s
> user    0m 0.00s
> sys     0m 0.35s
>=20
> which is fine. Although if there was any way to speed it up I would be
> interested, particularly the UBI attach time.

Yeah. Is there any way to increase read speed on driver level? UBI reads
1 NAND page of each eraseblock during scanning and this is the
bottleneck. It also checks CRC, so if the CPU is very slow, this may be
the bottleneck as well.

I have 2 quick ideas about how to improve scan speed, but I am not sure
if they will help.

1. Currently what UBI is doing is: read EC header, check it, read VID
header, check it. So we run mtd->read() 2 times (it might help to run it
1 time because EC and VID headers go one after the other): read EC and
VID headers in one go, check them. We might do this soon.

2. More complex optimization would be to split scanning on 2 processes -
one just reads VID/EC headers and puts them to a list, the other takes
them from the list and checks. So that we would split the scanning on
I/O and CPU bound processes. This should help, especially if the CPU is
not very fast and checking time is comparable to I/O speed. We will do
this when we have time.

Other ideas are:

3. Even more complex change. Teach UBI to dump all the mapping
information on the media before de-attaching. Then the scanning process
would have to find this data and that's it. Although this would not help
in case if there was an unclean reboot.

4. Finally, one  could invest money and develop UBI2. I would be
interested to participate. We have some ideas.

> I switched my UBIFS from the default lzo to zlib compression, as the
> resulting images (from mkfs.ubifs) were smaller. Is there any reason to
> prefer the default lzo?

Well, the only way is to use mkfs.ubifs for this. You may create an
empty image, put it to the media and that's it. Would you conceive
something else?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
