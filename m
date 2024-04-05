Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E808BCD11C2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzesiyJskEo+BPA1rdfoJQgwyti+FFlGlNGPCZw4soM=; b=2GXRTRkuSPPJd6
	IucGg/brSlvBzL5KTeJvygUfl0xzWW9e8RCciTs/mm56Ce389Hgz4XbkMbaZaignP3tJgrRDhz2aL
	m5ucLQ3pYsCRLC0Md9nBCcGXBA1zUfj4Px45PhnERkiRBKGfP1WvzdIrVMF2mzx9/nQzbb0koAefb
	sB059KsTM2+43qqkKBJhQgcftwiBEVt2doXclIR1WRneOiaIArt25qp2G1lGfaFE1XNwmOBu9OyKY
	fI25sZQWcioPJZYC7k5q//1BX7ofPiv2k7BmOwNmyGu1XOQICEkMvs3oZfN1wljvN+ON6qtw8CeWG
	/r7SWHGb7hrGu2N6RgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsdD3-00000005Ub0-1hHX;
	Fri, 05 Apr 2024 06:37:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsdCz-00000005UYn-0RbP
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 06:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 259BC6170C;
	Fri,  5 Apr 2024 06:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A48C433F1;
	Fri,  5 Apr 2024 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712299071;
	bh=x+/Mq/rmeQx2+kJB0UUehFljzLSHxpKorqQ3wE9zZvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noxxfr5Od8JqZzA0S0c0eMEryFu92K1ivZ/Xu6hDxj5sgEOn55Ibt2/H9bEWMSsNl
	 0v3w7GVCpas6gpDmPjN2LTMa2G/NtwdXIB7mHbuhRSyZoPxXQarH6f3s6c8RbLtHyR
	 ZlQRSF+nth98pN3+OGq3rrmFlKlWmVQIgC67MuuA=
Date: Fri, 5 Apr 2024 08:37:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: quic_sridsn@quicinc.com, quic_mdalam@quicinc.com, ezra@easyb.ch,
	gch981213@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
	sashal@kernel.org, vigneshr@ti.com, kernel@salutedevices.com,
	rockosov@gmail.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
	stable@vger.kernel.org,
	Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: Re: [PATCH v1] mtd: spinand: Add support for 5-byte IDs
Message-ID: <2024040509-faceless-passerby-10ad@gregkh>
References: <20240404121532.14755-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404121532.14755-1-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_233753_224425_72220345 
X-CRM114-Status: GOOD (  16.74  )
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

On Thu, Apr 04, 2024 at 03:15:21PM +0300, Dmitry Rokosov wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> [ Upstream commit 34a956739d295de6010cdaafeed698ccbba87ea4 ]

This commit is already in the following releases:
	6.6.24 6.7.12 6.8.3 6.9-rc1

> E.g. ESMT chips will return an identification code with a length of 5
> bytes. In order to prevent ambiguity, flash chips would actually need to
> return IDs that are up to 17 or more bytes long due to JEDEC's
> continuation scheme. I understand that if a manufacturer ID is located
> in bank N of JEDEC's database (there are currently 16 banks), N - 1
> continuation codes (7Fh) need to be added to the identification code
> (comprising of manufacturer ID and device ID). However, most flash chip
> manufacturers don't seem to implement this (correctly).
> 
> Cc: <stable@vger.kernel.org> # 6.6.23
> Cc: <stable@vger.kernel.org> # 6.7.11
> Cc: <stable@vger.kernel.org> # 6.8.2
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Link: https://lore.kernel.org/linux-mtd/20240125200108.24374-2-ezra@easyb.ch
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
> 
> In the patch series [1] only one patch was marked with Fixes tag, that's
> why the secon patch was not applied to 6.6.y, 6.7.y and 6.8y. It breaks
> ESMT detection flow with logs:
> 
> [    0.770730] spi-nand spi0.0: unknown raw ID c8017f7f
> [    0.772688] spi-nand: probe of spi0.0 failed with error -524
> 
> Please cherry-pick the second patch from the series to 6.6.y, 6.7.y and
> 6.8.y.

What commit id is "the second patch" here?  The one referenced above?
If so, again, this is already in a released kernel, so I'm confused as
to what to do here.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
