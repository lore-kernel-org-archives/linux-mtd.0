Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkj3D-0008Ex-JI
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 23:57:31 +0000
Received: by mail-pa0-f45.google.com with SMTP id ey11so256743pad.32
 for <linux-mtd@lists.infradead.org>; Wed, 14 May 2014 16:57:08 -0700 (PDT)
Date: Wed, 14 May 2014 16:57:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: Introduce mtd_block_isreserved()
Message-ID: <20140514235705.GK28907@ld-irv-0074>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140513013133.GA28907@ld-irv-0074>
 <20140514233721.GA19700@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140514233721.GA19700@arch.cereza>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 14, 2014 at 08:37:21PM -0300, Ezequiel Garcia wrote:
> On 12 May 06:31 PM, Brian Norris wrote:
> > On Fri, Mar 21, 2014 at 08:57:43AM -0300, Ezequiel Garcia wrote:
> [..]
> > >  
> > > +int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> > > +{
> > > +	if (!mtd->_block_isreserved)
> > > +		return 0;
> > > +	if (ofs < 0 || ofs > mtd->size)
> > > +		return -EINVAL;
> > 
> > At first, I was going to recommend that the out-of-bounds check go
> > before the !mtd->_block_isreserved check, since it's best to warn users
> > for invalid input. But then, mtd_block_isbad() has the same ordering, so
> > it'd be nice to consistent...
> > 
> > Do we flip a coin to decide whether to change both or leave as-is? :)
> > 
> 
> Actually, I just followed the same convention as all the other functions,
> not just mtd_block_isbad().

All? Like what? mtd_read_oob()? mtd_get_fact_prot_info()? These return
-EOPNOTSUPP, which is an informative error code. But that's different
than returning 0 for mtd_block_isbad() or mtd_block_isreserved(), even
if the block doesn't exist.

> I'll add a patch changing them all so the parameters checking is done first.

Can you mention which ones you think are problematic before adding
another patch? I'd be careful on playing with error codes for APIs that
are already have reasonable enough error codes. AFAICT,
mtd_block_isbad() (and your mtd_block_isreserved()) are the only
problems.

(Also, is it just me, or is mtd_writev() missing bounds checking?)

Brian
