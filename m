Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZLM6-0001EA-36
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 13:53:42 +0000
Date: Thu, 24 Oct 2013 10:52:59 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v11 00/10] [PATCH v10 00/10] mtd:nand:omap2: clean-up of
 supported ECC schemes
Message-ID: <20131024135258.GC9958@localhost>
References: <1382619026-4182-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1382619026-4182-1-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 ijc+devicetree@hellion.org.uk, linux-omap@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 avinashphilipk@gmail.com, swarren@wwwdotorg.org, jp.francois@cynove.com,
 balbi@ti.com, robherring2@gmail.com, bcousson@baylibre.com, olof@lixom.net,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

Just as suggestion, I think you should reconsider your 'upstream strategy'.

On Thu, Oct 24, 2013 at 06:20:16PM +0530, Pekon Gupta wrote:
[..]
> 
> Pekon Gupta (10):
>   ARM: OMAP2+: cleaned-up DT support of various ECC schemes
>   mtd: nand: omap: combine different flavours of 1-bit hamming ecc schemes
>   mtd: nand: omap: cleanup: replace local references with generic framework names

IMHO, this patch about the dobule nand_scan_ident():
>   mtd: nand: omap: use DT specified bus-width only for scanning NAND device

is a fix unrelated to this series and can be pushed independently.
Maybe you can try to send it as a one-patch fix?

>   mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in device_probe
>   mtd: nand: omap: clean-up ecc layout for BCH ecc schemes
>   mtd: nand: omap: use drivers/mtd/nand/nand_bch.c wrapper for BCH ECC instead of lib/bch.c
>   ARM: dts: AM33xx: updated default ECC scheme in nand-ecc-opt

And also this patch:
>   mtd: nand: omap: updated devm_xx for all resource allocation and free calls

doesn't seem to belong to this series.

I think tou could send those two independently and ask Brian to merge them earlier
if appropriate.

But again, this is just a suggestion.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
