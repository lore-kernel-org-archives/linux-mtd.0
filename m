Received: from relay.2ka.mipt.ru ([194.85.82.65] helo=2ka.mipt.ru)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hz9Hl-0006i8-IF
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 06:44:13 -0400
Date: Fri, 15 Jun 2007 12:59:27 +0400
From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
Subject: Re: [Patch 07/18] fs/logfs/dir.c
Message-ID: <20070615085927.GB20361@2ka.mipt.ru>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184429.GH8952@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070603184429.GH8952@lazybastard.org>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 03, 2007 at 08:44:29PM +0200, Jörn Engel (joern@lazybastard.org) wrote:
> --- /dev/null	2007-03-13 19:15:28.862769062 +0100
> +++ linux-2.6.21logfs/fs/logfs/dir.c	2007-06-03 19:54:55.000000000 +0200

...

> +static int __logfs_dir_walk(struct inode *dir, struct dentry *dentry,
> +		dir_callback handler, struct logfs_disk_dentry *dd, loff_t *pos)
> +{
> +	struct qstr *name = dentry ? &dentry->d_name : NULL;
> +	int ret;
> +
> +	for (; ; (*pos)++) {
> +		ret = read_dir(dir, dd, *pos);
> +		if (ret == -EOF)
> +			return 0;
> +		if (ret == -ENODATA) {
> +			/* deleted dentry */
> +			*pos = dir_seek_data(dir, *pos);
> +			continue;
> +		}
> +		if (ret)
> +			return ret;
> +		BUG_ON(dd->namelen == 0);

This can be moved out of the loop or even to the higher layer where this
one is called.
There is number of such debug stuff in the tree.

...

> +static int logfs_lookup_handler(struct inode *dir, struct dentry *dentry,
> +		struct logfs_disk_dentry *dd, loff_t pos)
> +{
> +	struct inode *inode;
> +
> +	inode = iget(dir->i_sb, be64_to_cpu(dd->ino));
> +	if (!inode)
> +		return -EIO;
> +	return PTR_ERR(d_splice_alias(inode, dentry));
> +}

>From perfectionism point of view it should return long not int, but
frankly it is so minor, that even does not costs time I spent writing
this sentence. ^W^W^W

> +static int __logfs_readdir(struct file *file, void *buf, filldir_t filldir)
> +{
> +	struct logfs_disk_dentry dd;
> +	struct inode *dir = file->f_dentry->d_inode;
> +	loff_t pos = file->f_pos - IMPLICIT_NODES;
> +	int err;
> +
> +	BUG_ON(pos<0);

Spaces run away.

> +static void logfs_set_name(struct logfs_disk_dentry *dd, struct qstr *name)
> +{
> +	BUG_ON(name->len > LOGFS_MAX_NAMELEN);

Hmmm, I would write here that user is damn wrong and his
DNA is not interested for the humanity gene pool instead of crashing
machine.

> +	dd->namelen = cpu_to_be16(name->len);
> +	memcpy(dd->name, name->name, name->len);
> +}
> +}

> +static int logfs_symlink(struct inode *dir, struct dentry *dentry,
> +		const char *target)
> +{
> +	struct inode *inode;
> +	size_t destlen = strlen(target) + 1;
> +
> +	if (destlen > dir->i_sb->s_blocksize)
> +		return -ENAMETOOLONG;

Should it also include related to name overhead, or name is just placed
into datablock as is?

> +	inode = logfs_new_inode(dir, S_IFLNK | S_IRWXUGO);
> +	if (IS_ERR(inode))
> +		return PTR_ERR(inode);
> +
> +	inode->i_op = &logfs_symlink_iops;
> +	inode->i_mapping->a_ops = &logfs_reg_aops;
> +
> +	return __logfs_create(dir, dentry, inode, target, destlen);
> +}

> +static int logfs_delete_dd(struct inode *dir, struct logfs_disk_dentry *dd,
> +		loff_t pos)
> +{
> +	int err;
> +
> +	err = read_dir(dir, dd, pos);
> +
> +	/*
> +	 * Getting called with pos somewhere beyond eof is either a goofup
> +	 * within this file or means someone maliciously edited the
> +	 * (crc-protected) journal.
> +	 */
> +	LOGFS_BUG_ON(err == -EOF, dir->i_sb);

Maybe just return permanent error, remount itself read-only
and say something insulting instead of killing itself in pain?

> +	if (err)
> +		return err;
> +
> +	dir->i_ctime = dir->i_mtime = CURRENT_TIME;
> +	if (dd->type == DT_DIR)
> +		dir->i_nlink--;
> +	return logfs_delete(dir, pos);
> +}

> +static int logfs_rename_target(struct inode *old_dir, struct dentry *old_dentry,
> +		struct inode *new_dir, struct dentry *new_dentry)
> +{
> +	struct logfs_super *super = logfs_super(old_dir->i_sb);
> +	struct inode *old_inode = old_dentry->d_inode;
> +	struct inode *new_inode = new_dentry->d_inode;
> +	int isdir = S_ISDIR(old_inode->i_mode);
> +	struct logfs_disk_dentry dd;
> +	loff_t pos;
> +	int err;
> +
> +	BUG_ON(isdir != S_ISDIR(new_inode->i_mode));

Spaces run away.

> +	if (isdir) {
> +		if (!logfs_empty_dir(new_inode))
> +			return -ENOTEMPTY;
> +	}

One can save two lines of code if put both logical chek in on if ().

> +int logfs_replay_journal(struct super_block *sb)
> +{
> +	struct logfs_super *super = logfs_super(sb);
> +	struct logfs_disk_dentry dd;
> +	struct inode *inode;
> +	u64 ino, pos;
> +	int err;
> +
> +	if (super->s_victim_ino) {
> +		/* delete victim inode */
> +		ino = super->s_victim_ino;
> +		inode = iget(sb, ino);
> +		if (!inode)
> +			goto fail;
> +
> +		super->s_victim_ino = 0;
> +		err = logfs_remove_inode(inode);
> +		iput(inode);
> +		if (err) {
> +			super->s_victim_ino = ino;
> +			goto fail;
> +		}
> +	}
> +	if (super->s_rename_dir) {
> +		/* delete old dd from rename */
> +		ino = super->s_rename_dir;
> +		pos = super->s_rename_pos;
> +		inode = iget(sb, ino);
> +		if (!inode)
> +			goto fail;
> +
> +		super->s_rename_dir = 0;
> +		super->s_rename_pos = 0;
> +		err = logfs_delete_dd(inode, &dd, pos);
> +		iput(inode);
> +		if (err) {
> +			super->s_rename_dir = ino;
> +			super->s_rename_pos = pos;
> +			goto fail;
> +		}
> +	}
> +	return 0;
> +fail:
> +	LOGFS_BUG(sb);
> +	return -EIO;

:)

> +}

-- 
	Evgeniy Polyakov
