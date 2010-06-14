Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOChA-0001Q1-Q9
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 16:39:33 +0000
Received: by pwj6 with SMTP id 6so3261897pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jun 2010 09:39:31 -0700 (PDT)
Subject: Re: [PATCH] mtd: Fix bug using smp_processor_id() in preemptible
	ubi_bgt1d kthread
From: Philby John <pjohn@mvista.com>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20100614150425.GC9550@shareable.org>
References: <1276513457.16642.3.camel@localhost.localdomain>
	<20100614150425.GC9550@shareable.org>
Content-Type: text/plain
Date: Mon, 14 Jun 2010 22:10:18 +0530
Message-Id: <1276533618.17818.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd@lists.infradead.org, David Daney <ddaney@caviumnetworks.com>,
	linux-kernel@vger.kernel.org
Reply-To: pjohn@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 16:04 +0100, Jamie Lokier wrote:
> Philby John wrote:
> > mtd: Fix bug using smp_processor_id() in preemptible ubi_bgt1d kthread
> > 
> > On a MIPS Cavium Octeon CN5020 when trying to create a UBI volume,
> > on the NOR flash, the kernel thread ubi_bgt1d calls
> > cfi_amdstd_write_buffers() --> do_write_buffer() -->
> > INVALIDATE_CACHE_UDELAY --> __udelay(). Its __udelay() that calls
> > smp_processor_id() in preemptible code, which you are not supposed to.
> > Fix the problem by disabling preemption.
> 
> The MTD code just calls udelay().
> Are you sure it isn't permitted to call udelay() from preemptible code?
> I think it is fine.

It isn't really udelay() but smp_processor_id() that you are not to call
from a preemptible thread. Now I also see Ed Swierk has done a similar
thing https://patchwork.kernel.org/patch/4049/ and he comments "..which
calls smp_processor_id(), which is not supposed to be called from a
preemptible thread."


So perhaps I can use preempt_disable() around just this call in function
__udelay()?

Regards,
Philby
