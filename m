Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMbm-0000OB-25
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:06:22 +0000
Received: by ewy3 with SMTP id 3so1121442ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 08:06:20 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] ubifs: add ubifs_fixup_free_space()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTinVHD1QYpqSTG0_WcLy-aA1ere34g@mail.gmail.com>
References: <BANLkTinVHD1QYpqSTG0_WcLy-aA1ere34g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 18:02:48 +0300
Message-ID: <1304694168.7222.68.camel@localhost>
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

On Thu, 2011-05-05 at 16:33 -0400, Matthew L. Creech wrote:
> +/**
> + * fixup_leb_free_space - remap/unmap a LEB containing free space.
> + * @c: UBIFS file-system description object
> + * @lnum: LEB number
> + * @len: number of used bytes in LEB (starting at offset 0)
> + *
> + * This function reads the contents of the given LEB, then remaps it to a
> + * new PEB, so that any empty pages are actually erased on flash (rather than
> + * being just all-0xff real data).  If the LEB is completely empty, it is
> + * simply unmappped.
> + */
> +static int fixup_leb_free_space(struct ubifs_info *c, int lnum, int len)
> +{
> +	int err = 0, aligned_len;
> +	void *sbuf = c->sbuf;
> +
> +	ubifs_assert(len >= 0);
> +	ubifs_assert(len % c->min_io_size == 0);

So if this is true.

> +	ubifs_assert(len < c->leb_size);
> +
> +	if (len == 0) {
> +		/* LEB has no valid data, unmap it (no-op if it's unused) */
> +		dbg_mnt("unmap empty LEB %d", lnum);
> +		return ubi_leb_unmap(c->ubi, lnum);
> +	}
> +
> +	dbg_mnt("fixup partially-empty LEB %d (len %d)", lnum, len);
> +
> +	/* Read the existing valid data for this LEB */
> +	err = ubi_read(c->ubi, lnum, sbuf, 0, len);
> +	if (err && err != -EBADMSG)
> +		return err;
> +
> +	/* Pad if necessary */
> +	aligned_len = ALIGN(len, c->min_io_size);
> +	if (aligned_len > len) {

This will be always false and the below code can be removed, right?

> +		int pad_len = aligned_len - ALIGN(len, 8);
> +
> +		if (pad_len > 0) {
> +			void *buf = sbuf + aligned_len - pad_len;
> +
> +			ubifs_pad(c, buf, pad_len);
> +		}
> +	}
> +

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
