Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vHRW-0008TO-00
	for mtd-list@infradead.org; Mon, 13 Nov 2000 11:06:30 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vHRV-0008TI-00
	for mtd@infradead.org; Mon, 13 Nov 2000 11:06:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: alan@lxorguk.ukuu.org.uk, kaos@ocs.com.au
Subject: s/get_module_symbol/inter_module_xxx/ in MTD CVS.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Nov 2000 11:06:27 +0000
Message-ID: <16638.974113587@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I'm about to merge the changes made in 2.4.0-test11 to get rid of 
get_module_symbol() and use inter_module_register() instead.

This is going to break the 2.2 build. But we _already_ had to patch the 
stock 2.2 kernel because get_module_symbol() was broken and didn't increase 
the use count of the module in which it found the symbol. 

Does anyone feel like volunteering to back-port Keith's inter_module_xxx 
patch to 2.2? Please put it in the patches/ directory of the CVS tree (or 
send it to me if you don't have CVS access). 

Also, it's probably worth sending it to Alan for possible inclusion in 2.2 
- as I said, get_module_symbol() is already broken there.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
