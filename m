Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160hfF-00063z-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 11:11:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BE66F9A.327AC763@emcraft.ru> 
References: <3BE66F9A.327AC763@emcraft.ru>  <3BE65965.F5C16E70@emcraft.ru> <29072.1004953009@redhat.com> 
To: Boris Bulkin <boris@emcraft.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 support for a custom PPC750 board 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Nov 2001 11:20:58 +0000
Message-ID: <10816.1004959258@redhat.com>
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


boris@emcraft.ru said:
>  One more question: from the M-Sys documents I understand there can be
> two types of partitions on a DOC device, binary and NFTL. Binary is
> supposed to store an OS image, and NFTL be used as a filesystem. Are
> there any MTD tools for creating and reading/writing binary DOC
> partitions? Sorry if it sonds silly. I'm not very familiar with DOC
> and MTD.

By 'binary partitions' they presumably mean data stored directly on the 
flash chips. NFTL is a kind of pseudo-filesystem which is used to emulate a 
block device - you then put normal filesystems on top of that emulated 
block device. 

Yes, we have programs which will write data to the raw flash. You just open 
/dev/mtd0, use the MEMERASE ioctl for the region you want to overwrite 
and then write to it. The doc_loadbios program was used for putting Grub in 
place of the normal firmware. 

--
dwmw2
