Received: from outbound0.sv.meer.net ([205.217.152.13])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CG0ts-00028W-Ef
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 15:59:38 -0400
Message-ID: <019301c4ad6e$33e3c730$0400a8c0@mark>
From: "Mark Hamilton" <mhamilton@alliantnetworks.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 8 Oct 2004 12:37:07 -0700
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0190_01C4AD33.862BA0C0"
Cc: 
Subject: GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0190_01C4AD33.862BA0C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

There looks to be a bug with the eCos port on how garbage collection is
done. I sent a notice about this bug before but I didn't get a resolution.
Another fellow came across the same bug and verified my fix. The bug seems
specific to eCos because of how jffs2_gc_fetch_page was ported but the
proposed fix is applied to gc.c. Since the gc.c is a JFFS2 core file, I
guess this is the appropriate mailing list for posting the patch. The patch
is attached.

Here is the problem.
ffs2_gc_fetch_page reads 4K of data into a static buffer. The static buffer
is hidden in the jffs2_gc_fetch_page function. The problem is when the
writebuf pointer is calculated. The offset is used again to reference into
the pg_ptr. You can image when start is equal to 4K that writebuf will
extend beyond the end of the pg_ptr valid memory. Offset is set to start
just before the while loop.

I made a comment below with what I think the fix should be.
Am I missing something?

            pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
            if (IS_ERR(pg_ptr)) {
                printk(KERN_WARNING "read_cache_page() returned error:
%ld\n",
                PTR_ERR(pg_ptr));
                return PTR_ERR(pg_ptr);
            }
            offset = start;
            while(offset < orig_end) {
                        uint32_t datalen;
                        uint32_t cdatalen;
                        char comprtype = JFFS2_COMPR_NONE;
                        ret = jffs2_reserve_space_gc(c, sizeof(ri) +
JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen);
                        if (ret) {
                            printk(KERN_WARNING "jffs2_reserve_space_gc of
%zd bytes for
                                       garbage_collect_dnode failed: %d\n",
                                         sizeof(ri)+ JFFS2_MIN_DATA_LEN,
ret);
                                    break;
                        }
                        cdatalen = min_t(uint32_t, alloclen - sizeof(ri),
end - offset);
                        datalen = end - offset;
                        // This looks to be wrong.
                        writebuf = pg_ptr + (offset & PAGE_CACHE_SIZE -1));
                        // I think it should be.
                        writebuf = pg_ptr + ((offset -start) &
(PAGE_CACHE_SIZE -1));

The patch uses a define(__ECOS) to fix this problem.

------=_NextPart_000_0190_01C4AD33.862BA0C0
Content-Type: application/octet-stream;
	name="gc.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="gc.patch"

Index: gc.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/ecos_artisan/packages/fs/jffs2/current/src/gc.c,v=0A=
retrieving revision 1.5=0A=
diff -u -F^f -r1.5 gc.c=0A=
--- gc.c	22 Jul 2004 21:35:32 -0000	1.5=0A=
+++ gc.c	6 Oct 2004 15:09:18 -0000=0A=
@@ -1188,7 +1188,15 @@=0A=
 		cdatalen =3D min_t(uint32_t, alloclen - sizeof(ri), end - offset);=0A=
 		datalen =3D end - offset;=0A=
 =0A=
+#if defined(__ECOS)=0A=
+    /* =0A=
+       For the eCos port, jffs2_gc_fetch_page above reads 4K into a =
static =0A=
+       buffer. =0A=
+    */=0A=
+		writebuf =3D pg_ptr + ((offset-start) & (PAGE_CACHE_SIZE -1));=0A=
+#else=0A=
 		writebuf =3D pg_ptr + (offset & (PAGE_CACHE_SIZE -1));=0A=
+#endif=0A=
 =0A=
 		comprtype =3D jffs2_compress(c, f, writebuf, &comprbuf, &datalen, =
&cdatalen);=0A=
 =0A=

------=_NextPart_000_0190_01C4AD33.862BA0C0--
