Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMfYL-0000eQ-0j
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 17:31:17 +0000
Received: by mail-vk0-x236.google.com with SMTP id e185so44831111vkb.1
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jan 2016 09:30:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AM2PR04MB072287A0E9C83F507FDF282389C40@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
 <CA+EcR20=OaZOOPMKVys-NDbTeXhEDCzre8L_vv53s+Ukv3XQLw@mail.gmail.com>
 <AM2PR04MB072287A0E9C83F507FDF282389C40@AM2PR04MB0722.eurprd04.prod.outlook.com>
Date: Fri, 22 Jan 2016 11:30:55 -0600
Message-ID: <CA+EcR2197eSd--Xt2ePXJc5kW1qhDa5_5DQh9R4s6HdFtDs_Qw@mail.gmail.com>
Subject: Re: mtd: spi-nor: fsl-quadspi: add support for ls1021a
From: Han Xu <xhnjupt@gmail.com>
To: Yao Yuan <yao.yuan@nxp.com>
Cc: Yuan Yao <yao.yuan@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 22, 2016 at 3:01 AM, Yao Yuan <yao.yuan@nxp.com> wrote:
> On Thu, Jan 21, 2016 at 11:42 PM, Han Xu < xhnjupt@gmail.com > wrote:
>> On Thu, Jan 21, 2016 at 1:53 AM, Yuan Yao <yao.yuan@freescale.com> wrote:
>> > This patch set is used for add the fsl-quadspi support for ls1021a and
>> > ls1043a, so remove the patch:
>> > mtd: spi-nor: fsl-quadspi: extend support for some special requerment.
>>
>> Please use --cover-letter to generate cover letter.
>>
>> >
>> > This patch will be send with anther patch set for add QSPI support on LS2080A.
>> >
>> > All the new property are document in anther patch set which is already
>> > send to linux-kernel@vger.kernel.org and devicetree@vger.kernel.org.
>> > Here is the patch name:
>> > 0001-Documentation-fsl-quadspi-Add-fsl-ls2080a-dspi-compa.patch
>> > 0002-Documentation-fsl-quadspi-Add-fsl-ls2080a-qspi-compa.patch
>> > 0003-dts-ls2080a-update-the-DTS-for-QSPI-and-DSPI-support.patch
>> > 0004-Documentation-fsl-quadspi-Add-optional-properties.patch
>> >
>> > Any extra information you can find them on the patchwork:
>> > https://patchwork.kernel.org/patch/8078931/
>> > https://patchwork.kernel.org/patch/8078951/
>> > https://patchwork.kernel.org/patch/8079091/
>> > https://patchwork.kernel.org/patch/8078941/
>>
>> Please send all patches in one patch set, this is not acceptable.
>>
>
> Thanks for your review.
> But those patches are dts binding patch. And will send to  devicetree@vger.kernel.org and some corresponding maintainer.
>
> Those two patch sets will send to different mail-list and maintainers separately.
>
> So, maybe it's better to send the patch to the maintainer accordingly and thus I think can also reduce the workload of maintainer.
>
> How about your think?

Send the complete patch set to maintainer and cc all related
sub-module groups, so everybody could understand the whole story.

> Thanks.
>
> Yuan Yao.
