Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Zw7n-0000DP-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 14:38:11 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Zw7m-0000DJ-00
	for mtd@infradead.org; Mon, 05 Mar 2001 14:38:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AA3A2FF.9E25407A@inventel.fr> 
References: <3AA3A2FF.9E25407A@inventel.fr> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: mtd@infradead.org
Subject: Re: mtd with 2.0.4-test6 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Mar 2001 14:34:41 +0000
Message-ID: <31161.983802881@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


xde@inventel.fr said:
> I am trying to add the mtd features to my 2.4.0-test6 system. But the
> inter module is not available in this kernel. Is it safe to patch it
> with the 2.2.17 inter module patch ?

Better just to remove the whole inter_module_xxx abortion from the MTD code 
and live with the extra dependencies. get_module_symbol() allowed us to 
make it nicer. With inter_module_xxx it's just not worth the trouble.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
