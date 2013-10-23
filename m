Received: from mail-oa0-f42.google.com ([209.85.219.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ74I-0001BL-Vq
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 22:38:23 +0000
Received: by mail-oa0-f42.google.com with SMTP id k14so1626711oag.15
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 15:37:59 -0700 (PDT)
Date: Wed, 23 Oct 2013 15:37:55 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
Message-ID: <20131023223755.GX23337@ld-irv-0074.broadcom.com>
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
 <5260DA32.4090502@freescale.com>
 <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
 <5264A220.2070900@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5264A220.2070900@freescale.com>
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

On Mon, Oct 21, 2013 at 11:40:16AM +0800, Huang Shijie wrote:
> 于 2013年10月19日 10:01, Brian Norris 写道:
> > Yes, I seem to have overlooked this set. I think it must have come in
> > parallel with your MLC patch set, so I delayed it until the MLC patch
> > set settled down?
> >
> this patch set has no relationship with MLC patch.

Well, it did touch the same driver, and your patch set kept evolving so
I chose to focus on just one of your patch sets at a time there...

I'll take a look now.

> > Anyway, I'll revisit this soon. But I probably need to take care of
> > your mtd-utils updates first, since they should go along with the MLC
> > patch set.
> >
> > And on top of that (to update the world on daily status), I seem to be
> > tripping over some UBIFS bugs that are inhibiting the validation I'm
> > trying to do for some new hardware. So, I'm all-around pretty busy!
> > I'll get myself together next week, hopefully.
> understood.
> 
> 
> I am too busy too, i am starting to code the Qspi driver now.
> I was blocked by a bluetooth/uart/dma issue last month.
> > In the meantime, other people's code could use some extra eyes. I know
> > Ezequiel just sent out a 27 (!) patch series today. There's also the
> > pending cmdline.c patch from months ago, where Cai Zhiyong wanted to
> > migrate our command line partition parser to a common
> > block/cmdline-parser.c. Part of her work (for block devices) is
> I like Cai zhiyong's patch. But I do not have time to test his patch.

Well, this represents a bad community mentality, where people have time
to submit plenty of code for their own drivers, and ask a lot from
maintainers to review and merge their code, yet they do not have any
time to review others' work. I believe that bearing the sole
responsibility of code review is a major contributing factor in both
Artem's and my long latency to merging patches.

That said, I understand that people get very busy sometimes, and I don't
mean to particularly focus on you, Huang. This is a general pattern that
I've seen, and I have done the same thing previously, where I simply did
not have (and did not make) time to review others' work much.

Brian
