Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dDckD-0000ya-Bv
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 20:18:59 +0000
Date: Thu, 25 May 2017 05:18:27 +0900
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Kees Cook <keescook@google.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Linux mtd <linux-mtd@lists.infradead.org>,
 Emese Revfy <re.emese@gmail.com>, "kernel-hardening@lists.openwall.com"
 <kernel-hardening@lists.openwall.com>
Subject: Re: [PATCH 23/31] gcc-plugins.txt: standardize document format
Message-ID: <20170525051827.0ed2b88e@vela.lan>
In-Reply-To: <CAGXu5jKyZEV+mvJUipfX5GMFqv=HYLoU-9C_1pYrc24J-0YaWg@mail.gmail.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
 <c6318a78ef026da30aa488bd90a5a19e18fc13a3.1495156488.git.mchehab@s-opensource.com>
 <CAGXu5jKyZEV+mvJUipfX5GMFqv=HYLoU-9C_1pYrc24J-0YaWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Wed, 24 May 2017 10:35:42 -0700
Kees Cook <keescook@google.com> escreveu:

> On Thu, May 18, 2017 at 6:22 PM, Mauro Carvalho Chehab
> <mchehab@s-opensource.com> wrote:
> > Each text file under Documentation follows a different
> > format. Some doesn't even have titles!
> >
> > Change its representation to follow the adopted standard,
> > using ReST markups for it to be parseable by Sphinx:
> >
> > - promote main title;
> > - use the right markup for footnotes;
> > - use bold markup for files name;
> > - identify literal blocks;
> > - add blank lines to avoid Sphinx to complain;
> > - remove numeration from titles.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>  
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> This should probably get moved under "Kernel API documentation" but
> may need a new sub-category, maybe "instrumentation"? Things like
> KASan could be put under that too.

Yeah, I guess that most documents under Documentation/
will need to be renamed and placed into an existing or new book.

Kasan documentation is currently under dev-tools, with is, currently,
an unsorted book with:

   coccinelle
   sparse
   kcov
   gcov
   kasan
   ubsan
   kmemleak
   kmemcheck
   gdb-kernel-debugging
   kgdb

I agree with you: it probably makes sense to split external development
tools, like coccinelle/sparse from Kernel instrumentation, like kgdb,
kasan, gcc-plugins, etc.

So, perhaps we can change the content of Documentation/dev-tools/index.rst
to something like.


================================
Development tools for the kernel
================================

This document describe tools and instrumentation features of the Linux Kernel
used by developers to do quality assurance (QA).

This section describes Kernel internal features designed to provide mechanisms
for developers to test their code.

.. toctree::
   :maxdepth: 2

   (add here books like kasan, printk related docs, gcc-plugins, etc)

This section describes external tools used to ensure Kernel quality
assurance (QA).

.. toctree::
   :maxdepth: 2

   (add here books related external tools and robots, like coccinelle,
    sparse, kernel build robot, ktest, Coverity, etc)

.. only::  subproject and html

   Indices
   =======

   * :ref:`genindex`



Cheers,
Mauro
