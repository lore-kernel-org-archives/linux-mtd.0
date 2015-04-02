Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydhpd-0004uO-Ch
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 16:19:02 +0000
Message-ID: <551D6BDA.6000606@nod.at>
Date: Thu, 02 Apr 2015 18:18:34 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <20150402160451.GF32500@ld-irv-0074>
In-Reply-To: <20150402160451.GF32500@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.04.2015 um 18:04 schrieb Brian Norris:
> On Thu, Apr 02, 2015 at 04:13:46PM +0200, Richard Weinberger wrote:
>> This simple MTD tests allows the user to see when read disturb happens.
>> By reading blocks over and over it reports flipped bits.
>> Currently it reports only flipped bits of the worst page of a block.
>> If within block X page P1 has 3 bit flips and P6 4, it will report 4.
>> By default every 50th block is read.
> 
> Didn't read through this much yet, but why do we need another in-kernel
> test that coul (AFAICT) be easily replicated in userspace? The same goes
> for several of the other tests, I think, actually. But at least with
> those, we have a history of keeping them around, so it's not too much
> burden [1].

I've added the test to drivers/mtd/tests/ because it fits into.
As simple as that.

> Brian
> 
> [1] Although there are some latent issues in these tests that are still
> getting get worked out (e.g., bad handling of 64-bit casting; too large
> of stacks; uninterruptibility). The latter two would not even exist if
> we were in user space.

uninterruptibility got solved by my "[PATCH] mtd: Make MTD tests cancelable" patch.

But if we want to kill drivers/mtd/tests/ I'll happily help out.
Where shall we move these tests into? mtd-utils?

Thanks,
//richard
