Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mYAg-0004dE-00
	for mtd-list@infradead.org; Mon, 09 Apr 2001 10:41:18 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mYAf-0004d8-00
	for mtd@infradead.org; Mon, 09 Apr 2001 10:41:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AD17FC6.6A918EA0@iriti.cnr.it> 
References: <3AD17FC6.6A918EA0@iriti.cnr.it> 
To: Fabrizio Pollastri <pollastri@iriti.cnr.it>
Cc: mtd@infradead.org
Subject: Re: Problems with nftl_format 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Apr 2001 10:41:04 +0100
Message-ID: <18147.986809264@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


pollastri@iriti.cnr.it said:
> MEMWRITEOOB at 14200: Invalid argument

OK, I probably broke it when I changed the structures slightly to make 
sparc64 happy. Can you confirm or deny my suspicion that it broke on the 
17th of March?

Does it start to work again if you recompile nftl_format against the new 
headers?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
