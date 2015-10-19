Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoHiX-0005MF-Fw
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2015 21:11:42 +0000
Subject: Re: [PATCH] mtd: Add simple read disturb test
To: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <20150402160451.GF32500@ld-irv-0074> <551D6BDA.6000606@nod.at>
 <20150412213120.0414fee5@bbrezillon> <20151013001153.GS107187@google.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Daniel Walter <sahne@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56255C73.60501@nod.at>
Date: Mon, 19 Oct 2015 23:11:15 +0200
MIME-Version: 1.0
In-Reply-To: <20151013001153.GS107187@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 13.10.2015 um 02:11 schrieb Brian Norris:
> Resurrecting this old thread, since it was mentioned at ELCE.
> 
> On Sun, Apr 12, 2015 at 09:31:20PM +0200, Boris Brezillon wrote:
>> On Thu, 02 Apr 2015 18:18:34 +0200
>> Richard Weinberger <richard@nod.at> wrote:
>>> Am 02.04.2015 um 18:04 schrieb Brian Norris:
>>>> On Thu, Apr 02, 2015 at 04:13:46PM +0200, Richard Weinberger wrote:
>>>>> This simple MTD tests allows the user to see when read disturb happens.
>>>>> By reading blocks over and over it reports flipped bits.
>>>>> Currently it reports only flipped bits of the worst page of a block.
>>>>> If within block X page P1 has 3 bit flips and P6 4, it will report 4.
>>>>> By default every 50th block is read.
>>>>
>>>> Didn't read through this much yet, but why do we need another in-kernel
>>>> test that coul (AFAICT) be easily replicated in userspace? The same goes
>>>> for several of the other tests, I think, actually. But at least with
>>>> those, we have a history of keeping them around, so it's not too much
>>>> burden [1].
>>>
>>> I've added the test to drivers/mtd/tests/ because it fits into.
>>> As simple as that.
>>>
>>>> Brian
>>>>
>>>> [1] Although there are some latent issues in these tests that are still
>>>> getting get worked out (e.g., bad handling of 64-bit casting; too large
>>>> of stacks; uninterruptibility). The latter two would not even exist if
>>>> we were in user space.
>>>
>>> uninterruptibility got solved by my "[PATCH] mtd: Make MTD tests cancelable" patch.
>>>
>>> But if we want to kill drivers/mtd/tests/ I'll happily help out.
>>
>> I'd vote for that solution too.
>> I've looked at in-kernel mtd tests, and I'm pretty sure they can all be
>> done in userland.
>> This would prevent any kernel crash caused by buggy test modules.  
>>
>>> Where shall we move these tests into? mtd-utils?
>>
>> I guess so, but I'll let Brian answer that one.
>> How about dispatching them in mtd-utils' tests/ directory (some of them
>> are NAND related tests, so creating a tests/nand would make sense,
>> and others are more generic).
> 
> mtd-utils makes sense to me. If we're going to do this, let's make it a
> policy to not add more to drivers/mtd/tests/ then. For instance, this
> one [1]. Also, would we drop the in-kernel tests completely?

I agree.
Ripping out in-kernel tests and moving them to mtd-utils seems legit to me.
While we're here, re-factoring existing tests in mtd-utils would also be nice.
I'm also thinking of making UBI tests more user friendly such that distros
can package them into their mtd-utils package.

> If we make the move, we'd need to make sure to update the documentation
> (mtd-www.git).
> 
> Brian
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-September/062237.html
>     http://lists.infradead.org/pipermail/linux-mtd/2015-September/062236.html

Thanks,
//richard
