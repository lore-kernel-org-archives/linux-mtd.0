Received: from nasmtp01.atmel.com ([192.199.1.245]
 helo=DVREDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgqSe-0007QS-EY
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 07:36:00 +0000
Message-ID: <54475E41.3030205@atmel.com>
Date: Wed, 22 Oct 2014 15:35:29 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Vinod Koul <vinod.koul@intel.com>, Herve Codina <herve.codina@celad.com>
Subject: Re: [PATCH 1/2] mtd: atmel_nand: use __iowrite32_copy for 32 bitcopy
References: <1413821173-18347-1-git-send-email-vinod.koul@intel.com>
 <54462F6C.1030307@atmel.com> <54463356.400@celad.com>
 <20141021103540.GJ28745@intel.com>
In-Reply-To: <20141021103540.GJ28745@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Bo Shen <voice.shen@atmel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Mark Brown <broonie@linaro.org>,
 HuangShijie <shijie8@gmail.com>, Jingoo Han <jg1.han@samsung.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 BartlomiejZolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 EzequielGarcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 10/21/2014 6:35 PM, Vinod Koul wrote:
> On Tue, Oct 21, 2014 at 12:20:06PM +0200, Herve Codina wrote:
>> Hi,
> Please don't top post
>> I didn't go deeper in atmel_nand.c code to see other accesses but old
>> copy use writel_relaxed which is a macro to __raw_writel((__force u32)
>> cpu_to_le32(v),c)
>>
>> __iowrite32_copy use directly __raw_writel(*src++, dst++)
>>
>> So we skip cpu_to_le32. Is it ok for all system using atmel_nand ?
> Also would be a good question if we need barriers as __iowrite32_copy()
> doesn't guarantee any ordering.
>

Just diving the code, I found the atmel-nand code use this function to 
transfer write these buffer to NFC sram.
And the NFC sram is not io space.
Also there should has no issue in barriers as it is in a SRAM.

So I think right way is use memcpy function to replace the 
ioread32/iowrite32. Since we use them for SRAM transfer not IO.
I'll prepare a new patch which do above replace.

Best Regards,
Josh Wu
