Received: from exg.allot.com ([199.203.223.202])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166ZW5-0001ie-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 15:42:26 +0000
Message-ID: <3BFBCE4A.5DF617F3@allot.com>
Date: Wed, 21 Nov 2001 17:54:50 +0200
From: Felix Radensky <felix@allot.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Kernel partition
References: <3BFBB870.5D435486@allot.com> <10926.1006355051@redhat.com>
Content-Type: text/plain; charset=us-ascii
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

Hi,

Thanks, David. I know I need some translation layer, and I have a driver
that provides it. My concern is disk partitioning. Will the method I described

work ? Will I be able to use dd to copy kernel image to kernel partition on
block
device ?

TIA.

Felix.

David Woodhouse wrote:

> felix@allot.com said:
> >  I'd like to create 2 partitions on my flash disk: kernel partition
> > (where kernel image resides) and normal ext2 partition. I was thinking
> > of using fdisk and creating an ext2 partition at some offset from the
> > start of the disk, thus reserving space for kernel partition. Will
> > this work, or some other technique is required ?
>
> No. You can't just put an ext2 filesystem on flash - at least not safely.
> You need either a translation layer to pretend to be a normal block device,
> or more usefully a real filesystem designed for use on flash, like JFFS2.
>
> --
> dwmw2
