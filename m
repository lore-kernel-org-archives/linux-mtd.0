Received: from smtp110.mail.mud.yahoo.com ([209.191.85.220])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjXeW-0003PK-IM
	for linux-mtd@lists.infradead.org; Sun, 21 Oct 2007 11:03:28 +0100
From: Nick Piggin <nickpiggin@yahoo.com.au>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: BUG at mm/filemap.c:1749 (2.6.24, jffs2, unionfs)
Date: Sun, 21 Oct 2007 19:57:11 +1000
References: <200710190605.l9J65kDe008069@agora.fsl.cs.sunysb.edu>
	<200710191716.53470.nickpiggin@yahoo.com.au>
	<1192956944.2672.6.camel@shinybook.infradead.org>
In-Reply-To: <1192956944.2672.6.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710211957.11928.nickpiggin@yahoo.com.au>
Cc: Erez Zadok <ezk@cs.sunysb.edu>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, jffs-dev@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 21 October 2007 18:55, David Woodhouse wrote:
> On Fri, 2007-10-19 at 17:16 +1000, Nick Piggin wrote:
> >         if (writtenlen) {
> > -               if (inode->i_size < (pg->index << PAGE_CACHE_SHIFT) +
> > start + writtenlen) { -                       inode->i_size = (pg->index
> > << PAGE_CACHE_SHIFT) + start + writtenlen; +               if
> > (inode->i_size < pos + start + writtenlen) {
> > +                       inode->i_size = pos + start + writtenlen;
>
> This part seems wrong. Shouldn't it just be pos + writtenlen -- which is
> basically what it was already: pos==(pg->index<<PAGE_CACHE_SHIFT)+start

Yeah you're right, thanks.
