Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1783pj-0002H3-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 19:49:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020515183403.3C15D2755@sitemail.everyone.net> 
References: <20020515183403.3C15D2755@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: misc question about MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 15 May 2002 19:49:05 +0100
Message-ID: <16906.1021488545@redhat.com>
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

zeusj@firstlinux.net said:
>  I erased the flash, and I mount it(I do all these just like mount
> JFFS),but I got the message that I have meet before (in the last board
> I ported): 
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020024: 0x2f0c instead 
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020028: 0x0001 instead

The flash is not completely erased. 

> Cowardly refusing to erase blocks on filesystem with no valid JFFS2
> nodes 

The flash is not completely erased, and doesn't contain _anything_ that 
looks like valid JFFS2 data, so we don't erase it and start using it, 
because you might have mounted the wrong partition.

> I know the "Last[3] is 9da5, datum is 6246" message is to tell me that
> what should be written is wrongly different from what be read from
> flash,its a sanity check,but why a printk() can affects the Flash
> write? 

Timing? You definitely have flash driver problems. 




--
dwmw2
