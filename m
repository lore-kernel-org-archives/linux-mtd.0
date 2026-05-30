Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37335CD6E4A
	for <linux-mtd@archiver.kernel.org>; Sat, 30 May 2026 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdJLfGIMSWXhr1Hmzbqf+IY3aqT48sJEMvqWwpGV8pI=; b=L8YYpxVEk96vRb
	1DYELG39NnyfxvFZdDgX+Y/vUHOhCm5zSpJxh21PDaCXOEndiv5bajUdjO98Xu59NHbzvDc9e5UPP
	mtC3F1QETk3b76FYwRlVmLiBP534H1+LZhaGq0qFV1C+7Y87O0uNmhCfPvXXawGPH5hIXR+r5rNLu
	N2WzrVa5JX9RmHfGtZcbjKy3lpgwbpNd22WoO5j41FarVwO2uZyFmnKz8bSuicpz/LlLFg5J2XSdf
	8r6IwkeuXpiAxF4EEYRS8jKOsTIRcmsKDnSfemMkQJqXBhfLUEjTOvWwPvKPi4WnvZiKanar+Y3HL
	3R1Xo/afiI9lPbtB24Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTFSb-00000008YPv-2MQd;
	Sat, 30 May 2026 08:54:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTFSX-00000008YPO-3INn
	for linux-mtd@lists.infradead.org;
	Sat, 30 May 2026 08:54:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7098B43FD7;
	Sat, 30 May 2026 08:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E0F1F00893;
	Sat, 30 May 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780131261;
	bh=CXpgVm9FxGfdae5u6tycGwxDHBkrtPMkQwMJjdDB8gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q6KFv3BwM6JMSJwQcqUKvrjKu16gTjCSqGmn8Qi0ILzyQf/8U9XQjtMYl0508qdue
	 QmfEkX4COYHW7zpK5La9eWyDvhsrNq3CENfkWN1yW66RtARad4S9aqbmtqdvb3T96+
	 JEzDEdqa0HjN+lVq7X9Cp5BRSELn1yw7i8SubKlFaKRzp6yjBoDterDYEcbyKd7vBY
	 6DKcWdq8llzS018We8Ozoib3T7eT2BIu8+45dNRztwlKpSLhfFQYPQ0m6nx4LN0oDL
	 8RoBMKr5Tb8sGF87O1mKAVhHkVLjJH1M3Rodvkc3Z0MQKABwc9Y9aAjLkRQmXH3QI5
	 1ssobfUStmUIA==
Date: Sat, 30 May 2026 10:54:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, 
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, 
	a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
Message-ID: <20260530-precise-practical-jaguarundi-81faa6@quoll>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-2-s-k6@ti.com>
 <20260528-clergyman-kindling-20971775ba78@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260528-clergyman-kindling-20971775ba78@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_015421_946647_058EB5B4 
X-CRM114-Status: GOOD (  22.36  )
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

On Thu, May 28, 2026 at 06:36:57PM +0100, Conor Dooley wrote:
> On Wed, May 27, 2026 at 11:25:15PM +0530, Santhosh Kumar K wrote:
> > Some SPI controllers support high-speed operating modes that require
> > controller-side configuration before the device can be driven at its
> > rated maximum frequency. In these cases two frequencies are relevant:
> > a conservative speed usable without any such configuration, and the
> > maximum speed achievable once the controller is set up accordingly.
> > 
> > The existing spi-max-frequency property accepts only a single u32,
> > which cannot express this distinction. Extend it to accept either a
> > single value (retaining full backward compatibility) or a two-element
> > array [base-frequency, max-frequency], where base-frequency is the
> > conservative operating speed and max-frequency is the highest speed
> > the device supports after controller-side configuration.
> > 
> > Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> > ---
> >  .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> Pretty sure this hasn't been tested, dt_binding_check cannot even build
> processed-schema.json with this applied because there are multiple
> definitions of spi-max-frequency with it applied.
> 
> The sashiko makes the point that this breaks every binding that uses
> minimum/maximum to set constraints too, because these properties do not
> apply to arrays unless applied per item.
> 
> I also don't get the point of this property, why can't you just set the
> max that the device can do and if the controller can configure itself to
> be fast enough it will do so, and if it can't then it'll pick whatever
> the fastest it can actually do instead?
> Seems like you're abusing a peripheral property to encode information
> about the controller.

Yes, commit msg speaks about controller but patch body changes SPI devices.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
