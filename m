Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ezOR-0004kZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 14:40:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8404454A4E@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB8404454A4E@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Now Grub ??? was :RE: lilo and mtd ans doc 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Sep 2001 14:46:33 +0100
Message-ID: <29736.999783993@redhat.com>
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

pallaire@gameloft.com said:
> can you share me you /boot/grub/menu.lst file ? and what is the good
> way to install it on doc ? 

I don't think I ever bothered to make one. I was just hacking on the code 
itself, not _using_ it.

Something like

title=bzimage
root=(dc0,0)
kernel=/bzImage root=/dev/nftla


--
dwmw2
