Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65666C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QEqUUhFsaCb/hcDSG9VE1d79lU+HLF8SnNMakLWRjk=; b=zhXng/WNdh7uEX
	7fNs+0MqlKMLg0iIMDJGnw7fvHb4UFCOAFEwYYZhCQmMwISEvXODuN6qjCT3ezTetGQkfFroS70By
	4U9KUaQK/vpMpjO/9xsx+B9JG1OiQdaYqhMWB2W5qzS+a141EfgfIqDu4sv21pnzcgxKlxaFQcqzb
	WlJpSQHcME12D25N2OZGwRGyWgvnMTJvEeFwh6w0NmFzrpSgor80PLxI/rMWJcrQWImmi8TJ1fi9w
	AjRJ9eV0QD0LcgfoHRJo5GwjKHmIzDxPFGowFsYZylGYTDBXqYMdd+ZsysITZYncJQK5YuQaolmBP
	0be/wu7YHqsCRiBEUHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwT1M-00HYl8-NJ; Wed, 01 Jun 2022 18:24:40 +0000
Received: from mx-out1.startmail.com ([145.131.90.139])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwT1B-00HYhR-SX; Wed, 01 Jun 2022 18:24:31 +0000
Date: Wed, 1 Jun 2022 13:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1654107865;
	bh=6QDUqmhuM8l1tVdeJi5firhjmNHPasPFCys26Iie+VU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=P1EAv5a9i3kopW4ykn8OWCntXzA5gWdkPwbERsEnYcy/tjRQveyLYsTwQphYppYkg
	 vY/DjjN/zYCSSGli2wMbqrr16cYWnTVI3aZENthlFVht1jr/vUBu68fEHxPsS18HWe
	 kuKcS1obKaJqlvVPh8fYsb0VD0w/AmUz6Ms/DirGW2NAnw15+/ydJPKJi6rfcsuLVP
	 ZY/F4blN3h7f0Cwev/KOyE1FVIaH8s2PXlmxB6LQTeW4ovz+LVcCLGYSVZYuCRVJJg
	 DM+p+GmiybFO0t1oXTpAX4PYIYLTufWrHsai6V6Mac7D7rCvWF7XFfcYkwlSjuCLPO
	 LCDpcIHp5et0A==
From: "Marty E. Plummer" <hanetzer@startmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
	devicetree@vger.kernel.org, gengdongjiu@huawei.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
	mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net,
	p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
	robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
	sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
	vigneshr@ti.com, xuwei5@hisilicon.com
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Message-ID: <20220601182418.okoofgannw6vbcxo@proprietary-killer>
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
 <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_112430_261644_47A15F4C 
X-CRM114-Status: GOOD (  17.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jun 01, 2022 at 01:09:28PM +0200, Krzysztof Kozlowski wrote:
> On 01/06/2022 13:06, Marty E. Plummer wrote:
> > On Wed, Jun 01, 2022 at 01:00:38PM +0200, Krzysztof Kozlowski wrote:
> >> On 01/06/2022 12:58, Marty E. Plummer wrote:
> >>> On Tue, May 03, 2022 at 01:37:42PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 01/05/2022 19:34, Marty E. Plummer wrote:
> >>>>> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> >>>>> generates clock and reset signals used by other module blocks on SoC.
> >>>>>
> >>>>> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> >>>>> ---
> >>>>>  drivers/clk/hisilicon/Kconfig             |   8 ++
> >>>>>  drivers/clk/hisilicon/Makefile            |   1 +
> >>>>>  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
> >>>>>  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
> >>>>
> >>>> Bindings go to separate patch. Your patchset is unmerge'able.
> >>>>
> >>> So, assuming I have the following patches:
> >>> 1: +include/dt-bindings/clock/hi3521a-clock.h
> >>> 2: +drivers/clk/hisilicon/crg-hi3521a.c
> >>> 3: +Documentation/devicetree/bindings/whatever
> >>>
> >>> In what order should they be applied?
> >>
> >> Applied or sent? The maintainer will apply them in proper order, this is
> >> bisectable.
> >>
> >>
> > Either or. Whatever makes the workload easier is what I'm looking for.
> 
> Sorry, you need to be more specific. Apply is not a job for you, for the
> patch submitter.
> 
> Then you miss here important piece - which is the first patch. DTS goes
> always via separate branch (or even tree) from driver changes. That's
> why bindings are always separate first patches.
> 
So, add a 4: arch/arm/boot/dts/soc.dtsi and 5: arch/arm/boot/dts/board.dts
to the above list, or should those be the same patch as well?

> Best regards,
> Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
