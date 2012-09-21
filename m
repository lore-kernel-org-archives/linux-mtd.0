Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TF5Mf-000459-3g
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 15:42:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id 816E713B01
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 17:41:59 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Z35Nj6U8tAI8 for <linux-mtd@lists.infradead.org>;
 Fri, 21 Sep 2012 17:41:58 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by ra.se.axis.com (Postfix) with ESMTP id 983A313AF1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 17:41:58 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by thoth.se.axis.com (Postfix) with ESMTP id 967D9341A2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 17:41:58 +0200 (CEST)
Subject: mkfs.ubifs problem when output file really isn't in the UBIFS root
 directory
From: Marcus Prebble <marcus.prebble@axis.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 21 Sep 2012 17:41:58 +0200
Message-ID: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricardw@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are working on a project using UBI/UBIFS and I have run into a
problem with mkfs.ubifs which I am hoping someone can advise on.
Apologies if I have already missed the answer to this in the archives
somewhere.

A requirement of the project is to take an image of the root filesystem
(/) which is implemented as a static UBI read only volume. Obviously its
not possible to unmount /, but it seems to be possible to re-mount the
UBI volume, read only, onto another location e.g. /tmp/mnt/new_rootfs.

The problem arises when running mkfs.ubifs is that it fails saying that
the output file cannot be in the UBIFS root directory.
This sounds like a reasonable constraint if the output file really was
in the root, but this is not the case for us seeing root is mounted
somewhere belowtmp. To give a concrete example of the command we are
running:

mkfs.ubifs --output=/tmp/rootfs.img  --leb-size=129024
--root=/tmp/rootfs_mnt --min-io-size=2048 --max-leb-cnt=147 

Where /dev/ubi0_11 is mounted read-only on both / and /tmp/rootfs_mnt/.

Having a look at the source for mkfs.ubifs it seems that the function
in_path(..) is the problem - it works up the directory tree using ../
until it either reaches the top_dir (/) or the inode number/dev match in
which case it fails. It doesn't seem that this section of code has
changed in the latest version of mtd-utils (we are running 1.4.3-2) and
I wonder if this is a bug in in_path(..) or a genuine safeguard against
screwing something up? I suspect the former for when I disabled this
check in mkfs.ubifs.c the resulting image was completely OK.

Kind regards,

Marcus Prebble
Axis Communications AB
