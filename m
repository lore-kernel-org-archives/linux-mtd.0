Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AE8d-00037r-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 17:41:19 +0000
Subject: Re: JFFS2: cannot execute /bin/bash: Permission denied
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
In-Reply-To: <27599.1007225846@redhat.com>
References: <1007224058.1712.2.camel@gromit>   <27599.1007225846@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Dec 2001 12:53:19 -0500
Message-Id: <1007229199.1713.4.camel@gromit>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Sat, 2001-12-01 at 11:57, David Woodhouse wrote:
> chmod +x /mnt/flash/lib/*.so*

Not the problem. I did look in lib/ though, and all the symlinks were
wrong. In the "source" tree, the one that I used mkfs.jffs2 on, the
symlinks were correct (produced by chrooted ldconfig).

I'm using 2.4.13.

I tried copying data to the fs, and now I'm getting a disk-pounding
amount of this:

Dec  1 12:43:51 gromit kernel: Argh. Special inode #1589 had more than
one node
Dec  1 12:46:32 gromit kernel: Argh. Special inode #1431 had more than
one node
Dec  1 12:46:33 gromit kernel: Argh. Special inode #1435 had more than
one node
Dec  1 12:46:33 gromit kernel: Argh. Special inode #1437 had more than
one node
Dec  1 12:46:33 gromit kernel: Argh. Special inode #1438 had more than
one node
Dec  1 12:46:33 gromit kernel: Argh. Special inode #1439 had more than
one node
Dec  1 12:46:34 gromit kernel: Argh. Special inode #1443 had more than
one node
Dec  1 12:46:35 gromit kernel: Argh. Special inode #1452 had more than
one node
Dec  1 12:47:01 gromit kernel: Eep. read_inode() failed for ino #1589
[...]
Dec  1 12:48:43 gromit last message repeated 96 times
Dec  1 12:48:43 gromit kernel: Eep. read_inod589
Dec  1 12:48:43 gromit kernel: Eep. read_inode() failed for ino #1589
Dec  1 12:48:43 gromit last message repeated 96 times
Dec  1 12:48:43 gromit kernel: Eep. read_inod589
Dec  1 12:48:43 gromit kernel: Eep. read_inode() failed for ino #1589
Dec  1 12:48:43 gromit last message repeated 96 times
Dec  1 12:48:43 gromit kernel: Eep. read_inod589
Dec  1 12:48:43 gromit kernel: Eep. read_inode() failed for ino #1589
Dec  1 12:48:43 gromit last message repeated 96 times
Dec  1 12:48:43 gromit kernel: Eep. read_inod589
Dec  1 12:48:43 gromit kernel: Eep. read_inode() failed for ino #1589
Dec  1 12:48:43 gromit last message repeated 96 times
Dec  1 12:48:43 gromit kernel: Eep. read_inod589
Dec  1 12:48:43 gromit kernel: Eep. read_inode() failed for ino #1589
Dec  1 12:48:43 gromit last message repeated 96 times
Dec  1 12:48:43 gromit kernel: Eep. read_inod589
