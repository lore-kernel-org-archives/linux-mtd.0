Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vHdS-0008Ul-00
	for mtd-list@infradead.org; Mon, 13 Nov 2000 11:18:50 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vHdR-0008Uf-00
	for mtd@infradead.org; Mon, 13 Nov 2000 11:18:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <2555.974113935@ocs3.ocs-net> 
References: <2555.974113935@ocs3.ocs-net> 
To: Keith Owens <kaos@ocs.com.au>
Cc: mtd@infradead.org, alan@lxorguk.ukuu.org.uk
Subject: Re: s/get_module_symbol/inter_module_xxx/ in MTD CVS. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Nov 2000 11:18:34 +0000
Message-ID: <18197.974114314@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kaos@ocs.com.au said:
>  I almost have it done, adding inter_module_xxx but keeping the old
> get/put_module_symbol interfaces.  I am not patching any code to use
> inter_module_xxx, just making the interface available for 2.2/2.4
> compatibility. 

Cool - although I'd have far preferred to have get_module_symbol() still 
available in 2.4 for at least a few versions to give me time to switch over.

You say 'keeping the old get/put...' but 2.2 didn't actually have 
put_module_symbol(). The patch to make it get_module_symbol() increase the 
use count was never included. Did you add put_module_symbol() or was this a 
typo?

Alan - please could you consider Keith's patch for 2.2.next, because its
impact is fairly limited - it shouldn't break anything and it's important 
for backwards-compatibility of 2.4 drivers. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
