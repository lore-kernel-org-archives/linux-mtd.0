Received: from smtp13.smtpout.orange.fr ([80.12.242.135]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVvIS-0007hw-Bp
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 08:50:30 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mark Brown <broonie@kernel.org>,  Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Nicolas Pitre <nico@fluxnic.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 09/14] ASoC: pxa: remove the dmaengine compat need
References: <20180617170217.24177-1-robert.jarzmik@free.fr>
 <20180617170217.24177-10-robert.jarzmik@free.fr>
 <1984a4a7-e33b-6349-31f3-6f85ff1582b8@zonque.org>
Date: Thu, 21 Jun 2018 10:50:03 +0200
In-Reply-To: <1984a4a7-e33b-6349-31f3-6f85ff1582b8@zonque.org> (Daniel Mack's
 message of "Sun, 17 Jun 2018 20:17:09 +0200")
Message-ID: <87muvoo75w.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel Mack <daniel@zonque.org> writes:

> Hi Mark,
>
> I prepared a series of patches for 4.18 that conflict with this one. Instead of
> letting other people resolve this down the road, I'd prefer if this one went
> through the ASoC tree, if you don't mind.
>
> I've talked to Robert off-list, and he's fine with this approach.
That's right.

I'll tentativaly queue this patch to my pxa/for-next tree. As soon as I hear
that Mark queued it up in his tree, I'll drop it from mine.

Cheers.

--
Robert
