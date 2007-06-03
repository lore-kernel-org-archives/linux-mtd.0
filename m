Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Huv3T-0002Ri-Tg
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 14:46:35 -0400
Date: Sun, 3 Jun 2007 20:38:46 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: LogFS take four
Message-ID: <20070603183845.GA8952@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>,
	Kyle Moffett <mrmacman_g4@mac.com>, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>, John Stoffel <john@stoffel.org>,
	Ondrej Zajicek <santiago@crfreenet.org>,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This round the patch is split into file-sized hunks.  There actually
seem to be kernel developers not manly enough to digest 6000+ lines of
code at once.  An I thought I was the only wimp around.

Again, anyone giving comments in the last round is on Cc:.

I'll try to respond to comments but the next round of patches may take a
while longer, due to other responsibilities.


Changed since take three:
o one blank line between functions
o depend on MTD
o use LOGFS_BLOCKSHIFT in logfs_index
o #define EOF to 512
o moved BUILD_BUG_ON() into an inline function
o declare completion futility on the stack
o 64bit nanoseconds time format
o created logfs_compare_inode()
o created struct logfs_device_ops
o truncate() to zero sets embedded flag
o unwrap logfs_memcpy()
o add FS_READONLY flag to superblock
o create blockdev_device_ops
  This one still needs some infrastructure and testing.
o Fix data corruption bug.


Unchanged:
o convert #define's to enums.
  Afaics one of those has to be cast to u8, the other has to go through
  cpu_to_be64.  I don't see how enums are an advantage under such circumstances
  and Thomas didn't seem to be sure either.
o generic function for logfs_type()
o generic helper for logfs_prepare_write()
o removed EOF
o error handling
o move rootdir generation back to mkfs
o replace kmap() with kmap_atomic()
o document logfs_new_meta_inode()
o Use KMEM_CACHE() helper for kmem_cache_create()
o read object header first, then read or read&uncompress object data
o shrink inodes to 200 bytes


Won't happen (unless I get convinced to do otherwise):
o lowercase LOGFS_SUPER and LOGFS_INODE
  These simply match the common pattern used is many Linux filesystems.
o remove "extern"
  For structures, this keyword actually serves a purpose and makes sense.
  On the other hand, it is completely bogus for functions and I won't be
  bullied into adding bogus crud either.
o Move fs/logfs/Locking to Documentation/
  At least JFFS2 has such documentation in its own directory as well.
  I can see good arguments for either side and no strong consensus.  While
  I ultimately just don't case, doing nothing is a good option in cases
  of great uncertainty.
o change (void*) to "proper" cast
  Neither variant is much better than the other.  I'm open for suggestions
  to completely remove the casts, though.
o Change LOGFS_BUG() and LOGFS_BUG_ON() to inline functions
  These are macros for very much the same reasons BUG() and BUG_ON() are.

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
