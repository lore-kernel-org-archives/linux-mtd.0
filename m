Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S90aM-0005j7-IZ
 for linux-mtd@lists.infradead.org; Sat, 17 Mar 2012 20:50:47 +0000
Message-ID: <4F64F919.2080200@newsguy.com>
Date: Sat, 17 Mar 2012 13:50:33 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316235424.60a62ed0@halley>
In-Reply-To: <20120316235424.60a62ed0@halley>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many thanks Shmulik.  This helped my thought process, which was distracted by
consideration of the "physical" nature of the device ;)  Yes, the integrity of
the entire page can be threatened in any one ecc step, so the danger threshold
should be based on the ecc strength of each step.

Thanks again,
Mike


On 03/16/2012 02:54 PM, Shmulik Ladkani wrote:
> Hi Mike,
> 
> On Fri, 16 Mar 2012 09:25:08 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
>> Maybe my (admittedly limited) understanding of the physical nature of NAND flash
>> is flawed.  I assumed that a writesize region (i.e., a NAND page for our
>> purposes) is the most elemental unit wrt physical wear, regardless of whether or
>> not ecc is caclulated once for the whole page or incrementally in steps.
> 
> Bit-flips may occur at a per-cell basis, even on the OOB cells, as a
> result of program-disturb, charge-loss, or cell ware-out causing read
> sensing errors.
> 
>> But you're sayimg my assumption is incorrect.  So each ecc-sized area within a
>> page is physically distinct and must be considered in isolation? 
> 
> There's no "physical" distinction, in the sense that cells are separated
> in the device or alike.
> Simply, the ECC algorithm is independently calculated over several
> portions of the page.
> But that's not a must: suppose X bits per Y bytes ECC is required; you
> may use a 2X / 2Y ECC and acheive similar intergrity and endurance
> statistical characteristics.
> 
> For your purposes, the question whether the cleaning decision should be
> according to the ecc step level, is dependent of how you define
> "a dangerously high number of bit errors".
> 
> Lets continue with Ivan's example (2KiB page, 4 eccsteps, 512 bytes
> each step, strength 4bits/512bytes).
> Suppose the first ECC portion has 4 bit errors, the other 3 portions
> have none.
> If, for example, several read operations later, a new bitflip is
> intorduced within the first portion, leading to 5 bit errors.
> Obviously, the ECC algorithm is now unable to correct this portion,
> meaning, the buffer is corrupt - which also means the entire page data
> read is corrupt. The nand infrastructure would return -EBADMSG - and you
> had just 5 bit errors over the entire page.
> 
> So question is, would you consider 4 bit errors in the first ECC portion
> to be "a dangerously high number of bit errors" as what's reported to
> the MTD users?
> If so, then yes, the cleaning decision should be according to the ecc
> step level, not at the page reading level.
> 
> Regards,
> Shmulik
> 
> 
