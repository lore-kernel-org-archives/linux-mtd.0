Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrXrY-0004YY-Ln
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 21:02:29 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <20151027175446.GT13239@google.com>
 <20151028085813.4b0b3ac8@bbrezillon>
 <201510281711.14196.marex@denx.de>
 <20151028173215.0c1c4e30@bbrezillon>
 <20151028171430.GC13239@google.com>
Date: Wed, 28 Oct 2015 21:55:24 +0100
In-Reply-To: <20151028171430.GC13239@google.com> (Brian Norris's message of
 "Wed, 28 Oct 2015 10:14:30 -0700")
Message-ID: <87eggek91f.fsf@belgarion.home>
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

Brian Norris <computersforpeace@gmail.com> writes:

>> > 
>> > Do some sorts of chipselects come into play here ? Ie. you can have one master
>> > with multiple NAND chips connected to it.
>> 
>> Most NAND controllers support interacting with several chips (or
>> dies in case your chip embeds several NAND dies), but I keep thinking
>> each physical chip should have its own instance of nand_chip + mtd_info.
>> If you want to have a single mtd device aggregating several chips you
>> can use mtdconcat.
>> 
>> This leaves the multi-dies chip case, and IHMO we should represent those
>> chips as a single entity, and I guess that's the purpose of the
>> ->numchips field in nand_chip (if your chip embeds 2 dies with 2 CS
>> lines, then ->numchips should be 2).
> Yes, I think that's some of the intention there. And so even in that
> case, a multi-die chip gets represented as a single struct nand_chip.

Isn't there the case of a single NAND controller with 2 identical chips, each a
8 bit NAND chip, and the controller aggregating them to offer the OS a single
16-bit NAND chip ?

In this case, the controller (pxa3xx is a good example) will be programmed to
handle both chips at the same time, and calculate CRC on both chips, etc ... I
hope the assertion "physical chip should have its own instance of nand_chip +
mtd_info" does take into account this example.

I don't know if there is actually any user of this for either pxa3xx or another
controller, nor if there is any value in this.

Cheers.

-- 
Robert
