Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175i6W-00078r-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 08:12:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200205082257.g48MvFP09794@tinman.seitzassoc.com> 
References: <200205082257.g48MvFP09794@tinman.seitzassoc.com> 
To: Galen Seitz <galens@seitzassoc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: module options for physmap.o? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 May 2002 08:12:42 +0100
Message-ID: <1614.1020928362@redhat.com>
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

galens@seitzassoc.com said:
>  I have a PCI card which contains flash memory that is mapped into the
> PCI memory space via a BAR.  Since the base address is dynamic, I'm
> not sure how to use physmap.  Is there another way to do this, or,
> alternatively, how difficult would it be to add module options to
> physmap to allow for dynamic configuration?

You'd do better to add module options to the pci map driver instead.

--
dwmw2
