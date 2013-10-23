Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYziG-0000EY-UF
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 14:47:09 +0000
Date: Wed, 23 Oct 2013 11:46:53 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v10 04/10] mtd: nand: omap: fix device scan:
 NAND_CMD_READID, NAND_CMD_RESET, CMD_CMD_PARAM use only x8 bus
Message-ID: <20131023144652.GI2458@localhost>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-5-git-send-email-pekon@ti.com>
 <20131022201624.GL23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA29DB8@DBDE04.ent.ti.com>
 <5267690C.9080005@gmail.com> <20131023125516.GA2458@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2A0CB@DBDE04.ent.ti.com>
 <20131023132457.GD2458@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131023132457.GD2458@localhost>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>, "olof@lixom.net" <olof@lixom.net>,
 "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On Wed, Oct 23, 2013 at 10:24:57AM -0300, Ezequiel Garcia wrote:
[..]
> 
> I'm currently trying mainline (just for this issue not for my product).
> I just need some time to prepare the bootargs and write a DT node for
> the NAND cape.
> 
> Again, not sure if I'll make some progress, but I'll give it a shot :-)

I won't be able to make too much progress without some help or without
squeezing my brains out :P

Care to push some git branch on some random repo with DT support for
the NAND cape in the Beaglebone?

Please base it in either some recent l2-mtd or some tag from Linus.

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
