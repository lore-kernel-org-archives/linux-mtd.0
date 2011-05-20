Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNZFH-0005Th-No
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 23:36:40 +0000
Subject: Setting security XATTR on ubifs
From: Subodh Nijsure <snijsure@grid-net.com>
To: mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 16:36:41 -0700
Message-ID: <1305934601.10340.12.camel@subodh-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: snijsure@grid-net.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


we have implemented modifications to UBIFS to add support for SELinux
labeling. Function that created this XATTR is called
ubifs_init_security(), shown below.

Following example of how JFFS2 does extended attribute labeling, This
function is being called from 
ubifs_create(),ubifs_mkdir(), ubifs_mknod(), ubifs_symlink() (in
fs/ubifs/dir.c)

With this modification things work "mostly", I am able to label the file
system, but sometimes the file system is getting corrupted. I will
certainly post the patch once things work reliably. 

I don't _fully_ understand how ubifs is doing space management, hence
the immediate questions I have are:
1. What is the right point to add the XATTR to the UBIFS inode, after
the ubifs_new_inode() is done? Should ubifs_budget_space() be updated to
handle extra space needed by the XATTR.

2. In function below ui_mutex is being locked/unlocked while XATTR for
the file is updated. Is that required while updating the extended
attribute?

-Subodh Nijsure

static void ubifs_init_security(struct dentry *dentry, struct inode
*inode, struct inode *dir)
{
        int err;
        char *name;
        void *value = NULL;
        size_t len = 0;
        struct ubifs_inode *dir_ui = ubifs_inode(dir);
        mutex_lock(&dir_ui->ui_mutex);
        err = security_inode_init_security(inode, dir, &name, &value,
&len);
        if (err) {
                if (err == -EOPNOTSUPP)
                        return;
                ubifs_err("unable to retrieve security context, error %
d", err);
                mutex_unlock(&dir_ui->ui_mutex);
                return;
        }
        err = ubifs_setxattr(dentry, name, value, len, 0);
        if (err)
                ubifs_err("unable to set security context (extended
attribute), err %d",err);
        kfree(name);
        if ( value )
                kfree(value);
        mutex_unlock(&dir_ui->ui_mutex);
}
