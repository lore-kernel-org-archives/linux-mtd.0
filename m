Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14yFr9-0003nF-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2001 17:33:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AFB5CA7.A413ECCF@troche.org> 
References: <3AFB5CA7.A413ECCF@troche.org>  <A3E34B558F5CD211B4980008C7A4A99003163ECC@sparrow.eng.gilbarco.com> 
To: edmund@troche.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: Errors getting JFFS to work 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 May 2001 17:37:03 +0100
Message-ID: <7178.989599023@redhat.com>
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

edmund@troche.org said:
> When I boot it recognizes the DoC correctly and it seems like I can
> ntfl_format and fdisk without problems. The problems seems to start
> when I try to copy and image created with mkfs.jffs into the mtd
> character device 0.

You can't use JFFS on the DiskOnChip yet. Small amounts of hacking on the 
hardware driver are required - to make it deal with large reads and writes, 
etc.

Either you need to make the necessary changes, or just use NFTL on it.

--
dwmw2
