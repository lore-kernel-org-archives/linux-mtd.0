Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OmFK-0004tr-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 20:19:34 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13OmFI-0004tl-00
	for mtd@infradead.org; Tue, 15 Aug 2000 20:19:32 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <Pine.LNX.4.04.10008151317260.30949-100000@phoenix.bmedesign.com> 
References: <Pine.LNX.4.04.10008151317260.30949-100000@phoenix.bmedesign.com> 
To: Mark Jackson <mdj@phoenix.bmedesign.com>
Cc: mtd@infradead.org
Subject: Re: Patches to compile on redhat 6.2 with downloaded kernel src 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Aug 2000 20:19:28 +0100
Message-ID: <14787.966367168@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mdj@phoenix.bmedesign.com said:
>  I was able to get the mtd version in cvs to compile on my RedHat 6.2
> box against the linux-2.2.13.tar.gz linux kernel tarball source with
> the following patches applied (cvs diff 8/15/2000) 

Don't do that. Use a newer kernel. Or at least just nick compatmac.h from 
it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
