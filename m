Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz4Ly-0006IB-1M
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 12:59:54 +0000
Message-ID: <1388753970.25123.124.camel@sauron.fi.intel.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Fri, 03 Jan 2014 14:59:30 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Fri, 2014-01-03 at 11:45 +0000, Gupta, Pekon wrote:
> *_Case-1_ Flashing UBIFS image from u-boot using 'nand write' utility*
> 
> For a partially written erased-block..
> (a) 1st page is written with 'erase-header'
> (b) 2nd page is written with 'volume-header'
> (c) '3rd page' is written with 'some data'
> (d) '4th to last-page of block' should be left blank, but they are written with 0xFF.
> As a effect of (d), the ECC calculated for (all 0xff data) is written to
> OOB area of all pages from 4th-page till last-page of the PEB.

Yup.

> As per my understanding, after mounting UBIFS as root, kernel tries to
> append some data to some files in rootfs, due to which leftover pages (d)
> get written by appended data, _without_ PEB getting erased.

Right.

> This causes ECC bytes to get corrupted, because OOB of 'unused-pages'
> was already written with ECC of (all 0xff data) by u-boot in step(d).
> And on next reboot, kernel sees 'un-corrected ECC' errors while booting.

Sure.

> *_Case-2_ Flashing UBIFS image from kernel using 'ubiformat' utility*
> 
> Whereas when same image is flashed using 'ubiformat' utility, after booting
> Kernel from other root source. 'ubiformat' automatically skips empty pages
> (4th to last-page) in erased-block. Thus OOB area of pages from 4th-page
> till last-page are un-touched.
> Hence, when kernel 'appends' the rootfs files there is no ECC corruption
> as the OOB area of 4th to last-page of PEB were blank. So everything works fine.

Exactly!

> Now my queries:
> (1) while _appending_ a file
>   (a) does UBIFS writes appended data to same existing PEB, if there is
>   enough space in PEB to accommodate new data ?

UBIFS always writes to the Journal PEB, whatever it happens to be. So
no, it is unlikely that the data will go to the same PEB.

>  OR
>   (b) does UBIFS copies the existing data to newer PEB  along with the
>    appended data ?

No, the existing data stays where it is. New data goes to the journal.
Then the journal PEB gets indexed. The data nodes end up in different
PEBs (i.e., fragmented).

If you are worried about fragmentation, we can discuss this separately.
You can find more about UBIFS journal in my very old UBIFS presentation,
which explains basic ideas behind the UBIFS wandering journal:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_documentation

There is also Adrian's white paper with some design description there.

> (2) In-case (b), then can someone point me to what can possibly be the issue ?
>  (Any references to UBIFS docs on infradead.org may also help).

I do not understand the question. There are no problems in your (b),
neither in "*_Case-2_" described.

If you meant "*_Case-1_", then yes, there is a piece of doc:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

Basically, "ubiformat" is the "correct" UBI-aware flasher, while
u-boot's "nand write" seems to be a dumb flasher. I guess you have 2
options:

1. Teach u-boot's "nand write" to skip empty pages, or may be implement
a separate "clever" flashing command.

2. Use UBIFS's "space fixup" feature. This will cause UBIFS to fix-up
all empty pages by basically copying all partially-used PEBs to
different PEBes with empty pages skipping. This will be done on the
first mount, only once, and may cause considerable delays.

See http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup

P.S. Looking at the MTD web-site now, when I am not doing any
UBI/UBIFS/MTD work anymore for few years, I am impressed how much stuff
I actually documented there :-)

HTH.

-- 
Best Regards,
Artem Bityutskiy
