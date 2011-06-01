Subject: Re: [PATCH 0/8] clean-up NAND / BBT code, flags
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1306884687-1824-1-git-send-email-computersforpeace@gmail.com>
References: <1306884687-1824-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 14:43:43 +0300
Message-ID: <1306928623.4405.108.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: baruch@tkos.co.il, Kevin Cernekee <cernekee@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	nsekhar@ti.com, b25806@freescale.com, tie-fei.zang@freescale.com,
	linux-mtd@lists.infradead.org,
	Florian Fainelli <ffainelli@freebox.fr>, jamie@jamieiles.com,
	Ivan Djelic <ivan.djelic@parrot.com>, kernel@wantstofly.org,
	khilman@ti.com, jesper.nilsson@axis.com, kgene.kim@samsung.com,
	linux@arm.linux.org.uk, hjk@linutronix.de, r64343@freescale.com,
	u.kleine-koenig@pengutronix.de,
	Ricard Wanderlof <ricard.wanderlof@axis.com>, alex@digriz.org.uk,
	john.ogness@linutronix.de, lucas.demarchi@profusion.mobi,
	nicolas.ferre@atmel.com, s.hauer@pengutronix.de,
	starvik@axis.com, joe@perches.com, ben-linux@fluff.org,
	cbouatmailru@gmail.com, linux-arm-kernel@lists.infradead.org,
	grant.likely@secretlab.ca, hong.xu@atmel.com,
	linux-cris-kernel@axis.com, sbranden@broadcom.com,
	nico@fluxnic.net, jkosina@suse.cz, blp@cs.stanford.edu,
	w.sang@pengutronix.de, mware@elphinstone.net,
	jdzheng@broadcom.com, chuanxiao.dong@intel.com, olof@lixom.net,
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

On Tue, 2011-05-31 at 16:31 -0700, Brian Norris wrote:
> Hello,
> 
> This patch series handles several issues with NAND chip flags and BBT
> flags, especially those related to the nand_chip.options and
> nand_bbt_descr.options fields. This topic was discussed and reviewed a
> bit on the linux-mtd thread found here:
>     http://lists.infradead.org/pipermail/linux-mtd/2011-April/035146.html
> 
> These changes have affected many drivers in relatively small ways, so
> I copied all the maintainers/contributors given by the
> scripts/getmaintainer.pl scripts. FYI, this patch set is based on the
> mtd-2.6.git repository from linux-mtd.
> 
> Also, the first patch:
>     mtd: nand: remove NAND_BBT_SCANBYTE1AND6 option
> solves the regression issues discussed here:
>     http://lists.infradead.org/pipermail/linux-mtd/2011-May/035696.html

Looks good to me, thank you. Pushed to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
