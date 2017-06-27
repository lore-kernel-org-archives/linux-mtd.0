Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPuSC-0005GB-4g
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 17:39:09 +0000
Date: Tue, 27 Jun 2017 10:38:44 -0700 (PDT)
From: matthew.gerlach@linux.intel.com
To: Marek Vasut <marek.vasut@gmail.com>
cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org
Subject: Re: [PATCH 3/3] mtd: spi-nor: Altera Quadspi Flash Controller v2
 Platform driver
In-Reply-To: <5f0e2ddd-d329-cb3d-01bc-c101247281a7@gmail.com>
Message-ID: <alpine.DEB.2.20.1706271028260.8058@mgerlach-VirtualBox>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-4-git-send-email-matthew.gerlach@linux.intel.com>
 <2ac33989-5665-33e0-c6f0-6791c8e46b0d@gmail.com>
 <alpine.DEB.2.20.1706270800240.8058@mgerlach-VirtualBox>
 <5f0e2ddd-d329-cb3d-01bc-c101247281a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue, 27 Jun 2017, Marek Vasut wrote:

> On 06/27/2017 05:15 PM, matthew.gerlach@linux.intel.com wrote:
>>
>>
>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>
>>> On 06/26/2017 06:13 PM, matthew.gerlach@linux.intel.com wrote:
>>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>
>>> Just wrap it into the Altera QSPI driver , no need for separate platform
>>> driver IMO.
>>
>> Hi Marek,
>>
>> I answered this question when you asked why the header file was
>> necessary, but I think further discussion could be helpful, since this
>> problem is becoming more prevelent.  The Altera Quadspi component is a
>> soft IP in a
>> FPGA, and the processor using the component may or may not have device
>> tree support compiled into the Linux kernel.  Since device tree support
>> may or may not be available, the device tree specific code must be
>> separated
>> from the core driver code.
>
> I see, that's fine, although there is no PCIe or other support in this
> submission. Is that planned ?

You probably would not see a PCIe driver for a card with a FPGA that would 
only have the Altera Quadspi component on it.  Usually a FPGA has several 
components, each requiring their own driver which are considered 
sub-drivers of the PCIe driver.  I will be adding Altera Quadspi support 
to the Intel-FPGA PCIe driver that is currently under review.  We have 
also seen people use the Altera Quadspi with a NIOS-II soft processor, and 
I expect someone would want to use the component with ARM SOCFPGAs.

Matthew Gerlach

>
>> One can certainly make the case, that device tree support could/should
>> be available everywhere, but the current reality is most x86 Linux
>> kernel configurations do not include device tree support.
>>
>> For the record, I believe device trees, and more specifically device
>> tree overlays, are the best way for Linux to use FPGAs, but I have to
>> deal with the current realities.
>>
>> Thanks again for all the great feedback.
>>
>> Matthew Gerlach
>
> [...]
>
> -- 
> Best regards,
> Marek Vasut
>
