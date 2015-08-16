Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZR6K9-0002L8-JL
 for linux-mtd@lists.infradead.org; Sun, 16 Aug 2015 22:22:42 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
References: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
 <20150816152924.GA799@laptop.cereza>
Date: Mon, 17 Aug 2015 00:18:09 +0200
In-Reply-To: <20150816152924.GA799@laptop.cereza> (Ezequiel Garcia's message
 of "Sun, 16 Aug 2015 12:29:27 -0300")
Message-ID: <87si7iandq.fsf@belgarion.home>
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

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> On 12 Aug 06:22 PM, Robert Jarzmik wrote:
>
> This fix looks correct. Thanks!
>
> Couple questions:
>
> 1. In which platform are you seeing this bug?
zylonite with a pxa310 (ie. internal stacked NAND).

> 2. Is this a regression? (i.e. should we queue it for -stable?)
No, it's been there for ages I think.

> Also, one might question why we can't just write NDSR right after it's read,
> before we wake the IRQ thread or start DMA. It appears this is
> a requirement of BCH, as per the comment in drain_fifo.
For irq thread that won't make any difference, the irq handler will finish first
and clear the bits anyway. For DMA it's better.

And more generaly speaking, I like it better, to clear it once read.

> It would be nice to put a comment explaining why we clear NDSR only
> before the check to WRCMDREQ. Maybe even copy-pasting something
> from the commit log?
If we move it up to something like that :
	status = nand_readl(info, NDSR);
	nand_writel(info, NDSR, status);
Then the comment is overkill I think.

> I'd like to say "Yay, let's pick it" but I'd like to make sure this is
> tested on all platforms first (unless you've tested it already).
I tested on zylonite (where bug occurs) and cm-x300 (where bug never occurs).

Cheers.

--
Robert
