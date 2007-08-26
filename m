Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IP647-0003QS-2Z
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 01:33:22 +0100
Date: Sat, 25 Aug 2007 20:23:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Jesper Juhl <jesper.juhl@gmail.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <9a8748490708251728h51d51092r11a3562ceb63b2f9@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0708252021070.8721@localhost.localdomain>
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
	<200708241141.06358.vda.linux@googlemail.com>
	<Pine.LNX.4.64.0708240642500.18301@localhost.localdomain>
	<9a8748490708251527n26cc2065n5b8716bd7f65e252@mail.gmail.com>
	<Pine.LNX.4.64.0708251956380.29507@localhost.localdomain>
	<9a8748490708251728h51d51092r11a3562ceb63b2f9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 26 Aug 2007, Jesper Juhl wrote:

> On 26/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:

> > i was thinking more along the lines of
> >
> > msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition), GFP_KERNEL);
> >
> > which was kind of the obvious implication, no?
>
> I guess
>
> > unless there's a reason kcalloc() wouldn't work here, this is
> > pretty much what kcalloc() was designed for.
> >
> When Denys brought up the zeroing thing and mentioned kzalloc() I
> did consider kcalloc() instead, but kzalloc() makes this allocation
> nicely look like the preceding ones visually and I couldn't convince
> myself that kcalloc() would give us any real benefit here.
>
> What exactely would using kcalloc() over kzalloc() here buy us?

technically, nothing.  but if you're not going to use kcalloc() when
you're explicitly allocating an array of identical objects (that you
want zero-filled, as a bonus), then what's the point of ever having
defined a kcalloc() routine in the first place?

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
