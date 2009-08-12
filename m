Received: from mail-yw0-f199.google.com ([209.85.211.199])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mb5DG-0000eq-NQ
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 04:13:27 +0000
Received: by ywh37 with SMTP id 37so6352662ywh.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Aug 2009 21:13:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090729170510.GD4803@oksana.dev.rtsoft.ru>
References: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
	<20090729170510.GD4803@oksana.dev.rtsoft.ru>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 12 Aug 2009 00:12:55 -0400
Message-ID: <8bd0f97a0908112112m2e97c71do722199fdce476231@mail.gmail.com>
Subject: Re: [PATCH 4/7] spi: Prefix modalias with "spi:"
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 29, 2009 at 13:05, Anton Vorontsov wrote:
> This makes it consistent with other buses (platform, i2c, vio, ...).
> I'm not sure why we use the prefixes, but there must be a reason.
>
> This was easy enough to do it, and I did it.

acked-by-me for misc blackfin/adi drivers, thanks
-mike
