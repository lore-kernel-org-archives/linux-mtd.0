Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0EVK-0002mA-EC
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 13:12:03 +0000
Message-ID: <4ADDB718.60002@simtec.co.uk>
Date: Tue, 20 Oct 2009 14:11:52 +0100
From: Ben Dooks <ben@simtec.co.uk>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: NAND: Add flags to the probe calls to control scan behaviour
References: <20091013090019.091262272@fluff.org.uk>	
	<1255534646.32489.169.camel@localhost>
	<4ADC4137.1060204@simtec.co.uk>
	<1256040395.29856.228.camel@localhost>
In-Reply-To: <1256040395.29856.228.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Simtec Linux Team <linux@simtec.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-10-19 at 11:36 +0100, Ben Dooks wrote:
>> I'd rather it be silent if it cannot find a device, as a number of our boards
>> have slots where NAND devices may be fitted by the customer and as such all
>> possibilities are registered with the NAND driver.
>>
>>> Could you please elaborate why more why is this needed a bit more? What
>>> is the driver?
>> Because customers get scared when errors with '!!!' turn up.
> 
>>> Why not to just remove that print at all?
>> Possible, but what about the case where there is a legitimate problem with
>> the device that is supposed to be there.
> 
> I would go for this instead. I think the drivers can print an error
> message themselves.

I was trying to avoid touching the 40+ drivers which use this
code. This would also be a bit of a code bloat as we would have
some interesting checks for the precise error code (was the failure
no-chip, no memory, some other problem?)

> Or can this be done using the chip->options ?

I will look into this.

-- 
Ben Dooks, Software Engineer, Simtec Electronics

http://www.simtec.co.uk/
