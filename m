Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OQXBd-0007rJ-TZ
	for linux-mtd@lists.infradead.org; Mon, 21 Jun 2010 02:56:40 +0000
Received: by pvc7 with SMTP id 7so619454pvc.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Jun 2010 19:56:35 -0700 (PDT)
Message-ID: <4C1ED4CA.9030906@gmail.com>
Date: Mon, 21 Jun 2010 10:56:10 +0800
From: Xiangfu Liu <xiangfu.z@gmail.com>
MIME-Version: 1.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v2 00/26] Add support for the Ingenic JZ4740
	System-on-a-Chip
References: <1276924111-11158-1-git-send-email-lars@metafoo.de>
	<20100620092610.GA4950@alpha.franken.de>
In-Reply-To: <20100620092610.GA4950@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Paul Gortmaker <p_gortmaker@yahoo.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Samuel Ortiz <sameo@linux.intel.com>, alsa-devel@alsa-project.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
	lm-sensors@lm-sensors.org,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org,
	Anton Vorontsov <cbouatmailru@gmail.com>, rtc-linux@googlegroups.com,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-usb@vger.kernel.org,
	Liam Girdwood <lrg@slimlogic.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/20/2010 05:26 PM, Thomas Bogendoerfer wrote:
> great stuff. I have a JZ4730 based netbook, for which I started magling
> the provided sources quite some time ago, but I didn't reach the
> point of submitting patches... there are a lot of common stuff between
> JZ4730 and JZ4740 so IMHO it would be a good thing not to nail
> everthing to JZ4740 namewise. It might also a good idea to select
> something like arch/mips/jzrisc as base directory, put the

Hi Thomas

I would advice "xburst" instead jzrisc. because the Ingenic call
their cpu "XBurst" series. like: XBurst JZ4740, XBurst JZ4750 ...


> factored out code there and add JZ4730/JZ4740 in either seperate
> files or directories.


-- 
Best Regards
Xiangfu Liu
http://www.openmobilefree.net
