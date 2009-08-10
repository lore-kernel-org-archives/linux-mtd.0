Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPSE-0001b7-7L
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:38:06 +0000
Subject: Re: [PATCH v2 0/6] Device table matching for SPI subsystem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: avorontsov@ru.mvista.com
In-Reply-To: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
References: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:35:23 +0300
Message-Id: <1249889723.19638.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Dooks <ben@fluff.org>, David Brownell <dbrownell@users.sourceforge.net>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-31 at 04:39 +0400, Anton Vorontsov wrote:
> Andrew,
> 
> This new patch set overwrites following patches:
> 
>   hwmon-lm70-convert-to-device-table-matching.patch
>   hwmon-adxx-convert-to-device-table-matching.patch
>   spi-merge-probe-and-probe_id-callbacks.patch
>   spi-prefix-modalias-with-spi.patch
>   of-remove-stmm25p40-alias.patch
>   mtd-m25p80-convert-to-device-table-matching.patch
>   spi-add-support-for-device-table-matching.patch

Are you going to send v3 and address David's comments?
Do you want some of these patches to go via the MTD tree or
they better go as a series via some other tree?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
