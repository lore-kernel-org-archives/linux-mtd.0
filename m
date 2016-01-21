Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMHNn-0002mn-5Y
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 15:42:47 +0000
Received: by mail-vk0-x22f.google.com with SMTP id e64so25583928vkg.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jan 2016 07:42:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
References: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
Date: Thu, 21 Jan 2016 09:42:25 -0600
Message-ID: <CA+EcR20=OaZOOPMKVys-NDbTeXhEDCzre8L_vv53s+Ukv3XQLw@mail.gmail.com>
Subject: Re: mtd: spi-nor: fsl-quadspi: add support for ls1021a
From: Han Xu <xhnjupt@gmail.com>
To: Yuan Yao <yao.yuan@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel@vger.kernel.org, yao.yuan@nxp.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 21, 2016 at 1:53 AM, Yuan Yao <yao.yuan@freescale.com> wrote:
> This patch set is used for add the fsl-quadspi support for ls1021a and
> ls1043a, so remove the patch:
> mtd: spi-nor: fsl-quadspi: extend support for some special requerment.

Please use --cover-letter to generate cover letter.

>
> This patch will be send with anther patch set for add QSPI support on LS2080A.
>
> All the new property are document in anther patch set which is already
> send to linux-kernel@vger.kernel.org and devicetree@vger.kernel.org.
> Here is the patch name:
> 0001-Documentation-fsl-quadspi-Add-fsl-ls2080a-dspi-compa.patch
> 0002-Documentation-fsl-quadspi-Add-fsl-ls2080a-qspi-compa.patch
> 0003-dts-ls2080a-update-the-DTS-for-QSPI-and-DSPI-support.patch
> 0004-Documentation-fsl-quadspi-Add-optional-properties.patch
>
> Any extra information you can find them on the patchwork:
> https://patchwork.kernel.org/patch/8078931/
> https://patchwork.kernel.org/patch/8078951/
> https://patchwork.kernel.org/patch/8079091/
> https://patchwork.kernel.org/patch/8078941/

Please send all patches in one patch set, this is not acceptable.

>
> Thanks.
>
> Yuan Yao.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
