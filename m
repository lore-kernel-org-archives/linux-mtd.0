Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwWmM-0007iY-Kh
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 09:31:03 +0000
Received: by wwj40 with SMTP id 40so3611853wwj.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 01:31:01 -0800 (PST)
Subject: Re: [PATCH] mtd/mxc_nand: fix read past buffer end
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <2edd0d1419770540f85178a1f29cd80fccf11e88.1299077237.git.baruch@tkos.co.il>
References: <2edd0d1419770540f85178a1f29cd80fccf11e88.1299077237.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 11:29:36 +0200
Message-ID: <1299490176.2746.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-02 at 16:47 +0200, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/nand/mxc_nand.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Pushed to l2-mtd-2.6.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
