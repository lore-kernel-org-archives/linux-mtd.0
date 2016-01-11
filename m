Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aISs3-0008RY-Ce
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 03:10:17 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 47E33201EC
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jan 2016 03:09:54 +0000 (UTC)
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58FC82027D
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jan 2016 03:09:51 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id k129so395721984yke.0
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jan 2016 19:09:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56930369.1050000@huawei.com>
References: <1452216405-10826-1-git-send-email-xuejiancheng@huawei.com>
 <20160109154249.GA28102@rob-hp-laptop> <56930369.1050000@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 10 Jan 2016 21:09:31 -0600
Message-ID: <CAL_Jsq+K-tF=snhq+w9yYQKmAxbxDSLq6cv5fLfWjHTgdJxQWQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 shijie.huang@intel.com, pengbinquan@huawei.com, han.xu@freescale.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Joachim Eastwood <manabian@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 yanhaifeng@hisilicon.com,
 yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com,
 gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 10, 2016 at 7:20 PM, xuejiancheng <xuejiancheng@huawei.com> wrote:
> Hi Rob,
>
> On 2016/1/9 23:42, Rob Herring wrote:
>> On Fri, Jan 08, 2016 at 09:26:45AM +0800, Jiancheng Xue wrote:
>>> add hisilicon spi-nor flash controller driver
>>>
>>> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
>>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
>>> ---

>>> +Required properties:
>>> +- compatible : Should be "hisilicon,hisi-sfc".
>>
>> I missed this last time, but you also need a more specific compatible
>> string with the SOC name in it.
>>
>
> This IP block is used in many SOCs. Do I need to add a specific compatible
> string for every SOC? Thank you.

Yes. You can keep the generic one for driver matching, but you want to
have the specific one in case there ever is a quirk/errata in a
specific SOC.

Rob
