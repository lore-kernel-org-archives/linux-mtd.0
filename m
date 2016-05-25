Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5iL7-0007MF-DO
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 23:35:50 +0000
Message-ID: <57463072.4080706@denx.de>
Date: Thu, 26 May 2016 01:08:34 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Trent Piepho <tpiepho@kymetacorp.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 "R, Vignesh" <vigneshr@ti.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1452486886-8049-1-git-send-email-marex@denx.de>	
 <1452486886-8049-2-git-send-email-marex@denx.de>	
 <1463097635.9103.301.camel@rtred1test09.kymeta.local>	
 <57351ECE.2020009@denx.de>
 <1463172208.9103.313.camel@rtred1test09.kymeta.local>
In-Reply-To: <1463172208.9103.313.camel@rtred1test09.kymeta.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/13/2016 10:43 PM, Trent Piepho wrote:
> On Fri, 2016-05-13 at 02:24 +0200, Marek Vasut wrote:
>> On 05/13/2016 02:00 AM, Trent Piepho wrote:
>>> On Mon, 2016-01-11 at 05:34 +0100, Marek Vasut wrote:
>>>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>>
>>>> Add support for the Cadence QSPI controller. This controller is
>>>> present in the Altera SoCFPGA SoCs and this driver has been tested
>>>> on the Cyclone V SoC.
>>>
>>> I'm trying to use this driver the Alaric Devkit for Altera's Arria10
>>> SoC.  It's not working so far.  In the course of trying to debug it,
>>> I've found a few things with the driver in the socfpga-4.1-ltsi branch.
>>
>> So are you trying to debug this driver or some other out-of-tree driver?
>> btw. I pushed the latest version here:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=next/cadence-qspi
> 
> I'm trying to use the out of tree driver from Altera's latest kernel,
> from here:
> https://github.com/altera-opensource/linux-socfpga/tree/socfpga-4.4
> 
> But it's not a totally different driver, it's just an older version of
> this driver.  I'm thinking of porting in this version since I think it's
> much improved (after V11 one would hope so).  Really, Altera should
> update their supported kernel with this code.

I'm quite sure they're doing their best and really, they _are_ better
than most vendors.

> Comments about what's on your branch.
> 
> Commit "ARM: socfpga: Add Candence QSPI controller DT node" only
> adds the node for Cyclone 5.  This same DT node should also be added to
> the socfpga_arria10.dtsi file.
> 
I don't have A10 devkit (yet), but feel free to send a patch once this
hits mainline if you can test it on A10. I updated the commit message
until then.

The latest stuff is pushed here:
http://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=korg/next/cadence-qspi-v12

-- 
Best regards,
Marek Vasut
