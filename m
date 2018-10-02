Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7SEC-0004XF-S6
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 21:29:14 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Paolo Valente <paolo.valente@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] block: BFQ default for single queue devices
Date: Tue, 02 Oct 2018 23:28:59 +0200
Message-ID: <12312155.XfG6iRcV51@blindfold>
In-Reply-To: <20181002124329.21248-1-linus.walleij@linaro.org>
References: <20181002124329.21248-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

Am Dienstag, 2. Oktober 2018, 14:43:29 CEST schrieb Linus Walleij:
> This sets BFQ as the default scheduler for single queue
> block devices (nr_hw_queues == 1) if it is available. This
> affects notably MMC/SD-cards but notably also UBI and
> the loopback device.

did you notice a difference for UBI?
Strictly speaking it affects only ubibock, the read-only
block device on top of an UBI volume.

Thanks,
//richard
