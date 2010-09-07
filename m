Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ost8N-000592-IZ
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 08:02:28 +0000
Subject: Re: [PATCH] nand/davinci: relax a timeout for ECC-initialization
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1283510137-23573-1-git-send-email-w.sang@pengutronix.de>
References: <1283382898.2209.62.camel@brekeke>
	<1283510137-23573-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 11:00:51 +0300
Message-ID: <1283846451.2241.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-03 at 12:35 +0200, Wolfram Sang wrote:
> Sudhakar found out that 100us are enough. Sadly, his updated patch was
> overlooked and an older version still using 100ms was merged. Fix this.
> 
> Reference: http://patchwork.ozlabs.org/patch/59180/
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Pushed to l2-mtd-2.6.git, thanks.

FYI, we prefix all MTD patches with "mtd:".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
