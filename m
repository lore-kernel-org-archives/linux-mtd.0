Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SEp8-00011k-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 08:59:06 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SEp7-00011d-00
	for mtd@infradead.org; Mon, 12 Feb 2001 08:59:05 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A86F72B.A1971413@mobach.nl> 
References: <3A86F72B.A1971413@mobach.nl> 
To: mendel@mobach.nl
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Errors with M-Systems' DOC v MD2200 D16 and ext2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Feb 2001 08:55:45 +0000
Message-ID: <19636.981968145@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mendel@mobach.nl said:
>  With the 2800 I've got no problems but with the  2200 I've got
> problems and get some very strange kernel messages 

Running out of free blocks to write to - again. This has happened to a few 
people. I'm confused. I put a change into the CVS tree to attempt to fix 
this - can you try it? Just drop nftl.c and nftlmount.c from CVS on top of 
the versions in your kernel tree.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
