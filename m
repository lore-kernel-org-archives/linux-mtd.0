Received: from roc.holo.8d.com ([64.254.227.115])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GRqDi-0007UV-5t
	for linux-mtd@lists.infradead.org; Mon, 25 Sep 2006 14:10:02 +0100
Message-ID: <4517D4AB.2060706@8d.com>
Date: Mon, 25 Sep 2006 09:07:55 -0400
From: Raphael Assenat <raph@8d.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] cmx270-nand: Make CMDLINE_PARTS usable
References: <4507FE99.3030106@8d.com>	
	<1158917790.24527.664.camel@pmac.infradead.org>
	<4513F01D.80608@8d.com>
	<1158936240.24527.733.camel@pmac.infradead.org>
In-Reply-To: <1158936240.24527.733.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Fri, 2006-09-22 at 10:15 -0400, Raphael Assenat wrote:
> 
>>Oh, sorry. My patch applies over the patch Mike Rapoport sent to the list on July 18
>>([PATCH] [MTD] CM-x270 NAND flash support), which I thought was already accepted. Was 
>>there anything wrong with it? Maybe you just missed it...
>>
>>I also sent a patch to the list on July 21 which added NAND flash support for the cm-x255 
>>boards ([PATCH] Add support for NAND flash on cm-x255) but received no feedback. I can 
>>resend it if you wish.
> 
> 
> July and August weren't really a good time for sending stuff that you
> expect me to pay attention to; sorry. Yes -- please retest and resend.
> 
> Can you explain how these two boards differ, and why they need two
> separate drivers?
Yes.

NAND on cm-x255:
- Uses physical address 0x04000000
- CS, ALE, CLE and RB mapped to pxa GPIOs 5,4,3,10 respectively.

NAND on cm-x270:
- CS and RB mapped to pxa GPIOs 11 and 89
- Read/Write with ALE/CLE inactive: 0x04000000
- Read/Write with ALE active: 0x04000008
- Read/Write with CLE active: 0x04000004

The base address is the same, but GPIOs used differ and the control signals
are controlled differently.


>>(BTW, every time I send to the linux-mtd list my message is held for moderator approval 
>>for reason 'Message has a suspicious header'. Who should I contact for more information? 
>>I'd like to know exactly what header(s) is/are 'suspicious' and fix them if possible).
> 
> 
> It just doesn't like attachments. Send patches inline and they shouldn't
> get trapped.

Best regards,

-- 
Raphael Assenat
8D Technologies Inc.
