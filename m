Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqIJp-0001KY-MP
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 10:46:46 +0000
Message-ID: <570E1F2B.2080003@denx.de>
Date: Wed, 13 Apr 2016 12:27:55 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Vignesh R <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de> <57053F81.70204@ti.com>
 <570563D3.9080704@denx.de> <5705E858.3050700@ti.com>
In-Reply-To: <5705E858.3050700@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/07/2016 06:55 AM, Vignesh R wrote:
> 
> 
> On 04/07/2016 01:00 AM, Marek Vasut wrote:
>> On 04/06/2016 06:55 PM, R, Vignesh wrote:
>>> Hi Marek,
>>
>> Hi!
>>
>>> I encountered a issue with this driver while testing.
>>
>> Try with the attached patches, I am planning to use them for V11
>> submission. I think you're hitting the problem with missing buslock.
>>
> 
> Thanks for the patches.
> But I am pretty sure that's not the problem at my end, because I have
> only one flash device on QSPI bus.

OK, sorry for the delayed reply. I will go through the rest of the QSPI
mail later, probably this week.

> The problem is cqspi_switch_cs() is called only once ie when JEDEC ID is
> being read(during autodetect of chip), but at that instance,
> nor->page_size and nor->mtd.erasesize are not yet initialized (They are
> initialized only after JEDEC ID is looked up in the table and page_size
> and erasesize are known).
> Therefore if nor->page_size is printed during cqspi_switch_cs() then its
> zero. But nor->page_size reports 256 when printed in cqspi_flash_setup()
> after spi_nor_scan(). Therefore CQSPI_REG_SIZE register has to be
> configured only after spi_nor struct is fully populated (i.e after
> spi_nor_scan() has recognized the slave after JEDEC ID read).
> 
> 


-- 
Best regards,
Marek Vasut
