Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKTGS-000116-3K
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 10:37:04 +0000
Received: by eyh6 with SMTP id 6so451566eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 03:37:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] UBIFS: add the fixup function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1304722703-7904-2-git-send-email-mlcreech@gmail.com>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-2-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 13:33:39 +0300
Message-ID: <1305196419.2713.84.camel@localhost>
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

On Fri, 2011-05-06 at 18:58 -0400, Matthew L. Creech wrote:
> This patch adds the 'ubifs_fixup_free_space()' function which scans all
> LEBs in the filesystem for those that are in-use but have one or more
> empty pages, then re-maps the LEBs in order to erase the empty portions.
> Afterward it removes the "space_fixup" flag from the UBIFS superblock.
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>

...

> +static int fixup_leb_free_space(struct ubifs_info *c, int lnum, int len)

I've renamed it to fixup_leb() which seems to be a nicer name.

> +{
> +       int err;
> +       void *sbuf = c->sbuf;
> +
> +       ubifs_assert(len >= 0);
> +       ubifs_assert(len % c->min_io_size == 0);
> +       ubifs_assert(len < c->leb_size);
> +
> +       if (len == 0) {
> +               dbg_mnt("unmap empty LEB %d", lnum);
> +               return ubi_leb_unmap(c->ubi, lnum);
> +       }
> +
> +       dbg_mnt("fixup LEB %d, data len %d", lnum, len);
> +       err = ubi_read(c->ubi, lnum, sbuf, 0, len);
> +       if (err && err != -EBADMSG)
> +               return err;

I've removed the 'err != -EBADMSG' check because I think we do want to
fail in case of unrecoverable ECC errors.

And I've pushed it to ubifs-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
