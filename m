Message-ID: <4F97A351.1090505@de.bosch.com>
Date: Wed, 25 Apr 2012 09:10:09 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 0/3] add gpmi-nand dt support for mx6q and mx28
References: <1335323184-11233-1-git-send-email-b32955@freescale.com>
 <4F979C91.9020607@de.bosch.com> <4F979EF2.8050904@freescale.com>
In-Reply-To: <4F979EF2.8050904@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25.04.2012 08:51, Huang Shijie wrote:
> 于 2012年04月25日 14:41, Dirk Behme 写道:
>> Hi Huang Shijie,
>>
>> On 25.04.2012 05:06, Huang Shijie wrote:
>>> The mx6q-arm2 and imx28evk have already support the device tree now.
>>> So i decide to add the gpmi-nand dt support to them.
>>>
>>> The mx23 does not support the device tree now. I will add the gpmi dt 
>>> support
>>> when it is ready.
>>>
>>> Test this patch set on both MX6Q(arm2) and mx28(evk).
>>>
>>> v1 --> v2
>>> [1] merge the gpmi/bch device node into one node.
>>> [2] add partitions support.
>>> [3] misc
>>>
>>> Huang Shijie (3):
>>> mtd: gpmi: add device tree support for mx6q and mx28
>>> ARM: mx28: add gpmi-nand dt support
>>> ARM: mx6q: add gpmi-nand dt support
>> For which kernel are these 3 patches? I tried to apply them on top of 
>> 3.4-rc4 and got a lot of rejects.
>>
> They are based on 3.4-rc4. but I also applied some mxs-dma patches.
> 
> Which one cause the rejects?

Could you kindly try to apply "mtd: gpmi: add device tree support for 
mx6q and mx28" on a clean 3.4-rc4?

Many thanks

Dirk
