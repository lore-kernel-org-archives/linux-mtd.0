Received: from wa-out-1112.google.com ([209.85.146.181])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IH5eF-0003FK-DG
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 18:29:33 -0400
Received: by wa-out-1112.google.com with SMTP id v33so963322wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 15:29:29 -0700 (PDT)
Message-ID: <6934efce0708031529g5a1d8band59a72075b0509bb@mail.gmail.com>
Date: Fri, 3 Aug 2007 15:29:27 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070803124745.GD19344@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801115535.GA2747@lazybastard.org>
	<6934efce0708022342uf468acfjed3def4c119f2d8a@mail.gmail.com>
	<20070803124745.GD19344@lazybastard.org>
Cc: dhowells <dhowells@redhat.com>, Carsten Otte <cotte@de.ibm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/3/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Thu, 2 August 2007 23:42:06 -0700, Jared Hulbert wrote:
> >
> > > point() doesn't have to be replaced.  My completely untested and
> > > uncompiled patch below adds another parameter to point() to return th=
e
> > > physical address in.  Parameter is optional and only cfi_cmdset_0001.=
c
> > > currently allows it.
> >
> > Hey I just thought of a different approach.  What about something like:
> >
> > int mtd_insert_mem(struct mtd_info *mtd, struct vm_area_struct *vma,
> > unsigned long addr, unsigned long offset)
> > {
> >      struct map_info *map =3D mtd->priv;
> >      unsigned long pfn;
> >
> >      pfn =3D (map->phys + offset) >> PAGE_SHIFT;
> >      return vm_insert_pfn(vma, addr, pfn);
> > }
> >
> > This way we don't need to export the physical address and we keep the
> > vm calls in the driver world.
>
> Hard to tell without looking at the AXFS code as well.  And it might
> trigger some janitor to remove this "completely unused function" shortly
> after introducing it.

Of course. I don't mind tracking it out of tree for a few weeks as
long after we agree on the solution here.

> How impolite would it be to ask for AXFS again? :)

I missed the cue the first time around, sorry.  Just keep asking until
it gets through my thick head....

I'll put a clean drop together on http://axfs.sf.net
