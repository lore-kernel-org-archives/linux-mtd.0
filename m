Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIIIR-0005PC-1d
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 08:53:27 +0000
Subject: Re: UBIFS on Atmel Dataflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
In-Reply-To: <hfnn6u$ah1$1@ger.gmane.org>
References: <hfnn6u$ah1$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 10:53:06 +0200
Message-Id: <1260348786.19669.1231.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-09 at 09:30 +0100, Andre Puschmann wrote:
> Hi guys,
> 
> this is my very first try to get UBIFS working. My target is an Atmel
> AT91RM9200 cpu which has a 8MB Atmel Dataflash AT45DB642x. Pagesize is
> 1056 Bytes.
> 
> I cross-compiled the ubi tools and my first try to attach was not
> successful:
> 
> $ ./ubiattach /dev/ubi_ctrl -m 6
> UBI: attaching mtd6 to ubi0
> UBI error: io_init: min. I/O unit (1056) is not power of 2

Yeah, I had a feeling we should not have assumed power of 2. But it was
so appealing, because we can avoid (slow) divisions when aligning data
to min. I/O unit boundary. I knew about DataFlash, but it is usually so
small that I did not expect anyone using UBIFS there.

Are you sure you want ubifs on such a tiny flash? We were really
targeting to larger ones, say, starting from 64MiB at least.

Basically, there is not fundamental reasons not to support non-power of
2 min. I/O unit size, besides of optimizations. And to fix this, one
would need to carefully look at / grep for min_io_size usage in both
UBI/UBIFS, and change stuff like ALIGN(x, c->min_io_size) to something
else. But there are very many of such places.

> My question is if it's possible (in general) to get a working version of
> UBIFS on this kind of flash (with no power of two pagesize)? Anybody
> ever tried this?

It is possible, but needs some work, which should not be too difficult.
I never heard anyone trying, though.

> I also tried ubiformat which raises a segfault:
> 
> $ ./ubiformat /dev/mtd6
> ubiformat: warning!: your MTD system is old and it is impossible to
> detect sub-page size. Use -s to get rid of this warning
> ubiformat: assume sub-page to be 1056
> ubiformat: mtd6 (dataflash), size 4815360 bytes (4.6 MiB), 4560
> eraseblocks of 1056 bytes (1.0 KiB), min. I/O size 1056 bytes
> libscan: scanning eraseblock 4559 -- 100 % complete
> ubiformat: 4554 eraseblocks are supposedly empty
> ubiformat: warning!: 6 of 4560 eraseblocks contain non-ubifs data
> ubiformat: continue? (yes/no)  yes
> ubiformat: warning!: only 0 of 4560 eraseblocks have valid erase counter
> ubiformat: erase counter 0 will be used for all eraseblocks
> ubiformat: note, arbitrary erase counter value may be specified using -e
> option
> ubiformat: continue? (yes/no)  yes
> ubiformat: use erase counter 0 for all eraseblocks
> ubiformat: formatting eraseblock 4559 -- 100 % complete
> Segmentation fault
> 
> Any comments on this are highly appreciated.

Yeah, I need to make ubiformat nicely return error instead of dying.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
