Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169N4g-0007fh-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2001 09:01:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1006360382.903.16.camel@LinuxDev> 
References: <1006360382.903.16.camel@LinuxDev>  <1006355430.17354.8.camel@LinuxDev> <1005925030.25782.27.camel@LinuxDev> <30843.1005925709@redhat.com> <15923.1006357600@redhat.com> 
To: Ian Campbell <icampbell@arcom.co.uk>
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>,
    JFFS dev Mailing List <jffs-dev@axis.com>
Subject: Re: Caching of reads 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 29 Nov 2001 09:08:23 +0000
Message-ID: <29707.1007024903@redhat.com>
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
>  It seems to do the trick!
> Thanks very much for the exceedingly quick response! 

I'm not committing it. We want to do it the way ext2 does, with 
page_symlink_inode_operations and a readpage(). That way, we can drop the 
cached symlink target from memory when we can't just drop the whole inode.

--
dwmw2
