Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qboml-00052t-Gp
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 07:02:08 +0000
Received: by iyn15 with SMTP id 15so983274iyn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 00:02:05 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd: nand: ignore ECC errors for simple BBM scans
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 29 Jun 2011 10:02:55 +0300
In-Reply-To: <1309303740-9936-2-git-send-email-computersforpeace@gmail.com>
References: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
	<1309303740-9936-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309330980.23597.126.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 16:28 -0700, Brian Norris wrote:
> Now that nand_do_readoob() may return -EUCLEAN or -EBADMSG on ECC errors,
> we need to handle the return value specially in some cases.
> 
> When scanning for simple bad block markers, reacting to an ECC error is
> not very useful, as we assume that the relevant markers are still
> non-0xFF for true bad blocks.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_bbt.c |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
