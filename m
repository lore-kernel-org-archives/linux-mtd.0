Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaX81-0006vj-Lx
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 16:54:14 +0000
Received: by fxm3 with SMTP id 3so2066073fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 09:54:13 -0700 (PDT)
Subject: Re: [PATCH v3] MTD: Nand: Add JZ4740 NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <1279368929-21193-1-git-send-email-lars@metafoo.de>
References: <1276924111-11158-18-git-send-email-lars@metafoo.de>
	<1279368929-21193-1-git-send-email-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 19:54:08 +0300
Message-Id: <1279472048.16247.63.camel@localhost.localdomain>
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

On Sat, 2010-07-17 at 14:15 +0200, Lars-Peter Clausen wrote:
> This patch adds support for the NAND controller on JZ4740 SoCs.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> 

Do you expect this patch to go in via the MTD tree? I guess it might be
better if it was MIPS tree?
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
