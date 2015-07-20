Received: from mail-lb0-f176.google.com ([209.85.217.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHFYF-0004hQ-Oe
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 18:12:32 +0000
Received: by lblf12 with SMTP id f12so100246845lbl.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 11:12:09 -0700 (PDT)
Message-ID: <55AD39F6.4080303@linaro.org>
Date: Mon, 20 Jul 2015 21:12:06 +0300
From: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
CC: dwmw2@infradead.org, santosh.shilimkar@ti.com,
 grygorii.strashko@ti.com, m-karicheri2@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsa@the-dreams.de, Hao Zhang <hzhang@ti.com>
Subject: Re: [Patch v2] nand: davinci: add support for 4K page size nand
 devices
References: <1408451514-4204-1-git-send-email-ivan.khoronzhuk@ti.com>
 <20150720173203.GB24125@google.com>
In-Reply-To: <20150720173203.GB24125@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 20.07.15 20:32, Brian Norris wrote:
> On Tue, Aug 19, 2014 at 03:31:54PM +0300, Ivan Khoronzhuk wrote:
>> From: Sandeep Paulraj <s-paulraj@ti.com>
>>
>> It is needed for k2l keystone2 EVM which uses NAND flash with 4K page
>> size, hence add support for 4K page size nand devices.
>>
>> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>> ---
>>
>> Based on l2-mtd/master
>>
>> v1..v2:
>> - fixed comment style, no functional changes
>
> This was resurrected Murali Karicheri. Since this one is nearly
> identical and much preceded it, I've pushed it to l2-mtd.git.
>
> Thanks,
> Brian

This happened, finally.
Thanks!
