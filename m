Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94D4CD6E55
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsFTJakxgIGpzaP9CZ2zvjT7YsMUDMr5J2y1SAldS3g=; b=GkpnndOtirU1of
	BbZYNvxcdCw9kWI+Bo4pSXjqkgOZsBCvbSdZmLmfCjqWkEsxnXqf0aLX7jP3YNZRd4937xyKfnYOn
	PUgcK3HOCkhihdwzPR5/B896hKwnj0k0LF8YUVwvifJ4K4cm3bEn6WFlCOu8nmafygWlKlN6Foohq
	E3YpQeD+pnE22wI0qxeYAS6gEXf6IyJQY10PqCODiUG1eLfMpnYNYdAFVaeeeuh+GZ7Ij9gK/545n
	3EhAkTL6lhxbsYvdc3pZzqMNjyPNkQNxmKdpgYpVqYGfuNN4PHaVKhVm6H86plj6Wxa6oaqDmzfL4
	zmLT8khtsi6tBgO+BVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU17N-0000000Aldn-0P7R;
	Mon, 01 Jun 2026 11:47:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU17M-0000000AldY-1UQx
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 11:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31C776001A;
	Mon,  1 Jun 2026 11:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AE61F00893;
	Mon,  1 Jun 2026 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780314458;
	bh=t1bK4cZQhsY0Yrq3fi8QJnWtjpMyyN2oQtBqaMvH3f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iLBPIPfrUmMFBfBo/9hPnVur6xSB/U4GS1TQHQ5ioN1AMCU9Agmv2FBfJ4ubCsO7o
	 Km3tCnbDZfZ0660St9fhIfUCrcH1M1LKZc5T3M/+7tLXGSVAVfRcWpEIXb7AmWHXId
	 QKZSxPZjxbiHUkPcg2nVCHi72JwdBIXHGaWmMuQd9uP7cM8rYVrGedF3vmZu+7E7n3
	 fQw5BPVREIWrXBIdBJrSsK7QIuEGS9JRZwz5QHWM/9o2XRGLoTo7t065OUREXoopA1
	 VO060BmGvzANgBbVEs9ez0OKuY4AvlhnbM2CyAhk2tBzzuFo69Z7I2vCMDpfuAfoE/
	 /w5oSfrm0KiZQ==
Date: Mon, 1 Jun 2026 13:47:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
Message-ID: <20260601-stirring-tested-mayfly-e97c14@quoll>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
 <20260530-original-peccary-of-cubism-af68ed@quoll>
 <2f091813-fa28-407f-892d-bbbbe3cac4e4@ti.com>
 <063fe976-9a28-4670-90df-921fbc1c3a8c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <063fe976-9a28-4670-90df-921fbc1c3a8c@kernel.org>
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

On Mon, Jun 01, 2026 at 01:26:27PM +0200, Krzysztof Kozlowski wrote:
 >>
> >> This should be used in any of applicable examples.
> > 
> > Please refer to the DT changes included in the repository linked in the
> > cover letter, which should provide a clearer picture of how this
> > property is intended to be used. [0]
> > 
> > I'll also add a DT binding example in the next version to make the usage
> > more explicit.
> 
> Why do you new a new example? Why existing examples are not applicable?

typo: "Why do you need a new example?"

> 
> > 
> >>
> >> I also have doubts that this is per-device property. Your commit msg
> >> suggests it is per controller.
> > 
> > This is a per-device property. It is consumed by the controller driver
> > only to locate and retrieve the offset of the PHY pattern partition
> 
> So with two devices on a bus, you need two separate partitions for tuning?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
