Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rcXF-00030X-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 10:21:33 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rcXE-00030R-00
	for mtd@infradead.org; Mon, 23 Apr 2001 10:21:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010423030902.1FEC.GAUTIER@email.enst.fr> 
References: <20010423030902.1FEC.GAUTIER@email.enst.fr> 
To: Fabrice Gautier <gautier@email.enst.fr>
Cc: mtd@infradead.org
Subject: Re: STPC and Macronix Flash. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Apr 2001 10:20:38 +0100
Message-ID: <6117.988017638@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



gautier@email.enst.fr said:
>  Then the flash should be mapped to 0x2a00000 so i'm doing an ioremap
> and using the return value to access the flash. Just like it is done
> in physmap.c and oher.

Do what I say, not what I do :)

Try ioremap_nocache and __raw_{read,write}[bwl].

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
