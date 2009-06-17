Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MGpxp-00020V-FG
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 07:53:52 +0000
Received: by an-out-0708.google.com with SMTP id d14so72348and.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Jun 2009 00:53:44 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 17 Jun 2009 15:53:43 +0800
Message-ID: <d16af8a00906170053p11a4f0e3vd0bbef99d65b9aac@mail.gmail.com>
Subject: how to implement prepare_write, commit_write for ubifs
From: Ivan Chan <ivanming@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am porting UBIFS/UBI to 2.6.4 kernel, however, 2.6.4 kernel requires
prepare_write, commit_write in address_space_operations (defined in
include/linux/fs.h),
but it is no longer exists in 2.6.2x kernel.

How can I rewrite these function for 2.6.4 kernel?

In 2.6.2x, there is similar function write_begin, and write_end, but
the API requires
struct address_space *mapping,=A0 struct page **pagep, void **fsdata,

Is that possible and how to provide this argument in 2.6.4 kernel?

Regards,
Ivan

2.6.x
struct address_space_operations {
=A0=A0=A0 int (*writepage)(struct page *page, struct writeback_control *wbc=
);
=A0=A0=A0 int (*readpage)(struct file *, struct page *);
=A0=A0=A0 int (*sync_page)(struct page *);

=A0=A0=A0 /* Write back some dirty pages from this mapping. */
=A0=A0=A0 int (*writepages)(struct address_space *, struct writeback_contro=
l *);

=A0=A0=A0 /* Set a page dirty */
=A0=A0=A0 int (*set_page_dirty)(struct page *page);

=A0=A0=A0 int (*readpages)(struct file *filp, struct address_space *mapping=
,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 struct list_head *pages, unsigned nr_pages);

=A0=A0=A0 /*
=A0=A0=A0 =A0* ext3 requires that a successful prepare_write() call be foll=
owed
=A0=A0=A0 =A0* by a commit_write() call - they must be balanced
=A0=A0=A0 =A0*/
=A0=A0=A0 int (*prepare_write)(struct file *, struct page *, unsigned, unsi=
gned);
=A0=A0=A0 int (*commit_write)(struct file *, struct page *, unsigned, unsig=
ned);
=A0=A0=A0 /* Unfortunately this kludge is needed for FIBMAP. Don't use it *=
/
=A0=A0=A0 sector_t (*bmap)(struct address_space *, sector_t);
=A0=A0=A0 int (*invalidatepage) (struct page *, unsigned long);
=A0=A0=A0 int (*releasepage) (struct page *, int);
=A0=A0=A0 int (*direct_IO)(int, struct kiocb *, const struct iovec *iov,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 loff_t offset, unsigned long nr_segs);
};

2.6.2x

struct address_space_operations {
=A0=A0=A0 int (*writepage)(struct page *page, struct writeback_control *wbc=
);
=A0=A0=A0 int (*readpage)(struct file *, struct page *);
=A0=A0=A0 void (*sync_page)(struct page *);

=A0=A0=A0 /* Write back some dirty pages from this mapping. */
=A0=A0=A0 int (*writepages)(struct address_space *, struct writeback_contro=
l *);

=A0=A0=A0 /* Set a page dirty.=A0 Return true if this dirtied it */
=A0=A0=A0 int (*set_page_dirty)(struct page *page);

=A0=A0=A0 int (*readpages)(struct file *filp, struct address_space *mapping=
,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 struct list_head *pages, unsigned nr_pages);

=A0=A0=A0 int (*write_begin)(struct file *, struct address_space *mapping,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 loff_t pos, unsigned len, unsigned =
flags,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 struct page **pagep, void **fsdata)=
;
=A0=A0=A0 int (*write_end)(struct file *, struct address_space *mapping,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 loff_t pos, unsigned len, unsigned =
copied,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 struct page *page, void *fsdata);

=A0=A0=A0 /* Unfortunately this kludge is needed for FIBMAP. Don't use it *=
/
=A0=A0=A0 sector_t (*bmap)(struct address_space *, sector_t);
=A0=A0=A0 void (*invalidatepage) (struct page *, unsigned long);
=A0=A0=A0 int (*releasepage) (struct page *, gfp_t);
=A0=A0=A0 ssize_t (*direct_IO)(int, struct kiocb *, const struct iovec *iov=
,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 loff_t offset, unsigned long nr_segs);
=A0=A0=A0 int (*get_xip_mem)(struct address_space *, pgoff_t, int,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 void **, unsign=
ed long *);
=A0=A0=A0 /* migrate the contents of a page to the specified target */
=A0=A0=A0 int (*migratepage) (struct address_space *,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 struct page *, struct page *);
=A0=A0=A0 int (*launder_page) (struct page *);
=A0=A0=A0 int (*is_partially_uptodate) (struct page *, read_descriptor_t *,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 unsigned long);
};
