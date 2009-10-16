Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Myi80-0006up-Bs
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 08:25:41 +0000
Subject: Re: [PATCH v9 4/5] core: Add kernel message dumper to call on
	oopses and panics
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ingo Molnar <mingo@elte.hu>
In-Reply-To: <20091016080935.GA3895@elte.hu>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094805.754461fa@marrow.netinsight.se>
	<20091015093133.GF10546@elte.hu>
	<20091015161052.0752208e@marrow.netinsight.se>
	<20091015154640.GA11408@elte.hu>
	<20091016094601.4e2c2d3e@marrow.netinsight.se>
	<20091016080935.GA3895@elte.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Oct 2009 11:24:27 +0300
Message-Id: <1255681467.32489.360.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-16 at 10:09 +0200, Ingo Molnar wrote:
> * Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:
> 
> /**
>  *	kmsg_dump_register - register a kernel log dumper.
>  *	@dump: pointer to the kmsg_dumper structure
>  *
>  *	Adds a kernel log dumper to the system. The dump callback in the
>  *	structure will be called when the kernel oopses or panics and must be
>  *	set. Returns zero on success and -EINVAL or -EBUSY otherwise.
>  */
> 
> Small detail - please use the KernelDoc style used in existing printk.c 
> facilities, i.e. use a single space instead of a tab:
> 
> /**
>  * kmsg_dump_register - register a kernel log dumper.
>  * @dump: pointer to the kmsg_dumper structure
>  *
>  * Adds a kernel log dumper to the system. The dump callback in the
>  * structure will be called when the kernel oopses or panics and must be
>  * set. Returns zero on success and -EINVAL or -EBUSY otherwise.
>  */

And then %-EINVAL and %-EBUSY.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
