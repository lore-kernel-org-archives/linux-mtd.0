Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wYiH-0000u3-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 23:45:05 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wYiD-0000tx-00
	for mtd@infradead.org; Thu, 16 Nov 2000 23:45:04 +0000
Date: Thu, 16 Nov 2000 23:44:01 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Erwin Authried <eauth@softsys.co.at>
cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: block device for 2.0
In-Reply-To: <01C04FE2.F4415760@omnibook.home.at>
Message-ID: <Pine.LNX.4.30.0011162343080.5514-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 16 Nov 2000, Erwin Authried wrote:

> I thought it might be best to have the choice between the
> old, uncached block block driver (for uClinux) or the new driver
> as a configuration option. Are there any better ideas?

Makes sense. How about having CONFIG_MTD_BLOCK and CONFIG_MTD_BLOCK_RW
just like we currently have for NFTL?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
