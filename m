Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aDJs-0007Q4-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:59:48 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aDJq-0007Px-00
	for mtd@infradead.org; Tue, 06 Mar 2001 08:59:47 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AA4A648.F57BEF2@inventel.fr> 
References: <3AA4A648.F57BEF2@inventel.fr>  <3AA3A2FF.9E25407A@inventel.fr> <31161.983802881@redhat.com> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: mtd@infradead.org
Subject: Re: mtd with 2.0.4-test6 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Mar 2001 08:56:24 +0000
Message-ID: <4257.983868984@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


xde@inventel.fr said:
> In fact, I applied the patch by hand (some modifications were already
> done at the 2.4.0-test6 stage). The kernel seems to feel happy and
> recognizes my flash parts (the driver should be running) ; I have some
> amd standard compatible flashes and want a cramfs on it. Between the
> filesystem and the driver, a layer should be added ; is it correct
> that this would be done by the mtdblock driver ?

Yes. The mtdblock driver would even allow you to put a writable filesystem 
on the device, although it wouldn't be particular robust or do any wear 
levelling. For cramfs, you could use the mtdblock_ro driver, which doesn't 
allow writing to the device. You can then load the cramfs onto it with the 
increasingly annoyingly misnamed 'doc_loadbios' program via the character 
device.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
