Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zejv-0007gH-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 14:19:51 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14zYyx-0006Cm-00
	for linux-mtd@lists.infradead.org; Tue, 15 May 2001 08:11:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000501c0dcea$5ea40780$326c020a@SENSORIA> 
References: <000501c0dcea$5ea40780$326c020a@SENSORIA> 
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 May 2001 08:10:45 +0100
Message-ID: <27752.989910645@redhat.com>
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

baoha@sensoria.com said:
> I would like to partition the Flash into two: (1) boot loader and  (2)
> JFFS2.  Can I put the kernel, zImage, and fs.gz on JFFS2,  and boot
> the kernel from there? 

The answer to that question is entirely dependent on the bootloader you 
use. But at the moment, I think there are no bootloaders which support this.

There are patches available for Compaq bootldr used on the iPAQ, which make
it capable of loading a kernel from a JFFSv1 filesystem. But nobody's yet 
done JFFS2, AFAIK. 

We're intending to add this support to RedBoot some time in the near 
future, hopefully.

--
dwmw2
