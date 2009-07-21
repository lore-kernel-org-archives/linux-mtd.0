Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTGEL-0001Fx-UL
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 14:22:14 +0000
Received: by fxm11 with SMTP id 11so2679107fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jul 2009 07:22:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A65CD65.3080408@gmail.com>
References: <1248175591-4592-1-git-send-email-corentincj@iksaif.net>
	<1248178451.24676.9.camel@localhost>
	<71cd59b00907210642u7d041dddk350254bf969c28ae@mail.gmail.com>
	<4A65CD65.3080408@gmail.com>
Date: Tue, 21 Jul 2009 16:22:02 +0200
Message-ID: <71cd59b00907210722n2fb74cd8l33ccfac8edcdac04@mail.gmail.com>
Subject: Re: [PATCH] UBI: Decrease I/O count in ubi_scan
From: Corentin Chary <corentin.chary@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: simon <spolette@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2009 at 4:15 PM, Artem Bityutskiy<dedekind1@gmail.com> wrot=
e:
> On 07/21/2009 04:42 PM, Corentin Chary wrote:
>>
>> [ =A0 12.544598] NAND device: Manufacturer ID: 0xec, Chip ID: 0x36
>> (Samsung NAND 64MiB 1,8V 8-bit)
>> [ =A0 12.683697] Scanni
>> [ =A0 12.691395] 0x000000000000-0x000000800000 : "Linux Kernel"
>> [ =A0 12.699687] 0x000000800000-0x000002800000 : "Filesystem"
>> [ =A0 12.707648] 0x000002800000-0x000004000000 : "Free"
>> [ =A0 12.719948] UBI: attaching mtd2 to ubi0
>> [ =A0 12.728005] UBI: physical eraseblock size: =A0 16384 bytes (16 KiB)
>> [ =A0 12.741397] UBI: logical eraseblock size: =A0 =A015360 bytes
>> [ =A0 12.751721] UBI: smallest flash I/O unit: =A0 =A0512
>> [ =A0 12.760202] UBI: VID header offset: =A0 =A0 =A0 =A0 =A0512 (aligned=
 512)
>> [ =A0 12.767589] UBI: data offset: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01024
>> [ =A0 13.047943] UBI: attached mtd2 to ubi0
>> [ =A0 13.055450] UBI: MTD device name: =A0 =A0 =A0 =A0 =A0 =A0"Free"
>> [ =A0 13.063343] UBI: MTD device size: =A0 =A0 =A0 =A0 =A0 =A024 MiB
>> [ =A0 13.071539] UBI: number of good PEBs: =A0 =A0 =A0 =A01536
>> [ =A0 13.084148] UBI: number of bad PEBs: =A0 =A0 =A0 =A0 0
>> [ =A0 13.095572] UBI: max. allowed volumes: =A0 =A0 =A0 89
>> [ =A0 13.105468] UBI: wear-leveling threshold: =A0 =A04096
>> [ =A0 13.113178] UBI: number of internal volumes: 1
>> [ =A0 13.129826] UBI: number of user volumes: =A0 =A0 1
>> [ =A0 13.140834] UBI: available PEBs: =A0 =A0 =A0 =A0 =A0 =A0 0
>> [ =A0 13.153634] UBI: total number of reserved PEBs: 1536
>> [ =A0 13.160852] UBI: number of PEBs reserved for bad PEB handling: 15
>> [ =A0 13.167731] UBI: max/mean erase counter: 2/1
>> [ =A0 13.177809] UBI: image sequence number: 0
>
> This flash does not look like something which could fit a 200MiB
> volume.

I didn't do the test myself I only had the dmesg for this test (there
was some gain too).
I'll try to know more.

>>> And why do you presume is the improvement -
>>> just less calls to MTD or really less I/O? Note MTD usually caches
>>> the last read NAND page, so usually this is not about less I/O.
>>
>> In this case it seems vid and ec headers are not on the same page.
>
> Strange. May be this is related to how they calculate ECC...
> Or just a problem in the driver. Normally flashes like this would
> have 256 byte sub-pages and have both headers in the same page.

I'll try to get more information about this flash, and fix the driver
if there is something to fix.

I didn't know that there was a page cache in mtd/nand, but know I
agree that these patch are useless
if both headers can fit in the same page.

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
