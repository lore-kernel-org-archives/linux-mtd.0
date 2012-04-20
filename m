Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLBwT-0004OS-Ij
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 11:23:58 +0000
Date: Fri, 20 Apr 2012 13:22:52 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Grazvydas Ignotas <notasas@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: add support for hardware BCH ecc
Message-ID: <20120420112252.GA12151@parrot.com>
References: <1334915328-10673-1-git-send-email-ivan.djelic@parrot.com>
 <CANOLnOOjrZEbPByOD3EQTZ3vn2ZO0SMdyYo1oME_NLRyYciXUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANOLnOOjrZEbPByOD3EQTZ3vn2ZO0SMdyYo1oME_NLRyYciXUQ@mail.gmail.com>
Cc: Jan Weitzel <J.Weitzel@phytec.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 20, 2012 at 12:12:27PM +0100, Grazvydas Ignotas wrote:
> On Fri, Apr 20, 2012 at 12:48 PM, Ivan Djelic <ivan.djelic@parrot.com> wrote:
> > Hello,
> > This patch provides hardware NAND BCH ecc support for OMAP3 boards.
> > It depends on the following patches:
> >
> > new GPMC BCH api (linux-omap):
> > http://lists.infradead.org/pipermail/linux-mtd/2012-April/040757.html
> >
> > race condition fix in OMAP mtd driver:
> > http://lists.infradead.org/pipermail/linux-mtd/2012-April/040724.html
> 
> I don't have this one in my mailbox (looked up through the archives),
> so commenting about it here. What about just dropping omap_wait()
> instead? I think gpmc_nand_read(.. GPMC_NAND_DATA) is equivalent to
> ordinary data read, knowing that omap_wait() looks like a duplicate of
> generic nand_wait(), just without LED support.

Yes, I agree; I also comtemplated getting rid of omap_wait(), but I needed this
quick fix out of the way to submit my BCH patch. But you're right, and there
are plenty other things to improve in omap2.c (look at omap_compare_ecc() for
a good example).
BR,
--
Ivan
