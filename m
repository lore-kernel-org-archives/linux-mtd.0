Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6Eq-0000bc-8N
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:09:21 +0000
Received: by eyd9 with SMTP id 9so1805912eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 07:09:18 -0800 (PST)
Subject: Re: [PATCH] drivers/mtd/maps/ts5500_flash.c: avoid calling
	map_destroy on NULL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <1296666816-21610-1-git-send-email-julia@diku.dk>
References: <1296666816-21610-1-git-send-email-julia@diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 17:08:24 +0200
Message-ID: <1297004904.4460.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-02-02 at 18:13 +0100, Julia Lawall wrote:
> map_destroy dereferences its argument.  The call is furthermore only
> reachable when this argument is NULL.  Thus the call is dropped.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
