Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPL8z-0000hL-RP
 for linux-mtd@lists.infradead.org; Sat, 30 Jan 2016 02:20:11 +0000
Subject: Re: [PATCH v5] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1454054597-8473-1-git-send-email-xuejiancheng@huawei.com>
 <20160129144502.GA1437@laptop.cereza>
CC: <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <shijie.huang@intel.com>, <pengbinquan@huawei.com>,
 <han.xu@freescale.com>, <fabio.estevam@freescale.com>,
 <manabian@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
 <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
 <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
 <zhangzhenxing@hisilicon.com>, <xuejiancheng@hisilicon.com>
From: xuejiancheng <xuejiancheng@huawei.com>
Message-ID: <56AC1BF6.8060007@huawei.com>
Date: Sat, 30 Jan 2016 10:12:06 +0800
MIME-Version: 1.0
In-Reply-To: <20160129144502.GA1437@laptop.cereza>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

Thank you very much for your comments. I read them carefully.
All of your suggestions are very good and helpful. I will correct
in next version.

Regards,

Jiancheng

.
On 2016/1/29 22:45, Ezequiel Garcia wrote:
> Hi Jiancheng,
>  
> Driver looks mostly good. Few comments below.
> 
> On 29 Jan 04:03 PM, Jiancheng Xue wrote:
>> add hisilicon spi-nor flash controller driver
>>
> 
