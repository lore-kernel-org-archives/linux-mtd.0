Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Jg80-0000Fr-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 20:28:16 +0000
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4A4@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: 'Thomas Gleixner' <tglx@linutronix.de>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Problem: 51MB partition max size on jffs2
Date: Wed, 4 Dec 2002 15:58:48 -0500 
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Gleixner wrote: 
> ... In actual CVS-code this problem is solved by building virtual 
> blocks of 2,4 or 8 physical blocks. 

Thanks! I hadn't checked CVS for a few weeks, so I didn't
realize there was a better solution. I'll drop the vmalloc()
change and use the CVS-code.

Dave
 
