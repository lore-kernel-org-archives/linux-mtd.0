Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w0xA-0001Q6-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 13:46:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <25D13BA49CC6D31193040040953309CE7FAA@MICSERV> 
References: <25D13BA49CC6D31193040040953309CE7FAA@MICSERV> 
To: Gareth Williams <gareth@microm-electronics.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DOC LILO BIOS Identities. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Oct 2001 13:55:59 +0100
Message-ID: <11780.1003841759@redhat.com>
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
> How does one discover what the BIOS disk identities will be for the
> disk on chip? E.g. 0x80 or 0x83 etc...

> I am trying to use LILO and it is getting confused!!

Just the same as for mixed SCSI/IDE drives - you don't, you just guess. 

Wanna get Grub finished?

--
dwmw2
