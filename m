Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jg218-0005qI-Ou
	for linux-mtd@lists.infradead.org; Sun, 30 Mar 2008 18:12:31 +0000
In-Reply-To: <47EA6E88.5050109@ru.mvista.com>
References: <200803101606.39184.laurentp@cse-semaphore.com>	<200803251823.32039.laurentp@cse-semaphore.com>	<DCEAAC0833DD314AB0B58112AD99B93B0427706A@ismail.innsys.innovsys.com>	<200803251914.24021.laurentp@cse-semaphore.com>
	<b06db7bb4932d14f8af9547abdfc9d0d@kernel.crashing.org>
	<47EA6E88.5050109@ru.mvista.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <f7651faf227608c9f9ca8f2737416f9a@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
Date: Sun, 30 Mar 2008 20:12:00 +0200
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

>> "memory-mapped-memory" perhaps :-)
>
>> Or, just "memory".  Although that one might play havoc with some
>
>    I'd suggest "ram" and "rom" then. Luckily the device trees don't 
> contain binding for the real RAM chips yet. :-)
>
>> not-quite-correct main memory probing code.
>
>    You mean the there's parsers that search the "compatible" prop for 
> "memory" as well as "device_type" prop?

There are parsers that make all kinds of mistakes, sure.

The code that figures out what region of ram to use should look at the
node pointed to by /chosen/memory, it's shouldn't look for anything
with a certain "compatible", and it shouldn't look at "device_type"
_at all_.


Segher
