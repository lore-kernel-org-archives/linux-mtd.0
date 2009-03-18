Received: from mail-ew0-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjuKH-0008VF-9p
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 11:52:56 +0000
Received: by ewy19 with SMTP id 19so7922ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Mar 2009 04:52:47 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 18 Mar 2009 12:52:46 +0100
Message-ID: <2bc2fa4d0903180452n2ca5432aj2fcedc9968184e1f@mail.gmail.com>
Subject: mtd mount error
From: little star <pinkystar07@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

My developement board Xscale is running a jffs2 ro rootfs and I am
trying to use free 1MB mtd partition for user data.
The mtd data (jffs2) partition is mounted to /mnt/data . Now, after
doing file operations like copy, move, edit files
on this partition, unmount and mounting again of this partition gets
failed and throws jffs2 error

JFFS2 error: (1863) jffs2_link_node_ref: Adding new ref c3d992f0 at
(0x00000000-0x00000030) not immediately after previo
us (0x00000000-0x00000000)
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3ea0000
[00000000] *pgd=03ea5031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:

any possible ideas, why it gets failed to mount ?

thanks
Pinky
