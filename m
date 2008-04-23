Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jocut-0004sh-KG
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 11:13:36 +0000
Message-ID: <480F19B9.1070403@ru.mvista.com>
Date: Wed, 23 Apr 2008 15:12:57 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROM
	mappings	in	the	physmap_of MTD driver.
References: <200803261344.03438.laurentp@cse-semaphore.com>	
	<47EA6B11.7050804@ru.mvista.com>	
	<777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>	
	<200803271026.51555.laurentp@cse-semaphore.com>	
	<1208894995.9212.669.camel@pmac.infradead.org>	
	<480E479C.7040408@ru.mvista.com>
	<1208895496.9212.671.camel@pmac.infradead.org>
In-Reply-To: <1208895496.9212.671.camel@pmac.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ben@simtec.co.uk, Segher Boessenkool <segher@kernel.crashing.org>,
	Laurent Pinchart <laurentp@cse-semaphore.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>>>>Ok. I'll submit a new patch as soon as we agree on a compatible name.

>>>Did we?

>>    IIRC, The latest agreement was that we don't need the "compatible" and 
>>will match on node name.

> Ok. Is there a current patch I should be merging?

    Looks like it was decided to revert to the platform device method, not 
sure why -- so, no changes. Laurent?

WBR, Sergei
