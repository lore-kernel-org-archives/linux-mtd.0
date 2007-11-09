Received: from web43144.mail.sp1.yahoo.com ([216.252.121.74])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqZcg-0003p8-MB
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 14:34:41 -0500
Date: Fri, 9 Nov 2007 11:34:32 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.0.9999.0711091329000.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <901761.25711.qm@web43144.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > Adding the ability to unlock a partition on mount is not a bad idea, but it
> should
> > not be the only way.  I often write to an mtd block device without mounting it
> and I
> > do not always use jffs2 as my writable filing system.
> 
> Never heard of the MTD flash-unlock user space utility?
> 

That does not help me on boot up.  I already have filing sytems that run that
through scripts on startup for some of my test images.

Justin

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
