Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KoxL-0006x3-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 00:33:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1024499619.9366.25.camel@geb> 
References: <1024499619.9366.25.camel@geb> 
To: Chris AtLee <catlee@canada.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Problems unlinking files 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 Jun 2002 00:33:42 +0100
Message-ID: <26464.1024529622@redhat.com>
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

catlee@canada.com said:
> I've noticed some problems with unlinking files with JFFS2 in my linux
> 2.2.18 port.  After unlinking a file, it doesn't appear in the
> directory listing, but if I do an 'ls' on the unlinked file, I can
> still get information on the file.  I can still read and write to the
> file, but it refuses to show up in the directory listing. After I
> unmount the JFFS2 partition and remount it the file isn't there at
> all.

Can you run with CONFIG_JFFS2_FS_DEBUG=1 and show the output while you 
unlink the file, then open it again?

Preferably using a serial console, and they'll be KERN_DEBUG messages so 
you'll need to echo 9 > /proc/sys/kernel/printk to make them get printed.

> Any ideas?  I'm sure I must have deleted something important getting
> everything working with linux 2.2.18.

Show me your jffs2_unlink() and jffs2_do_unlink() -- and indeed the rest of 
it :)

--
dwmw2
