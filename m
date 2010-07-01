Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OUAk0-00083e-Js
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 03:47:09 +0000
Received: by fxm20 with SMTP id 20so995641fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jun 2010 20:47:06 -0700 (PDT)
Subject: Re: [PATCH] mtd/mxc_nand: remove unused variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <1276498911-28115-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1276498911-28115-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Jul 2010 06:47:01 +0300
Message-Id: <1277956021.3599.28.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Ivo Clarysse <ivo.clarysse@gmail.com>,
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

On Mon, 2010-06-14 at 09:01 +0200, Uwe Kleine-König wrote:
> This fixes:
> 
> 	drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_resume':
> 	drivers/mtd/nand/mxc_nand.c:901: warning: unused variable 'host'
> 
> Removing this variable was missed in 9c14b153e6af.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Pushed to l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
