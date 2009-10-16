Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Myjm2-0006Ql-JB
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 10:11:07 +0000
Date: Fri, 16 Oct 2009 12:10:45 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH v10 4/5] core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091016101045.GA3263@elte.hu>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094805.754461fa@marrow.netinsight.se>
	<20091015093133.GF10546@elte.hu>
	<20091015161052.0752208e@marrow.netinsight.se>
	<20091015154640.GA11408@elte.hu>
	<20091016094601.4e2c2d3e@marrow.netinsight.se>
	<20091016080935.GA3895@elte.hu>
	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091016112556.6902b2dc@marrow.netinsight.se>
Cc: dedekind1@gmail.com, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:

> +int kmsg_dump_register(struct kmsg_dumper *dumper)
> +{
> +	unsigned long flags;
> +
> +	/* The dump callback needs to be set */
> +	if (!dumper->dump)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&dump_list_lock, flags);
> +
> +	/* Don't allow registering multiple times */
> +	if (dumper->registered) {
> +		spin_unlock_irqrestore(&dump_list_lock, flags);
> +
> +		return -EBUSY;
> +	}
> +
> +	dumper->registered = 1;
> +	list_add(&dumper->list, &dump_list);
> +	spin_unlock_irqrestore(&dump_list_lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(kmsg_dump_register);


i dont want to bikeshed paint this but this sequence caught my eyes. We 
generally do flatter and clearer locking sequences:

int kmsg_dump_register(struct kmsg_dumper *dumper)
{
	unsigned long flags;
	int err = -EBUSY;

	/* The dump callback needs to be set */
	if (!dumper->dump)
		return -EINVAL;

	spin_lock_irqsave(&dump_list_lock, flags);

	/* Don't allow registering multiple times */
	if (!dumper->registered) {
		dumper->registered = 1;
		list_add_tail(&dumper->list, &dump_list);
		err = 0;
	}

	spin_unlock_irqrestore(&dump_list_lock, flags);

	return err;
}
EXPORT_SYMBOL_GPL(kmsg_dump_register);

(warning: untested, written in mail editor)

Same goes for kmsg_dump_unregister().

	Ingo
