From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <1146917241.2766.61.camel@pmac.infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>
	<1146917241.2766.61.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Sat, 06 May 2006 13:38:28 +0100
Message-Id: <1146919108.2766.73.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joern@wohnheim.fh-wedel.de
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-05-06 at 13:07 +0100, David Woodhouse wrote:
> Thank you. These patches look good to me, in general. I do have a couple
> of minor comments to make, but I'll do that with a slightly shorter Cc
> list. 

As I said, it looks good in general. A few minor points though. I
haven't looked _too_ hard yet at the details, but this is what jumped
out at me when I scrolled through it.

1. Please don't use typedefs. Just 'struct jffs2_acl_header' instead of
this:
	typedef struct {
	       jint32_t        a_version;
	} jffs2_acl_header;


2. You're adding locks without documenting them in README.Locking.
Please make sure any new locks (c->xattr_sem) are fully documented.

3. You have very strange locking behaviour in
jffs2_garbage_collect_xattr() -- sometimes you return with the lock
still held, sometimes without. I think it would be best to check
ic->class within the jffs2_garbage_collect_passs() function instead.

4. You add a list_head to struct jffs2_inode_cache. That's two pointers
-- could we get away with only a single pointer instead?

How much has your code been tested on SMP machines?

Please let me know if you'd like an account with direct access to the
jffs2-xattr-2.6.git tree. I can continue to apply patches if you prefer,
but git is quite easy to use.

-- 
dwmw2
