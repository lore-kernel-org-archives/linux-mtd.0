Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwffE-0007XW-EO
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 13:05:21 +0000
Message-ID: <43C50274.8060606@intel.com>
Date: Wed, 11 Jan 2006 16:04:52 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: "Zhao, Forrest" <forrest.zhao@intel.com>, dedekind@infradead.org
References: <1135735258.3155.8.camel@localhost.localdomain>
In-Reply-To: <1135735258.3155.8.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] JFFS2 kernel panics fixup on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

I verified the latest mtd snapshot it looks it still doesn't contain 
fixes I sent.
Would you please review and checkin the patch if nobody has complains 
about it .

Zhao,
We did some tests on four* differe*nt h/w configurations including 
Generic NOR, Sibley, NAND.
JFFS2 with the patch works fine. Without it we have kernel panics on 
configuration with Sibley.

Thanks,
Alexey

> On Tue, 2005-12-27 at 16:07 +0300, Alexey, Korolev wrote:
>
> > =======================================
> > 
> > diff -aur c/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
> > --- c/fs/jffs2/nodelist.c 2005-12-23 16:43:09.000000000 +0300
> > +++ b/fs/jffs2/nodelist.c 2005-12-23 16:48:43.000000000 +0300
> > @@ -436,7 +436,7 @@
> >    * adding and jffs2_flash_read_end() interface. */
> >   if (c->mtd->point) {
> >    err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
> > -  if (!err && retlen < tn->csize) {
> > +  if (!err && retlen < len) {
> >     JFFS2_WARNING("MTD point returned len too short: %u instead of
> > %u.\n", retlen, tn->csize);
> >     c->mtd->unpoint(c->mtd, buffer, ofs, len);
> >    } else if (err)
> > diff -aur c/fs/jffs2/scan.c b/fs/jffs2/scan.c
> > --- c/fs/jffs2/scan.c 2005-12-23 16:43:09.000000000 +0300
> > +++ b/fs/jffs2/scan.c 2005-12-23 16:48:43.000000000 +0300
> > @@ -454,7 +454,7 @@
> >     buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size 
> - ofs);
> >     D1(printk(KERN_DEBUG "Fewer than %zd bytes (node header) left to 
> end
> > of buf. Reading 0x%x at 0x%08x\n",
> >        sizeof(struct jffs2_unknown_node), buf_len, ofs));
> > -   err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
> > +   err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
> >     if (err)
> >      return err;
> >     buf_ofs = ofs;
> > @@ -511,7 +511,7 @@
> >      break;
> >     }
> >     D1(printk(KERN_DEBUG "Reading another 0x%x at 0x%08x\n", 
> buf_len, ofs));
> > -   err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
> > +   err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
> >     if (err)
> >      return err;
> >     buf_ofs = ofs;
> > @@ -587,7 +587,7 @@
> >      buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size -
> > ofs);
> >      D1(printk(KERN_DEBUG "Fewer than %zd bytes (inode node) left to 
> end
> > of buf. Reading 0x%x at 0x%08x\n",
> >         sizeof(struct jffs2_raw_inode), buf_len, ofs));
> > -    err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
> > +    err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
> >      if (err)
> >       return err;
> >      buf_ofs = ofs;
> > @@ -603,7 +603,7 @@
> >      buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size -
> > ofs);
> >      D1(printk(KERN_DEBUG "Fewer than %d bytes (dirent node) left to 
> end
> > of buf. Reading 0x%x at 0x%08x\n",
> >         je32_to_cpu(node->totlen), buf_len, ofs));
> > -    err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
> > +    err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
> >      if (err)
> >       return err;
> >      buf_ofs = ofs;
> > @@ -650,7 +650,7 @@
> >     } else {
> >      if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
> >       buf_len = min_t(uint32_t, buf_size, jeb->offset + 
> c->sector_size -
> > ofs);
> > -     err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
> > +     err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
> >       if (err)
> >        return err;
> >       buf_ofs = ofs;
>
> Artem,
>
> I reviewed the part of this patch for EBH, the above remaining
> part need your review before we could check in the patch to CVS.
>
> Alexey,
>
> I don't have a Sibley flash at hand, so didn't do intensive
> test for it. Thank you for the fix.
>
> Thanks,
> Forrest
>
>
