Received: from mail3.aracnet.com ([216.99.193.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 176I3O-0001MN-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 22:35:54 +0100
Received: from tinman.seitzassoc.com (216-99-217-243.dsl.aracnet.com [216.99.217.243])
	by mail3.aracnet.com (8.12.2/8.12.1) with ESMTP id g4ALZoGN008516
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 14:35:52 -0700
Received: from tinman.seitzassoc.com (IDENT:galens@localhost [127.0.0.1])
	by tinman.seitzassoc.com (8.11.6/8.11.6) with ESMTP id g4ALZjP02377
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 14:35:50 -0700
Message-Id: <200205102135.g4ALZjP02377@tinman.seitzassoc.com>
To: linux-mtd@lists.infradead.org
Subject: Re: can't rmmod cfi_cmdset_0002 
In-Reply-To: Your message of "Fri, 10 May 2002 01:16:31 PDT."
             <200205100816.g4A8GVP25163@tinman.seitzassoc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 10 May 2002 14:35:45 -0700
From: Galen Seitz <galens@seitzassoc.com>
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

> In the course of hacking on pci.c, I've encountered an issue with
> removing the cfi_cmdset_0002 module.  It seems that once I have
> successfully loaded the pci module, I can't unload the cmdset module.
> Is it likely that I have created this problem?  How does one go about
> tracking down a problem like this? 

I've done a little more experimenting and come up with another data point.
After installing physmap, the use count of cfi_cmdset_0002 goes from
0 to 2.  When I rmmod physmap, the use count of cfi_cmdset_0002 only drops
back to 1, which prevents the module from being unloaded.  Has anyone
else seen this problem?  Note that the only change I made to physmap.c
was to change ioremap to ioremap_nocache.  It appears from looking at
the code that a call to cfi_cmdset_0002 will result in the macro 
MOD_INC_USE_COUNT being executed twice, once in cfi_cmdset_0002, and again
in cfi_amdstd_setup.  cfi_cmdset_0001.c has a similar structure.
Is this intentional?

thanks,
galen
