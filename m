Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gm35-0002zK-Tr
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2003 14:58:55 +0100
Mime-Version: 1.0
Message-Id: <a05200f0ebb49894ef8cf@[130.161.115.44]>
In-Reply-To: <1059313332.9895.3.camel@lapdancer.baythorne.internal>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>	
 <1059147413.28255.40.camel@lapdancer.baythorne.internal>	
 <a05200f01bb4700e6ff94@[130.161.115.44]>	
 <1059148567.28255.47.camel@lapdancer.baythorne.internal>	
 <a05200f0cbb497a9284c1@[130.161.115.44]>
 <1059313332.9895.3.camel@lapdancer.baythorne.internal>
Date: Sun, 27 Jul 2003 15:58:44 +0200
To: David Woodhouse <dwmw2@infradead.org>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
cc: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 9:42 -0400 27-07-2003, David Woodhouse wrote:
>On Sun, 2003-07-27 at 08:54, J.D. Bakker wrote:
>>  What is the return value for select_chip supposed to be ? Current CVS
>>  is a bit ambiguous in this regard (understandably, considering the
>>  newness).
>
>Currently void -- I can't imagine cases where it could fail. I suppose
>I'll probably turn out to be wrong though...

I was wondering what to do when 'chip' is larger than the maximum 
number of NANDs. Currently I silently deselect all devices when that 
happens.

>  > Style question: unsigned char, __u8, u_char, u_int8_t or uint8_t ?
>>  The kernel part of CVS uses all five in different places.
>
>unsigned char, uint8_t and u_char are the only ones I'd want to see --
>and the latter only if it's already in use. One of the former two in new
>code, please -- preferably 'unsigned char' I think.

unsigned char it is then.

>I reserve the right to do otherwise, and to change my mind -- not
>necessarily in that order.

HEY! I resemble that remark !

Thanks,

JDB
[just tried to insmod my first cut of the lartcan NAND driver -- blew 
up with 'partition extends beyond the end of device "<NULL>"' and a 
bunch of divisions by zero. Back to the drawing board...]
-- 
Your eyes are weary from staring at the CRT. You feel sleepy. Notice 
how restful it is to watch the cursor blink. Close your eyes. The 
opinions stated above are yours. You cannot imagine why you ever felt 
otherwise.
