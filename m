Received: from gate.alliedtelesyn.co.nz ([202.49.72.33])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOlLa-0007m6-6q
	for linux-mtd@lists.infradead.org; Tue, 06 Mar 2007 20:54:09 -0500
Message-Id: <45EED1C8.540D.00D5.0@alliedtelesis.co.nz>
Date: Wed, 07 Mar 2007 14:52:56 +1300
From: "xin zheng" <xin.zheng@alliedtelesis.co.nz>
To: <linux-mtd@lists.infradead.org>
Subject: A query about the solution for NFS to mount jffs2 file system
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello:

On my kernel (version 2.6.16.29), I can not mount a jffs2 filesystem by
NFS (NFS works well for other file systems). 

Here is my situation. I have a NFS server running with IP address
172.16.35.20, it has the /etc/exports with the following entry:

/flash 172.16.35.1/32(rw,async,no_subtree_check,no_root_squash)

/flash is a jffs2 filesystem

And I have NFS client with IP address 172.16.35.1. When I try to mount
/flash, I get an error looks like:

mount -t nfs 172.16.35.20:/flash /mnt
mount: 172.16.35.20:/flash failed, reason given by server: Permission
denied

I saw some discussions about this kind of problem on the following
link:

http://www.infradead.org/pipermail/linux-mtd/2006-September/016496.html

Then I did the fixes given there:
Made the two Change inlinux-2.6.29/fs/jffs2/super.c ,
 	struct jffs2_sb_info *p = data;
@@ -150,6 +154,7 @@
 	spin_lock_init(&c->inocache_lock);

 	sb->s_op = &jffs2_super_operations;
+	sb->s_export_op = &jffs2_export_ops;
 	sb->s_flags = flags | MS_NOATIME;

AND

ret = jffs2_do_fill_super(sb, data, (flags&MS_VERBOSE)?1:0);
@@ -314,6 +319,7 @@
 	.name =		"jffs2",
 	.get_sb =	jffs2_get_sb,
 	.kill_sb =	jffs2_kill_sb,
+	.fs_flags = FS_REQUIRES_DEV,
 };

ALSO, I changed the /etc/exports file entry to:
/flash
172.16.35.1/32(rw,async,no_subtree_check,no_root_squash,fsid=32505856)

THEN, I try mounting again by executing:
mount -t nfs 172.16.35.20:/flash /mnt

It DO mount correctly. BUT, when I try to access the mounted
directory:
> ls /mnt

It is just dead, no output, can not be killed.

I am wondering are there anything wrong in my previous operations. OR
are there any solutions, patches can fix this problem so that the jffs2
file system can be mounted and accessed correctly ON NFS.

Cheers,
Shane




NOTICE: This message contains privileged and confidential
information intended only for the use of the addressee
named above. If you are not the intended recipient of
this message you are hereby notified that you must not
disseminate, copy or take any action in reliance on it.
If you have received this message in error please
notify Allied Telesis Labs Ltd immediately.
Any views expressed in this message are those of the
individual sender, except where the sender has the
authority to issue and specifically states them to
be the views of Allied Telesis Labs.
