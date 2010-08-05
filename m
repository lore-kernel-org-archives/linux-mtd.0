Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgsUI-00031z-KH
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 04:55:27 +0000
Received: by fxm3 with SMTP id 3so3248807fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 21:55:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] mxc_nand: fix Unbalanced enable for IRQ
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20100802093230.GA29811@pengutronix.de>
References: <1276178584-10074-1-git-send-email-eric@eukrea.com>
	<20100802093230.GA29811@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:55:22 +0300
Message-Id: <1280984122.1175.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sascha Hauer <s.hauer@pengutronix.de>, stable@kernel.org,
	linux-mtd@lists.infradead.org, ivo.clarysse@gmail.com,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-02 at 11:32 +0200, Uwe Kleine-König wrote:
> Hi David,
> 
> can we please have this patch soon in mainline.  This bugs our
> autobuilder since long.

It is in the mtd tree now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
