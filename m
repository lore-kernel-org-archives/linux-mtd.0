Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YYO3-0001o4-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 21:14:19 +0000
Date: Tue, 14 Jan 2003 22:45:10 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Simon Evans <spse@secret.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: default readv/writev functions
Message-ID: <20030114214510.GC19834@wohnheim.fh-wedel.de>
References: <E18XNfT-0003Sp-00@spoinky.renegade.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E18XNfT-0003Sp-00@spoinky.renegade.org.uk>
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

On Sat, 11 January 2003 15:35:26 +0000, Simon Evans wrote:
> 
> I noticed in fs/jffs2/writev.c there is a mtd_fake_writev and a comment
> that it should be in the MTD core. Is the following ok to commit?
> 
> diff -u -p -u -r1.32 mtdcore.c
> --- drivers/mtd/mtdcore.c	7 Mar 2002 18:38:10 -0000	1.32
> +++ drivers/mtd/mtdcore.c	11 Jan 2003 12:28:16 -0000
>
> +int default_mtd_writev(struct mtd_info *mtd, const struct iovec *vecs,
> +		       unsigned long count, loff_t to, size_t *retlen)
> +int default_mtd_readv(struct mtd_info *mtd, struct iovec *vecs,
> +		      unsigned long count, loff_t from, size_t *retlen)
>
> +EXPORT_SYMBOL(default_mtd_writev);
> +EXPORT_SYMBOL(default_mtd_readv);
>
> diff -u -p -u -r1.37 mtd.h
> --- include/linux/mtd/mtd.h	19 Nov 2002 01:22:31 -0000	1.37
> +++ include/linux/mtd/mtd.h	11 Jan 2003 12:28:17 -0000
>
> +int default_mtd_writev(struct mtd_info *mtd, const struct iovec *vecs,
> +		       unsigned long count, loff_t to, size_t *retlen);
> +
> +int default_mtd_readv(struct mtd_info *mtd, struct iovec *vecs,
> +		      unsigned long count, loff_t from, size_t *retlen);

IMHO this is the wrong place. This should go into
drivers/mtd/chips/cfi_cmdset*.c.

Maybe I should comment on the code as well, but I'm lazy tonight. You
can compare it with cfi_cmdset_0003.c, that one should have a working
writev-function.

Jörn

-- 
Jörn Engel
mailto: joern@wohnheim.fh-wedel.de
http://wohnheim.fh-wedel.de/~joern
Phone: +49 179 6704074
