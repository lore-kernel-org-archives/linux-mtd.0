Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbKtX-0002Zt-IG
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 20:58:07 +0000
Date: Thu, 13 Aug 2009 00:58:00 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Michael Barkowski <michaelbarkowski@ruggedcom.com>
Subject: Re: [PATCH 2/6] mtd: m25p80: Convert to device table matching
Message-ID: <20090812205800.GA27074@oksana.dev.rtsoft.ru>
References: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
	<20090731004100.GB8371@oksana.dev.rtsoft.ru>
	<4A832A03.6020507@ruggedcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4A832A03.6020507@ruggedcom.com>
Cc: Ben Dooks <ben@fluff.org>, David Brownell <dbrownell@users.sourceforge.net>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 12, 2009 at 04:45:55PM -0400, Michael Barkowski wrote:
> Hello Anton,
> 
> Is m25p_probe now valid with dev.platform_data == NULL, for of platforms?
> 
> Then shouldn't you have the following change as well, near the end of
> the function?
> 
> -  	} else if (data->nr_parts)
> +  	} else if (data && data->nr_parts)
> 		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
> 				data->nr_parts, data->name);
> 
> Or am I misunderstanding something?

Yeah, you missed this patch:
http://patchwork.kernel.org/patch/38179/


Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
