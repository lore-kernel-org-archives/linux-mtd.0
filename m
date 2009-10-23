Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1E6f-0007yB-Sf
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 06:58:42 +0000
Date: Fri, 23 Oct 2009 08:58:31 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH v7 3/5]: mtdoops: Make page (record) size configurable
Message-ID: <20091023085831.517760a9@marrow.netinsight.se>
In-Reply-To: <1256271229.29885.179.camel@localhost>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094739.3728e731@marrow.netinsight.se>
	<1256271229.29885.179.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Oct 2009 07:13:49 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2009-10-15 at 09:47 +0200, Simon Kagstrom wrote:
> > The main justification for this is to allow catching long messages
> > during a panic, where the top part might otherwise be lost since moving
> > to the next block can require a flash erase.
> > 
> > Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> > Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> 
> What will happen if I have a partition with 8192-bytes records, and then
> attach it to mtdoops with default 4096 ?

Assuming you have a crash stored, it will keep the first 4KB of it and
mark the second 4KB as unclean. This will then trigger an erase where
it will first move to the next erase block above and erase that (see
mtdoops_inc_counter and mtdoops_workfunc_erase).

So until you've wrapped around to the 8KB record again, it will be
kept. Userspace code to readout the mtdoops partition would have to be
prepared for different sized blocks in this case.


In practice, I think that it's best to erase the oops area if you
decide to change the size.

> >  	cxt->mtd = mtd;
> >  	if (mtd->size > INT_MAX)
> > -		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
> > +		cxt->oops_pages = INT_MAX / record_size;
> >  	else
> > -		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
> > +		cxt->oops_pages = (int)mtd->size / record_size;
> 
> BTW, this INT_MAX and the (int) cast also suggests we need to limit the
> maximum partition size and add a check for this.

OK, I'll make a patch to limit this.

// Simon
