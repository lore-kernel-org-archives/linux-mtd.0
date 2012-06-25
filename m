Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjF8z-0006u8-2h
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 19:40:17 +0000
Message-ID: <4FE8BE92.1030502@newsguy.com>
Date: Mon, 25 Jun 2012 12:40:02 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
 <1340017963.2420.29.camel@sauron.fi.intel.com> <87ehpc1oyb.fsf@free.fr>
 <1340051296.1971.5.camel@koala> <87y5nczgo6.fsf@free.fr>
In-Reply-To: <87y5nczgo6.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
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

On 06/24/2012 11:52 AM, Robert Jarzmik wrote:
> Artem Bityutskiy <dedekind1@gmail.com> writes:
> 
>>> But in the end, the bad block table is immutable, and represents factory bad
>>> blocks, not up-to-date list of bad blocks.
>> How do you store the information about the later developed bad blocks?
> 
> Well, I think ... I don't actually. I should review a bit docg3 driver, as there
> is a spare byte in the OOB area to store information. The trick is, if the block
> is already worn out, can I rely on OOB to store the bad block info ?


It's imperfect for that reason, but mitigated by the fact that the block is
considered bad if the expected pattern in oob does not match exactly.

Another problem with this method is that if the flash contains data not written
by mtd, the bb scan falsely identifies most (if not all) of the non-blank blocks
as "bad".  This is the reason the docg4 driver has a module parameter
'ignore_badblocks'.  I have to use this parameter in order to read the flash in
a phone that still contains the data from PalmOS.

And currently the bb scan is done over the whole device, regardless of the
partitioning scheme.  This makes a dual boot setup, where the docg4 is divided
into PalmOS and Linux partitions, impossible without a blizzard of warnings
during initialization about bad blocks within the PalmOS partition.

Mike
