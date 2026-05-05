Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A801FF8855
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8qiEeTsvEzuefR4TL+lH1QKJCD43gz91lJ9I1ucovA=; b=l8xEg3GGKDDDsd
	FXS3qz+tY/sfuVC46IzoXNE5QJmIU2vtb4WeR3WGWn9Ate8NonoMD/7L8b9Vz8e3t0rah6ATBDtWf
	Q3qhEF6yEttpzdtovue3mG8Ap0WKpTpSAsDFi6DYKGaSECvYCqfjloeCWivC01c9hjY6Rw2KKlhsr
	cp7V7GP6gm87LydgIqOfvY5Q2Z0fr0IR8Fgguzpks06wllHgvDsjAlmX/95HCmv4lNxa64CtF3VPs
	xWGjQ7AJFPlRTshFoNxvKbx/HBnm1hBbhH6U7MfHWHD1BvJcWtdhrEZoQTiHfzaProp7nZjcSUv2O
	PQ3zncBo+aR664DEB+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIGr-0000000Gm8f-419S;
	Tue, 05 May 2026 16:05:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIGp-0000000Gm81-3uKJ
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 16:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CCAB40393;
	Tue,  5 May 2026 16:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453F6C2BCB4;
	Tue,  5 May 2026 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997115;
	bh=trnk4uG+uuv7clGk9dMv9N6Jna5KQ4Kj/uFyHAZAE+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YodhOV2o7J+a1layHvqfYd50fkptIsErwIZB2qAzJ1LWSlzLnE7XonexnsyfWd8aN
	 mtyEqSVAHkEUMs248G9zacGpHIVJyfkccC36jwuhhCtnxcepdKn5NfwDgnPJ2sMOtL
	 aYTKFupv6Y35vNlSkUMIlaJqJHt1MWwevxbvKIaBLOMs6ZyLIdsjjqa3yEiFxzodf7
	 gvjhOEpCQWiK5JdsVfXxskLIMZEGYtzlx7gMHjVJ8b1V6/jobdvfXCB3L9ifxweeto
	 fdQouHB6TEmdMqL5hyB7vZ+RbXM03qCJvkkpl0T0vQuDOJAi2wSxByflhbVSOmTWz7
	 o4ejh79nvorTQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
	(Miquel Raynal's message of "Fri, 03 Apr 2026 18:09:28 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
Date: Tue, 05 May 2026 18:05:11 +0200
Message-ID: <2vxzbjet266g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090516_011899_9DB9EC59 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 03 2026, Miquel Raynal wrote:

> There are many helpers already to either read and/or write SR and/or CR,
> as well as sometimes check the returned values. In order to be able to
> switch from a 1 byte status register to a 2 bytes status register while
> keeping the same level of verification, let's introduce a new helper
> that writes them both (atomically) and then reads them back (separated)
> to compare the values.
>
> In case 2 bytes registers are not supported, we still have the usual
> fallback available in the helper being exported to the rest of the core.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I'm confused. Doesn't spi_nor_write_16bit_sr_and_check() do the same
thing? How are these two different?

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
