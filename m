Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KL3I-0004pC-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 16:37:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1024414167.9366.9.camel@geb> 
References: <1024414167.9366.9.camel@geb> 
To: Chris AtLee <catlee@canada.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS & MTDBLOCK 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jun 2002 16:37:36 +0100
Message-ID: <14188.1024414656@redhat.com>
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
>  I'm not sure that I understand what this means...
> Does it mean that for production units where you want the filesystem
> to be writeable you should use JFFS on a non-MTDBLOCK device?

> Or does it mean that using a filesystem other than JFFS for writing to
> a MTDBLOCK device is probably a bad idea?

It means the latter. When you mount JFFS/JFFS2 on an mtdblock device, it 
doesn't actually _use_ the read/modify/erase/writeback algorithm described 
-- or indeed use the mtdblock driver at all -- it just uses the minor 
number of the mtdblock device you specified to get a handle on the real 
underlying MTD device. 

Using any _other_ file system than JFFS/JFFS2 on the mtdblock device other 
than in read-only mode is a bad idea. 

--
dwmw2
