Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DzXln-0008KQ-0P
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2005 06:43:55 -0400
Date: Mon, 1 Aug 2005 12:43:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Havasi Ferenc <havasi@inf.u-szeged.hu>
Message-ID: <20050801104343.GB32464@wohnheim.fh-wedel.de>
References: <20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru> <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42EDF470.4060208@inf.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 1 August 2005 12:07:44 +0200, Havasi Ferenc wrote:
> Jörn Engel wrote:
> >On Mon, 1 August 2005 11:50:04 +0200, Havasi Ferenc wrote:
> >
> >>Thanks for the review, the modified patch is at
> >>http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050729.patch.
> >
> >Not Found
> >The requested URL /jffs2/jffs2-summary-20050729.patch. was not found on this server.
> >
> Sorry, the "." was the end of the sentence, not the part of the URL. So
> it is:
> http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050729.patch

A classical problem.  :)


> diff -Narup Mtd-orig/fs/jffs2/build.c mtd/fs/jffs2/build.c
> --- Mtd-orig/fs/jffs2/build.c	2005-07-22 12:32:07.000000000 +0200
> +++ mtd/fs/jffs2/build.c	2005-07-29 18:43:16.000000000 +0200
> @@ -334,6 +334,9 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>  		c->blocks[i].first_node = NULL;
>  		c->blocks[i].last_node = NULL;
>  		c->blocks[i].bad_count = 0;
> +#ifdef CONFIG_JFFS2_SUMMARY
> +		c->blocks[i].sum_collected = NULL;
> +#endif

I guess we can start removing some of the #ifdef ugliness already.
The extra field per eraseblock can be added unconditionally, as can
this line.

> diff -Narup Mtd-orig/fs/jffs2/erase.c mtd/fs/jffs2/erase.c
> --- Mtd-orig/fs/jffs2/erase.c	2005-07-22 12:32:08.000000000 +0200
> +++ mtd/fs/jffs2/erase.c	2005-07-29 18:43:16.000000000 +0200
> @@ -425,6 +425,14 @@ static void jffs2_mark_erased_block(stru
>  		jeb->wasted_size = 0;
>  	}
>  
> +#ifdef CONFIG_JFFS2_SUMMARY
> +	if (jeb->sum_collected) {
> +		jffs2_sum_clean_collected(jeb);
> +		jeb->sum_collected->sum_size = 0;
> +		jeb->sum_collected->sum_padded = 0;
> +	}
> +#endif
> +

This part could be packaged in a small function.  With a bit of header
magic like this:

#ifdef CONFIG_JFFS2_SUMMARY
void jffs2_sum_clean_collected(struct jffs2_eraseblock *jeb);
#else
void inline jffs2_sum_clean_collected(struct jffs2_eraseblock *jeb) {}
#endif

You can call that function unconditionally here.  No ifdefs in the
already ugly function.

> diff -Narup Mtd-orig/fs/jffs2/gc.c mtd/fs/jffs2/gc.c
> --- Mtd-orig/fs/jffs2/gc.c	2005-07-24 17:14:14.000000000 +0200
> +++ mtd/fs/jffs2/gc.c	2005-07-29 18:43:16.000000000 +0200
> @@ -505,6 +505,7 @@ static int jffs2_garbage_collect_pristin
>  	uint32_t phys_ofs, alloclen;
>  	uint32_t crc, rawlen;
>  	int retried = 0;
> +	struct kvec vecs[1];

Funky.

>  	D1(printk(KERN_DEBUG "Going to GC REF_PRISTINE node at 0x%08x\n", ref_offset(raw)));
>  
> @@ -513,8 +514,9 @@ static int jffs2_garbage_collect_pristin
>  	/* Ask for a small amount of space (or the totlen if smaller) because we
>  	   don't want to force wastage of the end of a block if splitting would
>  	   work. */
> -	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN, 
> -					      rawlen), &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) +
> +				JFFS2_MIN_DATA_LEN, rawlen), &phys_ofs, &alloclen, rawlen);
> +				/* this is not optimal yet */

Can you add some more explanation to the comment?

>  	if (ret)
>  		return ret;
>  
> @@ -594,7 +596,10 @@ static int jffs2_garbage_collect_pristin
>  	nraw->__totlen = rawlen;
>  	nraw->next_phys = NULL;
>  
> -	ret = jffs2_flash_write(c, phys_ofs, rawlen, &retlen, (char *)node);
> +	vecs[0].iov_base = (unsigned char *) node;
> +	vecs[0].iov_len = rawlen;
> +
> +	ret = jffs2_flash_writev(c, vecs, 1, phys_ofs, &retlen, 0);

Why this change?  If it's required, it might make sense to split it
out into a preparatory patch.  But my gut feeling is that dropping
this part would be better.

> diff -Narup Mtd-orig/fs/jffs2/nodelist.h mtd/fs/jffs2/nodelist.h
> --- Mtd-orig/fs/jffs2/nodelist.h	2005-07-27 16:46:11.000000000 +0200
> +++ mtd/fs/jffs2/nodelist.h	2005-07-29 18:43:16.000000000 +0200
> @@ -20,6 +20,7 @@
>  #include <linux/jffs2.h>
>  #include <linux/jffs2_fs_sb.h>
>  #include <linux/jffs2_fs_i.h>
> +#include "summary.h"
>  
>  #ifdef __ECOS
>  #include "os-ecos.h"
> @@ -179,6 +180,10 @@ struct jffs2_eraseblock
>  	int bad_count;
>  	uint32_t offset;		/* of this block in the MTD */
>  
> +#ifdef CONFIG_JFFS2_SUMMARY	
> +	struct jffs2_sum_info *sum_collected;
> +#endif
> +
>  	uint32_t unchecked_size;
>  	uint32_t used_size;
>  	uint32_t dirty_size;

Make it unconditional (see above).

> @@ -313,8 +318,8 @@ int jffs2_add_full_dnode_to_inode(struct
>  
>  /* nodemgmt.c */
>  int jffs2_thread_should_wake(struct jffs2_sb_info *c);
> -int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio);
> -int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len);
> +int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio, uint32_t sumsize);
> +int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize);

128 columns. *grumble*

Dwmw2 has a different opinion on this matter (which he didn't bother
to explain, so far.) *grumble*

>  int jffs2_add_physical_node_ref(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *new);
>  void jffs2_complete_reservation(struct jffs2_sb_info *c);
>  void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw);
> @@ -374,6 +379,10 @@ char *jffs2_getlink(struct jffs2_sb_info
>  /* scan.c */
>  int jffs2_scan_medium(struct jffs2_sb_info *c);
>  void jffs2_rotate_lists(struct jffs2_sb_info *c);
> +int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
                          ^
This space can be removed.
> +				uint32_t ofs, uint32_t len);
> +struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
> +int jffs2_scan_classify_jeb(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
>  
>  /* build.c */
>  int jffs2_do_mount_fs(struct jffs2_sb_info *c);
> diff -Narup Mtd-orig/fs/jffs2/nodemgmt.c mtd/fs/jffs2/nodemgmt.c
> --- Mtd-orig/fs/jffs2/nodemgmt.c	2005-07-20 17:32:28.000000000 +0200
> +++ mtd/fs/jffs2/nodemgmt.c	2005-07-29 18:43:16.000000000 +0200
> @@ -18,6 +18,12 @@
>  #include <linux/sched.h> /* For cond_resched() */
>  #include "nodelist.h"
>  
> +#ifdef CONFIG_JFFS2_SUMMARY
> +#define jffs2_do_reserve_space(a,b,c,d,e) jffs2_do_reserve_space_sum(a,b,c,d,e)
> +#else
> +#define jffs2_do_reserve_space(a,b,c,d,e) jffs2_do_reserve_space_normal(a,b,c,d,e)
> +#endif
> +

Yuck!  Normally, this should be moved into some header.  I do see that
both functions are static, though, so that doesn't help.

This needs to be changed somehow.  I don't have a good idea yet, so
maybe you can come up with something.  If necessary, do a preparatory
cleanup patch for nodemgmt.c.

>  /**
>   *	jffs2_reserve_space - request physical space to write nodes to flash
>   *	@c: superblock info
> @@ -38,9 +44,9 @@
>   *	for the requested allocation.
>   */
>  
> -static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len);
> +static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize);
>  
> -int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio)
> +int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio, uint32_t sumsize)

*grumble*

> @@ -158,52 +164,36 @@ int jffs2_reserve_space_gc(struct jffs2_
>  	return ret;
>  }
>  
> -/* Called with alloc sem _and_ erase_completion_lock */
> -static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len)
> +
> +static void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock **jeb)
>  {

Not reviewed yet - this still need another round anyway and lunch is
waiting...

> +#ifdef CONFIG_JFFS2_SUMMARY
> +
> +/* Called with alloc sem _and_ erase_completion_lock */
> +static int jffs2_do_reserve_space_sum(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
> +{
[...]
> +#else
> +
> +/* Called with alloc sem _and_ erase_completion_lock */
> +static int jffs2_do_reserve_space_normal(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
> +{

It doesn't take too much creativity to combine this and the above
#ifdef into a single one.  That will still be ugly, but it's a step in
the right direction.

Still didn't review the whole patch, but I'm getting hungry.  Should
be enough to keep you busy for a moment.

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu
