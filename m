Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uCkU-0005yp-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 13:58:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011015144252.54361.qmail@web13608.mail.yahoo.com> 
References: <20011015144252.54361.qmail@web13608.mail.yahoo.com> 
To: Luke <luke_epsilon@yahoo.com>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: Serious flash problems - bad inodes? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Oct 2001 14:07:18 +0100
Message-ID: <25109.1003410438@redhat.com>
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

luke_epsilon@yahoo.com said:
> # ls
> Unknown INCOMPAT nodetype FFFF at 0076CC3C 
> Unknown INCOMPAT nodetype FFFF at 0076CAC0

Odd. Looks like something may have erased that flash block while it was 
mounted. Can you reproduce it?


> Last[2] is ff, datum is 85
> Write of 68 bytes at 0x0076ecec failed. returned 0, retlen 0

That's a flash driver playing silly buggers. Check you can write to the 
whole device.



--
dwmw2
