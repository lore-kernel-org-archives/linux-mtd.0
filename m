Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mb2H-0001SM-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:21:37 +0100
Date: Wed, 4 Sep 2002 15:21:36 +0100 (BST)
From: Jasmine Strong <jasmine@hex.linuxgrrls.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: John Hall <John.Hall@optionexist.co.uk>,
	"Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
In-Reply-To: <21868.1031129479@redhat.com>
Message-ID: <Pine.LNX.4.33.0209041519170.22265-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Wed, 4 Sep 2002, David Woodhouse wrote:

>
> jasmine@hex.linuxgrrls.org said:
> >  WARNING! WARNING!  there are architectures that will break if you do
> > this.
>
> Architectures on which Linux runs?

Yes.  uCLinux, anyway.   Pointers should always be treated as opaque
unless you have a *really* good reason not to.

(Architectures that don't always use word-aligned pointers include m68k
and ARM Thumb.)

Jas.
