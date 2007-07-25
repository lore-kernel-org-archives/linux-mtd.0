Received: from web57903.mail.re3.yahoo.com ([68.142.236.96])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDcYt-00051R-Hj
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 04:49:40 -0400
Date: Wed, 25 Jul 2007 01:42:59 -0700 (PDT)
From: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <46A6B5F8.3090104@ak.jp.nec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <300947.2701.qm@web57903.mail.re3.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

KaiGai Kohei <kaigai@ak.jp.nec.com> wrote:

> Did you pack any xattr in the filesystem image?

No. The initial rootfs has no files with xattrs. Applications add
attributes when the system operates. These errors occur before the
first xattr is written.

> is 0xffffff. In addition, 0x013c (316byte) and 0x07e0 (2016byte) are
> too long, if these are xattr nodes.

I don't think they're xattr nodes. These errors happen on first boot
when there are no xattrs.

> Is it possible to retry it using the kernel with debug messages.
> (See fs/jffs2/debug.h)

Ok. I'll send the log later.

> > Curiously, if I boot an NFS root and then mount the partition
> > manually, the errors do not occur.
> 
> Is it really same kernel, and same partition?

Yes. 

I mount the partition using

mount -t jffs2 /dev/mtdblock2 /mnt/tmp

I can then modify files under /mnt/tmp and then umount without errors.
There is a delay while I think jffs2 writes its clean markers to erased
sectors within the partition. If I boot with root=/dev/mtdblock2, the
errors occur and although the filesystem mounts, ls gives errors.

I'm beginning to think this is a timing issue at boot, perhaps due to a
bug in another driver. I'll investigate that.

Thanks for your reply.

Paul



      ____________________________________________________________________________________
Luggage? GPS? Comic books? 
Check out fitting gifts for grads at Yahoo! Search
http://search.yahoo.com/search?fr=oni_on_mail&p=graduation+gifts&cs=bz
