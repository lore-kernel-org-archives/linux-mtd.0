Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6iDq-0004IV-G3
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 11:13:15 +0000
Received: by gxk7 with SMTP id 7so313379gxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 04:13:12 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 Oct 2010 12:13:11 +0100
Message-ID: <AANLkTi=dc4TSda9218MDJjtqNbGH=wTykt2kEppwLWck@mail.gmail.com>
Subject: Understanding OOB data read implementation
From: David Peverley <pev@sketchymonkey.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I've been adding OOB data read support into a driver I'm working with
and I'm trying to understand how the offset works. As a starting point
I picked the doc2000.c driver (From the latest kernel.org 2.6.35.7
kernel)

The following happens in the driver :
    static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
                            struct mtd_oob_ops *ops)
    {
            ...
            ofs += ops->ooboffs;
            ...

This is what I don't understand - why does ofs have ooboffs added? In
the MTD char driver mtdchar.c the oob's read gets set up thus :
    static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
            uint32_t length, void __user *ptr, uint32_t __user *retp)
    {
        ...
        ops.ooboffs = start & (mtd->oobsize - 1);
        ...
        start &= ~((uint64_t)mtd->oobsize - 1);
        ret = mtd->read_oob(mtd, start, &ops);
        ...

So... my reading of this is that the requested OOB read offset is
passed into mtd_do_readoob() as the "start" parameter. This is then
copied into the ops structure and passed in to read_oob() as two
copies (via start and again inside the ops structure). This same logic
is also followed in doc2001.c and doc2001plus.c.

If that's the case, I don't understand why in doc2000.c it's being
added - is this not effectively using *double* the requested offset?

Also as a side note I suspect that mtd_do_readoob() would be a smidge
clearer if the above was re-factored to avoid the duplication of the
masking to oobsize :
    static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
            uint32_t length, void __user *ptr, uint32_t __user *retp)
    {
        ...
        start &= ~((uint64_t)mtd->oobsize - 1);
        ...
        ops.ooboffs = start;
        ...
        ret = mtd->read_oob(mtd, start, &ops);
        ...

Cheers all!

~Pev
