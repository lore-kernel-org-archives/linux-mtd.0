Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1k4S-0003MD-BU
	for linux-mtd@lists.infradead.org; Sat, 24 Oct 2009 17:06:32 +0000
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com>
In-Reply-To: <1256313202.5824.60.camel@atal-desktop>
References: <20091015093133.GF10546@elte.hu>
	<20091015161052.0752208e@marrow.netinsight.se>
	<20091015154640.GA11408@elte.hu>
	<20091016094601.4e2c2d3e@marrow.netinsight.se>
	<20091016080935.GA3895@elte.hu>	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
	<20091016101045.GA3263@elte.hu>
	<20091016140918.3981cfa2@marrow.netinsight.se>
	<1255952922.32489.505.camel@localhost>	<20091019125017.GA9030@elte.hu>
	<alpine.LFD.2.00.0910220832580.9771@eeepc.linux-foundation.org>
	<20091022082500.602f9a7d@marrow.netinsight.se>
	<1256313202.5824.60.camel@atal-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 24 Oct 2009 20:05:57 +0300
Message-Id: <1256403957.29885.357.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@elte.hu>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-23 at 18:53 +0300, Shargorodsky Atal
(EXT-Teleca/Helsinki) wrote:
> Hi all,
> 
> On Thu, 2009-10-22 at 08:25 +0200, ext Simon Kagstrom wrote:
> 
> > Thanks to everyone for the reviewing and suggestions!
> > 
> 
> I have a couple of questions:
> 
> 1. If somebody writes a module that uses dumper for uploading the
> oopses/panics logs via some pay-per-byte medium,  since he has no way
> to know in a module if the panic_on_oops flag is set, he'll have
> to upload both oops and the following panic, because he does not
> know for sure that the panic was caused by the oops. Hence he
> pays twice for the same information, right?

Looks like a valid point to me. Indeed, in this case we will first call
'kmsg_dump(KMSG_DUMP_OOPS)' from 'oops_exit()', and then call it from
'panic()'. And the dumper may dump the same information, which is not
nice.

I've looked briefly and tried to figure out how to fix this. But I
cannot find an clean way. And I was confused by the die/oops/etc code.
My question is, why the code does not work the following way instead?

diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
index 2d8a371..8f322c7 100644
--- a/arch/x86/kernel/dumpstack.c
+++ b/arch/x86/kernel/dumpstack.c
@@ -235,13 +235,12 @@ void __kprobes oops_end(unsigned long flags, struct pt_regs *regs, int signr)
        raw_local_irq_restore(flags);
        oops_exit();

-       if (!signr)
-               return;
        if (in_interrupt())
                panic("Fatal exception in interrupt");
        if (panic_on_oops)
                panic("Fatal exception");
-       do_exit(signr);
+       if (signr)
+               do_exit(signr);
 }

 int __kprobes __die(const char *str, struct pt_regs *regs, long err)

If the code worked like this, I think the problem indicated by Atal
could be easily fixed.

> 2. We tried to use panic notifiers mechanism to print additional
> information that we want to see in mtdoops logs and it worked well,
> but having the kmsg_dump(KMSG_DUMP_PANIC) before the
> atomic_notifier_call_chain() breaks this functionality.
> Can we the call kmsg_dump() after the notifiers had been invoked?

Atal, I think you should just attach your patch, it is easier to express
what you mean.

But for me it looks like atomic_notifier_call_chain() can be moved up.

Anyway, please, show your patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
