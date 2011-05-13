Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKzWj-00054U-RV
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 21:04:02 +0000
Received: by eyh6 with SMTP id 6so966094eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 14:04:00 -0700 (PDT)
Date: Sat, 14 May 2011 00:03:55 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] mtd: convert to seq_file interface
Message-ID: <20110513210354.GC29261@p183>
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

seq_file does all this for developer, see fs/seq_file.c
All you have to do is to fill buffer with data, this is why it's so cool.

> in particular, it seems like this is missing the seq_operations set of
> funcs for walking the list of mtd devices ...

Yes and no.
seq_operations aren't mandatory, because it doesn't matter much
how exactly buffer is filled. In this case we go for simpler code.
