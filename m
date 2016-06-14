Received: from ns.sciencehorizons.net ([71.41.210.147])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCkK5-0002nv-3p
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 09:07:49 +0000
Date: 14 Jun 2016 05:07:26 -0400
Message-ID: <20160614090726.20977.qmail@ns.sciencehorizons.net>
From: "George Spelvin" <linux@sciencehorizons.net>
To: boris.brezillon@free-electrons.com, linux@sciencehorizons.net
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Cc: beanhuo@micron.com, computersforpeace@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at
In-Reply-To: <20160612231314.15d06854@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon wrote:
> On 12 Jun 2016 16:24:53 George Spelvin wrote:
>> Boris Brezillon wrote:
>> My problem is that I don't really understand MLC programming.

> I came to the same conclusion: we really have these 2 cases in the
> wild, which makes it even more complicated to define a standard
> behavior.

I did find a useful stuy of the issue: "Program Interference in MLC NAND
Flash Memory: Characterization, Modeling, and Mitigation"

https://users.ece.cmu.edu/~omutlu/pub/flash-programming-interference_iccd13.pdf

It describes the write-disturb-precompensation technique, and also
shows how the two-stage programming works.  (Although the fact that the
"least significant bit" is the *largest* voltage difference and is shown
on the *left* makes no sense at all.)

Looking at the demonstrated programming sequence, it looks like
it should be possible to probe for the bit assignment.  If you have
a half-programmed page, then any bits programmed to "0" are actually
sitting close to the threshold between the two middle voltage levels.

So you'll get a lot of errors reading them as "1", but the interesting
part is the read-back of the unprogrammed bit.

If the chip is using the binary sequence, you'll read either 10 or 01.
If the chip us ising the Gray-code sequence, you'll read 10 or 00.

Basically, you read both pages and see which bit combination never
appears.  That is the combination that corresponds to the highest voltage
level.

Another interesting paper is "Read Disturb Errors in MLC NAND Flash
Memory: Characterization, Mitigation, and Recovery"
https://users.ece.cmu.edu/~omutlu/pub/flash-read-disturb-errors_dsn15.pdf

That talks about tricks that do as you observe: increase read error to start.
(In order to decreaease read disturb, and thus read errors later.)

>> It's more considering it to have 16K pages that can be accessed in half-pages.

> Yes, I know, but it's not really easy to fake that at the NAND level,
> because programming 2 pages still requires 2 page program operation.
> The MTD user could detect that the pairing scheme always exposes 2
> consecutive non-paired pages, but as you've seen, this condition does
> not necessarily imply the 'pair coupling' constraint, and we don't want
> to increase the min_io_size value if it's not really necessary.

Ideally, it would be nice to separate the "SLC hack" from the "later
write failures can corrupt earlier data" workaround.

First, you get the latter working on SLC flash.  Then you add MLC, and
make MLC another reason why it can happen.

But I'm not certain this is actually necessary.  Could listing 4 pages
rather than 2 as in other data sheets just be an editing or translation
error?  Maybe someoe got confused about "in the same row" when they
wrote that clarifying example.

> I'm just realizing this is actually a non-issue for the solution we
> developed with Ricard.  As I said, it's unsafe to partially write a
> block in MLC mode, so the only sane way is either to write a block in
> SLC mode, or atomically write a block in MLC mode, and that's what
> we're doing with our 'UBI LEB consolidation' approach.  I'm pretty sure
> the problem described in the Hynix datasheet does not happen when only
> writing in SLC mode.  So, even if the pairing scheme does not account
> for this extra 'coupling' constraint, we should be safe.

I can't see any reason why it would affect MLC and not SLC.
