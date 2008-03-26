Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeXga-0003UC-Jb
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 15:37:09 +0000
In-Reply-To: <47EA6B11.7050804@ru.mvista.com>
References: <200803261344.03438.laurentp@cse-semaphore.com>
	<346860fa1e8a75a4a89e260011690659@kernel.crashing.org>
	<47EA6B11.7050804@ru.mvista.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROM mappings in
	the	physmap_of MTD driver.
Date: Wed, 26 Mar 2008 16:34:58 +0100
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Laurent Pinchart <laurentp@cse-semaphore.com>,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>      {
>>> +        .compatible    = "physmap-ram",
>>> +        .data        = (void *)"map_ram",
>>> +    },
>>> +    {
>>> +        .compatible    = "physmap-rom",
>>> +        .data        = (void *)"map_rom",
>>> +    },
>
>> Why the cast?  It's redundant afaics.
>
>   To be in line with the surrounding code...

I see _that_, but it's not a great argument IMNSHO.  Could I trick
you into preceding this patch with a cleanup patch for the existing
casts?


Segher
