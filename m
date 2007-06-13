Received: from mail-in-12.arcor-online.net ([151.189.21.52])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HyL32-0000N2-Jp
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 01:05:38 -0400
In-Reply-To: <20070613031615.GC16148@localhost.localdomain>
References: <e4197fd2753f2b4d548d5dde9e3fd1d3@kernel.crashing.org>
	<466308F4.8050004@ru.mvista.com>
	<8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
	<466312C2.4090200@ru.mvista.com>
	<548a7e11ffb577f6395b8f5a9c2fba2d@kernel.crashing.org>
	<466323EF.5040807@ru.mvista.com>
	<1181228442.2785.60.camel@pmac.infradead.org>
	<18fbfbaf113ab76b602d279848d9b405@kernel.crashing.org>
	<20070612044459.GD4198@localhost.localdomain>
	<9e1a55ac71a2ecf5155d2fddf547025e@kernel.crashing.org>
	<20070613031615.GC16148@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <96f5b23c4f53e986e8caa2156f149cd8@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Wed, 13 Jun 2007 07:05:31 +0200
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>> Of course, Ebony has flash which is JEDEC rather than CFI probed, so 
>>> I
>>> have an interest in a binding for that, too.
>>
>> For JEDEC flash, you probably want extra properties
>> for manufacturing ID and chip ID.  Also, you need
>> to describe the block sizes in some way (on CFI, this
>> can be probed; on JEDEC, not).  Anything else?
>
> Hrm.  At the moment it appears to work without supplying this
> information for the Ebony flash...  I wonder if there are defaults in
> the mtd layer or something.

MTD does a lot of heuristic probing.  It is pretty good,
but it would be nice if you could skip that and hand it
the exact values it needs.  Also, this information should
be in the device tree no matter what, even if Linux
doesn't use it yet ;-)


Segher
