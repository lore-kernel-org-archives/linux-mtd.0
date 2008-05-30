Received: from agminet01.oracle.com ([141.146.126.228])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K27Ja-0006sd-CY
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 16:18:51 +0000
Date: Fri, 30 May 2008 09:31:47 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: linux-next@vger.kernel.org, dedekind@infradead.org
Subject: next 20080530: ubifs build errors
Message-Id: <20080530093147.cc1d389f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

with:
CONFIG_UBIFS_FS=y
# CONFIG_UBIFS_FS_XATTR is not set
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
# CONFIG_UBIFS_FS_LZO is not set
# CONFIG_UBIFS_FS_ZLIB is not set
# CONFIG_UBIFS_FS_DEBUG is not set

build gets:
fs/built-in.o: In function `compr_exit':
compress.c:(.text+0x4a3fc): undefined reference to `crypto_free_tfm'
fs/built-in.o: In function `compr_init':
compress.c:(.init.text+0x11d4): undefined reference to `crypto_alloc_base'
make[1]: *** [.tmp_vmlinux1] Error 1


because CRYPTO is not enabled.

---
~Randy
"He closes his eyes and drops the goggles.  You can't get hurt
by looking at a bitmap.  Or can you?"
