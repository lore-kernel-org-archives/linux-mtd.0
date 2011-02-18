Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PqR7g-0004gC-Hn
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2011 14:15:53 +0000
Received: by wwb17 with SMTP id 17so3851716wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Feb 2011 06:15:50 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd: Add mtdswap block driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <1297692971-7399-4-git-send-email-jarkko.lavinen@nokia.com>
References: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
	<1297692971-7399-4-git-send-email-jarkko.lavinen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Feb 2011 16:14:30 +0200
Message-ID: <1298038470.5623.50.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-14 at 16:16 +0200, Jarkko Lavinen wrote:
> +config MTD_SWAP_STRICT
> +       bool "Strict erase error handling"
> +       depends on MTD_SWAP
> +       help
> +        Enables strict tolerance on failed erasures, marking erase blocks bad
> +        right after the first failed operation. With non-strict mode the
> +        erase operation is retried. 

This is too small thing to deserve a separate config option. And the
help text does not explain what for is this needed, what's the problem
with re-trying the erase operation - it looks like over-design.

Is it please possible to remove this config option?

Otherwise I'm fine with the patches, thanks! I'm putting them to my l2
tree but I wait an updated version from you without this option. In the
worst case, if you can prove the need for this option, make it a module
parameter instead please.

Thanks a lot! This is good stuff and I know it works.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
