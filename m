Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tqWd-00040F-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 14:14:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BCD84E1.4DD484A6@uniquemodem.com> 
References: <3BCD84E1.4DD484A6@uniquemodem.com> 
To: data <data@uniquemodem.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock.c cannot compile under Linux 2.2.x 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Oct 2001 14:23:32 +0100
Message-ID: <25716.1003325012@redhat.com>
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

Comment out the BLKGETSIZE64 stuff in include/linux/mtd/compatmac.h and 
don't apply the patch which adds the init calls - 2.2.18 can do that the 
new way.

--
dwmw2
