Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrV8b-0000Ih-0H
	for linux-mtd@lists.infradead.org; Fri, 03 Sep 2010 12:12:57 +0000
Received: by iwn40 with SMTP id 40so1732577iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Sep 2010 05:12:55 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Sep 2010 14:12:54 +0200
Message-ID: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
Subject: mks.jffs2 uid/gid for root inode
From: Arno Steffen <arno.steffen@googlemail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use mkfs.jffs2 to generate a partition out of a directory tree (not
the hole root-filesystem).
It seem the owner of the root point of this directory tree is always
root:root, althouh it might have other owners.

Example

mkfs.jffs2 -lnp -e 0x20000 -r /opt/rootfs/opt -o /mnt/hgfs/share/fs_opt.jffs2

In my NFS-rootfs /opt/rootfs/opt is owned by user but flashing the
created jffs file will be mounted as owner root.
>From my point of view this is a bug, as it doesn't care about the real
owner of this part of filetree.
Or did I misused the -r option?

I hope you can give me a comment or some feedback, how to change this behaviour.

Best regards
Arno
