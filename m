Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwSgn-0005Kk-9p
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 17:09:34 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Alex <pevnev@juno.com>
In-Reply-To: <20050202.115006.19684.4589@webmail03.lax.untd.com>
References: <20050202.115006.19684.4589@webmail03.lax.untd.com>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 23:09:30 +0100
Message-Id: <1107382170.21196.611.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CONFIG_MTD_PHYSMAP_START
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yor mail client still sends lines > 80 chars 

On Wed, 2005-02-02 at 19:49 +0000, Alex wrote:
> Also (in addition to my previous post, where 
> I am questioning the correctness of the output, 
> stating that address belongs to RAM while it clearly does not !), 

Would you consider to read TFA ?
>> 2. It's inside the reserved physical address space of RAM

> - it looks that I am in the "chicken" and the "egg" problem ...
> According to Thomas (see above), I can not rely on the 
> flash phys start address, given to me "verbotum" - 

Given "verbotum" - I guess you meant verbatim. Some one told you to use
0x000801, which is definitely wrong. Can you please provide the verbatim
information which was given to you ?

You could also point to some valuable information about the board
(vendor, user manual ....)

> so I can not set the value in .config 
> for CONFIG_MTD_PHYSMAP_START ... 
> Thomas - in what software you advise me to "decode the 
> values in the registers to get real address values" ? 

Again: RTFA
>> I have no datasheet handy, but you should definitely read it :)

The registers are described there. Do you expect that I download the
datasheet and decode this for your conveniance ? I can do so, please
contact me offlist and talk to your manager about a support contract.

tglx
