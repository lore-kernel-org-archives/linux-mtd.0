Received: from [63.144.37.162] (helo=mh02.bioace.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rTUJ-0002U4-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 02:18:43 +0100
Received: from bioace.net (unknown [192.168.10.179])
	by mh02.bioace.net (Postfix) with ESMTP id ECE0440230
	for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2002 21:18:28 -0400 (EDT)
Message-ID: <3D87D464.5663351F@bioace.net>
Date: Tue, 17 Sep 2002 21:18:28 -0400
From: Carl Przybylek <carlp@bioace.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 Errors
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Seems the patchin.sh file did not link all the kernel files correctly.
When I try to compile 2.4.19 kernel I get a bunch of undefined reference
errors.

I manually linked the jffs2 directory as that was not included.  Im
assuming Ive missed some more.
The zlib_inflate_workspacesize is in the lib/zlib_inflate directory do
those directories need to be linked into the kernel source as well?

Any help would be greatly appreciated
Carl Przybylek

fs/fs.o: In function `jffs2_compress':
fs/fs.o(.text+0x3d654): undefined reference to `jffs2_rtime_compress'
fs/fs.o: In function `jffs2_decompress':
fs/fs.o(.text+0x3d6d9): undefined reference to `jffs2_rtime_decompress'
fs/fs.o: In function `jffs2_zlib_compress':
fs/fs.o(.text+0x3e051): undefined reference to `zlib_deflateInit_'
fs/fs.o(.text+0x3e0c1): undefined reference to `zlib_deflate'
fs/fs.o(.text+0x3e0fa): undefined reference to `zlib_deflate'
fs/fs.o(.text+0x3e102): undefined reference to `zlib_deflateEnd'
fs/fs.o(.text+0x3e12e): undefined reference to `zlib_deflateEnd'
fs/fs.o: In function `jffs2_zlib_decompress':
fs/fs.o(.text+0x3e18e): undefined reference to `zlib_inflateInit_'
fs/fs.o(.text+0x3e1e0): undefined reference to `zlib_inflate'
fs/fs.o(.text+0x3e200): undefined reference to `zlib_inflateEnd'
fs/fs.o: In function `jffs2_symlink':
fs/fs.o(.text+0x3e7db): undefined reference to `crc32'
fs/fs.o(.text+0x3e7f9): undefined reference to `crc32'
fs/fs.o(.text+0x3e806): undefined reference to `crc32'
fs/fs.o(.text+0x3e957): undefined reference to `crc32'
fs/fs.o(.text+0x3e99b): undefined reference to `crc32'
fs/fs.o(.text+0x3e9b0): more undefined references to `crc32' follow
fs/fs.o: In function `jffs2_garbage_collect_thread':
fs/fs.o(.text+0x46f50): undefined reference to `set_user_nice'
fs/fs.o: In function `jffs2_flush_wbuf':
fs/fs.o(.text+0x47a37): undefined reference to `crc32'
fs/fs.o: In function `jffs2_zlib_init':
fs/fs.o(.text.init+0xc15): undefined reference to
`zlib_deflate_workspacesize'
fs/fs.o(.text.init+0xc4a): undefined reference to
`zlib_deflate_workspacesize'
fs/fs.o(.text.init+0xc65): undefined reference to
`zlib_inflate_workspacesize'
fs/fs.o(.text.init+0xc9a): undefined reference to
`zlib_inflate_workspacesize'
