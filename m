Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtJUD-0001m2-RL
 for linux-mtd@lists.infradead.org; Tue, 25 Nov 2014 17:01:10 +0000
Message-ID: <5474B554.5070206@imgtec.com>
Date: Tue, 25 Nov 2014 13:59:00 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: bpqw <bpqw@micron.com>, Brian Norris <computersforpeace@gmail.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <71CF8D7F32C5C24C9CD1D0E02D52498A7713208B@NTXXIAMBX02.xacn.micron.com>
 <546DEA1C.2080805@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A049D3E5@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A049D3E5@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
Cc: "ionela.voinescu@imgtec.com" <ionela.voinescu@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/25/2014 04:02 AM, bpqw wrote:
>> Yeah, I've been thinking about this for some time. Right now, I think that
>> SPI NAND is just that: a NAND over SPI, so I'm doing some experiments
>> around this design:
>>
>>    Userspace
>>  ------------------
>>    MTD
>>  ------------------
>>    NAND core
>>  ------------------
>>    SPI NAND core
>>  ------------------
>>    SPI NAND device
>>  ------------------
>>    SPI core
>>  ------------------
>>    SPI master
>>  ------------------
>>    Hardware
> 
> I have finished a initial version of SPI-NAND framework based on drivers/staging/
> mt29f_spinand/mt29f_spinand.c . The structure is the same as yours, just treate SPI
> NAND as a NAND over SPI, put SPI NAND core under NAND core. Do you think it is a
> good structure to start with? Because it is a quick product, I even do not finish
> the unregisger function. So just care about the structure. Any suggestion about the
> patch is welcomed.
> 

Hm.. interesting. Ionela and I have started a similar work. However,
we've splitted the code in two: spi-nand-base.c and spi-nand-device.c.
The former handles the NAND logic, and the latter implements the
specific SPI commands.

The idea behind this separation is to allow for better evolution of the
code, given we are not sure the direction the SPI NAND devices will take.

I'm not sure how to handle a parallel effort like this and I don't want
to stop you from working. I'll have some code submitted by this week.

Maybe we can discuss it as well?
-- 
Ezequiel
