Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w1S2-0001UO-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 14:18:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <25D13BA49CC6D31193040040953309CE7FAB@MICSERV> 
References: <25D13BA49CC6D31193040040953309CE7FAB@MICSERV> 
To: Gareth Williams <gareth@microm-electronics.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DOC LILO BIOS Identities. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Oct 2001 14:27:54 +0100
Message-ID: <15446.1003843674@redhat.com>
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

gareth@microm-electronics.com said:
> Okay - tell me about GRUB, I take it that it's similar to LILO in that
> it's a boot manager?

Yep. You can load it into the DiskOnChip in place of their normal firmware, 
so that the system BIOS runs Grub instead of trying to boot normally. 

Then there are patches to grub itself to make it drive the DiskOnChip. 
Those patches aren't 100% perfect yet, but they're fairly close. They're in 
CVS. 

--
dwmw2
