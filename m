Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ADIA-00033T-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 16:47:06 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1007224058.1712.2.camel@gromit> 
References: <1007224058.1712.2.camel@gromit> 
To: Michael Rothwell <rothwell@holly-springs.nc.us>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2: cannot execute /bin/bash: Permission denied 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 16:57:26 +0000
Message-ID: <27599.1007225846@redhat.com>
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

[root@gromit flash]# chroot /mnt/flash
chroot: cannot execute /bin/bash: Permission denied

LD_DEBUG=all /mnt/flash/lib/ld-linux.so.2 --library-path /mnt/flash/lib:/mnt/flash/usr/lib /mnt/flash/bin/bash

chmod +x /mnt/flash/lib/*.so*

--
dwmw2
