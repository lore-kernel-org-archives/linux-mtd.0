Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Owi-0005gF-Tu
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 21:53:47 +0000
Received: by mail-qt0-x231.google.com with SMTP id k31so9692807qta.6
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 14:53:24 -0700 (PDT)
Date: Wed, 11 Oct 2017 17:53:22 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/5] MTD: mtdram: properly handle the phys argument in
 the point method
In-Reply-To: <CAFLxGvzM8rW4T484Z3YEG6H8=PmdwrS_Xj+ZbxC+OQ707++2mw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1710111748330.6870@knanqh.ubzr>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-2-nicolas.pitre@linaro.org>
 <CAFLxGvynd+dtgPUbXAm7PZVw85=RoR+LfJEghAZLVmfAOVNjQA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710111729390.6870@knanqh.ubzr>
 <CAFLxGvzM8rW4T484Z3YEG6H8=PmdwrS_Xj+ZbxC+OQ707++2mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 Oct 2017, Richard Weinberger wrote:

> On Wed, Oct 11, 2017 at 11:32 PM, Nicolas Pitre
> <nicolas.pitre@linaro.org> wrote:
> > In fact the above should be: *retlen = addr - *virt;
> 
> Hmm, yes.
> 
> While we are here, how did you test that code?

I didn't actually manage to trigger it as physical pages were always 
contiguous in my testing. So this is from inspection i.e. I just re-read 
the code from your reply.

> > Let me know if I should repost.
> 
> Yes, please. But wait a few days, hopefully we get more reviews.

Sure.


Nicolas
