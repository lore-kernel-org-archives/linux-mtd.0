Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGnUL-0003BN-Hm
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 23:06:08 -0400
Date: Fri, 3 Aug 2007 05:01:55 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070803030144.GA16512@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801115535.GA2747@lazybastard.org>
	<6934efce0708021856r14a41f89v58f4f156db5e8d5d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0708021856r14a41f89v58f4f156db5e8d5d@mail.gmail.com>
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

On Thu, 2 August 2007 18:56:46 -0700, Jared Hulbert wrote:
> 
> > --- point_phys/include/linux/mtd/mtd.h~point_phys       2007-05-16 02:01:55.000000000 +0200
> > +++ point_phys/include/linux/mtd/mtd.h  2007-08-01 13:49:30.000000000 +0200
> > @@ -136,10 +136,14 @@ struct mtd_info {
> >         int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
> >
> >         /* This stuff for eXecute-In-Place */
> > -       int (*point) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char **mtdbuf);
> > +       /* phys is optional and may be set to NULL */
> > +       int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
> > +                       size_t *retlen, void __iomem **virt,
> > +                       resource_size_t *phys);
> 
> Okay so I think __iomem is correct but I'm not sure I understand all
> the ramifications downstream from here.

Interestingly __iomem makes less sense for some RAM-based drivers.  So
maybe that part should get removed.  The whole patch was just a quick
hack to get an opinion.

> Why resource_size_t?

Because struct map_info has that type for phys.

Jörn

-- 
Joern's library part 2:
http://www.art.net/~hopkins/Don/unix-haters/tirix/embarrassing-memo.html
