Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14r0Za-0005CU-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 17:49:26 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14r0ZZ-0005CO-00
	for mtd@infradead.org; Sat, 21 Apr 2001 17:49:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010421180325.DAC3.GAUTIER@email.enst.fr> 
References: <20010421180325.DAC3.GAUTIER@email.enst.fr> 
To: Fabrice Gautier <gautier@email.enst.fr>
Cc: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: Mapping for JEDEC and CFI 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Apr 2001 17:49:04 +0100
Message-ID: <6495.987871744@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


gautier@email.enst.fr said:
>  And by the way, why the support for custom JEDEC mapping is here and
> not with the JEDEC driver?

This seems to be designed mostly for some MIPS boards. I've fixed the 
problems you refer to, and also put out a request for a more appropriate 
name.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
