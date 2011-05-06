Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILuP-0008Jl-7G
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:21:34 +0000
Received: by eyh6 with SMTP id 6so1109174eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:21:31 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] ubifs: add ubifs_fixup_free_space()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTikOosNid55BgDGqxab2pViieUKT4w@mail.gmail.com>
References: <BANLkTikOosNid55BgDGqxab2pViieUKT4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 17:17:59 +0300
Message-ID: <1304691479.7222.64.camel@localhost>
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

On Wed, 2011-05-04 at 18:12 -0400, Matthew L. Creech wrote:
> +/**
> + * ubifs_fixup_free_space - find & fix all LEBs with free space.
> + * @c: UBIFS file-system description object
> + *
> + * This function fixes up LEBs containing free space on first mount, if the
> + * appropriate flag was set when the FS was created.  Each LEB with one or more
> + * empty pages (i.e. free-space-count > 0) is re-written, to make sure the
> + * free space is actually erased.  This is necessary for some NAND chips, since
> + * the free space may have been programmed like real "0xff" data (generating a
> + * non-0xff ECC), causing future writes to the not-really-erased pages to
> + * behave badly.  After fixup, the superblock flag is removed so that this is
> + * skipped for all future mounts.
> + */
> +int ubifs_fixup_free_space(struct ubifs_info *c)
> +{
> +	int err = 0, sup_flags = 0;
> +	struct ubifs_sb_node *sup;
> +
> +	ubifs_assert(c->space_fixup);
> +	ubifs_assert(!c->ro_mount);
> +
> +	ubifs_msg("free-space fixup needed");
> +
> +	err = fixup_free_space(c);
> +	if (err)
> +		goto out;
> +
> +	sup = ubifs_read_sb_node(c);
> +	if (IS_ERR(sup)) {
> +		err = PTR_ERR(sup);
> +		goto out;
> +	}

This function will allocate 'sup' and you never free it. Please, do
kfree(sup) at "out:".

I've noticed the same bug in 'ubifs_remount_rw()' and just fixed it -
see patch [7/7] in the series I've sent few minutes ago to the mailing
list.

> +
> +	/* Free-space fixup is no longer required */
> +	c->space_fixup = 0;
> +
> +	/* Set new flags, omitting free-space fixup */
> +	sup_flags = 0;
> +	if (c->big_lpt)
> +		sup_flags |= UBIFS_FLG_BIGLPT;
> +	sup->flags = cpu_to_le32(sup_flags);

Could you please change this piece of code to something like

sup->flags &= cpu_to_le32(~UBIFS_FLG_SPACE_FIXUP);

I mean, obviously your piece of code is error-prone because if someone
adds yet another SB flag some day, he might miss your code which clears
it. IOW, you should touch only the UBIFS_FLG_SPACE_FIXUP bit and nothing
else.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
