Received: from idcmail-mo1so.shaw.ca ([24.71.223.10]
	helo=pd2mo1so.prod.shaw.ca)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3YkI-0007KG-Kr
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 15:48:23 +0000
Received: from pd3mr2so.prod.shaw.ca
	(pd3mr2so-qfe3.prod.shaw.ca [10.0.141.178]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0K1W002GA97REKC0@l-daemon> for
	linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 09:47:51 -0600 (MDT)
Received: from pn2ml9so.prod.shaw.ca ([10.0.121.7])
	by pd3mr2so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0K1W002YG97RW4E0@pd3mr2so.prod.shaw.ca> for
	linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 09:47:52 -0600 (MDT)
Received: from [192.168.0.107] ([70.73.70.241])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004)) with ESMTP id <0K1W005GV97RMN30@l-daemon> for
	linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 09:47:51 -0600 (MDT)
Date: Tue, 03 Jun 2008 09:47:47 -0600
From: Mandeep Ahuja <ahuja@aksysnetworks.com>
Subject: Re: Cannot compile latest mtd with 2.6.10
In-reply-to: <20080602201416.7d76c2e4@zod.rchland.ibm.com>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Message-id: <484567A3.1010604@aksysnetworks.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
References: <484486B4.3070605@aksysnetworks.com>
	<20080602201416.7d76c2e4@zod.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,
I checked out from here

      cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login /(password: anoncvs)/
      cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd

I am still battling with this issue. Can you guide me from where to get the latest mtd. I am having issues mounting a JFFS2 image with whatever mtd came with 2.6.11 kernel for mipsel

regards
Mandeep



Josh Boyer wrote:

>On Mon, 02 Jun 2008 17:48:04 -0600
>Mandeep Ahuja <ahuja@aksysnetworks.com> wrote:
>
>  
>
>>Hi,
>>I recently check out the 'mtd' module from CVS. I have kernel 2.6.10 for 
>>mips malta board. I ran the patchkernel.sh script and then tried to 
>>compile my kernel.
>>    
>>
>
>Which CVS?  The MTD CVS tree has been deprecated for a number of years
>now.
>
>josh
>
>  
>
