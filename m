Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMflv-0003q9-IK
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 09:41:22 +0000
Subject: Re: about the _dtype_ parameter
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuanxv@gmail.com>
In-Reply-To: <70B175DB52584932819754004995AB59@PC200810230421>
References: <ff5b6bcd0901050659k4679c64egffcfa054da4c9034@mail.gmail.com>
	<1231168447.6608.26.camel@localhost.localdomain>
	<70B175DB52584932819754004995AB59@PC200810230421>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2009 11:41:35 +0200
Message-Id: <1231839695.5973.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-01-12 at 17:26 +0800, xiaochuan-xu wrote:
> Hi Artem,
> 
> >> I write a temporary file in the ubifs with O_TRUNC flag over and over.
> >> I see that all the @dtype variables are equal to 2 not 3.
> >> why does this happen?
> 
> > Patch:
> > 
> > diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> > index 10ae25b..6a885c5 100644
> > --- a/fs/ubifs/journal.c
> > +++ b/fs/ubifs/journal.c
> > @@ -208,7 +208,7 @@ again:
> >  offs = 0;
> > 
> > out:
> > - err = ubifs_wbuf_seek_nolock(wbuf, lnum, offs, UBI_SHORTTERM);
> > + err = ubifs_wbuf_seek_nolock(wbuf, lnum, offs, wbuf->dtype);
> >  if (err)
> >  goto out_unlock;
> > 
> 
> I'v applied this patch, but the @dtype variables are still equal to UBI_SHORTTERM (2)! :-(
> Are there some more bugs?

Tried the latest ubifs-2.6 tree and @dtype is always UBI_UNKNOWN (3).
This is also strange though, I'll look at this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
