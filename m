Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IsJv-0003C9-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 15:17:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <OF7C0F5F09.F3127DE1-ONC1256C83.00554D72@keymile.ch> 
References: <OF7C0F5F09.F3127DE1-ONC1256C83.00554D72@keymile.ch> 
To: Thomas.Locher@keymile.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel deadlocks during jffs2 mount... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Dec 2002 15:47:41 +0000
Message-ID: <31066.1038844061@passion.cambridge.redhat.com>
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

Thomas.Locher@keymile.com said:
> It seems that the GC is blocking the kernel. When we use another NFS
> as root filesystem and then mount the partition,  we still get the
> same errors, but the system does'nt block... 

Remove invalidate_device() from mtdblock_release().

--
dwmw2
