Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTFc5-0000UJ-RU
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 13:42:44 +0000
Received: by bwz19 with SMTP id 19so2617187bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jul 2009 06:42:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1248178451.24676.9.camel@localhost>
References: <1248175591-4592-1-git-send-email-corentincj@iksaif.net>
	<1248178451.24676.9.camel@localhost>
Date: Tue, 21 Jul 2009 15:42:35 +0200
Message-ID: <71cd59b00907210642u7d041dddk350254bf969c28ae@mail.gmail.com>
Subject: Re: [PATCH] UBI: Decrease I/O count in ubi_scan
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2009 at 2:14 PM, Artem Bityutskiy<dedekind1@gmail.com> wrot=
e:
> On Tue, 2009-07-21 at 13:26 +0200, Corentin Chary wrote:
>> Merge ec_hdr and vid_hdr read in one ubi_io_read()
>> This result in a 25% speedup with nandsim, and 6%
>> speedup on an AT91SAM9263 board with a 200Mo UBI volume.
>>
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>> ---
>> =A0drivers/mtd/ubi/io.c =A0 | =A0 67 +++++++++++++++++++++++++++++++++++=
+++++++++++-
>> =A0drivers/mtd/ubi/scan.c | =A0 35 +++++++++++++------------
>> =A0drivers/mtd/ubi/ubi.h =A0| =A0 =A04 +++
>> =A03 files changed, 87 insertions(+), 19 deletions(-)
>
> Yeah, I did the same optimization some time ago:
>
> http://lists.infradead.org/pipermail/linux-mtd/2008-April/021311.html
>
> Could you please take a look at those patches as well, and if they
> are any better, use them or improve yours. I do not remember the
> details, to be frank.

Didn't see them, they are essentially the same. But I suspect yours are bet=
ter.

> No one reported a significant improvement, so I dropped it.
> nandsim improvement is not very interesting, but the AT91SAM9263 is.
> Which flash is there?

[   12.544598] NAND device: Manufacturer ID: 0xec, Chip ID: 0x36
(Samsung NAND 64MiB 1,8V 8-bit)
[   12.683697] Scanni
[   12.691395] 0x000000000000-0x000000800000 : "Linux Kernel"
[   12.699687] 0x000000800000-0x000002800000 : "Filesystem"
[   12.707648] 0x000002800000-0x000004000000 : "Free"
[   12.719948] UBI: attaching mtd2 to ubi0
[   12.728005] UBI: physical eraseblock size:   16384 bytes (16 KiB)
[   12.741397] UBI: logical eraseblock size:    15360 bytes
[   12.751721] UBI: smallest flash I/O unit:    512
[   12.760202] UBI: VID header offset:          512 (aligned 512)
[   12.767589] UBI: data offset:                1024
[   13.047943] UBI: attached mtd2 to ubi0
[   13.055450] UBI: MTD device name:            "Free"
[   13.063343] UBI: MTD device size:            24 MiB
[   13.071539] UBI: number of good PEBs:        1536
[   13.084148] UBI: number of bad PEBs:         0
[   13.095572] UBI: max. allowed volumes:       89
[   13.105468] UBI: wear-leveling threshold:    4096
[   13.113178] UBI: number of internal volumes: 1
[   13.129826] UBI: number of user volumes:     1
[   13.140834] UBI: available PEBs:             0
[   13.153634] UBI: total number of reserved PEBs: 1536
[   13.160852] UBI: number of PEBs reserved for bad PEB handling: 15
[   13.167731] UBI: max/mean erase counter: 2/1
[   13.177809] UBI: image sequence number: 0

> And why do you presume is the improvement -
> just less calls to MTD or really less I/O? Note MTD usually caches
> the last read NAND page, so usually this is not about less I/O.

In this case it seems vid and ec headers are not on the same page.
So, if I understand things correctly, there *is* more I/O, and the same thi=
ng

The same thing occurs with nandsim, because VID header offset is 2048,
I don't know
if it can happen on real flash.

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
