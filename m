Received: from mail-in-10.arcor-online.net ([151.189.21.50])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hz9sb-0007Ll-O3
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 07:22:15 -0400
In-Reply-To: <20070615041233.GA30104@localhost.localdomain>
References: <548a7e11ffb577f6395b8f5a9c2fba2d@kernel.crashing.org>
	<466323EF.5040807@ru.mvista.com>
	<1181228442.2785.60.camel@pmac.infradead.org>
	<18fbfbaf113ab76b602d279848d9b405@kernel.crashing.org>
	<20070612044459.GD4198@localhost.localdomain>
	<9e1a55ac71a2ecf5155d2fddf547025e@kernel.crashing.org>
	<20070613031615.GC16148@localhost.localdomain>
	<96f5b23c4f53e986e8caa2156f149cd8@kernel.crashing.org>
	<20070613061152.GF16148@localhost.localdomain>
	<40446e5131495e077da798bc54843b2a@kernel.crashing.org>
	<20070615041233.GA30104@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <4734020f827fdf8a34c7babd46fbf593@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Fri, 15 Jun 2007 13:22:09 +0200
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

>>> I agree.  Of course, this means figuring out what the values actually
>>> are for Ebony.  I presently have no idea, since the heuristic probing
>>> appears to work without problem.
>>
>> Doesn't it show it in sysfs, or in the dmesg at least?
>> Maybe some other important stuff is there, too.
>
> Not as far as I can tell.  Only dmesg information I can see is:
>
> 1ff800000.large-fla: Found 1 x8 devices at 0x0 in 8-bit bank
> 1ff800000.large-fla: Found 1 x8 devices at 0x200000 in 8-bit bank
> number of JEDEC chips: 2
> cfi_cmdset_0002: Disabling erase-suspend-program due to code
> brokenness.

Hrm, nothing in sysfs either?

Anyway, from jedec_probe.c:

                 cfi->mfr = jedec_read_mfr(map, base, cfi);
                 cfi->id = jedec_read_id(map, base, cfi);
                 DEBUG(MTD_DEBUG_LEVEL3,
                       "Search for id:(%02x %02x) interleave(%d) 
type(%d)\n",
                         cfi->mfr, cfi->id, cfi_interleave(cfi), 
cfi->device_type);

so you'll could enable some more debugging output.

Or, open the case, look at the chips, and look it up
in the big table at the start of that file (or the
relevant datasheet).


Segher
