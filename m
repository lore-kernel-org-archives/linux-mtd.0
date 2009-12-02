Subject: Re: JFFS2: jffs2_symlink/jffs2_mkdir/jffs2_mknod bug?
From: David Woodhouse <dwmw2@infradead.org>
To: Tao Huang <ulysses.huang@gmail.com>
In-Reply-To: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
References: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Dec 2009 19:54:07 +0000
Message-ID: <1259783647.3744.611.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-02 at 10:11 +0800, Tao Huang wrote:
> On jffs2_symlink/jffs2_mkdir/jffs2_mknod, after jffs2_write_dnode,
> any call jffs2_clear_inode will no call jffs2_mark_node_obsolete
> because pino_nlink is not zero.

True, I think. Well spotted. Although it may actually turn out to be
harmless, for reasons similar to those I outlined to Joakim earlier.

At worst, it'll cause a space leak, because until the next reboot we'll
think that the inode in question has a non-zero nlink and can't be
removed.

>  This will make kernel BUG on jffs2_garbage_collect_live.

But this isn't true. In fact, there isn't even a BUG in
jffs2_garbage_collect_live() -- you're seeing an Oops, not a BUG.
And it's not related to the locking issue. It's this:

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 090c556..3b6f2fa 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -700,7 +700,8 @@ static int jffs2_garbage_collect_metadata(struct jffs2_sb_info *c, struct jffs2_
 	struct jffs2_raw_inode ri;
 	struct jffs2_node_frag *last_frag;
 	union jffs2_device_node dev;
-	char *mdata = NULL, mdatalen = 0;
+	char *mdata = NULL;
+	int mdatalen = 0;
 	uint32_t alloclen, ilen;
 	int ret;
 
It looks like garbage collecting any symlink with a target length of
more than 128 characters, on a system where char is signed by default,
was broken since February 2001 when jffs2_garbage_collect_metadata() was
first (half-)written.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
