Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LCSV-0000EA-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 01:39:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFGEFACEAA.david@forcedpotato.com> 
References: <AIEOIMKIOAAJKHJOGAEFGEFACEAA.david@forcedpotato.com> 
To: "David Cooper" <david@forcedpotato.com>
Cc: "Ilguiz Latypov" <ilatypov@superbt.com>,
    "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: Re: X Windows Performance with DOC 2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Jun 2002 01:39:20 +0100
Message-ID: <10120.1024619960@redhat.com>
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

david@forcedpotato.com said:
>  Yes, when I use a kernel with the MTD support built-in for DoC 2000
> and nftl I can still run X with the DoC in the system (unless I use
> the M-Systems 4.2 firmware which prevents X from running with or
> without MTD support).  I have not tried loading and unloading MTD
> support as a kernel module.  Maybe this is worth a go. 

If you have the drivers built-in and can still run X, that's what I wanted 
to know. Can you even have the file system on NFTL mounted, as long as your 
X modules aren't on it?

>  Interestingly, I can run SVGAlib applications from the DoC (using the
> VESA driver) without any trouble.  This is confusing because I would
> imagine that the SVGAlib VESA driver and the XFree86 VESA driver are
> both accessing the VESA BIOS.

True.

> M-Systems have told me that the firmware DoC driver that loads into
> memory at bootup sometimes conflicts in memory space that linux is
> trying to use. I suppose this would explain why using different
> firmware versions can prevent X from running from the IDE drive. 

That caused Linux to fail to boot -- but once you're actually in Linux, 
the allocations of the old DOS driver should be long forgotten.

Unless the XFree86 code somehow tries to re-run the DiskOnChip firmware -- 
but you said you'd reproduced the problem even with that obliterated, 
didn't you?

--
dwmw2
