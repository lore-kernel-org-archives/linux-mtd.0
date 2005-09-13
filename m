Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFJrH-0004hS-Cv
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 19:06:42 -0400
Date: Wed, 14 Sep 2005 01:06:31 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>
Message-ID: <20050913230631.GB29579@wohnheim.fh-wedel.de>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <005e01c5b882$9b318420$0100000a@LuCyFir3>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 September 2005 18:45:41 +0200, Sébastien Couret wrote:
> 
> I'm not used to post to this mailing list as i use jffs2 with ecos.
> 
> Here are JFFS2 patches to silent gcc 4.0 warnings.

Rejected.  Examplary reasons below...

In principle, I'd like a patch to silence gcc warnings.  But only when
the patch actually improves code quality.  If I get to choose between
bad code and compiler warnings, I'll pick the warning.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law

> -	init_pushpull(&rs.pp, cpage_out, *dstlen * 8, 0, 32);
> +	init_pushpull(&rs.pp,(char*) cpage_out, *dstlen * 8, 0, 32);

If it was a bug before, it will still be a bug.  Either way, new code
would be uglier than old.

Simply adding an explicit cast is *not* a solution.

Solution would be to use void* as parameter type for init_pushpull().
The meaning of the parameter is a chunk of memory, not an array of
signed or unsigned chars, shorts, ints longs or whatnot.

> -			unsigned long *datum = ebuf + i;
> +			unsigned long *datum = (unsigned long *)((char*) ebuf + i);

Arithmetic with void* pointers is one of the best gcc extensions.  Use
it!  The above is obviously correct, while below makes my brain rotate
around itself at dangerous speed.

> @@ -352,11 +352,11 @@
>  static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
>  {
>  	struct jffs2_raw_node_ref *marker_ref = NULL;
>  	size_t retlen;
>  	int ret;
> -	uint32_t bad_offset;
> +	uint32_t bad_offset=0;
>  
>  	switch (jffs2_block_check_erase(c, jeb, &bad_offset)) {
>  	case -EAGAIN:	goto refile;
>  	case -EIO:	goto filebad;
>  	}

Obviously a false positive.  Gcc should be smart enough to notice that
jffs2_block_check_erase() - a static function - never reads bad_offset
before writing to it.

>  				    jffs2_flash_write(c, to, sizetomalloc,
> -						      &thislen, cbuf);
> +						      &thislen,(unsigned char *) cbuf);

Correct solution would be void* as parameter type for
jffs2_flash_write().

> -	ret = jffs2_flash_read(c, ref_offset(raw), rawlen, &retlen, (char *)node);
> +	ret = jffs2_flash_read(c, ref_offset(raw), rawlen, &retlen, (unsigned char *)node);

Dito here.

> -	rd.nsize = strlen(fd->name);
> +	rd.nsize = strlen((char*)fd->name);
> -		int name_len = strlen(fd->name);
> +		int name_len = strlen((char*)fd->name);

We might use char* for fd->name.  Cast is no solution.

> -	ret = jffs2_flash_read(c, ref_offset(ref), sizeof(n), &retlen, (char *)&n);
> +	ret = jffs2_flash_read(c, ref_offset(ref), sizeof(n), &retlen, (unsigned char *)&n);

void* for jffs2_flash_read() and remove cast from original code.

>  static inline void init_pushpull(struct pushpull *pp, char *buf, unsigned buflen, unsigned ofs, unsigned reserve)
                                                         ^^^^
Make that "void" instead of below.
>  {
> -	pp->buf = buf;
> +	pp->buf = (unsigned char*)buf;
>  	pp->buflen = buflen;
>  	pp->ofs = ofs;
>  	pp->reserve = reserve;
>  }
