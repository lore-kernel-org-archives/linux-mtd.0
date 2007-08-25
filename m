Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IP5hT-0003HY-Pu
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 01:09:59 +0100
Date: Sat, 25 Aug 2007 19:59:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Jesper Juhl <jesper.juhl@gmail.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <9a8748490708251527n26cc2065n5b8716bd7f65e252@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0708251956380.29507@localhost.localdomain>
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
	<200708241141.06358.vda.linux@googlemail.com>
	<Pine.LNX.4.64.0708240642500.18301@localhost.localdomain>
	<9a8748490708251527n26cc2065n5b8716bd7f65e252@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Denys Vlasenko <vda.linux@googlemail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
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

> On 24/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:

> > actually, i would think kcalloc would be more appropriate here, no?
> >
>
> Why?
>
> msp_parts[i] = kzalloc(pcnt * sizeof(struct mtd_partition), GFP_KERNEL);
>
> seems better to me than
>
> msp_parts[i] = kcalloc(1, pcnt * sizeof(struct mtd_partition), GFP_KERNEL);

i was thinking more along the lines of

msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition), GFP_KERNEL);

which was kind of the obvious implication, no?  unless there's a
reason kcalloc() wouldn't work here, this is pretty much what
kcalloc() was designed for.

rday

-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
