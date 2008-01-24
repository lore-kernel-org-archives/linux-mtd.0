Received: from n4.bullet.mail.re4.yahoo.com ([206.190.56.23])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHqBu-0001lt-CJ
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 00:43:45 +0000
Date: Wed, 23 Jan 2008 16:43:34 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: Adding a function pointer to mtd_info struct
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <20080123161324.45ea71e3@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <504404.99599.qm@web43132.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I am trying to add some new features in my kernel to cfi_cmd_0001.c for a test
> chip.
> >  I added a new field to the mtd_info struct in mtd.h and inserted the function
> > pointer into the mtd->overwrite field I added in cfi_cmd_0001.c, but when I try
> to
> > use mtd->overwrite in mtdblock.c the pointer is set to NULL.  
> > 
> > In the mtd_info struct in include/mtd/mtd.h I addded:
> > 	int (*overwrite) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
> > const u_char *buf);
> > 
> > In cfi_cmd_0001.c I added:
> > 	mtd->overwrite = cfi_intelext_overwrite_buffers;
> > 
> > What file or field do I need to modify to make new function accessible from
> > mtdblock.c?
> 
> Just post a patch of what you did.  It'll be easier to help you.
> 

I figured it out.  I did not realize I had to edit the mtd-parts file as well. Thank
you Josh.

Justin



      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
