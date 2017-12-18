Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQpbQ-0001yx-4o
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 07:12:46 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Hanna Hawa <hannah@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon>
Date: Mon, 18 Dec 2017 08:11:35 +0100
In-Reply-To: <20171214070930.0b885f6d@bbrezillon> (Boris Brezillon's message
 of "Thu, 14 Dec 2017 07:09:30 +0100")
Message-ID: <877etkecig.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

>> Robert, it would be great if you could also do more testing on PXA and
>> validate this driver. If needed, a branch ready to be tested is
>> available at [3]. It is based on nand/next and has all the changes
>> brought by the previously mentionned series as well as this one.
>
> Robert, do you think you'll have some time to test Miquel's branch on
> your PXA boards? Miquel already tested on one of these boards (CM-X300),
> but we'd like to have other testers. Also feel free to review the
> driver if have the time.
>
> Thanks,
>
> Boris

Hi Boris and Miquel,

I have applied the whole serie to linux-next yesterday.

A boot attempt on my zylonite with my old defconfig (with the new Marvell NAND
config activated) yields to :
 - this message
[    3.136818] marvell-nfc pxa3xx-nand: could not identify the nand chip
[    3.143874] marvell-nfc: probe of pxa3xx-nand failed with error -22
 - then my board hangs

Is there something to be done to improve the trace level so that you can guess
what's happening ?

Cheers.

--
Robert
