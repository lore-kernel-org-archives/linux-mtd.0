Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cvt1-0000tj-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 22:31:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8404344CFC@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB8404344CFC@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: lilo and mtd ans doc 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 31 Aug 2001 22:37:29 +0100
Message-ID: <10029.999293849@redhat.com>
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


pallaire@gameloft.com said:
> Kernel Panic : VFS: unable to mount root fs on 03:05 

Er, that's /dev/hda5. It's not trying to mount the DiskOnChip at all.
Try append="root=/dev/nftla1" instead of just root=/dev/nftla1

LILO sucks like that.

BTW, how many partitions do you have on the DiskOnChip? If only one, why 
are you wasting space on partitions rather than just using a filesystem on 
/dev/nftla ?

--
dwmw2
