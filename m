Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EaHG-0006Ft-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 17:03:42 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EaHE-0006BM-00
	for mtd@infradead.org; Fri, 05 Jan 2001 17:03:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A55FCE7.C8406CE0@inn.ericsson.se> 
References: <3A55FCE7.C8406CE0@inn.ericsson.se>  <978711806.3a55f4fe37922@webmail1.asu.edu> <978636488.3a54cec86af09@webmail2.asu.edu> <2842.978696346@redhat.com> <8151.978712149@redhat.com> 
To: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Cc: Russ.Dill@asu.edu, mtd@infradead.org
Subject: Re: Supported flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 Jan 2001 17:03:24 +0000
Message-ID: <12049.978714204@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kenneth.johansson@inn.ericsson.se said:
>  Well with SRAM you can intercange any data pin with another data pin
> and likewise with the adress bus and nothing would notice. Doing this
> with ROM or FLASH makes things quite interesting. This would mean that
> anything trying to program the device has to do translation.

For address lines, this is fixed up by the 'map' driver. For data lines it's
a little more annoying. But include/linux/cfi_endian.h could theoretically
at least do any form of swapping you desire.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
