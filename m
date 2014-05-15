Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wl24f-0002Fy-7e
 for linux-mtd@lists.infradead.org; Thu, 15 May 2014 20:16:17 +0000
Date: Thu, 15 May 2014 17:15:18 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/4] mtd: Introduce mtd_block_isreserved()
Message-ID: <20140515201518.GA18864@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140513013133.GA28907@ld-irv-0074>
 <20140514233721.GA19700@arch.cereza>
 <20140514235705.GK28907@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140514235705.GK28907@ld-irv-0074>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 May 04:57 PM, Brian Norris wrote:
> On Wed, May 14, 2014 at 08:37:21PM -0300, Ezequiel Garcia wrote:
> > On 12 May 06:31 PM, Brian Norris wrote:
> > > On Fri, Mar 21, 2014 at 08:57:43AM -0300, Ezequiel Garcia wrote:
> > [..]
> > > >  
> > > > +int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> > > > +{
> > > > +	if (!mtd->_block_isreserved)
> > > > +		return 0;
> > > > +	if (ofs < 0 || ofs > mtd->size)
> > > > +		return -EINVAL;
> > > 
> > > At first, I was going to recommend that the out-of-bounds check go
> > > before the !mtd->_block_isreserved check, since it's best to warn users
> > > for invalid input. But then, mtd_block_isbad() has the same ordering, so
> > > it'd be nice to consistent...
> > > 
> > > Do we flip a coin to decide whether to change both or leave as-is? :)
> > > 
> > 
> > Actually, I just followed the same convention as all the other functions,
> > not just mtd_block_isbad().
> 
> All? Like what? mtd_read_oob()? mtd_get_fact_prot_info()? These return
> -EOPNOTSUPP, which is an informative error code. But that's different
> than returning 0 for mtd_block_isbad() or mtd_block_isreserved(), even
> if the block doesn't exist.
> 

Ah... I misunderstood your comment. The point is that you don't want to
return 0, when the parameters may be are wrong.

So, I'll fix this patch by changing both, mtd_block_isbad and
mtd_block_isreserved, just as you asked in the first place.

> 
> (Also, is it just me, or is mtd_writev() missing bounds checking?)
> 

Hm... so it seems. I guess the check should be something like:

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d201fee..21ce0f4 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1066,11 +1066,22 @@ static int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen)
 {
+	int i;
+
 	*retlen = 0;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 	if (!mtd->_writev)
 		return default_mtd_writev(mtd, vecs, count, to, retlen);
+
+	if (to < 0 || to > mtd->size)
+		return -EINVAL;
+	for (i = 0; i < count; i++) {
+		if (!vecs[i].iov_len)
+			continue;
+		if (vecs[i].iov_len > mtd->size - to)
+			return -EINVAL;
+	}
 	return mtd->_writev(mtd, vecs, count, to, retlen);
 }
 EXPORT_SYMBOL_GPL(mtd_writev);

Right?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
