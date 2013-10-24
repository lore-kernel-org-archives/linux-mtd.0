Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZP8j-0000xX-4H
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 17:56:10 +0000
Message-ID: <52695F15.8090309@ti.com>
Date: Thu, 24 Oct 2013 23:25:33 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv3 2/3] drivers: mtd: devices: Add quad read support.
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-3-git-send-email-sourav.poddar@ti.com>
 <20131024010619.GA23337@ld-irv-0074.broadcom.com> <5268B3B8.4090807@ti.com>
 <20131024073400.GA9863@norris.computersforpeace.net>
 <5268DE0B.7040208@ti.com> <20131024170754.GA20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131024170754.GA20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagannadh.teki@gmail.com>,
 balbi@ti.com, Huang Shijie <b32955@freescale.com>, broonie@kernel.org,
 linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
On Thursday 24 October 2013 10:37 PM, Brian Norris wrote:
> On Thu, Oct 24, 2013 at 02:14:59PM +0530, Sourav Poddar wrote:
>> On Thursday 24 October 2013 01:04 PM, Brian Norris wrote:
>>> I just submitted my cleanups which (among other things) fixes this bug.
>>> I believe I CC'd you. Go ahead and review it, and if it works to your
>>> liking, please just base your work on top of it. I'll apply some or all
>>> of that series if no one objects.
>>>
>> Ok.
> I'll push parts the reviewed parts of my patch series now, so you can
> base off them. (I'm still open to comments on them, though.)
>
>>> Do all parts that support quad read also support all the other quad
>>> opcodes (like quad program)?
>>>
>> I have Spansion and Macronix flash with me.
>>
>> For spansion,
>> supported quad commands are:
>> QOR(0x6b) which is what I am using.
>> QIOR(0xeb)
>> DDR QIOR(0xed)
>>
>> For macronix,
>> QOR(0x6b) which is what I am using.
>> QIOR(0xeb)
> So it seems there are flash which support quad read but not quad
> program. So the flag I recommended (M25P80_QUAD) should be made specific
> to quad read (M25P80_QUAD_READ) I guess, since we may support page
> program eventually.
>
Sounds good. I will take care of this in my next version.


~Sourav
> Brian
