Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDvnn-0004YD-4I
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 16:07:40 +0000
Received: by mail-wj0-x243.google.com with SMTP id he10so25814212wjc.2
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2016 08:07:18 -0800 (PST)
Subject: Re: [PATCH v6 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161205112727.GI1459@lahna.fi.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2dac1535-de7f-47c3-2747-ba8cac854811@gmail.com>
Date: Mon, 5 Dec 2016 14:33:12 +0100
MIME-Version: 1.0
In-Reply-To: <20161205112727.GI1459@lahna.fi.intel.com>
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

On 12/05/2016 12:27 PM, Mika Westerberg wrote:
> On Mon, Nov 28, 2016 at 03:06:23PM +0300, Mika Westerberg wrote:
>> This is 6th iteration of the series. You can find the previous versions
>> archived on:
>>
>>   v5: https://lwn.net/Articles/706363/
>>   v4: https://lwn.net/Articles/703773/
>>   v3: https://lwn.net/Articles/697231/
>>   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
>>   v1: https://lkml.org/lkml/2016/6/14/269
>>
>> This patch series adds support for the Intel SPI serial flash controller
>> found on many recent Intel CPUs including Baytrail and Braswell. This
>> driver makes it possible to access the BIOS and other platform data which
>> is stored on the SPI serial flash. It is also possible to upgrade the BIOS
>> using this driver if it has not been protected by special hardware bits.
>>
>> The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
>> MAX.
>>
>> Since poking the SPI serial flash can brick the machine, this driver can
>> only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
>> unless instructed othwerwise by module parameter.
> 
> Hi Lee,
> 
> I think we have enough acks from the MTD maintainers. I wonder if you
> could merge this series via your MFD tree?
> 
Ideally you'd merge 1/3 via MTD and 2,3/3 via MFD, but I'm not sure if
that is possible and if that is a sensible thing to do.

-- 
Best regards,
Marek Vasut
