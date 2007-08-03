Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGwd2-0004FB-1I
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 08:51:41 -0400
Date: Fri, 3 Aug 2007 14:47:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070803124745.GD19344@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801115535.GA2747@lazybastard.org>
	<6934efce0708022342uf468acfjed3def4c119f2d8a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0708022342uf468acfjed3def4c119f2d8a@mail.gmail.com>
Cc: dhowells <dhowells@redhat.com>, Carsten Otte <cotte@de.ibm.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
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

On Thu, 2 August 2007 23:42:06 -0700, Jared Hulbert wrote:
> 
> > point() doesn't have to be replaced.  My completely untested and
> > uncompiled patch below adds another parameter to point() to return the
> > physical address in.  Parameter is optional and only cfi_cmdset_0001.c
> > currently allows it.
> 
> Hey I just thought of a different approach.  What about something like:
> 
> int mtd_insert_mem(struct mtd_info *mtd, struct vm_area_struct *vma,
> unsigned long addr, unsigned long offset)
> {
>      struct map_info *map = mtd->priv;
>      unsigned long pfn;
> 
>      pfn = (map->phys + offset) >> PAGE_SHIFT;
>      return vm_insert_pfn(vma, addr, pfn);
> }
> 
> This way we don't need to export the physical address and we keep the
> vm calls in the driver world.

Hard to tell without looking at the AXFS code as well.  And it might
trigger some janitor to remove this "completely unused function" shortly
after introducing it.

How impolite would it be to ask for AXFS again? :)

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
