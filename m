Subject: Re: JFFS2: jffs2_symlink/jffs2_mkdir/jffs2_mknod bug?
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF44ACA275.CD60CEF4-ONC1257680.0032B876-C1257680.0032E8E7@transmode.se>
References: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
	<1259744053.19465.902.camel@macbook.infradead.org>
	<OF44ACA275.CD60CEF4-ONC1257680.0032B876-C1257680.0032E8E7@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Dec 2009 09:48:17 +0000
Message-ID: <1259747297.19465.924.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tao Huang <ulysses.huang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-02 at 10:16 +0100, Joakim Tjernlund wrote:
> Do you need mutex lock/unlock around a simple assignment? 

Those are the locking rules.

The GC code may be currently processing this inode, and have the mutex
locked. It has the right to expect that fields of the data structure
won't be changed underneath it while it has the lock -- that's kind of
the point of the locking, isn't it?

It _might_ be the case that it wouldn't matter, because of the way that
the GC code uses the pino_nlink field, and because the mutex is going to
get locked by jffs2_do_clear_inode() anyway, so the inode won't
_actually_ get cleaned up until the GC code has finished with it.

But if you want to violate the locking rules, you'd need to _prove_ that
it's safe. And why would you bother? It's not as if it's worth
optimising this code path for performance -- it's a rarely-used error
path (which is why it's existed fairly much for ever without anyone
noticing. I don't think it was introduced by the more recent pino_nlink
merge; it was there when the nlink field was separate).

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
