Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFqON-00079o-W9
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 04:46:25 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: prashant@pramatech.com
In-Reply-To: <60299.202.156.2.50.1097211270.squirrel@mail.dotaku.com>
References: <60299.202.156.2.50.1097211270.squirrel@mail.dotaku.com>
Content-Type: text/plain
Message-Id: <1097224694.11402.1388.camel@thomas>
Mime-Version: 1.0
Date: Fri, 08 Oct 2004 10:38:14 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.8.1 / 2.6.9-rc3-ds1 jffs2 root mount failure - FAQ
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-08 at 06:54, Prashant Alves wrote:
> Hi,
> 
> I have been trying to get IXP425 based coyote board to boot with 2.6.8.1 /
> 2.6.9-rc3-ds1 with mtd-snapshot-20041005. I have selected jffs2 to also be
> updated from the snapshot.
> 
> However at bootup I get:
> Kernel panic - not syncing:VFS: Unable to mount root fs on
> unknown-block(31,2)
> 
> The root on flash is a jffs2 filesystem and I pass root=/dev/mtdblock2 as
> my kernel parameters.
> 
> The partition mounts fine when I boot using NFS and do a manual mount. It
> also  works fine as root on a 2.4.19-ds3 kernel that I have.
> 
> Tracing through it seems get_fs_names() in mount_block_root() in
> init/do_mounts.c fails.

pass rootfstype=jffs2 in the commandline

tglx
