Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178k95-0005zR-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 16:59:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0205170948210.11746-100000@snaresland.acl.lanl.gov> 
References: <Pine.LNX.4.33.0205170948210.11746-100000@snaresland.acl.lanl.gov> 
To: Ronald G Minnich <rminnich@lanl.gov>
Cc: "Richard A. Smith" <rsmith@bitworks.com>,
    "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
    linux-mtd@lists.infradead.org
Subject: Re: Getting big flash onto motherboards. Will CF work? what will? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 16:59:51 +0100
Message-ID: <10899.1021651191@redhat.com>
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

rminnich@lanl.gov said:
>  Are there other options? These are 1U or .8U spaces most likely, and
> so a big PCI card is out of the question -- that's needed for Myrinet.
> There are no ISA slots. There are two IDE headers, and possibly a SCSI
> header. A very low profile PCI card might work. The only option I was
> aware of was IDE->CF adapaters. Is there something else I should look
> at?

Given that you can ensure the BIOS won't get too upset -- could you glue 
some flash chips onto a DIMM?

If they're going to be read-only, I suspect you'd get away with CF though.

--
dwmw2
