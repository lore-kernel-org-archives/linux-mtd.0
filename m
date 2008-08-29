Date: Fri, 29 Aug 2008 13:29:07 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Eirik Aanonsen" <eaa@wprmedical.com>
Subject: Re: Slub debugging NAND error in 2.6.25.10.atmel.2
Message-ID: <20080829132907.3740d22f@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417D22@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C9D@wpr01.wprmedical.local>
	<6B5648EA2E2C2D42AF2FF7691522AD92417CA6@wpr01.wprmedical.local>
	<20080829114828.279b79bc@hskinnemo-gx745.norway.atmel.com>
	<6B5648EA2E2C2D42AF2FF7691522AD92417D22@wpr01.wprmedical.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@avr32linux.org, David
	Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Eirik Aanonsen" <eaa@wprmedical.com> wrote:
> The fault from my posts here seems to be related to a wrong definition related to my board. I had to change the include/linux/mtd/nand.h
> Where I had to replace:
> #define NAND_MAX_OOBSIZE	64
> #define NAND_MAX_PAGESIZE	2048
> With:
> #define NAND_MAX_OOBSIZE	128
> #define NAND_MAX_PAGESIZE	4096
> Nice the nand driver did not allocate enogh memory to handle ny nand flash. This was what caused the overwriting of the memory in my case.

Ah. That makes sense. It probably explains that weird oops loop you got
too -- all kinds of weird things can happen when memory is overwritten
like this.

> It could prove useifull to have these values in KConfig instead in an header, since the size of these values differ a lot from chip to chip?

I think they should just be adjusted. At least that's what the comment
directly above them says:

/* This constant declares the max. oobsize / page, which
 * is supported now. If you add a chip with bigger oobsize/page
 * adjust this accordingly.
 */

Haavard
