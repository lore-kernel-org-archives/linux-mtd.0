Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1MV1-0006Qj-DF
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 15:56:23 +0000
Subject: Re: [PATCH v11 4/5] core: Add kernel message dumper to call on
	oopses and panics
From: "Shargorodsky Atal (EXT-Teleca/Helsinki)"
	<ext-atal.shargorodsky@nokia.com>
To: ext Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091022082500.602f9a7d@marrow.netinsight.se>
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
Content-Type: text/plain
Date: Fri, 23 Oct 2009 18:53:22 +0300
Message-Id: <1256313202.5824.60.camel@atal-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On Thu, 2009-10-22 at 08:25 +0200, ext Simon Kagstrom wrote:

> Thanks to everyone for the reviewing and suggestions!
> 

I have a couple of questions:

1. If somebody writes a module that uses dumper for uploading the
oopses/panics logs via some pay-per-byte medium,  since he has no way
to know in a module if the panic_on_oops flag is set, he'll have
to upload both oops and the following panic, because he does not
know for sure that the panic was caused by the oops. Hence he
pays twice for the same information, right?

I can think of a couple of way to figure it out in the module
itself, but I could not think of any clean way to do it.


2. We tried to use panic notifiers mechanism to print additional
information that we want to see in mtdoops logs and it worked well,
but having the kmsg_dump(KMSG_DUMP_PANIC) before the
atomic_notifier_call_chain() breaks this functionality.
Can we the call kmsg_dump() after the notifiers had been invoked?


Thanks,
Atal.

> // Simon
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
