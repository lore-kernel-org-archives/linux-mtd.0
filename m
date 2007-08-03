Received: from wa-out-1112.google.com ([209.85.146.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGmPH-0002Qv-W1
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 21:56:50 -0400
Received: by wa-out-1112.google.com with SMTP id v33so691262wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Aug 2007 18:56:46 -0700 (PDT)
Message-ID: <6934efce0708021856r14a41f89v58f4f156db5e8d5d@mail.gmail.com>
Date: Thu, 2 Aug 2007 18:56:46 -0700
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

> --- point_phys/include/linux/mtd/mtd.h~point_phys       2007-05-16 02:01:55.000000000 +0200
> +++ point_phys/include/linux/mtd/mtd.h  2007-08-01 13:49:30.000000000 +0200
> @@ -136,10 +136,14 @@ struct mtd_info {
>         int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
>
>         /* This stuff for eXecute-In-Place */
> -       int (*point) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char **mtdbuf);
> +       /* phys is optional and may be set to NULL */
> +       int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
> +                       size_t *retlen, void __iomem **virt,
> +                       resource_size_t *phys);

Okay so I think __iomem is correct but I'm not sure I understand all
the ramifications downstream from here.

Why resource_size_t?
