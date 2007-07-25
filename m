Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDdIt-0005XL-Uh
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 05:37:13 -0400
Message-ID: <46A71A39.5020707@ak.jp.nec.com>
Date: Wed, 25 Jul 2007 18:39:05 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
References: <300947.2701.qm@web57903.mail.re3.yahoo.com>
In-Reply-To: <300947.2701.qm@web57903.mail.re3.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul,

 >> Did you pack any xattr in the filesystem image?
 >
 > No. The initial rootfs has no files with xattrs. Applications add
 > attributes when the system operates. These errors occur before the
 > first xattr is written.

I wonder why jffs2/xattr code gave an effect your flash device
without any xattr node, because any xattr related implementation
is invoked only when jffs2 found xattr nodes on the medium, or
xattr related operations are done (like setfacl).

>> Is it possible to retry it using the kernel with debug messages.
>> (See fs/jffs2/debug.h)
> 
> Ok. I'll send the log later.

I think Kconfig related to JFFS2 also helps us to understand the situation.

 > mount -t jffs2 /dev/mtdblock2 /mnt/tmp
 >
 > I can then modify files under /mnt/tmp and then umount without errors.
 > There is a delay while I think jffs2 writes its clean markers to erased
 > sectors within the partition. If I boot with root=/dev/mtdblock2, the
 > errors occur and although the filesystem mounts, ls gives errors.
 >
 > I'm beginning to think this is a timing issue at boot, perhaps due to a
 > bug in another driver. I'll investigate that.

What's happen when you boot the board with NFS root, and mount the errored
partition manually again?
If you can reproduce the error, I recommend you to try the same test
on mtdram pseudo mtd device next.

-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
