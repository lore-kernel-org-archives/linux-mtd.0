Received: from mail128.messagelabs.com ([216.82.250.131])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxvS3-0001ug-4o
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2007 21:45:48 -0400
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l5C1jeZt024580
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Jun 2007 18:45:40 -0700 (MST)
Received: from il06vts04.mot.com (il06vts04.mot.com [129.188.137.144])
	by il06exr04.mot.com (8.13.1/Vontu) with SMTP id l5C1jdcT016954
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Jun 2007 20:45:39 -0500 (CDT)
Received: from de01exm63.ds.mot.com (de01exm63.am.mot.com [10.176.8.108])
	by il06exr04.mot.com (8.13.1/8.13.0) with ESMTP id l5C1jcTN016943
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Jun 2007 20:45:39 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: JFFS2 deadlock with alloc_sem
Date: Mon, 11 Jun 2007 21:45:37 -0400
Message-ID: <F0A7A3D5461CB54F878D218854074FCE021A9529@de01exm63.ds.mot.com>
In-Reply-To: <1181564059.2801.93.camel@pmac.infradead.org>
References: <1181330764.10571.34.camel@kleikamp.austin.ibm.com>
	<1181564059.2801.93.camel@pmac.infradead.org>
From: "Roberts Nathan-mcg31137" <Nathan.Roberts@motorola.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Dave Kleikamp" <shaggy@linux.vnet.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> On Fri, 2007-06-08 at 14:26 -0500, Dave Kleikamp wrote:
> > Forgive me for not following up properly, but I'm not on the mailing

> > list, and I'm following up from the archives.
>
> Hm, sorry about that. The archives should be fixed (again) now -- if
you use the mailto: link at the top of an archived mail such as the >
one at
http://lists.infradead.org/pipermail/linux-mtd/2007-June/018477.html
> your response should have a correct In-Reply-To: header and be part of
the thread.
>
> > What do you think of this patch, and does it have any affect on=20
> > Nathan's deadlock?
>
> It looks sensible. Nathan?

We tried the patch at the bottom of this email(please let us know if
this doesn't look correct). We're now able to reproduce the hang even
quicker than before. Within a few seconds it will hang with these
backtraces. Is there any additional data we can provide that would help
narrow this down?=20


[<c02403e0>] (__schedule+0x0/0x5b0) from [<c0240afc>]
(schedule+0xec/0x124)
[<c0240a10>] (schedule+0x0/0x124) from [<c023ffb0>]
(__compat_down+0xe0/0x178)
 r4 =3D C0A4A000=20
[<c023fed0>] (__compat_down+0x0/0x178) from [<c023fe6c>]
(__compat_down_failed+0xc
/0x20)
 r8 =3D C2C2A42C  r7 =3D C32262E8  r6 =3D C32262E8  r5 =3D C2C2A400
 r4 =3D C322630C=20
[<c00d6090>] (jffs2_reserve_space+0x0/0x268) from [<c00d85e4>]
(jffs2_write_inode_
range+0x5c/0x468)
[<c00d8588>] (jffs2_write_inode_range+0x0/0x468) from [<c00d35dc>]
(jffs2_commit_w
rite+0x1b0/0x31c)
[<c00d342c>] (jffs2_commit_write+0x0/0x31c) from [<c0063e10>]
(generic_file_buffer
ed_write+0x3e4/0x64c)
[<c0063a2c>] (generic_file_buffered_write+0x0/0x64c) from [<c0064700>]
(__generic_
file_aio_write_nolock+0x488/0x4b4)
[<c0064278>] (__generic_file_aio_write_nolock+0x0/0x4b4) from
[<c00647ac>] (__gene
ric_file_write_nolock+0x80/0xac)
[<c006472c>] (__generic_file_write_nolock+0x0/0xac) from [<c00648fc>]
(generic_fil
e_write+0x58/0xdc)
 r9 =3D C0A4A000  r8 =3D C245F820  r6 =3D 4001E008  r5 =3D C245F8BC
 r4 =3D C245F88C=20
[<c00648a4>] (generic_file_write+0x0/0xdc) from [<c007f3ec>]
(vfs_write+0xec/0x170
)
[<c007f300>] (vfs_write+0x0/0x170) from [<c007f52c>]
(sys_write+0x48/0x74)
 r8 =3D C0025154  r7 =3D 00000004  r6 =3D C1C560E0  r5 =3D 00000000
 r4 =3D 0001B000=20
[<c007f4e4>] (sys_write+0x0/0x74) from [<c00249a0>]
(ret_fast_syscall+0x0/0x34)
 r6 =3D 00000004  r5 =3D 0001B000  r4 =3D 00077C01=20
[<c02403e0>] (__schedule+0x0/0x5b0) from [<c0240afc>]
(schedule+0xec/0x124)
[<c0240a10>] (schedule+0x0/0x124) from [<c023ffb0>]
(__compat_down+0xe0/0x178)
 r4 =3D C0A4A000=20
[<c023fed0>] (__compat_down+0x0/0x178) from [<c023fe6c>]
(__compat_down_failed+0xc
/0x20)
 r8 =3D C2C2A42C  r7 =3D C32262E8  r6 =3D C32262E8  r5 =3D C2C2A400
 r4 =3D C322630C=20
[<c00d6090>] (jffs2_reserve_space+0x0/0x268) from [<c00d85e4>]
(jffs2_write_inode_
range+0x5c/0x468)
[<c00d8588>] (jffs2_write_inode_range+0x0/0x468) from [<c00d35dc>]
(jffs2_commit_w
rite+0x1b0/0x31c)
[<c00d342c>] (jffs2_commit_write+0x0/0x31c) from [<c0063e10>]
(generic_file_buffer
ed_write+0x3e4/0x64c)
[<c0063a2c>] (generic_file_buffered_write+0x0/0x64c) from [<c0064700>]
(__generic_
file_aio_write_nolock+0x488/0x4b4)
[<c0064278>] (__generic_file_aio_write_nolock+0x0/0x4b4) from
[<c00647ac>] (__gene
ric_file_write_nolock+0x80/0xac)
[<c006472c>] (__generic_file_write_nolock+0x0/0xac) from [<c00648fc>]
(generic_fil
e_write+0x58/0xdc)
 r9 =3D C0A4A000  r8 =3D C245F820  r6 =3D 4001E008  r5 =3D C245F8BC
 r4 =3D C245F88C=20
[<c00648a4>] (generic_file_write+0x0/0xdc) from [<c007f3ec>]
(vfs_write+0xec/0x170
)
[<c007f300>] (vfs_write+0x0/0x170) from [<c007f52c>]
(sys_write+0x48/0x74)
 r8 =3D C0025154  r7 =3D 00000004  r6 =3D C1C560E0  r5 =3D 00000000
 r4 =3D 0001B000=20
[<c007f4e4>] (sys_write+0x0/0x74) from [<c00249a0>]
(ret_fast_syscall+0x0/0x34)
 r6 =3D 00000004  r5 =3D 0001B000  r4 =3D 00077C01=20
[<c02403e0>] (__schedule+0x0/0x5b0) from [<c0240afc>]
(schedule+0xec/0x124)
[<c0240a10>] (schedule+0x0/0x124) from [<c023ffb0>]
(__compat_down+0xe0/0x178)
 r4 =3D C0A4A000=20
[<c023fed0>] (__compat_down+0x0/0x178) from [<c023fe6c>]
(__compat_down_failed+0xc
/0x20)
 r8 =3D C2C2A42C  r7 =3D C32262E8  r6 =3D C32262E8  r5 =3D C2C2A400
 r4 =3D C322630C=20
[<c00d6090>] (jffs2_reserve_space+0x0/0x268) from [<c00d85e4>]
(jffs2_write_inode_
range+0x5c/0x468)
[<c00d8588>] (jffs2_write_inode_range+0x0/0x468) from [<c00d35dc>]
(jffs2_commit_w
rite+0x1b0/0x31c)
[<c00d342c>] (jffs2_commit_write+0x0/0x31c) from [<c0063e10>]
(generic_file_buffer
ed_write+0x3e4/0x64c)
[<c0063a2c>] (generic_file_buffered_write+0x0/0x64c) from [<c0064700>]
(__generic_
file_aio_write_nolock+0x488/0x4b4)
[<c0064278>] (__generic_file_aio_write_nolock+0x0/0x4b4) from
[<c00647ac>] (__gene
ric_file_write_nolock+0x80/0xac)
[<c006472c>] (__generic_file_write_nolock+0x0/0xac) from [<c00648fc>]
(generic_fil
e_write+0x58/0xdc)
 r9 =3D C0A4A000  r8 =3D C245F820  r6 =3D 4001E008  r5 =3D C245F8BC
 r4 =3D C245F88C=20
[<c00648a4>] (generic_file_write+0x0/0xdc) from [<c007f3ec>]
(vfs_write+0xec/0x170
)
[<c007f300>] (vfs_write+0x0/0x170) from [<c007f52c>]
(sys_write+0x48/0x74)
 r8 =3D C0025154  r7 =3D 00000004  r6 =3D C1C560E0  r5 =3D 00000000
 r4 =3D 0001B000=20
[<c007f4e4>] (sys_write+0x0/0x74) from [<c00249a0>]
(ret_fast_syscall+0x0/0x34)
 r6 =3D 00000004  r5 =3D 0001B000  r4 =3D 00077C01=20



=3D=3D=3D=3D

jffs2_gcd_mtd18 info


[<c02403e0>] (__schedule+0x0/0x5b0) from [<c0240afc>]
(schedule+0xec/0x124)
[<c0240a10>] (schedule+0x0/0x124) from [<c02416c0>]
(io_schedule+0x2c/0x48)
 r4 =3D C02E02C8=20
[<c0241694>] (io_schedule+0x0/0x48) from [<c00610f4>]
(sync_page+0x40/0x48)
 r5 =3D 00000000  r4 =3D C261DCF8=20
[<c00610b4>] (sync_page+0x0/0x48) from [<c0241a8c>]
(__wait_on_bit_lock+0x54/0x88)
[<c0241a38>] (__wait_on_bit_lock+0x0/0x88) from [<c00619dc>]
(__lock_page+0x88/0x9
8)
[<c0061954>] (__lock_page+0x0/0x98) from [<c0063554>]
(read_cache_page+0x21c/0x324
)
 r5 =3D 00000000  r4 =3D C0352580=20
[<c0063338>] (read_cache_page+0x0/0x324) from [<c00dfe68>]
(jffs2_gc_fetch_page+0x
2c/0x64)
[<c00dfe3c>] (jffs2_gc_fetch_page+0x0/0x64) from [<c00dcbb4>]
(jffs2_garbage_colle
ct_pass+0x14c4/0x1c68)
 r4 =3D C1805880=20
[<c00db6f0>] (jffs2_garbage_collect_pass+0x0/0x1c68) from [<c00debf4>]
(jffs2_garb
age_collect_thread+0x148/0x19c)
[<c00deaac>] (jffs2_garbage_collect_thread+0x0/0x19c) from [<c0044a20>]
(do_exit+0
x0/0xd88)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
[<c02403e0>] (__schedule+0x0/0x5b0) from [<c0240afc>]
(schedule+0xec/0x124)
[<c0240a10>] (schedule+0x0/0x124) from [<c02416c0>]
(io_schedule+0x2c/0x48)
 r4 =3D C02E02C8=20
[<c0241694>] (io_schedule+0x0/0x48) from [<c00610f4>]
(sync_page+0x40/0x48)
 r5 =3D 00000000  r4 =3D C261DCF8=20
[<c00610b4>] (sync_page+0x0/0x48) from [<c0241a8c>]
(__wait_on_bit_lock+0x54/0x88)
[<c0241a38>] (__wait_on_bit_lock+0x0/0x88) from [<c00619dc>]
(__lock_page+0x88/0x9
8)
[<c0061954>] (__lock_page+0x0/0x98) from [<c0063554>]
(read_cache_page+0x21c/0x324
)
 r5 =3D 00000000  r4 =3D C0352580=20
[<c0063338>] (read_cache_page+0x0/0x324) from [<c00dfe68>]
(jffs2_gc_fetch_page+0x
2c/0x64)
[<c00dfe3c>] (jffs2_gc_fetch_page+0x0/0x64) from [<c00dcbb4>]
(jffs2_garbage_colle
ct_pass+0x14c4/0x1c68)
 r4 =3D C1805880=20
[<c00db6f0>] (jffs2_garbage_collect_pass+0x0/0x1c68) from [<c00debf4>]
(jffs2_garb
age_collect_thread+0x148/0x19c)
[<c00deaac>] (jffs2_garbage_collect_thread+0x0/0x19c) from [<c0044a20>]
(do_exit+0
x0/0xd88)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
[<c02403e0>] (__schedule+0x0/0x5b0) from [<c0240afc>]
(schedule+0xec/0x124)
[<c0240a10>] (schedule+0x0/0x124) from [<c02416c0>]
(io_schedule+0x2c/0x48)
 r4 =3D C02E02C8=20
[<c0241694>] (io_schedule+0x0/0x48) from [<c00610f4>]
(sync_page+0x40/0x48)
 r5 =3D 00000000  r4 =3D C261DCF8=20
[<c00610b4>] (sync_page+0x0/0x48) from [<c0241a8c>]
(__wait_on_bit_lock+0x54/0x88)
[<c0241a38>] (__wait_on_bit_lock+0x0/0x88) from [<c00619dc>]
(__lock_page+0x88/0x9
8)
[<c0061954>] (__lock_page+0x0/0x98) from [<c0063554>]
(read_cache_page+0x21c/0x324
)
 r5 =3D 00000000  r4 =3D C0352580=20
[<c0063338>] (read_cache_page+0x0/0x324) from [<c00dfe68>]
(jffs2_gc_fetch_page+0x
2c/0x64)
[<c00dfe3c>] (jffs2_gc_fetch_page+0x0/0x64) from [<c00dcbb4>]
(jffs2_garbage_colle
ct_pass+0x14c4/0x1c68)
 r4 =3D C1805880=20
[<c00db6f0>] (jffs2_garbage_collect_pass+0x0/0x1c68) from [<c00debf4>]
(jffs2_garb
age_collect_thread+0x148/0x19c)
[<c00deaac>] (jffs2_garbage_collect_thread+0x0/0x19c) from [<c0044a20>]
(do_exit+0
x0/0xd88)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000


=3D=3D=3D=3D=3D=3D
diff -uprN jffs2_orig/file.c jffs2_new/file.c
--- jffs2_orig/file.c	2007-06-11 13:07:29.000000000 -0500
+++ jffs2_new/file.c	2007-06-11 13:06:49.000000000 -0500
@@ -100,14 +100,26 @@ static int jffs2_do_readpage_nolock (str
=20
 int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
 {
+#if 0 =20
 	int ret =3D jffs2_do_readpage_nolock(inode, pg);
 	unlock_page(pg);
+#else
+   struct jffs2_inode_info *f =3D JFFS2_INODE_INFO(inode);
+   int ret;
+
+   down(&f->sem);
+   ret =3D jffs2_do_readpage_nolock(inode, pg);
+   unlock_page(pg);
+   up(&f->sem);
+
+#endif
 	return ret;
 }
=20
=20
 static int jffs2_readpage (struct file *filp, struct page *pg)
 {
+#if 0 =20
 	struct jffs2_inode_info *f =3D
JFFS2_INODE_INFO(pg->mapping->host);
 	int ret;
 =09
@@ -115,6 +127,9 @@ static int jffs2_readpage (struct file *
 	ret =3D jffs2_do_readpage_unlock(pg->mapping->host, pg);
 	up(&f->sem);
 	return ret;
+#else
+   return jffs2_do_readpage_unlock(pg->mapping->host, pg);
+#endif
 }
=20
 static int jffs2_prepare_write (struct file *filp, struct page *pg,
diff -uprN jffs2_orig/gc.c jffs2_new/gc.c
--- jffs2_orig/gc.c	2007-06-11 13:09:05.000000000 -0500
+++ jffs2_new/gc.c	2007-06-11 13:06:38.000000000 -0500
@@ -1202,7 +1202,13 @@ static int jffs2_garbage_collect_dnode(s
 	 *    page OK. We'll actually write it out again in
commit_write, which is a little
 	 *    suboptimal, but at least we're correct.
 	 */
+#if 0
 	pg_ptr =3D jffs2_gc_fetch_page(c, f, start, &pg);
+#else
+    up(&f->sem);
+	pg_ptr =3D jffs2_gc_fetch_page(c, f, start, &pg);
+    down(&f->sem);
+#endif
=20
 	if (IS_ERR(pg_ptr)) {
 		printk(KERN_WARNING "read_cache_page() returned error:
%ld\n", PTR_ERR(pg_ptr));
