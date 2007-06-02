Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>
In-Reply-To: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
References: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
Content-Type: text/plain
Date: Sat, 02 Jun 2007 18:42:05 +0100
Message-Id: <1180806125.25232.134.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-04-30 at 15:41 -0400, Roberts Nathan-mcg31137 wrote:
> Has anyone seen this deadlock before? It seems to be a classic deadlock 
> situation so I'm not sure if maybe I'm misinterpreting things or 
> the use case (several postmark tests running in parallel on a
> preemptible kernel) is especially vulnerable. 

I think Josh has spotted the real problem here. Does this help? If so,
as better fix will be forthcoming....

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 2d99e06..1066120 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1218,7 +1218,9 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	 *    page OK. We'll actually write it out again in commit_write, which is a little
 	 *    suboptimal, but at least we're correct.
 	 */
+	up(&f->sem);
 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
+	down(&f->sem);
 
 	if (IS_ERR(pg_ptr)) {
 		printk(KERN_WARNING "read_cache_page() returned error: %ld\n", PTR_ERR(pg_ptr));

-- 
dwmw2
