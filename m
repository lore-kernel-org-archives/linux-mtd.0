Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBoVm-00065K-Lx
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 20:28:36 +0000
Date: Fri, 19 May 2017 17:28:01 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Joe Perches <joe@perches.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 04/29] printk-formats.txt: standardize document format
Message-ID: <20170519172801.042a238e@vela.lan>
In-Reply-To: <1495189568.31562.34.camel@perches.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <6c973f1a04299e7f637949f717ea7f6c9777b0b4.1495157082.git.mchehab@s-opensource.com>
 <1495189568.31562.34.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Fri, 19 May 2017 03:26:08 -0700
Joe Perches <joe@perches.com> escreveu:

> On Thu, 2017-05-18 at 22:25 -0300, Mauro Carvalho Chehab wrote:
> > Each text file under Documentation follows a different
> > format. Some doesn't even have titles!
> > 
> > Change its representation to follow the adopted standard,
> > using ReST markups for it to be parseable by Sphinx:
> > 
> > - add a title for the document;
> > - add markups for section titles;
> > - move authorship to the beginning and use :Author:;
> > - use right markup for tables;
> > - mark literals and literal blocks.  
> 
> I think the .rst markup is far uglier to read as text
> and harder to modify for new additions to %p<foo>
> given column alignments.
> 
> For instance below, but other than that, the .rst
> is easier to read.
> 
> > diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt  
> []
> > @@ -1,139 +1,180 @@
> > -If variable is of Type,		use printk format specifier:
> > ----------------------------------------------------------
> > -		int			%d or %x
> > -		unsigned int		%u or %x
> > -		long			%ld or %lx
> > -		unsigned long		%lu or %lx
> > -		long long		%lld or %llx
> > -		unsigned long long	%llu or %llx
> > -		size_t			%zu or %zx
> > -		ssize_t			%zd or %zx
> > -		s32			%d or %x
> > -		u32			%u or %x
> > -		s64			%lld or %llx
> > -		u64			%llu or %llx  
> []
> > +======================= ===========================
> > +If variable is of Type	use printk format specifier
> > +======================= ===========================
> > +``int``			``%d or %x``
> > +``unsigned int``	``%u or %x``
> > +``long``		``%ld or %lx``
> > +``unsigned long``	``%lu or %lx``
> > +``long long``		``%lld or %llx``
> > +``unsigned long long``	``%llu or %llx``
> > +``size_t``		``%zu or %zx``
> > +``ssize_t``		``%zd or %zx``
> > +``s32``			``%d or %x``
> > +``u32``			``%u or %x``
> > +``s64``			``%lld or %llx``
> > +``u64``			``%llu or %llx``
> > +======================= ===========================  

Well, we could,instead, use literal blocks, e. g. something like:

::

 -If variable is of Type,		use printk format specifier:
 ----------------------------------------------------------
 -		int			%d or %x
 -		unsigned int		%u or %x
 -		long			%ld or %lx
 -		unsigned long		%lu or %lx
 -		long long		%lld or %llx
 -		unsigned long long	%llu or %llx
 -		size_t			%zu or %zx
 -		ssize_t			%zd or %zx
 -		s32			%d or %x
 -		u32			%u or %x
 -		s64			%lld or %llx
 -		u64			%llu or %llx  



Cheers,
Mauro
