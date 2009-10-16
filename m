Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MykxX-00069W-4l
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 11:27:03 +0000
Message-ID: <4AD85842.9090800@nokia.com>
Date: Fri, 16 Oct 2009 14:25:54 +0300
From: Aaro Koskinen <aaro.koskinen@nokia.com>
MIME-Version: 1.0
To: ext Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH v10 4/5] core: Add kernel message dumper to call on oopses
	and panics
References: <20091015094057.7298e0d7@marrow.netinsight.se>	<20091015094805.754461fa@marrow.netinsight.se>	<20091015093133.GF10546@elte.hu>	<20091015161052.0752208e@marrow.netinsight.se>	<20091015154640.GA11408@elte.hu>	<20091016094601.4e2c2d3e@marrow.netinsight.se>	<20091016080935.GA3895@elte.hu>	<1255681467.32489.360.camel@localhost>
	<20091016112556.6902b2dc@marrow.netinsight.se>
In-Reply-To: <20091016112556.6902b2dc@marrow.netinsight.se>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
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

Hello,

Simon Kagstrom wrote:
> +#ifndef _LINUX_KMSG_DUMP_H
> +#define _LINUX_KMSG_DUMP_H
> +
> +#include <linux/list.h>
> +
> +enum kmsg_dump_reason {
> +	KMSG_DUMP_OOPS,
> +	KMSG_DUMP_PANIC,
> +};
> +
> +/**
> + * struct kmsg_dumper - kernel crash message dumper structure
> + * @dump:	The callback which gets called on crashes. The buffer is passed
> + * 		as two sections, where s1 (length l1) contains the older
> + * 		messages and s2 (length l2) contains the newer.
> + * @list:	Entry in the dumper list (private)
> + * @registered:	Flag that specifies if this is already registered
> + */
> +struct kmsg_dumper {
> +	void (*dump)(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason,
> +			const char *s1, unsigned long l1,
> +			const char *s2, unsigned long l2);
> +	struct list_head list;
> +	int registered;
> +};
> +
> +void kmsg_dump(enum kmsg_dump_reason reason);
> +
> +int kmsg_dump_register(struct kmsg_dumper *dumper);
> +
> +int kmsg_dump_unregister(struct kmsg_dumper *dumper);
> +
> +#endif /* _LINUX_DUMP_DEVICE_H */

If you still make a new version of the patch, please correct the
"_LINUX_DUMP_DEVICE_H" comment.

A.
