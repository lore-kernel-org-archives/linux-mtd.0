Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hWZn-0001mG-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 13:58:27 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hWZm-0001mA-00
	for mtd@infradead.org; Mon, 26 Mar 2001 13:58:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ABF2CB0.3D7EFE4B@convergence.de> 
References: <3ABF2CB0.3D7EFE4B@convergence.de> 
To: Frank Neuber <neuber@convergence.de>
Cc: ihristov@databrokers.net, mtd@infradead.org
Subject: Re: Can't compile 2.4.2 kernel after MTD patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 26 Mar 2001 13:57:32 +0100
Message-ID: <6291.985611452@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


neuber@convergence.de said:
>  there is a small bug in nftl.c! The debug variable should be
> MTD_DEBUG_LEVEL1  :-)

Fix committed. Thanks.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
