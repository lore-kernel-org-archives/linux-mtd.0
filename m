Received: from wx-out-0506.google.com ([66.249.82.231])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP67F-00046s-1d
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 20:36:36 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1103608wxc
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 17:36:32 -0700 (PDT)
Message-ID: <9a8748490708251736k5b751998yee72abdc8c4c1b53@mail.gmail.com>
Date: Sun, 26 Aug 2007 02:36:32 +0200
From: "Jesper Juhl" <jesper.juhl@gmail.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <Pine.LNX.4.64.0708252021070.8721@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
	<200708241141.06358.vda.linux@googlemail.com>
	<Pine.LNX.4.64.0708240642500.18301@localhost.localdomain>
	<9a8748490708251527n26cc2065n5b8716bd7f65e252@mail.gmail.com>
	<Pine.LNX.4.64.0708251956380.29507@localhost.localdomain>
	<9a8748490708251728h51d51092r11a3562ceb63b2f9@mail.gmail.com>
	<Pine.LNX.4.64.0708252021070.8721@localhost.localdomain>
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

On 26/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Sun, 26 Aug 2007, Jesper Juhl wrote:
>
> > On 26/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
> > > i was thinking more along the lines of
> > >
> > > msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition), GFP_KERNEL);
> > >
> > > which was kind of the obvious implication, no?
> >
> > I guess
> >
> > > unless there's a reason kcalloc() wouldn't work here, this is
> > > pretty much what kcalloc() was designed for.
> > >
> > When Denys brought up the zeroing thing and mentioned kzalloc() I
> > did consider kcalloc() instead, but kzalloc() makes this allocation
> > nicely look like the preceding ones visually and I couldn't convince
> > myself that kcalloc() would give us any real benefit here.
> >
> > What exactely would using kcalloc() over kzalloc() here buy us?
>
> technically, nothing.  but if you're not going to use kcalloc() when
> you're explicitly allocating an array of identical objects (that you
> want zero-filled, as a bonus), then what's the point of ever having
> defined a kcalloc() routine in the first place?
>
I wonder a bit about that myself...

I have found some other issues in that function that I want to fix, so
I'll be respinning the patch as a patch series instead - and why not;
I'll just go with kcalloc() and see what the maintainers have to say,
it's not like I personally care much one way or the other.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
