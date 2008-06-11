Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6Due-0006sN-Bx
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 00:10:04 +0000
In-Reply-To: <20080608121020.GA13200@logfs.org>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
MIME-Version: 1.0
Message-ID: <OF397179E3.A6764D8A-ON88257464.007D81C8-88257465.0000E0CF@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 10 Jun 2008 17:09:35 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jorn,

Well I'm glad I started a lively discussion :).  Most of what you and 
Jamie are talking about are beyond me though so I don't think I'll try and 
contribute.  I'll just keep asking questions to try and understand.

I think I'm starting to glean some things and one of those things is that 
I think I'm in over my head :(.  Are you suggesting that the direction we 
want to move is to change the MTD layer over to function the same way as 
the Block I/O layer?  With all of it's attendant infrastructure?  I've 
read through the 'Block Device Drivers' chapter of 'Understanding the 
Linux Kernal'.  It talks about the I/O scheduler and queues of requests 
consisting of multiple bios which can consist of multiple segments 
(bio_vec?), and a WHOLE lot of 'stuff'.  If that's what we're talking 
about then it's WAY beyond my scope or my abilities.  I'm trying to solve 
a very narrow problem (i.e., I want to access 8GiB of flash as a single 
device using UBI/UBIFS).

So here's what I suggest I can do for you and you can tell me if it'll be 
of any help.  I can continue to ask questions about the code you posted so 
I understand both the plumbing end and the calling end (I'm still a bit 
confused on the struct page part and how to use it), implement basically 
just what you showed me (not anything like I've read about BIO), and try 
to make it work for my UBI/MTD/NAND case.  That would be a start to the 
changes without being beyond my abilities and I can do it in a way that 
should't break any existing code.  Sound resonable or just a waste of 
your's and the list's time?

On to some questions:

> +static int ram_submit_fio(struct mtd_info *mtd, struct fio *fio)
> +{
> +   int i, err = 0;
> +   u32 ofs;
> +   size_t *retlen;
> +   const u_char *buf;
> +   struct fio_vec *vec;
> +
> +   /* This driver cannot deal with device >32bit yet */
> +   if (fio->fi_blockno * mtd->erasesize + fio->block_ofs + fio->fi_len
> +         > 0xffffffff)
> +      return -EIO;
> +
> +   ofs = fio->fi_blockno * mtd->erasesize + fio->block_ofs;
> +
> +   if (fio->fi_command == FI_ERASE) {
> +      memset(mtd->priv + ofs, 0xff, fio->fi_len);
> +      goto out;
> +   }
> +
> +   for (i = 0; i < fio->fi_vcnt; i++) {
> +      vec = fio->fi_io_vec + i;
> +      buf = kmap_atomic(vec->fv_page, KM_USER0);
> +      switch (fio->fi_command) {
> +      case FI_READ:
> +         err = ram_read(mtd, ofs, vec->fv_len, &retlen,
> +               buf + vec->fv_offset);

I don't understand 'struct page' which is probably where my confusion 
comes from.  'ofs' passed to ram_read() is calculated from fi_blockno and 
fi_blockofs.  This makes sense as ram_read() is going to use this as the 
starting location in the "mtd" device to read from.  'buf' is calculated 
from vec->fv_page and vec->fv_offset.  I think this makes sense, as this 
is used by ram_read() is the starting location in fv_page to write to. 
'len' confuses me a bit as it comes from vec->fv_len rather than fi_len. 
Why use the length from the vector rather than the struct fio?  Should 
they be initialized to the same thing?  I would think to use fi_len as the 
calling function should have loaded that at the same time it figured out 
where to start from (i.e., when it loaded fi_blockno and fi_blockofs). I'm 
sure I'm missing something because I've never used struct page before and 
it's probably obvious to someone with more kernel experiance.

Does vec->fv_len represent the remaining length of vec->fv_page?  And 
vec->fv_offset the offset to start accessing vec->fv_page from?  Sorry to 
be asking dumb questions.

Bruce
