Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J5NYL-0000B1-8E
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 15:43:24 +0000
Received: by py-out-1112.google.com with SMTP id a25so7677365pyi.11
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Dec 2007 07:43:15 -0800 (PST)
Date: Thu, 20 Dec 2007 09:43:04 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH][MTD-UTILS] Set mkfs.jffs2 page size runtime instead of
	fixed [respoin]
Message-ID: <20071220094304.336d8ccb@vader.jdub.homelinux.org>
In-Reply-To: <Pine.LNX.4.64.0712201241410.21948@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0712061232550.28640@lnxricardw.se.axis.com>
	<20071207070354.02e020b2@weaponx>
	<Pine.LNX.4.64.0712201241410.21948@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Dec 2007 12:46:38 +0100 (CET)
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> 
> On Fri, 7 Dec 2007, Josh Boyer wrote:
> 
> > On Thu, 6 Dec 2007 12:43:47 +0100 (CET)
> > Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> >
> >>
> >> This patch reads the default PAGE_SIZE from sysconf(), i.e. the system
> >> mkfs.jffs2 is running on, instead of just setting it to 4096 (which of
> >> course is valid for most systems but not all).
> >
> > This makes sense overall.  I'd like to do it a slightly different way 
> > though.
> 
> I think I see what you mean. I had inadvertently put the setting 
> of the page_size variable at the start of write_regular_file() instead of 
> at the start of main() where I wanted it. Fixed.
> 
> > Could we add an additional check here to see if page_size != 4096, and
> > print a loud warning with the page size that is actually being used and
> > suggest the --pagesize option if that isn't what is desired?
> >
> > It's not that we have tons of systems using a page size different than
> > 4KiB, but it's a change in behavior for those that do and I'd like to
> > at least warn users about it.  Otherwise the patch looks fine.
> 
> Ok, good point, something like this then:

Looks good.  Applied.

josh
