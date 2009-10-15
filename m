Received: from mx2.mail.elte.hu ([157.181.151.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MyMgY-0003Ft-8Q
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 09:31:55 +0000
Date: Thu, 15 Oct 2009 11:31:33 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH v7 4/5]: core: Add kernel message dumper to call on
	oopses and panics
Message-ID: <20091015093133.GF10546@elte.hu>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094805.754461fa@marrow.netinsight.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091015094805.754461fa@marrow.netinsight.se>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
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

> --- /dev/null
> +++ b/include/linux/kmsg_dump.h

> +enum kmsg_dump_reason {
> +	kmsg_dump_oops,
> +	kmsg_dump_panic,
> +};

Please capitalize constants - lower case suggests it's some sort of 
variable which it is not.

> +void dump_kmsg(enum kmsg_dump_reason reason);
> +
> +int register_kmsg_dumper(struct kmsg_dumper *dumper);
> +
> +void unregister_kmsg_dumper(struct kmsg_dumper *dumper);

Please rename these APIs to be more in line with how we name new kernel 
APIs. Something like:

  kmsg_dump()
  kmsg_dumper_register()
  kmsg_dumper_unregister()

(we start with the subsystem as a prefix, then we go from more generic 
to less generic words.)

Might even make sense to name them all kmsg_dump:

  kmsg_dump()
  kmsg_dump_register()
  kmsg_dump_unregister()

Thanks,

	Ingo
