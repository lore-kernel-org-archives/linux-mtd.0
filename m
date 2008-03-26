Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeXiv-0003Zx-3Q
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 15:39:33 +0000
Message-ID: <47EA6E88.5050109@ru.mvista.com>
Date: Wed, 26 Mar 2008 18:40:56 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
References: <200803101606.39184.laurentp@cse-semaphore.com>	<200803251823.32039.laurentp@cse-semaphore.com>	<DCEAAC0833DD314AB0B58112AD99B93B0427706A@ismail.innsys.innovsys.com>	<200803251914.24021.laurentp@cse-semaphore.com>
	<b06db7bb4932d14f8af9547abdfc9d0d@kernel.crashing.org>
In-Reply-To: <b06db7bb4932d14f8af9547abdfc9d0d@kernel.crashing.org>
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

>> - Using another device node with a compatible value set to 
>> "linear-ram" (or
>> something similar). This would support both volatile and non-volatile
>> devices, and a property could be added to specify if the device is 
>> volatile
>> or not.

> "memory-mapped-memory" perhaps :-)

> Or, just "memory".  Although that one might play havoc with some

    I'd suggest "ram" and "rom" then. Luckily the device trees don't contain 
binding for the real RAM chips yet. :-)

> not-quite-correct main memory probing code.

    You mean the there's parsers that search the "compatible" prop for 
"memory" as well as "device_type" prop?

> Segher

WBR, Sergei
