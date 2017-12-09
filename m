Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNoXb-00032i-DQ
 for linux-mtd@lists.infradead.org; Sat, 09 Dec 2017 23:28:21 +0000
Received: by mail-pl0-x236.google.com with SMTP id v41so2439746plg.4
 for <linux-mtd@lists.infradead.org>; Sat, 09 Dec 2017 15:27:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 9 Dec 2017 20:27:57 -0300
Message-ID: <CAAEAJfC6Ctxfuk+jv=Z7__4ME6VtDdQk-H74hiN19gcEo6HOxg@mail.gmail.com>
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Neta Zur Hershkovits <neta@marvell.com>,
 Hanna Hawa <hannah@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Miquel,

On 7 December 2017 at 17:18, Miquel Raynal
<miquel.raynal@free-electrons.com> wrote:
> Hi,
>
> After the addition of the NAND framework ->exec_op() interface (see [1]
> for the series preparing it and [2] for the last version of the
> core-side implementation of ->exec_op() itself), this series replaces
> the current Marvell NAND controller driver pxa3xx_nand.c with a rework
> called marvell_nand.c.
>

Nice to see this effort!

Unfortunately, I don't much time to spend reviewing this, but I'm super
happy to see a new driver fixing all the nasty issues the current one has.

Cheers,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
