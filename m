Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gl2Y-0002hW-CQ
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2003 13:54:18 +0100
Mime-Version: 1.0
Message-Id: <a05200f0cbb497a9284c1@[130.161.115.44]>
In-Reply-To: <1059148567.28255.47.camel@lapdancer.baythorne.internal>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>	
 <1059147413.28255.40.camel@lapdancer.baythorne.internal>	
 <a05200f01bb4700e6ff94@[130.161.115.44]>
 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
Date: Sun, 27 Jul 2003 14:54:12 +0200
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

At 11:56 -0400 25-07-2003, David Woodhouse wrote:
>On Fri, 2003-07-25 at 11:51, J.D. Bakker wrote:
>>  I have a two-hour old CVS; where should I look ?
>
>The fact that select_chip() now takes a 'chip_number' argument,

What is the return value for select_chip supposed to be ? Current CVS 
is a bit ambiguous in this regard (understandably, considering the 
newness).

Style question: unsigned char, __u8, u_char, u_int8_t or uint8_t ? 
The kernel part of CVS uses all five in different places.

JDB
[sticking with unsigned char for the time being]
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
