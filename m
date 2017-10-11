Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2OCw-0006A3-N8
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 21:06:28 +0000
Received: by mail-wm0-x22f.google.com with SMTP id m72so21495783wmc.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 14:06:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: Altera ASMI Parallel II IP Core
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org,
 tien.hock.loh@intel.com, hean.loong.ong@intel.com
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1505932139-2905-3-git-send-email-matthew.gerlach@linux.intel.com>
 <deae5a9f-4301-c7de-b265-b09292f8da15@gmail.com>
 <alpine.DEB.2.20.1710110956260.2194@mgerlach-VirtualBox>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ca36c177-0e7c-647d-f821-ab4bb7d85b10@gmail.com>
Date: Wed, 11 Oct 2017 23:06:02 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1710110956260.2194@mgerlach-VirtualBox>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/11/2017 07:00 PM, matthew.gerlach@linux.intel.com wrote:
> 
> 
> On Tue, 10 Oct 2017, Marek Vasut wrote:
> 
>> On 09/20/2017 08:28 PM, matthew.gerlach@linux.intel.com wrote:
>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>
>>> This patch adds support for a spi-nor, platform driver for the
>>> Altera ASMI Parallel II IP Core.  The intended use case is to be able
>>> to update the flash used to load a FPGA at power up with mtd-utils.
>>>
>>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>> ---
>>> v2:
>>>     minor checkpatch fixing by Wu Hao <hao.wu@intel.com>
>>>     Use read_dummy value as suggested by Cyrille Pitchen.
>>>     Don't assume 4 byte addressing (Cryille Pichecn and Marek Vasut).
>>>     Fixed #define indenting as suggested by Marek Vasut.
>>>     Added units to timer values as suggested by Marek Vasut.
>>>     Use io(read|write)8_rep() as suggested by Marek Vasut.
>>>     Renamed function prefixed with __ as suggested by Marek Vasut.
>>
>> [...]
>>
>>> +#define QSPI_ACTION_REG            0
>>> +#define QSPI_ACTION_RST            BIT(0)
>>> +#define QSPI_ACTION_EN            BIT(1)
>>> +#define QSPI_ACTION_SC            BIT(2)
>>> +#define QSPI_ACTION_CHIP_SEL_SFT    4
>>> +#define QSPI_ACTION_DUMMY_SFT        8
>>> +#define QSPI_ACTION_READ_BACK_SFT    16
>>> +
>>> +#define QSPI_FIFO_CNT_REG        4
>>> +#define QSPI_FIFO_DEPTH            0x200
>>> +#define QSPI_FIFO_CNT_MSK        0x3ff
>>> +#define QSPI_FIFO_CNT_RX_SFT        0
>>> +#define QSPI_FIFO_CNT_TX_SFT        12
>>> +
>>> +#define QSPI_DATA_REG            0x8
>>> +
>>> +#define QSPI_POLL_TIMEOUT_US        10000000
>>
>> 10 s poll timeout ? :)
> 
> Hi Marek,
> 
> The 10s timeout is fairly arbitrary.  In other words, I pulled it out of
> thin air.  Can you suggest a better timeout?  From a practical
> standpoint 10s seemed to be much better than no timeout when I was
> debugging bad FPGA images.  Without a timeout I was hanging the system
> when the FPGA image failed.  With this timeout, we get a nice message
> and Linux keeps running happily.
AFAIK the SPI subsystem has a timeout which is adaptive to the bus
clock, maybe that's what you want to use here ?

-- 
Best regards,
Marek Vasut
