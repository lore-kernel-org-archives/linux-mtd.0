Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRwrW-0006n3-CK
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 06:28:39 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
References: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
 <20150816152924.GA799@laptop.cereza> <87si7iandq.fsf@belgarion.home>
 <CAAEAJfAmD5VzA4J4+jwmCirmqfAJcvY8Ac45nupZwGVVb38Vhg@mail.gmail.com>
 <87d1ylafq3.fsf@belgarion.home> <20150819004629.GS60523@google.com>
Date: Wed, 19 Aug 2015 08:22:05 +0200
In-Reply-To: <20150819004629.GS60523@google.com> (Brian Norris's message of
 "Tue, 18 Aug 2015 17:46:29 -0700")
Message-ID: <87io8b94s2.fsf@belgarion.home>
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

> Hi Robert,
>
> On Mon, Aug 17, 2015 at 09:15:48PM +0200, Robert Jarzmik wrote:
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>> > So unless I'm completely off, the current patch is right, and a comment
>> > would be helpful.
>> Ok Ezequiel, I'll wait for your Tested-by, and respin with something like :
>> 
>> 	/* Clear all status bit before issuing the next command, which can and
>>          * will alter the status bits and will deserve a new interrupt on its
>>          * own.
>>          */
>
> To be clear: I should hold off on this patch?
If you can hold until this evening (ie. in 12h), I'll post the same version of
the patch with Ezequiel's comment, and Ack/Test if he provides it.

If you have to decide in the next few hours, take it, this fix should land in
v4.3.

> I'm going to try to clear my queue of things that are simple/obvious
> and/or fix bugs (I think you spoke up about a different pxa3xx_nand
> bugfix which I will try to find). There's too big a backlog for me to
> get through everything for the merge window...

I'll resend my pxa3xx-nand backlog this evening for fixes I have on mind which
are simple fixes :
 - this one (random command timeouts)
 - Antoine's one (resent yesterday)
 - my fix for probe (mtd: nand: pxa3xx_nand: fix early spurious interrupt)
If you can wait this evening it will spare you digging through your mails.

Or alternatively Ezequiel, if you want to aggregate the patches because you have
others on mind also, please feel free to overtake this from me before my evening :)

Cheers.

-- 
Robert
