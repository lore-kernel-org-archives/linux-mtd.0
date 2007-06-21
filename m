Received: from wr-out-0506.google.com ([64.233.184.232])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1GWU-0006lQ-Os
	for linux-mtd@lists.infradead.org; Thu, 21 Jun 2007 02:52:09 -0400
Received: by wr-out-0506.google.com with SMTP id 58so141388wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jun 2007 23:52:05 -0700 (PDT)
Message-ID: <a781481a0706202352u1efed48fo5a101f8c015638d7@mail.gmail.com>
Date: Thu, 21 Jun 2007 12:22:01 +0530
From: "Satyam Sharma" <satyam.sharma@gmail.com>
To: "Tom Spink" <tspink@gmail.com>
Subject: build failure due to ROOT_DEV in mtd module (was Re:
	linux-2.6.22-rc5-g7c8545e build #298 failed ...)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: =?ISO-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>,
	Paolo Giarrusso <blaisorblade@yahoo.it>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

[Added Christoph, Paolo, David and linux-mtd.]

On 6/21/07, Tom Spink <tspink@gmail.com> wrote:
> On 20/06/07, Tom Spink <tspink@gmail.com> wrote:
> > On 20/06/07, Toralf F=F6rster <toralf.foerster@gmx.de> wrote:
> > > Hello,
> > >
> > > the build with the attached .config failed, make ends with:
> > [...]
> > The build seems to fail because of:
> > ERROR: "ROOT_DEV" [drivers/mtd/maps/nettel.ko] undefined!
> >
> > After taking a quick look at the code, I can't immediately see why
> > this would be, since there is an include for linux/root_dev.h at the
> > top, there.
> >
> > There's only one occurrence of ROOT_DEV (line 425), and after a quick
> > look at the git history, it seems the include was originally missing,
> > but was put back in, in commit
> > 6cc449c7d0292cb9b993f0df84fd3225e3099492.
> [...]
> After further inspection, I *think* it's because nettel is being built
> as a module, and it's trying to reference ROOT_DEV, which is not
> exported.

You're right. Look at:
commit a2d2b5cb8e5d8787f009eeb3bbca52687bd42a77
[ http://lkml.org/lkml/2005/7/13/166 ]

You could export ROOT_DEV to modules back again, or perhaps:
http://www.infradead.org/pipermail/linux-mtd/2005-March/012290.html
to get around the build error.

[ It might've been unexported for good reasons, of course, see:
http://lkml.org/lkml/2005/3/30/179 ]

Satyam
