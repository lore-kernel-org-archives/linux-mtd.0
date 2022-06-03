Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40307C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpcmfKAsvCeazFgu0Wf3yRY/qvn1z45peDjFqWDtNqE=; b=DZlKDK6Zazqqw7
	2uOIN/B4Awnm9LZ3GJlxrgEwJAHtaRpxkO8vlZD9jWwD/X3tLrdmjkb5kWgNuR+tono2Jp60nbOzo
	HhgX5xEZYBHG7gFS7AnA9UehsbO0zHXzSuzlcYHjj5i7I5o0GqJv48/dYbxBWSFpHGzpJLEIJ4fQK
	8u87qyU2HpcGdCz5cHwT5hMoTljMbjmQUTEMfvJX2lfnyFSppF+50f1YW3lTw0H6ohSXh4pUZ8ppV
	Y4mFOqfW25rVDomBlEe8kBahfjlOUWBPXTh1VZCT1p4nsBIJQwuumnWwvDiIP1SkiswZAi0+RhXdi
	w+AXsfSOcV2mBvZ3V6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx5ON-007AWD-2w; Fri, 03 Jun 2022 11:22:59 +0000
Received: from mx-out1.startmail.com ([145.131.90.139])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx5OB-007AQr-0Z; Fri, 03 Jun 2022 11:22:48 +0000
Date: Fri, 3 Jun 2022 06:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1654255355;
	bh=BVv2NM9n65XEgstvWZEX3Zz0IsWB0nQDd9CmGlBZ1e8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=TaHE9+rTyTn3uo0Ihyw9XeRywIri5CokHtUnXmvWBUvxj7QpMfl659rYDDUthemfw
	 JDXglecgRmHRtFhUnE1pBX1ZZ1mYxZGxXQKGGGio2/2sQaTIJaQk+P77qZGnX3F2Xr
	 0bGtgjEq3muByV8xMktfZAv+1DCRVp102o9UNJp9qUslKCDlOG9BrpoxI75ANeC75s
	 ef1ed+r/fYmYby6gCAporGN0ySGZPSsQfNaTbQLfklIQcllOmGlTp/aO+NTRC7sqju
	 qgU2F3/onmtQaBr9ql/yiVstsBoMbSkwLAX+Zh2/8K/IxsuiRJfbWuPnoly64ueyNm
	 jSBSc8cPAkN3g==
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
Message-ID: <20220603112227.hmzwy7xxl6ddezqh@proprietary-killer>
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
 <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
 <20220601182418.okoofgannw6vbcxo@proprietary-killer>
 <b1b87be5-a048-b713-c9f2-84b948aa6718@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1b87be5-a048-b713-c9f2-84b948aa6718@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_042247_225171_73049CF8 
X-CRM114-Status: GOOD (  13.91  )
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

On Thu, Jun 02, 2022 at 08:37:43AM +0200, Krzysztof Kozlowski wrote:
> On 01/06/2022 20:24, Marty E. Plummer wrote:
> 
> >>> Either or. Whatever makes the workload easier is what I'm looking for.
> >>
> >> Sorry, you need to be more specific. Apply is not a job for you, for the
> >> patch submitter.
> >>
> >> Then you miss here important piece - which is the first patch. DTS goes
> >> always via separate branch (or even tree) from driver changes. That's
> >> why bindings are always separate first patches.
> >>
> > So, add a 4: arch/arm/boot/dts/soc.dtsi and 5: arch/arm/boot/dts/board.dts
> > to the above list, or should those be the same patch as well?
> 
> For me does not matter, sub architecture maintainer might have preference.
> 
Fair enough. That being said, for the dt-bindings patch, is it
permissible to include #define CLOCK_FOO 1337 and so on for clocks which
haven't been wired up in the driver yet? As in, you know they're there,
and are important enough to model, but you haven't gotten to that point
yet?
> Best regards,
> Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
