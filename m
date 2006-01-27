Received: from zproxy.gmail.com ([64.233.162.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2bwd-0007d9-Op
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 17:19:55 -0500
Received: by zproxy.gmail.com with SMTP id i11so763526nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jan 2006 14:19:50 -0800 (PST)
Message-ID: <625fc13d0601271419o7914b1ddu8a579e87deba9fb5@mail.gmail.com>
Date: Fri, 27 Jan 2006 16:19:50 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0601271540450.16649@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
	<43DA3CDF.5050202@intel.com>
	<6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
	<625fc13d0601271151i796ab647v629495dc80cbc940@mail.gmail.com>
	<Pine.LNX.4.64.0601271540450.16649@localhost.localdomain>
Cc: "Alexey, Korolev" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH] map drivers. DCACHE option for physmap and mphysmap
	drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/27/06, Nicolas Pitre <nico@cam.org> wrote:
> On Fri, 27 Jan 2006, Josh Boyer wrote:
>
> > On 1/27/06, Jared Hulbert <jaredeh@gmail.com> wrote:
> > > When I first did a patch like this I used a very platform dependent
> > > embedded assembly loop to _invalidate_ NOT _flush_ the specific
> > > cachelines possibly affected by the flash program or erase.
> >
> > Yep, that would be better.
>
> No it wouldn't.  It would quickly become crufty and unreadable as more
> architectures add their stuff.

/me sighs.

Yes, I misread what Jared had said.  I was solely focusing on
"_invalidate_ NOT _flush_" and missed the embedded assembly loop part.

I think you're probably right in that there is no clean way to do this
in a non-platform specific driver.  At least not a way that would be
worthwhile.

josh
