Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avSUP-0001nN-GU
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 16:39:02 +0000
Received: by mail-pa0-x231.google.com with SMTP id zm5so23575680pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 09:38:41 -0700 (PDT)
Date: Wed, 27 Apr 2016 10:38:32 -0600
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 4/8] mtd-utils: Add flash stress test Utility
Message-ID: <20160427163832.GB6425@localhost>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-5-git-send-email-richard@nod.at>
 <20160426101850.2ccde903@bbrezillon> <571F3354.4040909@nod.at>
 <20160426114750.1a9186dc@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426114750.1a9186dc@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2016 at 11:47:50AM +0200, Boris Brezillon wrote:
> On Tue, 26 Apr 2016 11:22:28 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
> > Am 26.04.2016 um 10:18 schrieb Boris Brezillon:
> > > Please use getopt_long(). I guess this applies to all your patches, so
> > > I'll stop mentioning it.
> > >   
> > 
> > I agree, other mtd-utils programs use getopt too. Let's stay consistent.
> > 
> > BTW: How do you feel about switching globally over to argp?
> > http://www.gnu.org/software/libc/manual/html_node/Argp.html
> > 
> > IMHO it is much less pain to use and offers nice features such as auto generating
> > --help.
> > Although it is a GNU feature there is also a standalone package available which can be used
> > when building for musl or uclibc.
> 
> I don't have any objection to it. Let's see how Brian feels about it.

I don't have strong opinions. My main question would have been about
build dependencies, but it sounds like it's not too onerous.

Brian
