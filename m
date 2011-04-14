Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALOT-0004ZV-GG
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:11:33 +0000
Received: by eyh6 with SMTP id 6so501361eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 05:11:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] MTD: s3c2410_nand: Add option to disable hw ECC at
	runtime
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <1302637672-25339-1-git-send-email-lars@metafoo.de>
References: <1302637672-25339-1-git-send-email-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:08:31 +0300
Message-ID: <1302782911.2796.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Holger Freyther <zecke@openmoko.org>, Kukjin Kim <kgene.kim@samsung.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ben Dooks <ben-linux@fluff.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-12 at 21:47 +0200, Lars-Peter Clausen wrote:
> From: Holger Freyther <zecke@openmoko.org>
> 
> This patch adds a flag to the s3c2410_nand platform data, which configures
> whether hardware ECC is used.
> 
> Currently it is only possible to decide whether hw ECC should be used or not at
> compile time through a config option. But if you want to build a kernel which
> runs on multiple devices you might have a configuration where some devices
> require hw ECC and some devices which want software ECC.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Extending platform data is kind of vetoed in arm tree, I do not think
the MTD tree can take these changes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
