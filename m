Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgyZR-00020Q-29
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 11:25:09 +0000
Subject: Re: [PATCH] atmel_nand: Fix warning: 'part_probes' defined but not
	used
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andreas =?ISO-8859-1?Q?Bie=DFmann?= <biessmann@corscience.de>
In-Reply-To: <1281004721-397-1-git-send-email-biessmann@corscience.de>
References: <1279099026-24298-1-git-send-email-biessmann@corscience.de>
	<1281004721-397-1-git-send-email-biessmann@corscience.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 13:50:40 +0300
Message-ID: <1281005440.15689.83.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <dbrownell@users.sourceforge.net>, trivial@kernel.org,
	linux-kernel@vger.kernel.org, Sandeep Paulraj <s-paulraj@ti.com>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-05 at 12:38 +0200, Andreas Bießmann wrote:
> This patch fixes
> 
> drivers/mtd/nand/atmel_nand.c:372: warning: 'part_probes' defined but not used
> 
> which is issued when CONFIG_MTD_PARTITIONS is defined but
> CONFIG_MTD_CMDLINE_PARTS not.
> 
> Signed-off-by: Andreas Bießmann <biessmann@corscience.de>

Pushed to my l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
