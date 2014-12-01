Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvQhJ-0002MI-ST
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 13:07:26 +0000
Received: by mail-pd0-f172.google.com with SMTP id y13so10959896pdi.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 05:07:04 -0800 (PST)
Message-ID: <547C67F3.7080807@gmail.com>
Date: Mon, 01 Dec 2014 21:06:59 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
In-Reply-To: <20141130090853.GG3608@norris-Latitude-E6410>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 haojian.zhuang@gmail.com, wangzhou1@hisilicon.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, xuwei5@hisilicon.com, galak@codeaurora.org,
 caizhiyong@huawei.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014年11月30日 17:08, Brian Norris wrote:
> On Tue, Nov 04, 2014 at 08:46:59PM +0800, Zhou Wang wrote:
>> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
>> The NAND controller IP was developed by hisilicon and needs a new driver to
>> support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
>> controller works fine in Hip04 D01 board.
>
> Have you tested on the MTD test modules (drivers/mtd/tests/*)? This is
> important, as we seem to regularly get UBIFS bug reports from users
> whose drivers have not even passed some of the simple tests.
>
> Also, it might be worth testing out the UBI tests found in the mtd-utils
> package.
>
> Brian
>

Hi Brian,

I have not tested on the MTD test modules, I will do this test and
the UBI tests ASAP. Thank you very much for so many helpful comments!

Best Regards,
Zhou Wang
