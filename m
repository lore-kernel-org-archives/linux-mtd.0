Received: from nwcst284.netaddress.usa.net ([204.68.23.29])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Ne4u-000524-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 18:28:40 +0100
Message-ID: <20010720173422.18538.qmail@nwcst284.netaddress.usa.net>
Date: 20 Jul 2001 10:34:22 PDT
From: Eric <ebrower@usa.net>
To: David Woodhouse <dwmw2@infradead.org>, Tim Hockin <thockin@sun.com>
Subject: Re: [Re: [structure field names] ]
CC: MTD List <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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

David Woodhouse <dwmw2@infradead.org> wrote:
> =

> > ebrower@usa.net said:
> > > There is a patch for SPARC/Linux in the patches directory
> > > that performs 32- to 64-bit ioctl conversions.  If you
> > > touch any struct member names that are used as ioctl args
> > > this patch will need to be rev'ed as well.
> =

> I thought we'd changed the types so that conversions weren't necessary?=


We changed the types so that (amongst other reasons) the ioctl
conversions were easier-- without explicitly-sized types the
conversion routines would need to redefine all structs used as
ioctl arguments to be explicitly sized, and then it would have =

to copy each struct element individually to and from userspace.

Though we are now using proper types, we still need to inform the
sparc64 kernel that the MTD ioctls are understood and require no
explicit conversions.  In the case of the MEMREADOOB and MEMWRITEOOB
ioctls, we still must do conversions so that the u8* is understood
by the kernel to be a 32-bit userspace pointer and not a 64-bit
kernelspace pointer.  This involves a bit of handwaving that will
require a conversion routine.  Strictly speaking, the sparc64 =

platform does not use NAND flash so these OOB ioctls are not =

necessary (so I did not include them in the initial patch), but
DaveM would like the conversions there for completeness so I have
submitted that patch to him; if accepted, I'll submit it to the
MTD CVS for safekeeping.

To make a long story short (too late!), when running the sparc64
kernel with a 32-bit userland, ALL ioctls must have an entry in =

the ioctl32 conversion table, and some will require custom =

conversion routines.

I only brought this up because if the structure member names are
modified, they must be modified in the sparc64 patch as well.  This
is, unfortunately, a required headache.

E
