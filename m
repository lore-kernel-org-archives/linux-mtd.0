Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159lF1-0000gN-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 11:17:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B25EBA0.71C2EF64@iriti.cnr.it> 
References: <3B25EBA0.71C2EF64@iriti.cnr.it> 
To: Fabrizio Pollastri <pollastri@iriti.cnr.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "add only" fs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 11:23:02 +0100
Message-ID: <18752.992341382@redhat.com>
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

pollastri@iriti.cnr.it said:
> a common problem in embedded systems is to log important data in a way
> safe against power failure and software bugs. The question is: may be
> jffs2 the right place to introduce an "add only" protection? It can be
> at partition level, in such a way that mounting that partition as "add
> only" I am protected against loss of data, because I can only create
> new files and/or append data to existing files and never delete or
> truncate a file unless the partition is remounted rw. 

JFFS2 _has_ to move data around, even data which haven't changed. If you 
want 100% guarantees (or as close as possible) that some parts can't 
change, put them in a separate partition which you mount readonly.

--
dwmw2
