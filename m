Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ybmm-0001vv-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 16:30:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110262114340.15641-200000@server.superbt.com> 
References: <Pine.LNX.4.33.0110262114340.15641-200000@server.superbt.com> 
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GNU GRUB 0.90 DiskOnChip patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Oct 2001 16:39:56 +0000
Message-ID: <30479.1004459996@redhat.com>
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

ilatypov@superbt.com said:
>  I modified the latest available GRUB DiskOnChip patch,
> grub-0.5.97-doc.patch, to make it read partitions off the file systems
> on the DiskOnChip 2000.

Cool. Thanks for updating it.

> Note that in less than 10% of all reboots I am getting the read error
> resulting in error 16 (corrupted file sytem) or CRC errors during the
> kernel uncompression.  Your improvements are welcome. 

Quite possibly a timing issue. The LinuxBIOS people have seen something 
similar, I think.

--
dwmw2
