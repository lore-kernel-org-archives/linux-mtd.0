Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qWOM-00065T-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2001 10:08:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BBD8729.92A77296@digigram.com> 
References: <3BBD8729.92A77296@digigram.com> 
To: Claire Troussier <troussier@digigram.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem with mtd on a Sandpoint 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 10:16:54 +0100
Message-ID: <13586.1002532614@redhat.com>
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

troussier@digigram.com said:
>  I add the mtd support in the kernel configuration and during boot the
> flash is correctly identified. When I try to access it I always got
> the same error "can't locate module block-major-31" or "can't locate
> module char-major-90" if I use mtd0 instead of mtdblock0

Those errors happen because you haven't enabled CONFIG_MTD_BLOCK or 
CONFIG_MTD_CHAR respectively. Without CONFIG_MTD_BLOCK, you can't mount 
JFFS, although that's a limitation we intend to fix, as we don't actually 
_use_ the mtdblock driver during the operation of JFFS.

--
dwmw2
