Received: from postfix2-1.free.fr ([213.228.0.9])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Cgeb-0002Id-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 May 2002 14:04:45 +0100
Received: from imp4-1.free.fr (imp4-1.free.fr [213.228.0.57])
	by postfix2-1.free.fr (Postfix) with ESMTP id 253E0407
	for <linux-mtd@lists.infradead.org>; Tue, 28 May 2002 15:04:45 +0200 (CEST)
To: linux-mtd@lists.infradead.org
Subject: unresolved symbols in kernel (MTD_CVS and linux 2.4.19pre1)
Message-ID: <1022591085.3cf3806d06fc4@imp.free.fr>
Date: Tue, 28 May 2002 15:04:45 +0200 (MEST)
From: olivier.eribon@free.fr
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm trying to compile the latest MTD_CVS (/home/oeribon/MTD_CVS/mtd) with my
2.4.19pre1 Linux kernel in order to use JFFS2 on Nand flash.
I've symlinked this files in the kernel :

./drivers/mtd                 -> /home/oeribon/MTD_CVS/mtd/drivers/mtd/
./fs/jffs2                    -> /home/oeribon/MTD_CVS/mtd/fs/jffs2/
./fs/ffs2                     -> /home/oeribon/MTD_CVS/mtd/fs/ffs2/
./include/linux/mtd           -> /home/oeribon/MTD_CVS/mtd/include/linux/mtd
./include/linux/jffs.h        -> /home/oeribon/MTD_CVS/mtd/include/linux/jffs.h
./include/linux/jffs2.h       -> /home/oeribon/MTD_CVS/mtd/include/linux/jffs2.h
./include/linux/jffs2_fs_i.h  ->
/home/oeribon/MTD_CVS/mtd/include/linux/jffs2_fs_i.h
./include/linux/zlib.h        -> /home/oeribon/MTD_CVS/mtd/include/linux/zlib.h
./include/linux/zutil.h       -> /home/oeribon/MTD_CVS/mtd/include/linux/zutil.h
./include/linux/zconf.h       -> /home/oeribon/MTD_CVS/mtd/include/linux/zconf.h
./include/linux/jffs2_fs_sb.h ->
/home/oeribon/MTD_CVS/mtd/include/linux/jffs2_fs_sb.h
./include/linux/crc32.h       -> /home/oeribon/MTD_CVS/mtd/fs/jffs2/crc32.h
./kernel/mapped.c             -> /home/oeribon/MTD_CVS/mtd/kernel/mapped.c
./kernel/mixmem.c             -> /home/oeribon/MTD_CVS/mtd/kernel/mixmem.c
./lib/zlib_deflate            -> /home/oeribon/MTD_CVS/mtd/lib/zlib_deflate/
./lib/zlib_inflate            -> /home/oeribon/MTD_CVS/mtd/lib/zlib_inflate/
./util                        -> /home/oeribon/MTD_CVS/mtd/util/

I have the same problem (Andrew Dixon & Chris Wilson (unresolved symbols in
kernel Apr. 2002))

/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:100: undefined reference to
`zlib_deflateInit_'
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:100: relocation truncated to
fit: R_PPC_REL24 zlib_deflateInit_
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:117: undefined reference to
`zlib_deflate'
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:117: relocation truncated to
fit: R_PPC_REL24 zlib_deflate
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:122: undefined reference to
`zlib_deflateEnd'
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:122: relocation truncated to
fit: R_PPC_REL24 zlib_deflateEnd
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:129: undefined reference to
`zlib_deflate'
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:129: relocation truncated to
fit: R_PPC_REL24 zlib_deflate
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:130: undefined reference to
`zlib_deflateEnd'
/home/oeribon/MTD_CVS/mtd/fs/jffs2/compr_zlib.c:130: relocation truncated to
fit: R_PPC_REL24 zlib_deflateEnd

Could you give me some information about tree structure integration of MTD_CVS
and linux kernel.
How can i compile MTD_CVS and a kernel (as 2.4.19) with JFFS2 without any error?

With Regards,
Thanks in advance

Olivier Eribon
