Received: from idcmail-mo1so.shaw.ca ([24.71.223.10]
	helo=pd2mo2so.prod.shaw.ca)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3aGY-0004Pd-SJ
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 17:25:47 +0000
Received: from pd3mr3so.prod.shaw.ca
	(pd3mr3so-qfe3.prod.shaw.ca [10.0.141.179]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0K1W0012XDPQWN20@l-daemon> for
	linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 11:25:02 -0600 (MDT)
Received: from pn2ml2so.prod.shaw.ca ([10.0.121.146])
	by pd3mr3so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0K1W00LXBDPQ88C0@pd3mr3so.prod.shaw.ca> for
	linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 11:25:02 -0600 (MDT)
Received: from [192.168.0.107] ([70.73.70.241])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006)) with ESMTP id <0K1W004T3DPO8F20@l-daemon> for
	linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 11:25:01 -0600 (MDT)
Date: Tue, 03 Jun 2008 11:24:56 -0600
From: Mandeep Ahuja <ahuja@aksysnetworks.com>
Subject: Re: SPAM-LOW: Re: Cannot compile latest mtd with 2.6.10
In-reply-to: <1212512194.16924.399.camel@pmac.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <48457E68.2020503@aksysnetworks.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
References: <484486B4.3070605@aksysnetworks.com>
	<20080602201416.7d76c2e4@zod.rchland.ibm.com>
	<1212512194.16924.399.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

But interestingly the 2.4.17 kernel still able to mount jffs2 without 
any issues
so why cant 2.6.11 do it?

David Woodhouse wrote:

>On Mon, 2008-06-02 at 20:14 -0500, Josh Boyer wrote:
>  
>
>>>I recently check out the 'mtd' module from CVS. I have kernel 2.6.10 for 
>>>mips malta board. I ran the patchkernel.sh script and then tried to 
>>>compile my kernel.
>>>      
>>>
>>Which CVS?  The MTD CVS tree has been deprecated for a number of years
>>now.
>>    
>>
>
>So has 2.6.10 :)
>
>  
>
