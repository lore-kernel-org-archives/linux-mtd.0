Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2jDY-0006IT-8R
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 12:33:00 +0000
Received: by pzk4 with SMTP id 4so6596841pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 05:32:58 -0700 (PDT)
Subject: Re: [PATCH 10/12] mtd: nand: kill member `ops' of `struct nand_chip'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 15:35:24 +0300
In-Reply-To: <1314755147-17756-11-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-11-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315744529.18731.42.camel@sauron>
Mime-Version: 1.0
Cc: b35362@freescale.com, Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
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

On Tue, 2011-08-30 at 18:45 -0700, Brian Norris wrote:
> The nand_chip.ops field is a struct that is passed around globally with
> no particular reason. Every time it is used, it could just as easily be
> replaced with a local struct that is updated on each operation. So make
> it local.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Looks like a good clean-up, thanks, pushed to my tree.

-- 
Best Regards,
Artem Bityutskiy
