Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYnk5-0007hL-PX
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 03:04:46 +0000
From: Marek Vasut <marex@denx.de>
To: bpqw <bpqw@micron.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Mon, 29 Sep 2014 20:57:31 +0200
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409290043.43750.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCF74@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315DCF74@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409292057.31274.marex@denx.de>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, September 29, 2014 at 02:30:04 AM, bpqw wrote:
> >> For Micron spi norflash,you can enable Quad spi transfer by clear
> >> EVCR(Enhanced Volatile Configuration Register) Quad I/O protocol bit.
> >
> >OK, this information is nice and all, but what does this patch do? I can't
> >learn this information from the commit message as it is, can I ? And ,
> >the purpose of the commit message is exactly to summarize the change the
> >patch implements.
> 
> you don't understand what purpose of this patch!

Well, I dare to say, reacting to feedback like you just did won't make you many 
allies around here.

> just as subject and commit
> message described, it is for enable Micron Quad spi transfer mode.

I understand the subject part. The commit message, on the other hand, just 
states that it is possible to frob with a certain register to achieve a certain 
effect ; the commit message does not state what this patch does or how is the 
patch useful.

Does this patch enable the bit or does it disable the bit ? I cannot tell 
without looking into the code , I really have no clue just by reading the 
subject and the commit message.

> do you
> read the spi-nor.c file?

No, I didn't even look at the code.

> please pay attention to the set_quad_mode()
> function.

No, what set_quad_mode_function() are you talking about ...

> by the way,I can add more commit message for it,but I think it is
> redundant,don't need.

The commit message shall state what the patch does in the first place, what the 
hardware can do is ortogonal to that. The commit message can be as short as:

The hardware supports 4-bit I/O when bit FOO is set in register BAR. This patch 
adds function that sets bit FOO in register BAR to enable 4-bit I/O if condition 
BAZ and QUUX are met.

Then I do not even have to look at the code if I want to just get the high-level 
overview of what the patch does. If I want to know the details, I will look into 
the code.

Do you know what I'm getting at ?

[...]

Best regards,
Marek Vasut
