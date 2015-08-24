Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTuxu-0002mp-6s
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 16:51:23 +0000
Received: by pacti10 with SMTP id ti10so27869428pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2015 09:51:01 -0700 (PDT)
Date: Mon, 24 Aug 2015 09:50:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi: do not re-read the data already read out in retry
Message-ID: <20150824165058.GF81844@google.com>
References: <1440143981-20826-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55D6ECC4.5070503@nod.at> <55DA6DC8.9010308@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55DA6DC8.9010308@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2015 at 09:05:12AM +0800, Dongsheng Yang wrote:
> On 08/21/2015 05:17 PM, Richard Weinberger wrote:
> >Brian, does MTD core guarantee that upon an erroneous mtd_read() the number of "read" bytes
> >in "buf" are valid?

I'll take a look. I believe the Dongsheng is interpreting the mtd_read()
API correctly, but most MTD "guarantees" are more like surveys of
existing practice; most implementations may do something sane, but there
may be a few oddballs.

> >So, my fear is that this change will introduce new regressions (due faulty MTD drivers, etc..)
> >without a real gain.
> 
> I would say "big gain" rather than "real gain".

I'd like evidence, rather than just bold statements :)

> Consider this case, if
> you are going to read 4M from driver but it failed at the last byte
> twice. When we success on the third retry, we have read out 4*3=12M for
> 4M data user requested. That tripled the latency.

On what driver do you see this? Many drivers take an all-or-nothing
approach already; they don't fill in 'retlen' to any non-zero value
until the last byte, so Richard is right in those cases.

(I can partly answer this question; nand_do_read_ops() incrementally
fills pages, and *retlen increases when a (portion of) a page is read
correctly.)

Also, what sort of failure modes are you seeing? It seems a bit dubious
to be relying on UBI I/O retry, let alone optimizing for performance,
since the retry may be masking significant problems anyway.

> But with this patch applied. we do not re-try the data we have already
> read out. So the latency is 1/3 of it mentioned above.
> 
> But, yes, I said understandable, I also want Brian to say is this
> change safe enough currently.

Brian
