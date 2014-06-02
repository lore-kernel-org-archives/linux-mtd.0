Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrN9e-0000Sd-DW
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 07:59:38 +0000
Message-ID: <1401695954.11182.112.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Date: Mon, 02 Jun 2014 10:59:14 +0300
In-Reply-To: <20140531000054.GA12737@earthship.lan>
References: <20140530232039.GH3599@ld-irv-0074>
 <20140531000054.GA12737@earthship.lan>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 hujianyang@huawei.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Daniel, this looks nicer than the original patch. Would you
please do few more cosmetic changes, though.

On Sat, 2014-05-31 at 02:01 +0200, Daniel Golle wrote: 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index a81c7b5..e88bbb6 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1149,6 +1149,8 @@ static int mount_ubifs(struct ubifs_info *c)
>  	size_t sz;
>  
>  	c->ro_mount = !!(c->vfs_sb->s_flags & MS_RDONLY);
> +	c->probing = !!(c->vfs_sb->s_flags & MS_SILENT);

Would you add a comment on top of this saying what MS_SILENT is about.
The kernel people who read the code do not necessary know the "FS
probing" use-case. E.g., I did not know about it.
> @@ -1441,6 +1451,7 @@ struct ubifs_info {
>  	unsigned int replaying:1;
>  	unsigned int mounting:1;
>  	unsigned int remounting_rw:1;
> +	unsigned int probing:1;

We have kerneldoc-style comment on top of this structure, could you
please document the new field there.

-- 
Best Regards,
Artem Bityutskiy
