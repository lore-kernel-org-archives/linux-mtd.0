Received: from mail-bw0-f67.google.com ([209.85.214.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSnrO-0001s8-2N
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 09:41:22 +0000
Received: by bwz3 with SMTP id 3so597601bwz.6
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 01:41:20 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: nand: choose correct chip name (ONFI bug)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1292142213-645-1-git-send-email-computersforpeace@gmail.com>
References: <1292142213-645-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Dec 2010 11:40:51 +0200
Message-ID: <1292406051.2512.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Florian Fainelli <ffainelli@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-12-12 at 00:23 -0800, Brian Norris wrote:
> We have the order of the conditional wrong for choosing the ONFI chip name
> vs. the ID table name. Without this fix, we will almost *always* choose a
> NULL string to print out instead of the correct one.
> 
> This has already been suggested by Matthieu Castet.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed both to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
