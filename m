Received: from www.llwyncelyn.cymru ([82.70.14.225] helo=fuzix.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g89Gd-000217-7w
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 19:26:37 +0000
Date: Thu, 4 Oct 2018 20:25:53 +0100
From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>,
 Linus Walleij <linus.walleij@linaro.org>, linux-block
 <linux-block@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Ulf Hansson <ulf.hansson@linaro.org>,
 Richard Weinberger <richard@nod.at>, Artem
 Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jan Kara <jack@suse.cz>,
 Andreas Herrmann <aherrmann@suse.com>, Mel Gorman <mgorman@suse.com>,
 Chunyan Zhang <zhang.chunyan@linaro.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, "'Paolo Valente' via bfq-iosched\"        
 <bfq-iosched@googlegroups.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Mark Brown <broonie@kernel.org>"@fuzix.org
Subject: Re: [PATCH] block: BFQ default for single queue devices
Message-ID: <20181004202553.71c2599c@alans-desktop>
In-Reply-To: <1538582091.205649.20.camel@acm.org>
References: <20181002124329.21248-1-linus.walleij@linaro.org>
 <05fdbe23-ec01-895f-e67e-abff85c1ece2@kernel.dk>
 <B5321A64-8A1A-42FF-A337-F4524BDA179B@linaro.org>
 <1538582091.205649.20.camel@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I agree with Jens that it's best to leave it to the Linux distributors to
> select a default I/O scheduler.

That assumes such a thing exists. The kernel knows what devices it is
dealing with. The kernel 'default' ought to be 'whatever is usually best
for this device'. A distro cannot just pick a correct single default
because NVME and USB sticks are both normal and rather different in needs.

Alan
