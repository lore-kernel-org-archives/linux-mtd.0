Received: from bay0-omc2-s37.bay0.hotmail.com ([65.54.246.173])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HP4gQ-0006Xd-TN
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 22:32:37 +0000
Message-ID: <BAY129-F38DCF83FC0B3A84A14DF91AD7A0@phx.gbl>
From: "zheng xin" <zhx821223@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: The NFS mounting jffs2 filesystem with errors, solution need
Date: Wed, 07 Mar 2007 22:32:17 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Experts:

Very very sorry about the previous mail that with disclaimer in it. Now I 
post another one with the same problem but no disclaimer. Thank you for your 
time in advance.

On my kernel (version 2.6.16.29), I can not mount a jffs2 filesystem by NFS 
(NFS works well for other file systems).

Here is my situation. I have a NFS server running with IP address 
172.16.35.20, it has the /etc/exports with the following entry:

/flash 172.16.35.1/32(rw,async,no_subtree_check,no_root_squash)

/flash is a jffs2 filesystem

And I have NFS client with IP address 172.16.35.1. When I try to mount 
/flash, I get an error looks like:

mount -t nfs 172.16.35.20:/flash /mnt
mount: 172.16.35.20:/flash failed, reason given by server: Permission denied

I saw some discussions about this kind of problem on the following link:

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

It DO mount successfully. BUT, when I try to access the mounted directory:
>ls /mnt

It is just dead, no output, can not be killed.

I am wondering are there anything wrong in my previous operations. OR are 
there any solutions, patches can fix this problem so that the jffs2 file 
system can be mounted and accessed correctly ON NFS.

Cheers,
Shane

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
