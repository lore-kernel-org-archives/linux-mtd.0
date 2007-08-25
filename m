Received: from wx-out-0506.google.com ([66.249.82.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP45x-0002Q3-Go
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 18:27:08 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1084681wxc
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 15:27:04 -0700 (PDT)
Message-ID: <9a8748490708251527n26cc2065n5b8716bd7f65e252@mail.gmail.com>
Date: Sun, 26 Aug 2007 00:27:04 +0200
From: "Jesper Juhl" <jesper.juhl@gmail.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <Pine.LNX.4.64.0708240642500.18301@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
	<200708241141.06358.vda.linux@googlemail.com>
	<Pine.LNX.4.64.0708240642500.18301@localhost.localdomain>
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Fri, 24 Aug 2007, Denys Vlasenko wrote:
>
> > On Friday 24 August 2007 00:52, Jesper Juhl wrote:
> > > kmalloc() returns a void pointer.
> > > No need to cast it.
> >
> > > -   msp_flash = (struct mtd_info **)kmalloc(
> > > -                   fcnt * sizeof(struct map_info *), GFP_KERNEL);
> > > -   msp_parts = (struct mtd_partition **)kmalloc(
> > > -                   fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> > > -   msp_maps = (struct map_info *)kmalloc(
> > > -                   fcnt * sizeof(struct mtd_info), GFP_KERNEL);
> > > +   msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
> > > +   msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> > > +   msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
> > >     memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));
> >
> > This one wants kzalloc.
> >
> > > -           msp_parts[i] = (struct mtd_partition *)kmalloc(
> > > -                   pcnt * sizeof(struct mtd_partition), GFP_KERNEL);
> > > +           msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
> > > +                   GFP_KERNEL);
> > >             memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
> > >
> > >             /* now initialize the devices proper */
> >
> > Same
>
> actually, i would think kcalloc would be more appropriate here, no?
>

Why?

msp_parts[i] = kzalloc(pcnt * sizeof(struct mtd_partition), GFP_KERNEL);

seems better to me than

msp_parts[i] = kcalloc(1, pcnt * sizeof(struct mtd_partition), GFP_KERNEL);


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
