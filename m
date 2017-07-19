Date: Wed, 19 Jul 2017 17:40:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Jason Cooper
 <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Yehuda Yitschak <yehuday@marvell.com>,
 Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Richard
 Weinberger <richard@nod.at>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@free-electrons.com>, linux-kernel@vger.kernel.org, Nadav
 Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Igal Liberman <igall@marvell.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Shadi Ammouri <shadi@marvell.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Hanna Hawa <hannah@marvell.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: pxa3xx_nand: enable building on mvebu
 64-bit platforms
Message-ID: <20170719174006.1ca20652@windsurf>
In-Reply-To: <20170719153126.16905-2-gregory.clement@free-electrons.com>
References: <20170719153126.16905-1-gregory.clement@free-electrons.com>
 <20170719153126.16905-2-gregory.clement@free-electrons.com>
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

Hello,

On Wed, 19 Jul 2017 17:31:25 +0200, Gregory CLEMENT wrote:

>  config MTD_NAND_PXA3xx
>  	tristate "NAND support on PXA3xx and Armada 370/XP"
> -	depends on PXA3xx || ARCH_MMP || PLAT_ORION
> +	depends on PXA3xx || ARCH_MMP || PLAT_ORION  || ARCH_MVEBU

                                                   ^^^

Stupid minor nit: there are two spaces here, there should be one. No
need to send a v2 just for this, I'm sure Boris will happily fix this
when applying :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
