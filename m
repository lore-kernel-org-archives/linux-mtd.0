Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vHXT-0008Tz-00
	for mtd-list@infradead.org; Mon, 13 Nov 2000 11:12:39 +0000
Received: from ppp0.ocs.com.au ([203.34.97.3] helo=mail.ocs.com.au)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13vHXQ-0008Tq-00
	for mtd@infradead.org; Mon, 13 Nov 2000 11:12:37 +0000
From: Keith Owens <kaos@ocs.com.au>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org, alan@lxorguk.ukuu.org.uk
Subject: Re: s/get_module_symbol/inter_module_xxx/ in MTD CVS. 
In-reply-to: Your message of "Mon, 13 Nov 2000 11:06:27 -0000."
             <16638.974113587@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Nov 2000 22:12:15 +1100
Message-ID: <2555.974113935@ocs3.ocs-net>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 13 Nov 2000 11:06:27 +0000, 
David Woodhouse <dwmw2@infradead.org> wrote:
>Does anyone feel like volunteering to back-port Keith's inter_module_xxx 
>patch to 2.2? Please put it in the patches/ directory of the CVS tree (or 
>send it to me if you don't have CVS access). 

I almost have it done, adding inter_module_xxx but keeping the old
get/put_module_symbol interfaces.  I am not patching any code to use
inter_module_xxx, just making the interface available for 2.2/2.4
compatibility.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
