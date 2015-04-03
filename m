Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydu1K-0005g3-FI
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2015 05:19:55 +0000
Message-ID: <551E22E2.80200@dave-tech.it>
Date: Fri, 03 Apr 2015 07:19:30 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: Add simple read disturb test
References: <mailman.39315.1427996116.22890.linux-mtd@lists.infradead.org>
 <mailman.39315.1427996116.22890.linux-mtd.{24f734ed-8ded-41ef-a2bd-8beedb955756}.0@lists.infradead.org>
 <551D6BDA.6000606@nod.at>
In-Reply-To: <551D6BDA.6000606@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

Il 02/04/2015 18:18, Richard Weinberger ha scritto:
> Am 02.04.2015 um 18:04 schrieb Brian Norris:
>> On Thu, Apr 02, 2015 at 04:13:46PM +0200, Richard Weinberger wrote:
>> [1] Although there are some latent issues in these tests that are still
>> getting get worked out (e.g., bad handling of 64-bit casting; too large
>> of stacks; uninterruptibility). The latter two would not even exist if
>> we were in user space.
> 
> uninterruptibility got solved by my "[PATCH] mtd: Make MTD tests cancelable" patch.

And this is something I was looking for from years!

> But if we want to kill drivers/mtd/tests/ I'll happily help out.
> Where shall we move these tests into? mtd-utils?

I think so.
I'm writing a similar read disturb test on my own, mixing already
existing mtd-tools (flash_erase, nandwrite, nanddump) with some naive
bash scripting.
IMHO, we have a lot of pros running in userspace:
* dumping data
* better error/status log (which can be easily written on file, for
example, while mtdtests error log is mixed with other kernel messages)
* running test in parallel (if it make sense ;-)

For example on read disturb I already calculate RBER, which is, AFAIK, a
nice index on the quality of the NAND cell and of its data. I'm working
on writing down data on a separate CSV which can be easily processed
later (e.g. to make part to part comparison/statistics).

There's already a test directory inside mtd-utils, I think it's better
to start creating tests there, as userspace tools, whenever this is
possible.
Do we have any reason to have MTD tests as kernel module? (performance?)

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
