Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gTf9-0006rX-8W
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 19:20:59 +0100
Mime-Version: 1.0
Message-Id: <a05200f07bb4875574a88@[130.161.115.44]>
In-Reply-To: <1059231977.539.2.camel@lapdancer.baythorne.internal>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>	
 <1059147413.28255.40.camel@lapdancer.baythorne.internal>	
 <a05200f01bb4700e6ff94@[130.161.115.44]>	
 <1059148567.28255.47.camel@lapdancer.baythorne.internal>	
 <a05200f05bb4803789a4f@[130.161.115.44]>
 <1059231977.539.2.camel@lapdancer.baythorne.internal>
Date: Sat, 26 Jul 2003 20:20:53 +0200
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

At 11:06 -0400 26-07-2003, David Woodhouse wrote:
>On Sat, 2003-07-26 at 06:22, J.D. Bakker wrote:
>>  Ah, I see. Are you planning to always treat the NANDs as a linear
>>  array ?
>
>Yeah -- I think so. Any reason not to?

Not really, if you exclude braindead setups like multiple 
hot-swappable SmartMedia cards. The only sane setup I could imagine 
is having one partition per NAND device, but it's not one I would be 
using myself.

Would you expect all devices to have the same size ?

JDB
[working around oddities in Lattice's ABEL compiler...]
-- 
Riddoch's Myth of computing:
         Any computer problem is invariably the fault of the closest
         sysadmin.
