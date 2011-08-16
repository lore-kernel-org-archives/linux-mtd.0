Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtJx9-0004J8-7p
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 13:45:11 +0000
Received: by yxk8 with SMTP id 8so3993875yxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 06:45:08 -0700 (PDT)
Subject: Re: [PATCH] mtd: plat_nand: fix `bbt_options' compile error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 16 Aug 2011 16:46:47 +0300
In-Reply-To: <1312827993-19163-1-git-send-email-computersforpeace@gmail.com>
References: <1312827993-19163-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313502412.21711.1.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, axel.lin@gmail.com,
	avorontsov@ru.mvista.com, linux-mtd@lists.infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-08 at 11:26 -0700, Brian Norris wrote:
> This fixes a bug in commit 86cb232d4e6b589be3daef8d570d1921c05be962
> ("mtd: nand: consolidate redundant flash-based BBT flags"). The problem
> was reported by Axel Lin at:

Merged this fix with that commit in the l2-mtd-2.6.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
