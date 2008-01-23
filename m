Received: from an-out-0708.google.com ([209.85.132.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHqP4-0002xI-1t
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 00:57:21 +0000
Received: by an-out-0708.google.com with SMTP id c3so4808ana.99
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Jan 2008 16:57:07 -0800 (PST)
Date: Wed, 23 Jan 2008 16:13:24 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: Adding a function pointer to mtd_info struct
Message-ID: <20080123161324.45ea71e3@zod.rchland.ibm.com>
In-Reply-To: <63159.87126.qm@web43145.mail.sp1.yahoo.com>
References: <63159.87126.qm@web43145.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 Jan 2008 09:28:13 -0800 (PST)
Justin Treon <justin_treon@yahoo.com> wrote:

> I am trying to add some new features in my kernel to cfi_cmd_0001.c for a test chip.
>  I added a new field to the mtd_info struct in mtd.h and inserted the function
> pointer into the mtd->overwrite field I added in cfi_cmd_0001.c, but when I try to
> use mtd->overwrite in mtdblock.c the pointer is set to NULL.  
> 
> In the mtd_info struct in include/mtd/mtd.h I addded:
> 	int (*overwrite) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
> const u_char *buf);
> 
> In cfi_cmd_0001.c I added:
> 	mtd->overwrite = cfi_intelext_overwrite_buffers;
> 
> What file or field do I need to modify to make new function accessible from
> mtdblock.c?

Just post a patch of what you did.  It'll be easier to help you.

josh
