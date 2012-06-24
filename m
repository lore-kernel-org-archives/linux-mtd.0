Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sirv9-0002hp-7n
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2012 18:52:30 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading its
 version
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
 <1340017963.2420.29.camel@sauron.fi.intel.com>
 <87ehpc1oyb.fsf@free.fr> <1340051296.1971.5.camel@koala>
Date: Sun, 24 Jun 2012 20:52:09 +0200
In-Reply-To: <1340051296.1971.5.camel@koala> (Artem Bityutskiy's message of
 "Mon, 18 Jun 2012 23:28:16 +0300")
Message-ID: <87y5nczgo6.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Mon, 2012-06-18 at 19:59 +0200, Robert Jarzmik wrote:
>> To store worn out blocks, each filesystem implementation has to do something
>> smart. UBI has it way, SAFTL (docg3 fs) has its way, etc ...
>
> UBI does not do anything about storing the bad block table. UBI relies
> on the MTD layer - it may mark a block as bad and MTD should take care
> of storing this information either in the OOB or in the BBT on in both
> places.
Urg ... I was under the impression UBI stored that information in its control
data, too bad for me ...

>> But in the end, the bad block table is immutable, and represents factory bad
>> blocks, not up-to-date list of bad blocks.
> How do you store the information about the later developed bad blocks?

Well, I think ... I don't actually. I should review a bit docg3 driver, as there
is a spare byte in the OOB area to store information. The trick is, if the block
is already worn out, can I rely on OOB to store the bad block info ?

I remember seeing people on this mailing list discussing this topic, but I can't
remember the outcome ...

>> As to whether you should kill it or not, it's up to the maintainer of diskonchip
>> I suppose.
> There is no DoC maintainer, you can consider yourself to be the
> maintainer, because you and Mike are the only people who care about this
> AFAICS.
Same as Mike, I don't have the hardware. If somebody has some spare hardware to
provide, I'd gladly take over the maintenership.

Cheers.

-- 
Robert
