Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166YlB-0001dd-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 14:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BFBB870.5D435486@allot.com> 
References: <3BFBB870.5D435486@allot.com> 
To: Felix Radensky <felix@allot.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel partition 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Nov 2001 15:04:11 +0000
Message-ID: <10926.1006355051@redhat.com>
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

felix@allot.com said:
>  I'd like to create 2 partitions on my flash disk: kernel partition
> (where kernel image resides) and normal ext2 partition. I was thinking
> of using fdisk and creating an ext2 partition at some offset from the
> start of the disk, thus reserving space for kernel partition. Will
> this work, or some other technique is required ? 

No. You can't just put an ext2 filesystem on flash - at least not safely. 
You need either a translation layer to pretend to be a normal block device, 
or more usefully a real filesystem designed for use on flash, like JFFS2.

--
dwmw2
