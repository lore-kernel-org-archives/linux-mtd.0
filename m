Received: from ozlabs.org ([203.10.76.45])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JefEj-0005vW-J1
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 23:40:53 +0000
Date: Thu, 27 Mar 2008 10:37:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROM mappings in the
	physmap_of MTD driver.
Message-ID: <20080326233725.GB8005@localhost.localdomain>
References: <200803261344.03438.laurentp@cse-semaphore.com>
	<346860fa1e8a75a4a89e260011690659@kernel.crashing.org>
	<47EA6B11.7050804@ru.mvista.com>
	<777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, ben@simtec.co.uk,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 26, 2008 at 04:34:58PM +0100, Segher Boessenkool wrote:
>>>>      {
>>>> +        .compatible    = "physmap-ram",
>>>> +        .data        = (void *)"map_ram",
>>>> +    },
>>>> +    {
>>>> +        .compatible    = "physmap-rom",
>>>> +        .data        = (void *)"map_rom",
>>>> +    },
>>
>>> Why the cast?  It's redundant afaics.
>>
>>   To be in line with the surrounding code...
>
> I see _that_, but it's not a great argument IMNSHO.  Could I trick
> you into preceding this patch with a cleanup patch for the existing
> casts?

Hrm.  Much as I generally dislike redundant casts, these ones do serve
to inform the reader that the data field is not always a string, which
they might otherwise assume.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
