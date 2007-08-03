Received: from wa-out-1112.google.com ([209.85.146.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGqrP-0005Oe-SX
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 02:42:11 -0400
Received: by wa-out-1112.google.com with SMTP id v33so751808wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Aug 2007 23:42:06 -0700 (PDT)
Message-ID: <6934efce0708022342uf468acfjed3def4c119f2d8a@mail.gmail.com>
Date: Thu, 2 Aug 2007 23:42:06 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070801115535.GA2747@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801115535.GA2747@lazybastard.org>
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

> point() doesn't have to be replaced.  My completely untested and
> uncompiled patch below adds another parameter to point() to return the
> physical address in.  Parameter is optional and only cfi_cmdset_0001.c
> currently allows it.

Hey I just thought of a different approach.  What about something like:

int mtd_insert_mem(struct mtd_info *mtd, struct vm_area_struct *vma,
unsigned long addr, unsigned long offset)
{
     struct map_info *map = mtd->priv;
     unsigned long pfn;

     pfn = (map->phys + offset) >> PAGE_SHIFT;
     return vm_insert_pfn(vma, addr, pfn);
}



This way we don't need to export the physical address and we keep the
vm calls in the driver world.
