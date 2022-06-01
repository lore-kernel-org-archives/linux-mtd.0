Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0CDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzx3Icws7hxUMublkxO/vv1ZrSqLd7sQLp5/qvCQrtg=; b=c+qg8DnRlWo6r5
	KFHYdWOBfniuJnK48F5TeOlPiR75uhioHjxl5XD6P4fOa/ZmwsnoAQg3jjOvLAGVTBBVYwyXsPwAc
	fQIdEA0/8mckMUzKLEJs5W767JHiRePZZiF/71KGOyA44raGsJ3qrpos6gYzunr4fQkNWRKroMMzg
	ckPzYGVjy6jA9MltMaukQYBQ4WKxdrPH30DAPH8XEG7Wy0NcAVZvh8JHHzRTsGTz62Gm365ykSKNF
	+fyNU8kX81kPfXfLp39bJDgn2uKdysudUtDKbSdS8M1VtiTKirJeGunaGJqkOvK1u6g0Tk6CF+7Ln
	o/Z6mc2MjwbJIXKDzF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwM4I-00FSf5-1s; Wed, 01 Jun 2022 10:59:14 +0000
Received: from mx-out1.startmail.com ([145.131.90.139])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwM47-00FSb7-Dq; Wed, 01 Jun 2022 10:59:04 +0000
Date: Wed, 1 Jun 2022 05:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1654081133;
	bh=xLfn3Y0/yusqS6Eog6u344rvDpPcQgkFd+Nc9svjBZc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=yKR1FSWQZKbmWEJq56tQ7+c8inCVHzc/rmVKOXmTvPxNJFpV+LWFw5BanJCRftdiH
	 P+xcq4HwEtf6xrHoas36nm9U5blUYUV4dPHXZUb4LkZruJoC4SFEk+l9CwXLLl+H08
	 gi+Fr0mfxIsDMCNJr3YBNv2FCMJDM89OfpnOQrpny8JU0kgxu5nYrooYNWsRSY4pAK
	 nLE7939OCvlXlFWiVLi/w2+7QBptE2o1wAgcBzfwHXyzgVLJ0UE7PjcrtyG7iIs0Nq
	 Llsezfhj7YOheX1YykDGie3p5GrkY8a4UQ/SyAhc+uzxNVQORsQlEa+2HHM728LeDe
	 pr+gnnUvXrpDQ==
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
Message-ID: <20220601105846.7hriawg3stxb657f@proprietary-killer>
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_035903_632054_46802F8F 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, May 03, 2022 at 01:37:42PM +0200, Krzysztof Kozlowski wrote:
> On 01/05/2022 19:34, Marty E. Plummer wrote:
> > Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> > generates clock and reset signals used by other module blocks on SoC.
> > 
> > Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> > ---
> >  drivers/clk/hisilicon/Kconfig             |   8 ++
> >  drivers/clk/hisilicon/Makefile            |   1 +
> >  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
> >  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
> 
> Bindings go to separate patch. Your patchset is unmerge'able.
> 
So, assuming I have the following patches:
1: +include/dt-bindings/clock/hi3521a-clock.h
2: +drivers/clk/hisilicon/crg-hi3521a.c
3: +Documentation/devicetree/bindings/whatever

In what order should they be applied?
> Best regards,
> Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
