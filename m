Date: Thu, 22 Oct 2015 17:12:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, robert.jarzmik@free.fr,
 zmxu@marvell.com, jszhang@marvell.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Gregory =?UTF-8?B?Q2w=?=
 =?UTF-8?B?w6ltZW50?= <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v4 0/5] mtd: pxa3xx_nand: rework the timing setup
Message-ID: <20151022171259.57581575@free-electrons.com>
In-Reply-To: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Antoine,

On Wed, 21 Oct 2015 10:28:59 +0200, Antoine Tenart wrote:

> Antoine Tenart (5):
>   mtd: pxa3xx: prepare allowing compile test
>   mtd: nand: allow compile test of MTD_NAND_PXA3xx
>   mtd: pxa3xx_nand: add helpers to setup the timings
>   mtd: pxa3xx_nand: rework flash detection and timing setup
>   mtd: pxa3xx_nand: clean up the pxa3xx timings

I tested your series on Armada 375 DB, which uses the same pxa3xx
driver, but with the Armada 370 variant.

With the current Device Tree which has nand,keep-config to keep the
timing configuration from the bootloader, I don't see any problem, so
there is no regression introduced by your series, at least on this
platform.

However, when I remove nand,keep-config to use the ONFI timings from
the NAND, then things work fine (I can mount a UBIFS root filesystem),
but there is a weird:

pxa3xx-nand f10d0000.nand: Wait time out!!!

After investigating a bit, the following steps occur:

 * The timings are configured as ONFI mode 0
 * Reset command is sent to the NAND (0xff), two times in a row.
 * READID command is sent to the NAND (0x90), three times in a row.
 * PARAM command is sent to the NAND (0xec) and it times out
 * The NAND is properly identified, and the timings are reconfigured as
   ONFI mode 5
 * Everything seems to work fine

In the current implementation of the driver, the nand_cmdfunc()
function is used for all the identification phase, and only switched
later to nand_cmdfunc_extended() if we are on an Armada 370/XP variant
(which Armada 375 is) and the page size is higher than PAGE_CHUNK_SIZE.
So the timeout occurs when nand_cmdfunc() is in-use. I've tried forcing
to use nand_cmdfunc_extended() from the beginning, but it times out
similarly in this function.

Since the driver works fine, maybe the PARAM command has worked
properly, but just times out for some reason. It would be good to
understand why.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
