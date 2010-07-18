Received: from mailhost.informatik.uni-hamburg.de ([134.100.9.70])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OaXGK-0000m8-8v
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 17:02:49 +0000
Message-ID: <4C43338E.7030706@metafoo.de>
Date: Sun, 18 Jul 2010 19:02:06 +0200
From: Lars-Peter Clausen <lars@metafoo.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v3] MTD: Nand: Add JZ4740 NAND driver
References: <1276924111-11158-18-git-send-email-lars@metafoo.de>
	<1279368929-21193-1-git-send-email-lars@metafoo.de>
	<1279472048.16247.63.camel@localhost.localdomain>
In-Reply-To: <1279472048.16247.63.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Sat, 2010-07-17 at 14:15 +0200, Lars-Peter Clausen wrote:
>> This patch adds support for the NAND controller on JZ4740 SoCs.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: linux-mtd@lists.infradead.org
>>
> 
> Do you expect this patch to go in via the MTD tree? I guess it might be
> better if it was MIPS tree?

Hi

Yes, letting it go through the MIPS tree is the plan.

- Lars
