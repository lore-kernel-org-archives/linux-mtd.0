Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15izt1-0007A8-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 16:00:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B72@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B72@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re(2): trouble compiling mkfs.jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Sep 2001 16:06:45 +0100
Message-ID: <25718.1000739205@redhat.com>
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

jonas.holmberg@axis.com said:
> BTW: shouldn't mkfs.jffs2 be in the kernel source like mkcramfs? 

Possibly. 

Whatever happens, we should probably deprecate the non-zlib compression
methods except for rtime, which can be implmented purely in mkfs.jffs2.c 
rather than mucking about with sharing files between the kernel and 
userspace code.

--
dwmw2
