Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eASW5-0004Ee-Eo
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 03:19:35 +0000
Received: by mail-qk0-x243.google.com with SMTP id l194so1736619qke.13
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 20:19:12 -0700 (PDT)
Date: Thu, 2 Nov 2017 23:19:10 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
cc: Richard Weinberger <richard@nod.at>,
 Chris Brandt <chris.brandt@renesas.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
In-Reply-To: <20171030095853.230d800f@bbrezillon>
Message-ID: <nycvar.YSQ.7.76.1711022315290.21665@knanqh.ubzr>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
 <20171027140651.4032744b@bbrezillon>
 <nycvar.YSQ.7.76.1710271120070.3238@knanqh.ubzr>
 <20171030095853.230d800f@bbrezillon>
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

On Mon, 30 Oct 2017, Boris Brezillon wrote:

> Hi Nicolas,
> 
> On Fri, 27 Oct 2017 11:27:46 -0400 (EDT)
> Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> 
> > On Fri, 27 Oct 2017, Boris Brezillon wrote:
> > 
> > > Hi Nicolas,
> > > 
> > > Some of your commits do not have commit messages (just a subject and
> > > that's all). I know you're an experimented kernel developer and you
> > > might find this superfluous, but we try to push all MTD contributors to
> > > write a commit message, even if it's just a one line description that
> > > basically repeats what the subject line says. Would you mind adding a
> > > short description to patch 2 and 3.
> > > 
> > > Other than that, the changes look good to me, so
> > > 
> > > Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
> > 
> > No problem.
> > 
> > I added a one-liner justification to those commits, and your ACK to the 
> > series.
> > 
> > This has been pushed here if you wish to pull it:
> > 
> >   http://git.linaro.org/people/nicolas.pitre/linux mtd_point
> > 
> > Or if you prefer that I repost the whole thing just say so and I'll 
> > oblige.
> 
> It's easier for us if you repost the whole series (we use patchwork to
> track MTD patches, and I like to have the version that hits mainline
> available on patchwork too).

V3 were posted earlier this week. With the looming merge window I just 
want to confirm everything is fine on your side.

Thanks.


Nicolas
