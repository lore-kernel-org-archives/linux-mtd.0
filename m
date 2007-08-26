Received: from fk-out-0910.google.com ([209.85.128.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IPJ6v-0008PL-UV
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 10:29:09 -0400
Received: by fk-out-0910.google.com with SMTP id 19so2047096fkr
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Aug 2007 07:29:04 -0700 (PDT)
From: Denys Vlasenko <vda.linux@googlemail.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
Date: Sun, 26 Aug 2007 15:28:56 +0100
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<9a8748490708251728h51d51092r11a3562ceb63b2f9@mail.gmail.com>
	<Pine.LNX.4.64.0708252021070.8721@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708252021070.8721@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708261528.56250.vda.linux@googlemail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Jesper Juhl <jesper.juhl@gmail.com>,
	linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 26 August 2007 01:23, Robert P. J. Day wrote:
> On Sun, 26 Aug 2007, Jesper Juhl wrote:
> > On 26/08/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
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
> >
> > When Denys brought up the zeroing thing and mentioned kzalloc() I
> > did consider kcalloc() instead, but kzalloc() makes this allocation
> > nicely look like the preceding ones visually and I couldn't convince
> > myself that kcalloc() would give us any real benefit here.
> >
> > What exactely would using kcalloc() over kzalloc() here buy us?
>
> technically, nothing.

The idea of calloc is that it can check for underflow in parameter.

calloc(-1, 10000000) => easy to detect
malloc(-1 * 10000000) => malloc(-10000000) => not so trivial
--
vda
