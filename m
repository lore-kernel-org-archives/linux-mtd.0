Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8HPM-0005HS-CK
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 16:18:18 +0000
Received: by yw-out-1718.google.com with SMTP id 5so3797636ywm.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2008 09:18:06 -0700 (PDT)
Date: Mon, 16 Jun 2008 12:12:42 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] respect CFLAGS/CPPFLAGS from build environment
Message-ID: <20080616121242.6e4bf43a@vader.jdub.homelinux.org>
In-Reply-To: <200806131711.21891.vapier@gentoo.org>
References: <1213220948-30156-1-git-send-email-vapier@gentoo.org>
	<20080613105153.31449aa5@vader.jdub.homelinux.org>
	<200806131711.21891.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 13 Jun 2008 17:11:21 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> On Friday 13 June 2008, Josh Boyer wrote:
> > On Wed, 11 Jun 2008 17:49:08 -0400
> >
> > Mike Frysinger <vapier@gentoo.org> wrote:
> > > diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
> > > index 0394eee..062cc32 100644
> > > --- a/ubi-utils/Makefile
> > > +++ b/ubi-utils/Makefile
> > > @@ -2,7 +2,6 @@
> > >  # Makefile for ubi-utils
> > >  #
> > >
> > > -OPTFLAGS := -O2 -g -Wall
> > >  KERNELHDR := ../include
> > >  DESTDIR := /usr/local
> > >  SBINDIR=/usr/sbin
> > > @@ -10,8 +9,10 @@ MANDIR=/usr/share/man
> > >  INCLUDEDIR=/usr/include
> > >
> > >  CC := $(CROSS)gcc
> > > -CFLAGS := -I./inc -I./src -I$(KERNELHDR) $(OPTFLAGS) -Werror \
> > > -	-Wwrite-strings -W -std=gnu99 -DPACKAGE_VERSION=\"1.0\"
> > > +CFLAGS ?= -O2 -g -Werror
> > > +CFLAGS += -Wall -Wwrite-strings -W
> > > +CPPFLAGS += -I./inc -I./src -I$(KERNELHDR) \
> > > +	-std=gnu99 -DPACKAGE_VERSION=\"1.0\"
> > >
> > >  PERLPROGS = mkpfi ubicrc32.pl
> > >
> > > @@ -26,7 +27,7 @@ vpath   %.c ./src
> > >  	$(CC) $(LDFLAGS) -g -o $@ $^
> > >
> > >  %.o: %.c
> > > -	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
> > > +	$(CC) $(CPPFLAGS) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$(shell basename
> > > $<).dep
> >
> > Should either remove the unconditional -g here, or not specify it in
> > the default CFLAGS above, correct?
> 
> moving -g in both Makefiles to the default CFLAGS makes the most sense to 
> me ... i just figured someone liked it the way it was and i didnt really care 
> to fight em for it.

Yeah, default CFLAGS makes sense.  I'll fix that up and get this
committed shortly.  Thanks.

josh
