Received: from outbound0.sv.meer.net ([205.217.152.13])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C5R7F-0005sh-Qp
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2004 11:45:43 -0400
Received: from mail.meer.net (mail.meer.net [209.157.152.14])
	by outbound0.sv.meer.net (8.12.10/8.12.6) with ESMTP id i89FjAr2034315
	for <linux-mtd@lists.infradead.org>;
	Thu, 9 Sep 2004 08:45:10 -0700 (PDT)
	(envelope-from mhamilton@alliantnetworks.com)
Received: from mark (covad-alliant.meer.net [209.157.145.9])
	by mail.meer.net (8.12.1/8.12.2/meer) with SMTP id i89FiHaa040177
	for <linux-mtd@lists.infradead.org>;
	Thu, 9 Sep 2004 08:44:22 -0700 (PDT)
	(envelope-from mhamilton@alliantnetworks.com)
Message-ID: <000d01c49683$d77d6ce0$dafd000a@mark>
From: "Mark Hamilton" <mhamilton@alliantnetworks.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 9 Sep 2004 08:44:05 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: File truncation in eCos
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using the JFFS file system and I'm having problems with files being
truncated during garbage collection. I believe I've tracked down the
problem. I'm hoping someone can give me positive feedback on my fix. The
problem is in this snippet of code below:





Jffs2_gc_fetch_page reads 4K of data into a static buffer. The static buffer
is hidden in the jffs2_gc_fetch_page function. The problem is when the
writebuf pointer is calculated. The offset is used again to reference into
the pg_ptr. You can image when start is equal to 4K that writebuf will
extend beyond the end of the pg_ptr valid memory. Offset is set to start
just before the while loop.

I made a comment below with what I think the fix should be.
Am I missing something?

  pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);

  if (IS_ERR(pg_ptr)) {
    printk(KERN_WARNING "read_cache_page() returned error: %ld\n",
              PTR_ERR(pg_ptr));
     return PTR_ERR(pg_ptr);
  }
   offset = start;
   while(offset < orig_end) {
     uint32_t datalen;
     uint32_t cdatalen;
     char comprtype = JFFS2_COMPR_NONE;
     ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN,
&phys_ofs,
                                                   &alloclen);
     if (ret) {
      printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for
                garbage_collect_dnode failed: %d\n",
                sizeof(ri)+ JFFS2_MIN_DATA_LEN, ret);
      break;
   }

   cdatalen = min_t(uint32_t, alloclen - sizeof(ri), end - offset);
   datalen = end - offset;

    // This looks to be wrong.
    writebuf = pg_ptr + (offset & (PAGE_CACHE_SIZE -1));
    // I think it should be.
    writebuf = pg_ptr + ((offset -start) & (PAGE_CACHE_SIZE -1));
