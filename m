Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166ZXy-0001iy-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 15:44:22 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BFBCE4A.5DF617F3@allot.com> 
References: <3BFBCE4A.5DF617F3@allot.com>  <3BFBB870.5D435486@allot.com> <10926.1006355051@redhat.com> 
To: Felix Radensky <felix@allot.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel partition 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Nov 2001 15:54:52 +0000
Message-ID: <16766.1006358092@redhat.com>
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
>  Thanks, David. I know I need some translation layer, and I have a
> driver that provides it. My concern is disk partitioning. Will the
> method I described

> work ? Will I be able to use dd to copy kernel image to kernel
> partition on block device ?

That depends on your translation layer - I assume that'll work. Your 
translation layer code must use the gendisk mess to get partitioning to 
work. Persuading your bootloader to understand your translation layer
and the partitioning within it, and hence to load the kernel from it, is a 
different matter.

--
dwmw2
