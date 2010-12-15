Received: from mail-gx0-f176.google.com ([209.85.161.176])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSfYJ-0006o9-C6
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 00:49:09 +0000
Received: by gxk4 with SMTP id 4so930593gxk.21
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 16:49:06 -0800 (PST)
From: Rob Landley <rob@landley.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
Date: Tue, 14 Dec 2010 18:49:02 -0600
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<20101214195124.GA6010@falooley.org>
	<1292356893.29257.1.camel@koala>
In-Reply-To: <1292356893.29257.1.camel@koala>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012141849.03926.rob@landley.net>
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	richard -rw- weinberger <richard.weinberger@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jeff Dike <jdike@addtoit.com>, Jason Lunz <lunz@acm.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 14 December 2010 14:01:33 Artem Bityutskiy wrote:
> > > Instead, you should solve this problem in UML code. I do not know how,
> > > but may be you can add readb/writeb there which actually do nothing or
> > > print a scary warning, or do BUG(), and let things which use them just
> > > fail run-time.
> >
> > Something like this could work, but it would be error-prone for anyone
> > else who attempts using iomem-requiring drivers on uml. Instead of
> > getting obvious compile failures we'd have broken drivers that BUG() or
> > emit scary warnings. That doesn't seem to me like an improvement.
>
> This problem does not seem to be mtd-specific, right? So my point was
> that it would be nicer to come up with a general solution.

The problem is that jffs2 is a filesystem, and thus something people would 
really like to be able to loopback mount, but it's hardwired to assume it's 
only ever stored on a certain type of hardware, and thus requies incestuous 
knowledge of the erase granularity of the flash layer in order to function.

It would be really nice to have either the loopback driver or jffs2 be able to 
fake the mtd thing with some kind of "granularity=262144" option to let it 
know "you're not on flash right now, but the flash you'll eventually be on is 
X".  This might require padding the image at the beginning and being mounted 
with an offset if the filesystem doesn't start at the beginning of an erase 
block when copied to the final hardware, but losetup already supports offsets.

What any of this has to do with UML is an open question.  I don't want to 
require UML to loopback mount a jffs2 image, I want to be able to do it from my 
host.  From my perspective, you're solving the wrong problem.

Rob
-- 
GPLv3: as worthy a successor as The Phantom Menace, as timely as Duke Nukem 
Forever, and as welcome as New Coke.
