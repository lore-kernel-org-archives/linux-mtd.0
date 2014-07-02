Message-ID: <53B36A85.2010104@gmail.com>
Date: Wed, 02 Jul 2014 10:12:21 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver
 for hisilicon hip04 Soc
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com>
 <1404115409-20200-3-git-send-email-wangzhou.bry@gmail.com>
 <6920327.DpBe6vKVPa@wuerfel>
 <C3050A4DBA34F345975765E43127F10F2C15561F@SZXEMA512-MBX.china.huawei.com>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F2C15561F@SZXEMA512-MBX.china.huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Alexander Shiyan <shc_work@mail.ru>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Quyaxin <quyaxin@hisilicon.com>, Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>,
 Pekon Gupta <pekon@ti.com>, "Wanli \(welly\)" <welly.wan@hisilicon.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>, Kumar Gala <galak@codeaurora.org>,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014年06月30日 17:59, Caizhiyong wrote:
>> -----Original Message-----
>> From: Arnd Bergmann [mailto:arnd@arndb.de]
>> Sent: Monday, June 30, 2014 5:01 PM
>> To: linux-arm-kernel@lists.infradead.org
>> Cc: Zhou Wang; Rob Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar
>> Gala; Russell King; David Woodhouse; Brian Norris; Grant Likely; Ezequiel
>> Garcia; Pekon Gupta; Artem Bityutskiy; Alexander Shiyan; Ivan Khoronzhuk;
>> Jussi Kivilinna; Joern Engel; Randy Dunlap; devicetree@vger.kernel.org;
>> linux-mtd@lists.infradead.org; linux-doc@vger.kernel.org;
>> linux-kernel@vger.kernel.org; Caizhiyong; Wangzhou (B)
>> Subject: Re: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver for
>> hisilicon hip04 Soc
>>
>>
>>> +	struct device		*dev;
>>> +	void __iomem		*iobase;
>>> +	struct completion       cmd_complete;
>>> +	unsigned int		offset;
>>> +	unsigned int		command;
>>> +	int			chipselect;
>>> +	unsigned int		addr_cycle;
>>> +	unsigned int		addr_value[2];
>>> +	unsigned int		cache_addr_value[2];
>>> +	char			*buffer;
>>> +	dma_addr_t		dma_buffer;
>>> +	dma_addr_t		dma_oob;
>>> +	int			version;
>>> +	unsigned int            ecc_bits;
>>> +	unsigned int            irq_status; /* interrupt status */
>>> +
>>> +	int (*send_cmd_pageprog)(struct hinfc_host *host);
>>> +	int (*send_cmd_status)(struct hinfc_host *host);
>>> +	int (*send_cmd_readstart)(struct hinfc_host *host);
>>> +	int (*send_cmd_erase)(struct hinfc_host *host);
>>> +	int (*send_cmd_readid)(struct hinfc_host *host);
>>> +	int (*send_cmd_reset)(struct hinfc_host *host, int chipselect);
>>> +};
>>
>> Why do you need function pointers here? The current version of the
>> driver you posted always assigns these to the same functions, so
>> it would be more efficient to just call those directly.
>>
>
> I agree with you.
> This feature was originally designed to support a variety version of NAND controllers.
> But in fact, this feature is not used now.
>
I will move them out the host, thanks for your opinion!
