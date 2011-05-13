Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKzQx-00052M-AG
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 20:58:04 +0000
Received: by fxm14 with SMTP id 14so2703963fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 13:58:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110513203419.GA29261@p183>
References: <20110513203419.GA29261@p183>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 13 May 2011 16:57:41 -0400
Message-ID: <BANLkTinAx_wd2NtVPR5nw7K4Ga7_ij3M4A@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert to seq_file interface
To: Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 13, 2011 at 16:34, Alexey Dobriyan wrote:
> ->read_proc interface is going away, switch to seq_file.

while i like converting to seq_file in general, i'm not sure this
conversion is correct ... or maybe it's just incomplete ?

> +static int mtd_proc_show(struct seq_file *m, void *v)
>  {
>        struct mtd_info *mtd;
>
> +       seq_puts(m, "dev:    size   erasesize  name\n");
>        mutex_lock(&mtd_table_mutex);
>        mtd_for_each_device(mtd) {
> +               seq_printf(m, "mtd%d: %8.8llx %8.8x \"%s\"\n",
> +                          mtd->index, (unsigned long long)mtd->size,
> +                          mtd->erasesize, mtd->name);
>         }
>        mutex_unlock(&mtd_table_mutex);
> +        return 0;
>  }

this is the new version of the func.  the old one handled
offsets/seeks while the new one doesnt seem to.  am i mistaken ?

in particular, it seems like this is missing the seq_operations set of
funcs for walking the list of mtd devices ...
-mike
