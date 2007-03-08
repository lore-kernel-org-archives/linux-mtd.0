Subject: Re: The NFS mounting jffs2 filesystem with errors, solution need
From: David Woodhouse <dwmw2@infradead.org>
To: zheng xin <zhx821223@hotmail.com>
In-Reply-To: <1173366491.3461.464.camel@pmac.infradead.org>
References: <BAY129-F38DCF83FC0B3A84A14DF91AD7A0@phx.gbl>
	<1173366491.3461.464.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 16:57:11 +0000
Message-Id: <1173373032.3461.475.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Neil Brown <neilb@suse.de>, linux-mtd@lists.infradead.org,
	Gregory CLEMENT <gclement00@gmail.com>, hch@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 15:08 +0000, David Woodhouse wrote:
> [C00000000A5C34F0] [D0000000009B99A8] .jffs2_lookup+0x88/0x218 [jffs2]
> [C00000000A5C35A0] [C0000000001056F4] .__lookup_hash+0x18c/0x1d4
> [C00000000A5C3640] [C000000000105E0C] .lookup_one_len+0x74/0x8c
> [C00000000A5C36D0] [D000000000AD0B6C] .compose_entry_fh+0x12c/0x1bc [nfsd]
> [C00000000A5C3780] [D000000000AD0EBC] .encode_entry+0x1dc/0x444 [nfsd]
> [C00000000A5C3AA0] [D0000000009B9CF0] .jffs2_readdir+0x1b8/0x24c [jffs2] 

OK, it's caused by readdirplus, which seems to call our ->lookup() on
every child of the directory it's reading, just to generate a filehandle
for each one.

This problem isn't limited to JFFS2. GFS2 works around it by checking
whether the lock owner == current, and GFS1 does it by building up a
list of everything it wants to return, then dropping all the locks and
feeding it all to the filldir() function afterwards.

If we could just provide i_generation to filldir(), the NFS code
wouldn't _need_ to actually call ->lookup() for every child inode; it
could create the filehandles for itself. At least in the common case
where the filesystem doesn't override encode_fh().

This evil hack should work around the problem, but I'd rather see a
proper fix.

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 9fa2e27..a1f62ec 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -88,7 +88,8 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 	dir_f = JFFS2_INODE_INFO(dir_i);
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
-	down(&dir_f->sem);
+	if (current != dir_f->readdir_process)
+		down(&dir_f->sem);
 
 	/* NB: The 2.2 backport will need to explicitly check for '.' and '..' here */
 	for (fd_list = dir_f->dents; fd_list && fd_list->nhash <= target->d_name.hash; fd_list = fd_list->next) {
@@ -101,7 +102,8 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 	}
 	if (fd)
 		ino = fd->ino;
-	up(&dir_f->sem);
+	if (current != dir_f->readdir_process)
+		up(&dir_f->sem);
 	if (ino) {
 		inode = iget(dir_i->i_sb, ino);
 		if (!inode) {
@@ -149,6 +151,7 @@ static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 
 	curofs=1;
 	down(&f->sem);
+	f->readdir_process = current;
 	for (fd = f->dents; fd; fd = fd->next) {
 
 		curofs++;
@@ -168,6 +171,7 @@ static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 			break;
 		offset++;
 	}
+	f->readdir_process = NULL;
 	up(&f->sem);
  out:
 	filp->f_pos = offset;
diff --git a/fs/jffs2/jffs2_fs_i.h b/fs/jffs2/jffs2_fs_i.h
index 3a56607..811a0ea 100644
--- a/fs/jffs2/jffs2_fs_i.h
+++ b/fs/jffs2/jffs2_fs_i.h
@@ -16,7 +16,7 @@ struct jffs2_inode_info {
 	   into the GC code so it didn't attempt to obtain the i_mutex
 	   for the inode(s) which are already locked */
 	struct semaphore sem;
-
+	struct task_struct *readdir_process;
 	/* The highest (datanode) version number used for this ino */
 	uint32_t highest_version;
 


-- 
dwmw2
