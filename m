Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MqUE-0000NV-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 14:36:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02062413502007.08285@tux> 
References: <02062413502007.08285@tux> 
To: esn@cotas.dk
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with Jffs2 on this board 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jun 2002 14:36:01 +0100
Message-ID: <17635.1025012161@redhat.com>
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

esn@cotas.dk said:
>  I create a root filesystem image with mkfs.jffs2 which I transfer to
> the  flash on the board with over serial. I can now boot the kernel
> from the  bootloader but the kernel can't find other files that those
> in /devs (from  the debug level of 2 in the jffs2 subsystem in the
> kernel) and thus fails to call /sbin/init.

Your mkfs.jffs2 isn't the problem though -- can you double-check that the 
image has made it correctly to the flash? If you can boot nfsroot, read it 
back from the /dev/mtd device and compare it with the original -- to verify 
correct download and correct partitioning setup etc.

--
dwmw2
