Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14WERD-0003sw-00
	for mtd-list@infradead.org; Fri, 23 Feb 2001 09:22:55 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14WERC-0003sq-00
	for mtd@infradead.org; Fri, 23 Feb 2001 09:22:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01020607301103.02799@localhost.localdomain> 
References: <01020607301103.02799@localhost.localdomain> 
To: elenstev@mesatop.com
Cc: mtd@infradead.org
Subject: Re: [PATCH] 2.4.1-ac3 CONFIG_INPUT documentation in Configure.help 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Feb 2001 09:22:42 +0000
Message-ID: <28608.982920162@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


elenstev@mesatop.com said:
>  It looks like the following MTD related config options have no help
> in Configure.help:

Some of those are present in my current CVS version:
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/patches/Configure.help

I'll try to find some time shortly to fill in the rest and make a patch for
you, if nobody else gets there first.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
