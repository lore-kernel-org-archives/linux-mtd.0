Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ekx1-0003ZP-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 23:15:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B968F05.55BD868A@gmx.de> 
References: <3B968F05.55BD868A@gmx.de> 
To: Thomas Eschenbacher <Thomas.Eschenbacher@gmx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD in kernel 2.4.9 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 23:21:17 +0100
Message-ID: <14713.999728477@redhat.com>
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

Thomas.Eschenbacher@gmx.de said:
>  just a newbie question: is there a way to get the current cvs version
> of mtd/jffs2 working with kernel 2.4.9?

It generally ought to work, although I'm not building JFFS2 against
2.4.9 so I haven't merged the complete_and_exit() fix yet. Other than that, 
what breaks?


--
dwmw2
