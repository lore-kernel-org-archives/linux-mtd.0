Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from lightning.swansea.uk.linux.org ([194.168.151.1] helo=the-village.bc.nu)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11iLVQ-0003uA-00
	for mtd@infradead.org; Mon, 1 Nov 1999 17:44:33 +0000
Subject: Re: jfs/linux
To: David.Woodhouse@mvhi.com (David Woodhouse)
Date: Mon, 1 Nov 1999 17:40:36 +0000 (GMT)
Cc: miket@bluemug.com, SLEAS@videoupdate.com, sct@redhat.com, joh@xinit.se,
	linux-kernel@vger.rutgers.edu, mtd@infradead.org
In-Reply-To: <E11iIib-00088Z-00@devel2.axiom.internal> from "David Woodhouse" at Nov 1, 99 02:45:57 pm
Content-Type: text
Message-Id: <E11iLRd-0002uk-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> All the solutions we currently have for filesystems on flash present a block 
> device rather than a filesystem interface - that is, both FTL and NFTL act as 
> an extra translation layer below the actual filesystem, providing 512-byte 
> random block access for use by a traditional filesystem. 

Ditto with Compact flash (ATAPI). Compact flash according to the docs does
its own wear levelling.  Im still baffled why people use the other stuff 8)

Alan



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
