Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NWQSO-00064C-9O
	for linux-mtd@lists.infradead.org; Sun, 17 Jan 2010 08:26:05 +0000
Received: by fxm3 with SMTP id 3so1388300fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Jan 2010 00:25:57 -0800 (PST)
Subject: Re: [PATCH] mxc-nand: no need to check for validity of platform
	drive data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Jan 2010 10:25:54 +0200
Message-Id: <1263716754.8276.132.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vova.barinov@gmail.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
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

On Mon, 2010-01-11 at 15:05 +0100, Uwe Kleine-König wrote:
> The probe function calls platform_set_drvdata with a valid pointer when
> the probe is successful.  As mxcnd_suspend and mxcnd_resume are only
> called on bound devices, platform_get_drvdata always returns non-NULL.
> 
> This fix isn't critical as the pointer is always valid so it doesn't
> matter if the compiler generated code for it or not.

I've put these patches to my l2-mtd-2.6.git/master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
