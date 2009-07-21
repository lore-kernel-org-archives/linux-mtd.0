Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTG80-0000cI-Mv
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 14:15:41 +0000
Message-ID: <4A65CD65.3080408@gmail.com>
Date: Tue, 21 Jul 2009 17:15:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] UBI: Decrease I/O count in ubi_scan
References: <1248175591-4592-1-git-send-email-corentincj@iksaif.net>	
	<1248178451.24676.9.camel@localhost>
	<71cd59b00907210642u7d041dddk350254bf969c28ae@mail.gmail.com>
In-Reply-To: <71cd59b00907210642u7d041dddk350254bf969c28ae@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/21/2009 04:42 PM, Corentin Chary wrote:
> [   12.544598] NAND device: Manufacturer ID: 0xec, Chip ID: 0x36
> (Samsung NAND 64MiB 1,8V 8-bit)
> [   12.683697] Scanni
> [   12.691395] 0x000000000000-0x000000800000 : "Linux Kernel"
> [   12.699687] 0x000000800000-0x000002800000 : "Filesystem"
> [   12.707648] 0x000002800000-0x000004000000 : "Free"
> [   12.719948] UBI: attaching mtd2 to ubi0
> [   12.728005] UBI: physical eraseblock size:   16384 bytes (16 KiB)
> [   12.741397] UBI: logical eraseblock size:    15360 bytes
> [   12.751721] UBI: smallest flash I/O unit:    512
> [   12.760202] UBI: VID header offset:          512 (aligned 512)
> [   12.767589] UBI: data offset:                1024
> [   13.047943] UBI: attached mtd2 to ubi0
> [   13.055450] UBI: MTD device name:            "Free"
> [   13.063343] UBI: MTD device size:            24 MiB
> [   13.071539] UBI: number of good PEBs:        1536
> [   13.084148] UBI: number of bad PEBs:         0
> [   13.095572] UBI: max. allowed volumes:       89
> [   13.105468] UBI: wear-leveling threshold:    4096
> [   13.113178] UBI: number of internal volumes: 1
> [   13.129826] UBI: number of user volumes:     1
> [   13.140834] UBI: available PEBs:             0
> [   13.153634] UBI: total number of reserved PEBs: 1536
> [   13.160852] UBI: number of PEBs reserved for bad PEB handling: 15
> [   13.167731] UBI: max/mean erase counter: 2/1
> [   13.177809] UBI: image sequence number: 0

This flash does not look like something which could fit a 200MiB
volume.

>> And why do you presume is the improvement -
>> just less calls to MTD or really less I/O? Note MTD usually caches
>> the last read NAND page, so usually this is not about less I/O.
>
> In this case it seems vid and ec headers are not on the same page.

Strange. May be this is related to how they calculate ECC...
Or just a problem in the driver. Normally flashes like this would
have 256 byte sub-pages and have both headers in the same page.

Could you please check this? I just do not want to optimize it
for a bad/bogus driver. And I think now I recall that this patch
introduced slow down in some cases, when the driver can avoid reading
full page and calculatingfull ECC.

> So, if I understand things correctly, there *is* more I/O, and the same thing

Should not be more I/O.

> The same thing occurs with nandsim, because VID header offset is 2048,
> I don't know
> if it can happen on real flash.

With nandsim you should always have both headers on the same page, unless
you deliberately asked for the opposite by using -s option of ubiformat.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
