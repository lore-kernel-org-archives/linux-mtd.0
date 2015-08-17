Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRPx4-0005Ys-EA
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 19:20:11 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
References: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
 <20150816152924.GA799@laptop.cereza> <87si7iandq.fsf@belgarion.home>
 <CAAEAJfAmD5VzA4J4+jwmCirmqfAJcvY8Ac45nupZwGVVb38Vhg@mail.gmail.com>
Date: Mon, 17 Aug 2015 21:15:48 +0200
In-Reply-To: <CAAEAJfAmD5VzA4J4+jwmCirmqfAJcvY8Ac45nupZwGVVb38Vhg@mail.gmail.com>
 (Ezequiel Garcia's message of "Mon, 17 Aug 2015 16:09:04 -0300")
Message-ID: <87d1ylafq3.fsf@belgarion.home>
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

> In other words, it seems that we must wake the IRQ thread handler
> _before_ we clear RDDREQ, not after.
>
> So unless I'm completely off, the current patch is right, and a comment
> would be helpful.
Ok Ezequiel, I'll wait for your Tested-by, and respin with something like :

	/* Clear all status bit before issuing the next command, which can and
         * will alter the status bits and will deserve a new interrupt on its
         * own.
         */

> OK, I'll see about testing your four patches on some Armada 370/XP.
Yeah, that would be good.

Cheers.

-- 
Robert
