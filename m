Received: from wx-out-0506.google.com ([66.249.82.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IPI1n-0007cE-Sg
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 09:19:46 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1191680wxc
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Aug 2007 06:19:43 -0700 (PDT)
Message-ID: <9a8748490708260619x24d42a7w7618b3c7ce625fa@mail.gmail.com>
Date: Sun, 26 Aug 2007 15:19:42 +0200
From: "Jesper Juhl" <jesper.juhl@gmail.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH 1/4] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <Pine.LNX.4.64.0708260434160.6485@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200708260352.33343.jesper.juhl@gmail.com>
	<200708260354.27928.jesper.juhl@gmail.com>
	<Pine.LNX.4.64.0708260434160.6485@localhost.localdomain>
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	MTD mailing list <linux-mtd@lists.infradead.org>,
	Marc St-Jean <stjeanma@pmc-sierra.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Sun, 26 Aug 2007, Jesper Juhl wrote:
>
> > +     msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
> >       memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));
>
> ...
>
> > +             msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
> > +                     GFP_KERNEL);
> >               memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
>
> again, both of the above could be done with a single call to kcalloc()
> in each case.  why are you so philosophically opposed to doing it that
> way?
>
Check the second patch in the series, please.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
