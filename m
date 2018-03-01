Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erV65-0007jw-2E
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 20:46:39 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Eric Miao <eric.y.miao@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 5/6] arm: dts: pxa: use reworked NAND controller driver
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-6-miquel.raynal@bootlin.com>
 <20180222104618.1ff78b52@bbrezillon> <87efl66vow.fsf@belgarion.home>
 <20180227214245.4267448e@bbrezillon> <20180301100446.0f61aaf9@xps13>
 <20180301175732.3be789fb@bbrezillon>
Date: Thu, 01 Mar 2018 21:46:18 +0100
In-Reply-To: <20180301175732.3be789fb@bbrezillon> (Boris Brezillon's message
 of "Thu, 1 Mar 2018 17:57:32 +0100")
Message-ID: <87606f7cdh.fsf@belgarion.home>
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

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> On Thu, 1 Mar 2018 10:04:46 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> I guess Miquel meant squash it into the commit introducing the
> regression ("mtd: nand: remove useless fields from pxa3xx NAND platform
> data"), and I agree, if you haven't pulled the branch yet, I'd prefer to
> create a new one addressing the issue. I could also add your Acked-by
> at the same time ;-).
Lucky you, I was going to pull this Saturday, you still can make that change.

Cheers.

-- 
Robert
