Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzUfS-00066s-GP
	for linux-mtd@lists.infradead.org; Thu, 30 Apr 2009 11:43:09 +0000
Message-ID: <49F98EB1.10804@embeddedalley.com>
Date: Thu, 30 Apr 2009 15:42:41 +0400
From: Vladimir Barinov <vbarinov@embeddedalley.com>
MIME-Version: 1.0
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v3)
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>
	<200904291252.15650.h.schurig@mn-solutions.de>
	<49F97D72.8030109@embeddedalley.com>
	<200904301309.54859.hs4233@mail.mn-solutions.de>
In-Reply-To: <200904301309.54859.hs4233@mail.mn-solutions.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	dwmw2@infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	Lothar Wassmann <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Holger Schurig wrote:
>> Hello Holger,
>>
>> Could you explain how this message is related to this thread?
>> This patch as well as linux-mtd mail list doesn't care about
>> platform specific code that you can do in your custom mx21
>> based board.
>>     
>
> The thread is about a NAND flash driver for Linux MTD. And this 
> driver will work with i.MX27 and i.MX21 SoCs. However, the 
> i.MX21 has a specific error in it's silicon, where the hardware 
> ECC cannot one-bit-errors IF they are in two consecutive NAND 
> blocks.
>   
This thread is about minor fixes for MXC NAND driver :)
> If the NAND driver, that is supposed to be used for i.MX21, 
> cannot handle this (e.g. using software ECC), then the NAND 
> driver is buggy.
>
>   
You have pointed to the way how to resolve the mx21 h/w bug via platform 
data.
> This has nothing to do with board-specific things, my question 
> was just if the board setup code can keep ".ecc = 0". Or if that 
> won't work, we have to fix the MXC NAND driver with some 
> cpu_is_mx21() code paths.
>   
It's up to you to see if it work using .hw_ecc = 0. I have no mx21 
hardware at all.

Regards,
Vladimir
