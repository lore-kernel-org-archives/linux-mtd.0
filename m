Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KNus-00056z-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 19:41:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200206181242203.SM02488@there> 
References: <200206181242203.SM02488@there> 
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jun 2002 19:41:21 +0100
Message-ID: <25600.1024425681@redhat.com>
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

mark@lakeshoremicro.com said:
> Patch GRUB with DiskOnChip updates:
> 	cd grub-0.92
> 	patch -p0 -i ../mtd/patches/grub-2002-02-19-doc.patch 

BTW, I finally got round to sorting out the copyright assignment for the 
DiskOnChip support in Grub, so hopefully this step won't be necessary for 
much longer.

--
dwmw2
