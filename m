Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY6Ja-00013T-Mw
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 03:37:59 +0000
Message-ID: <5264A220.2070900@freescale.com>
Date: Mon, 21 Oct 2013 11:40:16 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>	<5260DA32.4090502@freescale.com>
 <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
In-Reply-To: <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA10=D4=C219=C8=D5 10:01, Brian Norris =D0=B4=B5=C0:
> Yes, I seem to have overlooked this set. I think it must have come in
> parallel with your MLC patch set, so I delayed it until the MLC patch
> set settled down?
>
this patch set has no relationship with MLC patch.

> Anyway, I'll revisit this soon. But I probably need to take care of
> your mtd-utils updates first, since they should go along with the MLC
> patch set.
>
> And on top of that (to update the world on daily status), I seem to be
> tripping over some UBIFS bugs that are inhibiting the validation I'm
> trying to do for some new hardware. So, I'm all-around pretty busy!
> I'll get myself together next week, hopefully.
understood.


I am too busy too, i am starting to code the Qspi driver now.
I was blocked by a bluetooth/uart/dma issue last month.
> In the meantime, other people's code could use some extra eyes. I know
> Ezequiel just sent out a 27 (!) patch series today. There's also the
> pending cmdline.c patch from months ago, where Cai Zhiyong wanted to
> migrate our command line partition parser to a common
> block/cmdline-parser.c. Part of her work (for block devices) is
I like Cai zhiyong's patch. But I do not have time to test his patch.


thanks
Huang Shijie
