Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSIqK-0003f2-HX
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 08:38:15 +0000
Date: Fri, 22 Dec 2017 09:37:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v3 3/4] mtd: Stop directly calling master ->_xxx() hooks
 from mtdpart code
Message-ID: <20171222093750.0c49abec@bbrezillon>
In-Reply-To: <CAAyFORLBhxpn5cFHztrY5OHt9FCfbDkQzUCsLf2Wyp2aGzPGnA@mail.gmail.com>
References: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
 <20171215123954.30017-4-boris.brezillon@free-electrons.com>
 <CAAyFORLBhxpn5cFHztrY5OHt9FCfbDkQzUCsLf2Wyp2aGzPGnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 Dec 2017 13:40:26 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> Hi Boris,
> 
> On Fri, Dec 15, 2017 at 8:39 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > The MTD layer provides several wrappers around mtd->_xxx() hooks. Call
> > these wrappers instead of directly dereferencing the associated ->_xxx()
> > pointer.
> >
> > This change has been motivated by another rework letting the core
> > handle the case where ->_read/write_oob() are implemented but not  
> > ->_read/write(). In this case, we want mtd_read/write() to fall back to
> > ->_read/write_oob() when ->_read/write() are NULL. The problem is,  
> > mtdpart is directly calling the ->_xxx() instead of using the wrappers,
> > thus leading to a NULL pointer exception.
> >
> > Even though we only need to do the change for part_read/write(), going
> > through those wrappers for all kind of part -> master operation
> > propagation is a good thing, because other wrappers might become
> > smarter over time, and the duplicated check overhead (parameters will
> > be checked at the partition and master level instead of only at the
> > partition level) should be negligible.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > Changes in v3:
> > - unconditionally assign part wrappers as suggested by Brian
> >
> > Changes in v2:
> > - new patch needed to fix a NULL pointer dereference BUG
> > ---
> >  drivers/mtd/mtdpart.c | 141 +++++++++++++++++++-------------------------------
> >  1 file changed, 53 insertions(+), 88 deletions(-)
> >
> > diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> > index be088bccd593..e83c9d870b11 100644
> > --- a/drivers/mtd/mtdpart.c
> > +++ b/drivers/mtd/mtdpart.c
> > @@ -74,8 +74,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
> >         int res;
> >  
> 
> This is not about your modification. But shouldn't we add check to prevent
> part_read/write/write_oob from accessing  past the end of partition?
> There is a check in part_read_oob() only.

You should not call part_xxx() directly, and mtd_read/write{_oob}()
should already check that. If that's not the case, we should fix them.

Can you give a bit more details about what is wrong?

Thanks,

Boris

> 
> Thanks
> Peter Pan
> 
> >         stats = part->parent->ecc_stats;
> > -       res = part->parent->_read(part->parent, from + part->offset, len,
> > -                                 retlen, buf);
> > +       res = mtd_read(part->parent, from + part->offset, len, retlen, buf);
> >         if (unlikely(mtd_is_eccerr(res)))
> >                 mtd->ecc_stats.failed +=
> >                         part->parent->ecc_stats.failed - stats.failed;
> > @@ -90,15 +89,15 @@ static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> >
> > -       return part->parent->_point(part->parent, from + part->offset, len,
> > -                                   retlen, virt, phys);
> > +       return mtd_point(part->parent, from + part->offset, len, retlen, virt,
> > +                        phys);
> >  }
> >
> >  static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> >
> > -       return part->parent->_unpoint(part->parent, from + part->offset, len);
> > +       return mtd_unpoint(part->parent, from + part->offset, len);
> >  }
> >
> >  static int part_read_oob(struct mtd_info *mtd, loff_t from,
> > @@ -126,7 +125,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
> >                         return -EINVAL;
> >         }
> >
> > -       res = part->parent->_read_oob(part->parent, from + part->offset, ops);
> > +       res = mtd_read_oob(part->parent, from + part->offset, ops);
> >         if (unlikely(res)) {
> >                 if (mtd_is_bitflip(res))
> >                         mtd->ecc_stats.corrected++;
> > @@ -140,48 +139,43 @@ static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
> >                 size_t len, size_t *retlen, u_char *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_read_user_prot_reg(part->parent, from, len,
> > -                                                retlen, buf);
> > +       return mtd_read_user_prot_reg(part->parent, from, len, retlen, buf);
> >  }
> >
> >  static int part_get_user_prot_info(struct mtd_info *mtd, size_t len,
> >                                    size_t *retlen, struct otp_info *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_get_user_prot_info(part->parent, len, retlen,
> > -                                                buf);
> > +       return mtd_get_user_prot_info(part->parent, len, retlen, buf);
> >  }
> >
> >  static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
> >                 size_t len, size_t *retlen, u_char *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_read_fact_prot_reg(part->parent, from, len,
> > -                                                retlen, buf);
> > +       return mtd_read_fact_prot_reg(part->parent, from, len, retlen, buf);
> >  }
> >
> >  static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
> >                                    size_t *retlen, struct otp_info *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_get_fact_prot_info(part->parent, len, retlen,
> > -                                                buf);
> > +       return mtd_get_fact_prot_info(part->parent, len, retlen, buf);
> >  }
> >
> >  static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
> >                 size_t *retlen, const u_char *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_write(part->parent, to + part->offset, len,
> > -                                   retlen, buf);
> > +       return mtd_write(part->parent, to + part->offset, len, retlen, buf);
> >  }
> >
> >  static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
> >                 size_t *retlen, const u_char *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_panic_write(part->parent, to + part->offset, len,
> > -                                         retlen, buf);
> > +       return mtd_panic_write(part->parent, to + part->offset, len, retlen,
> > +                              buf);
> >  }
> >
> >  static int part_write_oob(struct mtd_info *mtd, loff_t to,
> > @@ -193,30 +187,29 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
> >                 return -EINVAL;
> >         if (ops->datbuf && to + ops->len > mtd->size)
> >                 return -EINVAL;
> > -       return part->parent->_write_oob(part->parent, to + part->offset, ops);
> > +       return mtd_write_oob(part->parent, to + part->offset, ops);
> >  }
> >
> >  static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
> >                 size_t len, size_t *retlen, u_char *buf)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_write_user_prot_reg(part->parent, from, len,
> > -                                                 retlen, buf);
> > +       return mtd_write_user_prot_reg(part->parent, from, len, retlen, buf);
> >  }
> >
> >  static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
> >                 size_t len)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_lock_user_prot_reg(part->parent, from, len);
> > +       return mtd_lock_user_prot_reg(part->parent, from, len);
> >  }
> >
> >  static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
> >                 unsigned long count, loff_t to, size_t *retlen)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_writev(part->parent, vecs, count,
> > -                                    to + part->offset, retlen);
> > +       return mtd_writev(part->parent, vecs, count, to + part->offset,
> > +                         retlen);
> >  }
> >
> >  static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
> > @@ -225,7 +218,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
> >         int ret;
> >
> >         instr->addr += part->offset;
> > -       ret = part->parent->_erase(part->parent, instr);
> > +       ret = mtd_erase(part->parent, instr);
> >         if (ret) {
> >                 if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
> >                         instr->fail_addr -= part->offset;
> > @@ -251,51 +244,51 @@ EXPORT_SYMBOL_GPL(mtd_erase_callback);
> >  static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_lock(part->parent, ofs + part->offset, len);
> > +       return mtd_lock(part->parent, ofs + part->offset, len);
> >  }
> >
> >  static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_unlock(part->parent, ofs + part->offset, len);
> > +       return mtd_unlock(part->parent, ofs + part->offset, len);
> >  }
> >
> >  static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_is_locked(part->parent, ofs + part->offset, len);
> > +       return mtd_is_locked(part->parent, ofs + part->offset, len);
> >  }
> >
> >  static void part_sync(struct mtd_info *mtd)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       part->parent->_sync(part->parent);
> > +       mtd_sync(part->parent);
> >  }
> >
> >  static int part_suspend(struct mtd_info *mtd)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_suspend(part->parent);
> > +       return mtd_suspend(part->parent);
> >  }
> >
> >  static void part_resume(struct mtd_info *mtd)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       part->parent->_resume(part->parent);
> > +       mtd_resume(part->parent);
> >  }
> >
> >  static int part_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> >         ofs += part->offset;
> > -       return part->parent->_block_isreserved(part->parent, ofs);
> > +       return mtd_block_isreserved(part->parent, ofs);
> >  }
> >
> >  static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> >         ofs += part->offset;
> > -       return part->parent->_block_isbad(part->parent, ofs);
> > +       return mtd_block_isbad(part->parent, ofs);
> >  }
> >
> >  static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
> > @@ -304,7 +297,7 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
> >         int res;
> >
> >         ofs += part->offset;
> > -       res = part->parent->_block_markbad(part->parent, ofs);
> > +       res = mtd_block_markbad(part->parent, ofs);
> >         if (!res)
> >                 mtd->ecc_stats.badblocks++;
> >         return res;
> > @@ -313,13 +306,13 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
> >  static int part_get_device(struct mtd_info *mtd)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       return part->parent->_get_device(part->parent);
> > +       return __get_mtd_device(part->parent);
> >  }
> >
> >  static void part_put_device(struct mtd_info *mtd)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> > -       part->parent->_put_device(part->parent);
> > +       __put_mtd_device(part->parent);
> >  }
> >
> >  static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
> > @@ -347,8 +340,7 @@ static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
> >  {
> >         struct mtd_part *part = mtd_to_part(mtd);
> >
> > -       return part->parent->_max_bad_blocks(part->parent,
> > -                                            ofs + part->offset, len);
> > +       return mtd_max_bad_blocks(part->parent, ofs + part->offset, len);
> >  }
> >
> >  static inline void free_partition(struct mtd_part *p)
> > @@ -437,59 +429,32 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
> >
> >         slave->mtd._read = part_read;
> >         slave->mtd._write = part_write;
> > -
> > -       if (parent->_panic_write)
> > -               slave->mtd._panic_write = part_panic_write;
> > -
> > -       if (parent->_point && parent->_unpoint) {
> > -               slave->mtd._point = part_point;
> > -               slave->mtd._unpoint = part_unpoint;
> > -       }
> > -
> > -       if (parent->_read_oob)
> > -               slave->mtd._read_oob = part_read_oob;
> > -       if (parent->_write_oob)
> > -               slave->mtd._write_oob = part_write_oob;
> > -       if (parent->_read_user_prot_reg)
> > -               slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
> > -       if (parent->_read_fact_prot_reg)
> > -               slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
> > -       if (parent->_write_user_prot_reg)
> > -               slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
> > -       if (parent->_lock_user_prot_reg)
> > -               slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
> > -       if (parent->_get_user_prot_info)
> > -               slave->mtd._get_user_prot_info = part_get_user_prot_info;
> > -       if (parent->_get_fact_prot_info)
> > -               slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
> > -       if (parent->_sync)
> > -               slave->mtd._sync = part_sync;
> > -       if (!partno && !parent->dev.class && parent->_suspend &&
> > -           parent->_resume) {
> > +       slave->mtd._panic_write = part_panic_write;
> > +       slave->mtd._point = part_point;
> > +       slave->mtd._unpoint = part_unpoint;
> > +       slave->mtd._read_oob = part_read_oob;
> > +       slave->mtd._write_oob = part_write_oob;
> > +       slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
> > +       slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
> > +       slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
> > +       slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
> > +       slave->mtd._get_user_prot_info = part_get_user_prot_info;
> > +       slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
> > +       slave->mtd._sync = part_sync;
> > +       if (!partno && !parent->dev.class) {
> >                 slave->mtd._suspend = part_suspend;
> >                 slave->mtd._resume = part_resume;
> >         }
> > -       if (parent->_writev)
> > -               slave->mtd._writev = part_writev;
> > -       if (parent->_lock)
> > -               slave->mtd._lock = part_lock;
> > -       if (parent->_unlock)
> > -               slave->mtd._unlock = part_unlock;
> > -       if (parent->_is_locked)
> > -               slave->mtd._is_locked = part_is_locked;
> > -       if (parent->_block_isreserved)
> > -               slave->mtd._block_isreserved = part_block_isreserved;
> > -       if (parent->_block_isbad)
> > -               slave->mtd._block_isbad = part_block_isbad;
> > -       if (parent->_block_markbad)
> > -               slave->mtd._block_markbad = part_block_markbad;
> > -       if (parent->_max_bad_blocks)
> > -               slave->mtd._max_bad_blocks = part_max_bad_blocks;
> > -
> > -       if (parent->_get_device)
> > -               slave->mtd._get_device = part_get_device;
> > -       if (parent->_put_device)
> > -               slave->mtd._put_device = part_put_device;
> > +       slave->mtd._writev = part_writev;
> > +       slave->mtd._lock = part_lock;
> > +       slave->mtd._unlock = part_unlock;
> > +       slave->mtd._is_locked = part_is_locked;
> > +       slave->mtd._block_isreserved = part_block_isreserved;
> > +       slave->mtd._block_isbad = part_block_isbad;
> > +       slave->mtd._block_markbad = part_block_markbad;
> > +       slave->mtd._max_bad_blocks = part_max_bad_blocks;
> > +       slave->mtd._get_device = part_get_device;
> > +       slave->mtd._put_device = part_put_device;
> >
> >         slave->mtd._erase = part_erase;
> >         slave->parent = parent;
> > --
> > 2.11.0
> >  
