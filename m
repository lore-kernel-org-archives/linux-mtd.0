Received: from ideaobjects.com ([204.83.220.134] helo=www.ideaobjects.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CFmpL-0006TW-La
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 00:58:02 -0400
Received: from mail.pramatech.com (localhost [127.0.0.1])
	by www.ideaobjects.com (8.12.8p2/8.12.8) with SMTP id i984sT59069517
	for <linux-mtd@lists.infradead.org>;
	Thu, 7 Oct 2004 22:54:30 -0600 (CST)
	(envelope-from prashant@pramatech.com)
Message-ID: <60299.202.156.2.50.1097211270.squirrel@mail.dotaku.com>
Date: Fri, 8 Oct 2004 12:54:30 +0800 (SGT)
From: "Prashant Alves" <prashant@pramatech.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: 2.6.8.1 / 2.6.9-rc3-ds1 jffs2 root mount failure
Reply-To: prashant@pramatech.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been trying to get IXP425 based coyote board to boot with 2.6.8.1 /
2.6.9-rc3-ds1 with mtd-snapshot-20041005. I have selected jffs2 to also be
updated from the snapshot.

However at bootup I get:
Kernel panic - not syncing:VFS: Unable to mount root fs on
unknown-block(31,2)

The root on flash is a jffs2 filesystem and I pass root=/dev/mtdblock2 as
my kernel parameters.

The partition mounts fine when I boot using NFS and do a manual mount. It
also  works fine as root on a 2.4.19-ds3 kernel that I have.

Tracing through it seems get_fs_names() in mount_block_root() in
init/do_mounts.c fails.

Any idea what is causing this ? Any suggestions where I should be looking
for the cause of the problem.

Thanks,
Prashant Alves
