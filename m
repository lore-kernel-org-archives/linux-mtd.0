Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cFio-000870-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 02:34:46 +0100
Message-ID: <003001c23db2$a9fe8d20$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <brendan.simon@ctam.com.au>, "linux-mtd" <linux-mtd@lists.infradead.org>
References: <3D4F89CF.3010809@ctam.com.au> <4518.1028624265@redhat.com> <3D505C85.80705@ctam.com.au>
Subject: Re: kernel hangs on DOC2000 root filesystem
Date: Wed, 7 Aug 2002 09:35:08 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

(2.4.18)mount_root():blkdev_put():bdev->bd_op->release():invalidate_device()
: invalidate_inodes(sb)
probably caused by doing invalidate_xxx() inside mount_root()?
(some other driver also hang when doing release() operation inside
mount_root)

----- Original Message -----
From: "Brendan J Simon" <brendan.simon@ctam.com.au>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Sent: Wednesday, August 07, 2002 7:32 AM
Subject: Re: kernel hangs on DOC2000 root filesystem


>
>
> David Woodhouse wrote:
>
> >brendan.simon@ctam.com.au said:
> >
> >> Any ideas why the kernel just hangs ?
> >>
> >>>>>>>>>>BJS: nftl_release(): invalidate_device()
> >>>>>>>>>>
>
> Is this because get_super() fails ???
>
> I've done an fsck.ext2 and it passed with no problems.  This should mean
> that the super blocks are OK, should it ???
>
> I formatted the DOC with nftl_format if that makes any difference.
> I also used the latest fdisk from util-linux for format the drive with
> an MSDOS partition table and one ext2 partition.
>
> Thanks for any help or advice.
> Brendan Simon.
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
