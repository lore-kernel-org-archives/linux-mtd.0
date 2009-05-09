Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2e8C-0004RL-TN
	for linux-mtd@lists.infradead.org; Sat, 09 May 2009 04:25:55 +0000
Message-ID: <59246.192.168.10.89.1241843067.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <43965.192.168.10.89.1241763647.squirrel@dbdmail.itg.ti.com>
References: <43965.192.168.10.89.1241763647.squirrel@dbdmail.itg.ti.com>
Date: Sat, 9 May 2009 09:54:27 +0530 (IST)
Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large
	page NAND chips
From: "vimal singh" <vimalsingh@ti.com>
To: "David Brownell" <david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, nsnehaprabha@ti.com,
	akpm@linux-foundation.org, dwmw2@infradead.org, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 7, 2009 at 10:24 PM, David Brownell <david-b@pacbell.net> wrote:
> On Thursday 07 May 2009, vimal singh wrote:
>> >> How about leaving bytes '4' and '5' for bad block marker, to support 16-bit
>> >> NAND parts too.
>> >
>> > This 4-bit ECC engine only works for 8-bit wide parts ...
>> > or are you suggesting that in case TI re-engineers that
>> > engine in the future?
>>
>> I am omap guy and was not aware of that. In omap HW BCH
>> ECC (4- or 8- bit correction)can work both kind of memories.
>
> I'm somewhat more of an OMAP guy too -- just got sucked in to
> trying to get a dm355 board to run off NAND in mainline-bound
> code, and you can see where that landed me!
>
> Last I looked at the OMAP2/OMAP3 NAND controller driver, it
> didn't yet support most fancy hardware features, like ECC
> using more than one bit or the prefetch/postwrite logic.
I planned to push simple driver first, as it is present in L-O tree,
and then pushing other features later.
'prefetch-read/post-write' logic has been already implemented
in omapkernel git (For which sometime back I submitted patch on L-O list).
I'll be pushing those patches separately.

ECC using more than one bit (i.e. 4- or -8 bit) can be implemented
by configuring HW ECC engine accordingly in BCH ECC mode. But this
feature is still not implemented, may be in future I'll be
looking into this.

---
Regards,
\/ | |\/| /-\ |_
