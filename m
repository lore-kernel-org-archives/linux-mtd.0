Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbTJ-0001Ws-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:49:33 +0100
Date: Wed, 4 Sep 2002 15:49:32 +0100 (BST)
From: Jasmine Strong <jasmine@hex.linuxgrrls.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: John Hall <John.Hall@optionexist.co.uk>,
	"Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
In-Reply-To: <547.1031150220@redhat.com>
Message-ID: <Pine.LNX.4.33.0209041546020.22265-100000@hex.linuxgrrls.org>
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

> At a gratuitous extra 4 bytes per object, that's... ok, well it's only
> wasting 32KiB which is less than I expected, but it still annoys me.

Is there nowhere that's not a pointer that you can stuff it?

> > (Architectures that don't always use word-aligned pointers include
> > m68k and ARM Thumb.)
>
> Even when we're allocating from the slab and the object in question is a
> structure of size which is an even number?

If you can ensure that the region you are allocating from is word-aligned,
that the structures within it are always word aligned, and the code will
never run on architectures with weird addressing schemes, fine.

> Even so, I'd assume that we care even _more_ about that 32KiB on uCLinux, so

Yes, I'd agree, but...

> maybe it's worth adding 1 byte of padding to the structure there and
> manually aligning the pointer after allocating, or something. We only need
> 1 bit, after all. Or we could use the _top_ bit on uCLinux, perhaps?

Depends on the architecture, again.  Problem is that treating pointers as
non-opaque objects will necessarily limit portability.

Jas.
