Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOVDB-0005Fg-U1
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 12:25:50 +0000
Received: by iwn3 with SMTP id 3so740956iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jun 2010 05:25:47 -0700 (PDT)
Subject: Re: [PATCH] mtd: Fix bug using smp_processor_id() in preemptible
	ubi_bgt1d kthread
From: Philby John <pjohn@mvista.com>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20100614150425.GC9550@shareable.org>
References: <1276513457.16642.3.camel@localhost.localdomain>
	<20100614150425.GC9550@shareable.org>
Content-Type: text/plain
Date: Tue, 15 Jun 2010 17:56:34 +0530
Message-Id: <1276604794.19810.3.camel@localhost.localdomain>
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

Hello Jamie,

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
> 
> Perhaps MIPS udelay() should be disabling preemption itself, or
> (as x86 does) using raw_smp_processor_id() instead?

Sorry for the noise. I now find that raw_smp_processor_id() has been
implemented specific to MIPS in the latest kernel, I was using 2.6.32.

Thanks and regards,
Philby
