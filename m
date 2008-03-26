Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeXUc-00026g-Oa
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 15:24:47 +0000
Message-ID: <47EA6B11.7050804@ru.mvista.com>
Date: Wed, 26 Mar 2008 18:26:09 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROM mappings in
	the	physmap_of MTD driver.
References: <200803261344.03438.laurentp@cse-semaphore.com>
	<346860fa1e8a75a4a89e260011690659@kernel.crashing.org>
In-Reply-To: <346860fa1e8a75a4a89e260011690659@kernel.crashing.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Laurent Pinchart <laurentp@cse-semaphore.com>, ben@simtec.co.uk,
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

Segher Boessenkool wrote:

>>      {
>> +        .compatible    = "physmap-ram",
>> +        .data        = (void *)"map_ram",
>> +    },
>> +    {
>> +        .compatible    = "physmap-rom",
>> +        .data        = (void *)"map_rom",
>> +    },

> Why the cast?  It's redundant afaics.

   To be in line with the surrounding code...

> Segher

WBR, Sergei
