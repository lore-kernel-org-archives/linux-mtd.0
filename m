Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sPCb-0007nR-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 15:56:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <14573.1032532613@redhat.com> 
References: <14573.1032532613@redhat.com>  <1032494909.1059.41.camel@www.avantwave.com> <1032432851.1847.22.camel@www.avantwave.com> <28606.1032433176@redhat.com> 
Cc: Victor Tse <victortse@avantwave.com>, linux-mtd@lists.infradead.org
Subject: Re: jffs2 BUG() in gc.c:135 "Checked all inodes but still..." 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Sep 2002 15:56:13 +0100
Message-ID: <15779.1032533773@redhat.com>
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

dwmw2@infradead.org said:
>  I can fix the fact that we screw up the accounting and hit the BUG()
> when we get this error. 

OK, I think I've done this -- CVS update and try again. Now you should just 
lose data when you get flash errors like this, rather than hitting my 
accounting sanity checks and getting a BUG(). I'm still not wonderfully 
happy with what you're seeing though.

--
dwmw2
