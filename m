Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWr4u-0003lJ-Ah
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 13:23:52 +0000
Subject: Re: [PATCH v2 17/26] MTD: Nand: Add JZ4740 NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <4C35D084.7050605@metafoo.de>
References: <1276924111-11158-1-git-send-email-lars@metafoo.de>
	<1276924111-11158-18-git-send-email-lars@metafoo.de>
	<1278569214.12733.38.camel@localhost>  <4C35D084.7050605@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 16:19:02 +0300
Message-ID: <1278595142.20321.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-08 at 15:20 +0200, Lars-Peter Clausen wrote:
> On the other hand I'm wondering where on would put headers for non platform specific
> drivers?

If we are talking about MTD, then drivers/mtd ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
