Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15iy5X-0006yi-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 14:05:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BA5F4EC.2060909@tid.es> 
References: <3BA5F4EC.2060909@tid.es> 
To: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash writings limit? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Sep 2001 14:11:26 +0100
Message-ID: <10490.1000732286@redhat.com>
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


jradc@tid.es said:
>     Is it harmful to the flash memory if the whole filesystem tree in
> linux is intalled on flash (including /tmp /var and other directories
> with a high rate of writing operations) ? I have Strata Flash with
> JFFS2  installed.

It depends how much you actually write to those directories, but yes - it's 
advisable to put them elsewhere. The iPAQ uses ramfs for /tmp and some of 
the subdirectories of /var - that seems like a sensible plan.

--
dwmw2
