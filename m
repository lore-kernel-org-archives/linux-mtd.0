Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g4qx-0003Kb-9R
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 16:51:31 +0100
Mime-Version: 1.0
Message-Id: <a05200f01bb4700e6ff94@[130.161.115.44]>
In-Reply-To: <1059147413.28255.40.camel@lapdancer.baythorne.internal>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
 <1059147413.28255.40.camel@lapdancer.baythorne.internal>
Date: Fri, 25 Jul 2003 17:51:27 +0200
To: David Woodhouse <dwmw2@infradead.org>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 11:36 -0400 25-07-2003, David Woodhouse wrote:
>On Fri, 2003-07-25 at 11:12, J.D. Bakker wrote:
>>  Hi all,
>>
>>  I have an expansion board for the LART (an embedded computer based on
>>  the DEC/Intel StrongARM) with eight NAND flash devices on it. As
>>  suggested by the Toshiba datasheet, they share data, CLE, ALE, nWE
>>  and nRE and RDY. Each chip has its own nCE line.
>>
>
>If they each had their own data/CLE/ALE etc you'd use mtdconcat. As it
>is, you want the code I've half-written to handle multiple chips in one
>MTD device.

I have a two-hour old CVS; where should I look ?

Does it *help* to have separate data/CLE/ALE ? I've read the recent 
thread on using address lines for CLE/ALE, and there's a big CPLD 
between the CPU and the NANDs, so I could make them appear to be 
separate devices. Note that all devices share the same data bus, so 
they're not attached to different byte lanes as I've seen discussed 
in the source.

Thanks again,

JDB.
[can you tell I'm a hardware guy ? ;-)]
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
