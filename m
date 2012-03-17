Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S905B-0004oq-Fv
 for linux-mtd@lists.infradead.org; Sat, 17 Mar 2012 20:18:34 +0000
Message-ID: <4F64F17C.2070409@newsguy.com>
Date: Sat, 17 Mar 2012 13:18:04 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com>
In-Reply-To: <20120316184345.GF10228@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/16/2012 11:43 AM, Ivan Djelic wrote:
> On Fri, Mar 16, 2012 at 04:25:08PM +0000, Mike Dunn wrote:
>>
>> But you're sayimg my assumption is incorrect.  So each ecc-sized area within a
>> page is physically distinct and must be considered in isolation?  Could you
>> maybe elaborate on this?
> 
> When NAND manufacturers specify ECC requirements in their datasheet, they indicate:
> - a block size on which ECC should be computed (possibly smaller than the page size)
> - how many errors should be correctable in a single block size, i.e. strength
> 
> For instance:
> - size = 512 bytes
> - strength = 8 errors
> 
> If the NAND device has 2 kB (resp. 4kB) pages, you will need to perform 4 (resp. 8) ECC
> computations per page.
> 
> The point of implementing the specified ECC is to ensure the integrity of data for the
> specified lifetime, i.e. its longevity.
> 
> Manufacturers select an ECC size/strength setup for a device purely from statistical
> computations or empirical results: there is no "special" physical ecc-sized area in each
> page. It's just that the error distribution empirically observed is well covered by the
> specified size/strength combination. You could perfectly protect your NAND device using
> a different size/strength combination, with different longevity results.
> The manufacturer size/strength recommendation takes also into account the available spare
> space and ECC computational requirements.
> 
> As a matter of fact, NAND manufacturers run write/read cycle aging tests in ovens, and
> measure how fast data corruption happens, assuming various protection schemes: no ECC,
> 1-bit ECC/512, 2-bit ECC/512, and so on. Google "NAND UBER" for more details (UBER =
> Uncorrectable Bit Error Rate).
> 
> Now, the point of scrubbing a block is to avoid error accumulation to the point when
> ECC is no longer able to correct all errors. This is why we must monitor each single
> ecc step rather than consider the total amount of errors corrected in a page.


Thanks for the detailed explanation, Ivan.  I guess I'm convinced now that I
think it through...  Basically, the chain (NAND page) is only as strong as the
weakest link (ecc.size).

So if we're all convinced that thresholds must be evaluated at the ecc.size
level, there's more work <sigh>.  As Ivan pointed out earlier, the nand drivers
currently do not track bitflip corrections per ecc step, which means all the
nand drivers must be modified.  Before I start on this, I'd like to get a
blessing from Artem / David, since the chamges will touch many drivers in a
somehat non-trivial manner.

I think the best approach is to have the nand drivers return max_bitflips over
all ecc steps, same idea as what the previous patches returned to mtd, but at a
finer granularity.  Then the nand code just passes this up to mtd, instead of
examining the ecc_stats as previously.

If I do go ahead, I can first post patches that fixes the two patches already
pushed to l2-mtd, or Artem can just pull them out and I'll start from scratch.
I personally prefer the former, since it's easier for me, plus it would be
illustrative of the change of plans.

Thanks,
Mike
