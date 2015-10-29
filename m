Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrgrx-0003Sq-RK
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 06:39:30 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Marek Vasut <marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <20151028171430.GC13239@google.com> <87eggek91f.fsf@belgarion.home>
 <201510282347.27379.marex@denx.de>
Date: Thu, 29 Oct 2015 07:32:33 +0100
In-Reply-To: <201510282347.27379.marex@denx.de> (Marek Vasut's message of
 "Wed, 28 Oct 2015 23:47:27 +0100")
Message-ID: <87611qjibi.fsf@belgarion.home>
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

Marek Vasut <marex@denx.de> writes:

>> Isn't there the case of a single NAND controller with 2 identical chips,
>> each a 8 bit NAND chip, and the controller aggregating them to offer the
>> OS a single 16-bit NAND chip ?
>
> Is that using 1 or 2 physical chipselect lines on the CPU (controller) ?
I think it's 2 physical chipselects (CS0 and CS1). The way I understand it is
that the NAND controller asserts them both, issues the command on the command
line (shared between the 2 chips), and reads/writes on the separate data lines.

Cheers.

-- 
Robert
