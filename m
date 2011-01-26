Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi4BZ-0000bZ-PW
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 12:09:18 +0000
Received: by iyj21 with SMTP id 21so302779iyj.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2011 04:09:15 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 26 Jan 2011 13:09:15 +0100
Message-ID: <AANLkTikjt-=81o4dTo2+PKYrL4+N_ae02oNNYtuy0ekN@mail.gmail.com>
Subject: mtd-utils bug in mkjffs2 : owner info not part of fs
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
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
It seems that the owner of the root point of this directory tree is always
root:root, althouh it might have other owners.

Example

mkfs.jffs2 -lnp -e 0x20000 -r /opt/rootfs/opt -o /mnt/hgfs/share/fs_opt.jffs2

In my NFS-rootfs /opt/rootfs/opt is owned by user but flashing the
created jffs file will be mounted as owner root.
>From my point of view this is a bug, as it doesn't care about the real
owner of this part of filetree.


To make this situation more clean: My flash has 2 partitions
/ and /opt

And I also create two jffs2 files, one for each partition: root.jffs2
and opt.jffs2

If I mount /opt - the ownership of /opt is root, although it has been
"user" in the tree I generated the jffs2 files from.

As I am not familiar with internal design, I hope you can fix this bug.

Best regards
Arno
