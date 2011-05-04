Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHa5B-0001dZ-4r
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 11:17:30 +0000
Received: by ewy3 with SMTP id 3so339751ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 04:17:27 -0700 (PDT)
Subject: Re: [PATCH 2/3] ubifs: add ubifs_mount_fixup_lebs()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
References: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 May 2011 14:13:45 +0300
Message-ID: <1304507625.7222.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-03 at 18:55 -0400, Matthew L. Creech wrote:
> This call scans all LEBs in the filesystem for those that are in-use but have
> one or more empty pages at the end, then re-maps the LEBs in order to erase the
> empty portions.  Afterward it removes the "leb_fixup" flag from the UBIFS
> superblock.
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
> ---
>  fs/ubifs/sb.c    |  136 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/ubifs/ubifs.h |    1 +
>  2 files changed, 137 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
> index e3777d0..2afc3ad 100644
> --- a/fs/ubifs/sb.c
> +++ b/fs/ubifs/sb.c
> @@ -652,3 +652,139 @@ out:
>  	kfree(sup);
>  	return err;
>  }
> +
> +/**
> + * ubifs_fixup_leb - scan LEB for empty pages & remap if needed

Nitpick, but to be 100% consistent - put a do after the first sentence
of all kerneldoc comments, because all the UBIFS code does this.

> + * @c: UBIFS file-system description object
> + * @lnum: LEB number
> + * @nfree: Number of free bytes at the end of the LEB
> + *
> + * This function reads the contents of the given LEB, then remaps it to a
> + * new PEB, so that any empty pages are actually erased on flash (rather than
> + * being just all-0xff real data).
> + */
> +static int ubifs_fixup_leb(struct ubifs_info *c, int lnum, int nfree)

Please, do not add the "ubifs_" prefix for static function. Not sure if
UBIFS is very consistent in this, but we tried to use this prefix only
for non-static (visible outside) functions to make sure we do not have
any namespace clashes.

> +{
> +	int err = 0, aligned_len;
> +	int len = c->leb_size - nfree;

We also tried to define all variables of the same type in one line, if
they fit. I mean

int a, b, c;

instead of

int a, b;
int c;

> +	void *sbuf = c->sbuf;
> +
> +	if (unlikely(len<=0))
> +		return 0;
> +
> +	dbg_mnt("fixup LEB %d (len %d)", lnum, len);
> +
> +	/* Read the existing valid data for this LEB */
> +	err = ubi_read(c->ubi, lnum, sbuf, 0, len);
> +	if (err && err != -EBADMSG) {
> +		ubifs_err("cannot read %d bytes from LEB %d, error %d",
> +			  len, lnum, err);

No need to print the error message here - UBI will do it if it fails.

> +		goto out;
> +	}
> +
> +	/* Pad if necessary */
> +	aligned_len = ALIGN(len, c->min_io_size);

Hmm, I think len returned by lprops is always min. I/O size - aligned,
so the below piece of code should not be necessary. Just ass
ubifs_assert(len % c->min_io_size == 0) here to make double sure.

> +	if (aligned_len > len) {
> +		int pad_len = aligned_len - ALIGN(len, 8);
> +
> +		if (pad_len > 0) {
> +			void *buf = sbuf + aligned_len - pad_len;
> +
> +			ubifs_pad(c, buf, pad_len);
> +		}
> +	}
> +
> +	/* Atomically change this LEB's mapping */
> +	err = ubi_leb_change(c->ubi, lnum, sbuf, aligned_len, UBI_UNKNOWN);
> +out:
> +	return err;

I'd kill this "out:" label.

> +}
> +
> +/**
> + * ubifs_fixup_all_lebs - find & remap all LEBs with trailing empty pages

dot.

> + * @c: UBIFS file-system description object
> + *
> + * This function walks through all LEBs in the filesystem and remaps those
> + * which are in-use and have trailing empty pages.
> + */
> +static int ubifs_fixup_all_lebs(struct ubifs_info *c)

So according to my suggestion this would be named:

fixup_free_space()

or something like this. Please, if you agree with my naming suggestion,
revise all comments and prints and amend them as well please.

> +{
> +	int lnum, err = 0;
> +	struct ubifs_lprops *lprops;
> +
> +	ubifs_get_lprops(c);
> +
> +	/*
> +	 * Find all in-use LEBs and remap them to new PEBs, which will erase
> +	 * any "empty" pages (they might currently exist as real 0xff data).
> +	 */
> +	for (lnum = 2; lnum <= c->leb_cnt; lnum++) {
> +		lprops=ubifs_lpt_lookup(c, lnum);
> +		if (IS_ERR(lprops)) {
> +			err = PTR_ERR(lprops);
> +			goto out;
> +		}
> +
> +		if (!(lprops->flags & LPROPS_EMPTY) &&

I think this is not quite right, because empty taken LEBs will not be
fixed up. I think you should only look at free space and nothing else.

> +		    (lprops->free>=c->min_io_size)) {
> +			/* Non-empty LEB with at least 1 free page */
> +			err = ubifs_fixup_leb(c, lnum, lprops->free)

And actually for free LEBs (lprops->free == c->leb_size) we just need to
unmap them ubi_leb_unmap() is the function name AFAIR. I mean, for
completely free LEBs we might have 2 situations:

1. Most often - it is unmapped, then unmap operation will be noop
2. Rarely it may be mapped, which means the free space there may need
fixup, so we unmap them and UBI will erase the corresponding PEB.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
