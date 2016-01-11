Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aITem-0001w6-Do
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 04:00:38 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
To: Rob Herring <robh@kernel.org>
References: <1452216405-10826-1-git-send-email-xuejiancheng@huawei.com>
 <20160109154249.GA28102@rob-hp-laptop> <56930369.1050000@huawei.com>
 <CAL_Jsq+K-tF=snhq+w9yYQKmAxbxDSLq6cv5fLfWjHTgdJxQWQ@mail.gmail.com>
CC: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <shijie.huang@intel.com>,
 <pengbinquan@huawei.com>, <han.xu@freescale.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Joachim Eastwood <manabian@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,
 <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
 <suwenping@hisilicon.com>, <ml.yang@hisilicon.com>,
 <gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <xuejiancheng@hisilicon.com>
From: xuejiancheng <xuejiancheng@huawei.com>
Message-ID: <56932742.5070105@huawei.com>
Date: Mon, 11 Jan 2016 11:53:38 +0800
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+K-tF=snhq+w9yYQKmAxbxDSLq6cv5fLfWjHTgdJxQWQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2016/1/11 11:09, Rob Herring wrote:
> On Sun, Jan 10, 2016 at 7:20 PM, xuejiancheng <xuejiancheng@huawei.com> wrote:
>> Hi Rob,
>>
>> On 2016/1/9 23:42, Rob Herring wrote:
>>> On Fri, Jan 08, 2016 at 09:26:45AM +0800, Jiancheng Xue wrote:
>>>> add hisilicon spi-nor flash controller driver
>>>>
>>>> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
>>>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
>>>> ---
> 
>>>> +Required properties:
>>>> +- compatible : Should be "hisilicon,hisi-sfc".
>>>
>>> I missed this last time, but you also need a more specific compatible
>>> string with the SOC name in it.
>>>
>>
>> This IP block is used in many SOCs. Do I need to add a specific compatible
>> string for every SOC? Thank you.
> 
> Yes. You can keep the generic one for driver matching, but you want to
> have the specific one in case there ever is a quirk/errata in a
> specific SOC.
> 

I see. Thank you.

> Rob
> 
> .
> 
