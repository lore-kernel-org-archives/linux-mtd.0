Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164l5J-0001FX-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 15:39:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1005925030.25782.27.camel@LinuxDev> 
References: <1005925030.25782.27.camel@LinuxDev> 
To: Ian Campbell <icampbell@arcom.co.uk>
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Caching of reads 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 16 Nov 2001 15:48:29 +0000
Message-ID: <30843.1005925709@redhat.com>
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


icampbell@arcom.co.uk said:
>  It seems as if reads from a JFFS2 file system are not being cached as
> we would expect, for instance this small script:

> while true ; do sleep 1; done

> causes a read from the flash every time the sleep is executed. This is
> true even if the fs is mounted read only. 

Strange. JFFS2 doesn't do caching - that's supposed to be handle by the 
Linux VFS/VM. But set CONFIG_JFFS2_FS_DEBUG=1 and 
echo 9 > /proc/sys/kernel/printk, then see what it's actually being asked 
to read each time.

--
dwmw2
