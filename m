Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agpBx-0003h2-TA
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 07:51:30 +0000
Received: by mail-lb0-x231.google.com with SMTP id k12so83029379lbb.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2016 00:51:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1458285741-20821-1-git-send-email-xuejiancheng@huawei.com>
References: <1458285741-20821-1-git-send-email-xuejiancheng@huawei.com>
Date: Fri, 18 Mar 2016 13:21:07 +0530
Message-ID: <CAD6G_RQp0neR8VcPXJ8Xd7E44ZE1wfpP+JwWykEAnr=8WwMx2w@mail.gmail.com>
Subject: Re: [PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
From: Jagan Teki <jagannadh.teki@gmail.com>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com,
 boris.brezillon@free-electrons.com, ezequiel@vanguardiasur.com.ar,
 juhosg@openwrt.org, shijie.huang@intel.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Furquan Shaikh <furquan@google.com>,
 Han Xu <han.xu@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>,
 manabian@gmail.com, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 yanhaifeng@hisilicon.com,
 yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com,
 ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com,
 xuejiancheng@hisilicon.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 March 2016 at 12:52, Jiancheng Xue <xuejiancheng@huawei.com> wrote:
> Add hisilicon spi-nor flash controller driver
>
> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---

Reviewed-by: Jagan Teki <jteki@openedev.com>

-- 
Jagan.
