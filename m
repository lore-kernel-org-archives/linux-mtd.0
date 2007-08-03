Received: from wa-out-1112.google.com ([209.85.146.181])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGpkC-0004Yj-VS
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 01:30:51 -0400
Received: by wa-out-1112.google.com with SMTP id v33so735957wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Aug 2007 22:30:32 -0700 (PDT)
Message-ID: <6934efce0708022223w4e49264o29347d91e88d62f7@mail.gmail.com>
Date: Thu, 2 Aug 2007 22:23:47 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070803030144.GA16512@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801115535.GA2747@lazybastard.org>
	<6934efce0708021856r14a41f89v58f4f156db5e8d5d@mail.gmail.com>
	<20070803030144.GA16512@lazybastard.org>
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

> Interestingly __iomem makes less sense for some RAM-based drivers.  So
> maybe that part should get removed.

(http://marc.info/?l=linux-arm-kernel&m=118193919321290&w=4)
  Russel King said:
-->
-->   const void *start = virt + offset;
-->
--> This will generate a sparse warning (since you haven't used sparse you
--> won't know about this.)  The __iomem annotation does nothing as far as
--> the C language goes, but sparse uses it to annotate variables as to
--> which address space they refer to, and issues warnings if you try to
--> cast between different address spaces.  However, it does allow code
--> which knows what it's doing to do such casts.
-->
-->   const void *start = (void __force *)virt + offset;
-->
--> MTD people may like to make a note that the 'cached' element of struct
--> map_info is assigned __iomem pointers (from ioremap_cached) but is
--> itself not marked with an __iomem pointer.  This will also produce
--> sparse warnings.

Now I think maybe it should be "void **virt" not "void __iomem **virt"
and then just __force virt.  Anybody know?

> The whole patch was just a quick hack to get an opinion.

Trying to move it forward...
