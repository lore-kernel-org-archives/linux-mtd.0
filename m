Received: from mail-wg0-f46.google.com ([74.125.82.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YE7xR-0001g8-4v
 for linux-mtd@lists.infradead.org; Thu, 22 Jan 2015 02:57:22 +0000
Received: by mail-wg0-f46.google.com with SMTP id l2so5975459wgh.5
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2015 18:56:58 -0800 (PST)
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com.
 [74.125.82.177])
 by mx.google.com with ESMTPSA id u13sm2089892wjr.26.2015.01.21.18.56.57
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Wed, 21 Jan 2015 18:56:57 -0800 (PST)
Received: by mail-we0-f177.google.com with SMTP id l61so24836568wev.8
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2015 18:56:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAN1oZWzeev-1uE7gxPnJA=L4Th65CRj8C_LQ7hMJLPHGssDjNQ@mail.gmail.com>
References: <CAN1oZWxB5N=YMQcsJppZgp7TXodcR4tKZM+LNFXS7PSx3F-Yag@mail.gmail.com>
 <CAN1oZWzeev-1uE7gxPnJA=L4Th65CRj8C_LQ7hMJLPHGssDjNQ@mail.gmail.com>
Date: Thu, 22 Jan 2015 10:56:57 +0800
Message-ID: <CAN1oZWwBb3nWDKcwFmDD1kc94mxCWBz+O-nUnZdByYsfZSTtCQ@mail.gmail.com>
Subject: Re: [PATCH mtd] mtd:devices: Add Altera EPCQ Driver
From: Viet Nga Dao <vndao@altera.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Viet Nga Dao <vndao@altera.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 20, 2015 at 10:05 AM, Viet Nga Dao <vndao@altera.com> wrote:
> On Thu, Jan 15, 2015 at 5:27 PM, Viet Nga Dao <vndao@altera.com> wrote:
>> On Tue, Jan 13, 2015 at 11:33 AM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>>> On Thu, Dec 18, 2014 at 12:23:16AM -0800, vndao@altera.com wrote:
>>>> From: Viet Nga Dao <vndao@altera.com>
>>>>
>>>> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
>>>> EPCS flash chips. This patch adds driver for these devices.
>>>>
>>>> Signed-off-by: Viet Nga Dao <vndao@altera.com>
>>>
>>> This drivers seems awfully similar to (and so I infer it is likely
>>> copy-and-pasted from) m25p80.c / spi-nor.c. Do you think it can be
>>> rewritten as a SPI NOR driver, under drivers/mtd/spi-nor/ ? It looks
>>> like these flash share most (all?) the same basic opcodes.
>>>
>> For Altera EPCQ flashes, almost operations are performed underline
>> hardware. Software only able to perform the following through
>> registers:
>>  -  read status register
>>  -  read id
>>  -  write status registers bit SR_BP0,SR_BP1, SR_BP2,SR_BP3, SR_TB
>> (http://www.altera.com.my/literature/hb/cfg/cfg_cf52012.pdf)
>> For read/write data: all the operations like QUAD_READ/WRITE,
>> FAST_READ/WRITE are handled by hardware as well. From software point
>> of view, there is no difference between these 2 modes.
>> That is why if rewrite the drivers to follow spi-nor structure, it
>> will require extra decoding works for the only few used opcodes.
>>
> Is it OK to remain this driver structure?
Can someone please reply my question as it is been a while?
Viet Nga
