Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKzc0-00058H-Fm
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 21:09:29 +0000
Received: by ewy3 with SMTP id 3so966955ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 14:09:27 -0700 (PDT)
Date: Sat, 14 May 2011 00:09:22 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] mtd: convert to seq_file interface
Message-ID: <20110513210922.GD29261@p183>
References: <20110513203419.GA29261@p183>
	<BANLkTinAx_wd2NtVPR5nw7K4Ga7_ij3M4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BANLkTinAx_wd2NtVPR5nw7K4Ga7_ij3M4A@mail.gmail.com>
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

On Fri, May 13, 2011 at 04:57:41PM -0400, Mike Frysinger wrote:
> On Fri, May 13, 2011 at 16:34, Alexey Dobriyan wrote:
> > ->read_proc interface is going away, switch to seq_file.
> 
> while i like converting to seq_file in general, i'm not sure this
> conversion is correct ... or maybe it's just incomplete ?
> 
> > +static int mtd_proc_show(struct seq_file *m, void *v)
> >  {
> >        struct mtd_info *mtd;
> >
> > +       seq_puts(m, "dev:    size   erasesize  name\n");
> >        mutex_lock(&mtd_table_mutex);
> >        mtd_for_each_device(mtd) {
> > +               seq_printf(m, "mtd%d: %8.8llx %8.8x \"%s\"\n",
> > +                          mtd->index, (unsigned long long)mtd->size,
> > +                          mtd->erasesize, mtd->name);
> >         }
> >        mutex_unlock(&mtd_table_mutex);
> > +        return 0;
> >  }
> 
> this is the new version of the func.  the old one handled
> offsets/seeks while the new one doesnt seem to.  am i mistaken ?
> 
> in particular, it seems like this is missing the seq_operations set of
> funcs for walking the list of mtd devices ...

seq_operations are mostly needed when read(2) is going to be short
enough to not require walking full object list to fill necessary amount.
Seeing that bash reads 32 KB by default, we go for simpler code.
