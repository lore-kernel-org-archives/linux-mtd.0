Received: from [216.208.38.106] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19glny-0002s9-7l
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2003 14:43:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f0cbb497a9284c1@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
	 <1059147413.28255.40.camel@lapdancer.baythorne.internal>
	 <a05200f01bb4700e6ff94@[130.161.115.44]>
	 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
	 <a05200f0cbb497a9284c1@[130.161.115.44]>
Message-Id: <1059313332.9895.3.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Sun, 27 Jul 2003 09:42:15 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Sun, 2003-07-27 at 08:54, J.D. Bakker wrote:
> What is the return value for select_chip supposed to be ? Current CVS 
> is a bit ambiguous in this regard (understandably, considering the 
> newness).

Currently void -- I can't imagine cases where it could fail. I suppose
I'll probably turn out to be wrong though...

> Style question: unsigned char, __u8, u_char, u_int8_t or uint8_t ? 
> The kernel part of CVS uses all five in different places.

unsigned char, uint8_t and u_char are the only ones I'd want to see --
and the latter only if it's already in use. One of the former two in new
code, please -- preferably 'unsigned char' I think.

I reserve the right to do otherwise, and to change my mind -- not
necessarily in that order. 

-- 
dwmw2
