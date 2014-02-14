Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WECmU-0007jd-J0
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 07:01:51 +0000
Received: by mail-pb0-f49.google.com with SMTP id up15so11822350pbc.8
 for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2014 23:01:26 -0800 (PST)
Date: Thu, 13 Feb 2014 23:01:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Li Zefan <lizefan@huawei.com>
Subject: Re: [patch 2/4] jffs2: fix unbalanced locking
Message-ID: <20140214070122.GG3500@norris-Latitude-E6410>
References: <20140212204455.B3FD75A40F6@corp2gmr1-2.hot.corp.google.com>
 <20140213064847.GF3500@norris-Latitude-E6410>
 <52FC81E4.2020301@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52FC81E4.2020301@huawei.com>
Cc: linux-mtd@lists.infradead.org, artem.bityutskiy@linux.intel.com,
 akpm@linux-foundation.org, dwmw2@infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Li,

On Thu, Feb 13, 2014 at 04:27:16PM +0800, Li Zefan wrote:
> On 2014/2/13 14:48, Brian Norris wrote:
> > On Wed, Feb 12, 2014 at 12:44:55PM -0800, Andrew Morton wrote:
> >> From: Li Zefan <lizefan@huawei.com>
> >> Subject: jffs2: fix unbalanced locking
> >>
> >> This was found by our internal debugging feature on runtime, but this bug
> >> won't lead to deadlock, as the structure that this lock is embedded in is
> >> freed on error.
> > 
> > Well, one of its callers frees it without unlocking it, but you're
> > forgetting about one of its other callers, and in doing so, you are
> > introducing a potential double-unlock instead!
> 
> But I don't think I should be blamed here.
> 
> Without my patch, some of the error paths release f->sem but some don't,
> so the potential double-unlock is already there.

So you can't be blamed for making *all* cases a double unlock? And this
patch is incorrect as well. See below.

> > BTW, the right way to handle lock balancing is to handle the unlocking
> > at the same level where you do the locking. So I guess you're looking
> > for the following patch instead, which is really not very useful because
> > (as Li noted) the lock is freed immediately afterward anyway:
> > 
> 
> Yeah, I do believe it's better to do locking/unlocking in the same level.
> How about this:
> 
> [PATCH v2] jffs2: fix unbalanced locking
[...]
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index 386303d..6f22234 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
[...]
> @@ -1317,8 +1308,13 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
>  	}
>  	if (f->inocache->state == INO_STATE_READING)
>  		jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
> -
> -	return 0;
> +out:
> +	if (ret) {
> +		mutex_unlock(&f->sem);
> +		jffs2_do_clear_inode(c, f);
> +		mutex_lock(&f->sem);

This still is not consistent, and this access pattern (unlock / call
function which uses lock / lock) seems like a hack. How about we just
make the callers all do the same cleanup instead? Notice the 'error'
label in jffs2_iget(), which performs the jffs2_do_clear_inode() itself
already -- seemingly redundant. At least your patch doesn't add double
unlocks this time...

> +	}
> +	return ret;
>  }
>  
>  /* Scan the list of all nodes present for this ino, build map of versions, etc. */
[...]

How about we just push all the mutex_unlock(&f->sem) and
jffs2_do_clear_inode() to the callers which hold the mutex? The
following patch is totally untested:

(BTW Li, have you actually tested any of your patches? I'm going to need
some Tested-by's before I merge any of this.)

Signed-off-by: Brian Norris <norris@broadcom.com>

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index a69e426435dd..9ac37354852d 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -272,12 +272,9 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	mutex_lock(&f->sem);
 
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
+	if (ret)
+		goto error;
 
-	if (ret) {
-		mutex_unlock(&f->sem);
-		iget_failed(inode);
-		return ERR_PTR(ret);
-	}
 	inode->i_mode = jemode_to_cpu(latest_node.mode);
 	i_uid_write(inode, je16_to_cpu(latest_node.uid));
 	i_gid_write(inode, je16_to_cpu(latest_node.gid));
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 386303dca382..5539ed46e89b 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1203,17 +1203,13 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 		JFFS2_ERROR("failed to read from flash: error %d, %zd of %zd bytes read\n",
 			ret, retlen, sizeof(*latest_node));
 		/* FIXME: If this fails, there seems to be a memory leak. Find it. */
-		mutex_unlock(&f->sem);
-		jffs2_do_clear_inode(c, f);
-		return ret?ret:-EIO;
+		return ret ? ret : -EIO;
 	}
 
 	crc = crc32(0, latest_node, sizeof(*latest_node)-8);
 	if (crc != je32_to_cpu(latest_node->node_crc)) {
 		JFFS2_ERROR("CRC failed for read_inode of inode %u at physical location 0x%x\n",
 			f->inocache->ino, ref_offset(rii.latest_ref));
-		mutex_unlock(&f->sem);
-		jffs2_do_clear_inode(c, f);
 		return -EIO;
 	}
 
@@ -1250,16 +1246,11 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			 * keep in RAM to facilitate quick follow symlink
 			 * operation. */
 			uint32_t csize = je32_to_cpu(latest_node->csize);
-			if (csize > JFFS2_MAX_NAME_LEN) {
-				mutex_unlock(&f->sem);
-				jffs2_do_clear_inode(c, f);
+			if (csize > JFFS2_MAX_NAME_LEN)
 				return -ENAMETOOLONG;
-			}
 			f->target = kmalloc(csize + 1, GFP_KERNEL);
 			if (!f->target) {
 				JFFS2_ERROR("can't allocate %u bytes of memory for the symlink target path cache\n", csize);
-				mutex_unlock(&f->sem);
-				jffs2_do_clear_inode(c, f);
 				return -ENOMEM;
 			}
 
@@ -1271,8 +1262,6 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 					ret = -EIO;
 				kfree(f->target);
 				f->target = NULL;
-				mutex_unlock(&f->sem);
-				jffs2_do_clear_inode(c, f);
 				return ret;
 			}
 
@@ -1289,15 +1278,11 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 		if (f->metadata) {
 			JFFS2_ERROR("Argh. Special inode #%u with mode 0%o had metadata node\n",
 			       f->inocache->ino, jemode_to_cpu(latest_node->mode));
-			mutex_unlock(&f->sem);
-			jffs2_do_clear_inode(c, f);
 			return -EIO;
 		}
 		if (!frag_first(&f->fragtree)) {
 			JFFS2_ERROR("Argh. Special inode #%u with mode 0%o has no fragments\n",
 			       f->inocache->ino, jemode_to_cpu(latest_node->mode));
-			mutex_unlock(&f->sem);
-			jffs2_do_clear_inode(c, f);
 			return -EIO;
 		}
 		/* ASSERT: f->fraglist != NULL */
@@ -1305,8 +1290,6 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			JFFS2_ERROR("Argh. Special inode #%u with mode 0x%x had more than one node\n",
 			       f->inocache->ino, jemode_to_cpu(latest_node->mode));
 			/* FIXME: Deal with it - check crc32, check for duplicate node, check times and discard the older one */
-			mutex_unlock(&f->sem);
-			jffs2_do_clear_inode(c, f);
 			return -EIO;
 		}
 		/* OK. We're happy */
@@ -1400,10 +1383,8 @@ int jffs2_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *i
 	f->inocache = ic;
 
 	ret = jffs2_do_read_inode_internal(c, f, &n);
-	if (!ret) {
-		mutex_unlock(&f->sem);
-		jffs2_do_clear_inode(c, f);
-	}
+	mutex_unlock(&f->sem);
+	jffs2_do_clear_inode(c, f);
 	jffs2_xattr_do_crccheck_inode(c, ic);
 	kfree (f);
 	return ret;
