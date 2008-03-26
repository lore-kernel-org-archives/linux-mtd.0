Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeXHo-0001ly-5b
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 15:11:32 +0000
In-Reply-To: <200803251744.46001.laurentp@cse-semaphore.com>
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251651.42608.laurentp@cse-semaphore.com>
	<47E926FB.3030900@ru.mvista.com>
	<200803251744.46001.laurentp@cse-semaphore.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <6c0f876f13b57f6d8cc28e004ed73313@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
Date: Wed, 26 Mar 2008 16:09:22 +0100
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The nvram device descrived in the Device Support Extensions is 
> probably meant
> to describe the kind of nvram found in RTC chips.

It describes a generic interface _within OF_ for _all kinds_ of NVRAM,
both physical and virtual.


Segher
