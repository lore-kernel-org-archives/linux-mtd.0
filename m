Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqkLn-0003Ln-9R
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 16:42:40 +0000
From: "R, Vignesh" <vigneshr@ti.com>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
To: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de> <57053F81.70204@ti.com>
 <570563D3.9080704@denx.de> <5705E858.3050700@ti.com>
 <570E608C.1030901@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Message-ID: <570FC843.9010403@ti.com>
Date: Thu, 14 Apr 2016 22:11:39 +0530
MIME-Version: 1.0
In-Reply-To: <570E608C.1030901@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 04/13/2016 08:36 PM, Marek Vasut wrote:
> On 04/07/2016 06:55 AM, Vignesh R wrote:
>>
>>
>> On 04/07/2016 01:00 AM, Marek Vasut wrote:
>>> On 04/06/2016 06:55 PM, R, Vignesh wrote:
>>>> Hi Marek,
>>>
>>> Hi!
>>>
>>>> I encountered a issue with this driver while testing.
>>>
>>> Try with the attached patches, I am planning to use them for V11
>>> submission. I think you're hitting the problem with missing buslock.
>>>
>>
>> Thanks for the patches.
>> But I am pretty sure that's not the problem at my end, because I have
>> only one flash device on QSPI bus.
>>
>> The problem is cqspi_switch_cs() is called only once ie when JEDEC ID is
>> being read(during autodetect of chip), but at that instance,
>> nor->page_size and nor->mtd.erasesize are not yet initialized (They are
>> initialized only after JEDEC ID is looked up in the table and page_size
>> and erasesize are known).
>> Therefore if nor->page_size is printed during cqspi_switch_cs() then its
>> zero. But nor->page_size reports 256 when printed in cqspi_flash_setup()
>> after spi_nor_scan(). Therefore CQSPI_REG_SIZE register has to be
>> configured only after spi_nor struct is fully populated (i.e after
>> spi_nor_scan() has recognized the slave after JEDEC ID read).
> 
> Got it and I have a patch for this. Nice find, thanks! It gave me 60%
> read performance boost on my machine :-)
>

Ah, hope I will see similar improvement at my end :)

> I am now caching the page_size, erasesize, addr_width values, so I can
> avoid reconfiguring the controller if there is no need for it, but
> reconfigure it if there is a need. The patch is attached, but it's quite
> big, so I also pushed a git branch with this driver for your convenience
> (based on linux-next, expect rebases):
> 
> https://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=next/cadence-qspi
> 

Ok, I will test this on my board sometime soon, thanks.

-- 
Regards
Vignesh
