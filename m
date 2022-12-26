Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A6BC3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sryx3mA76XRxqQ6dzDRW9YfFaTGuFKgqJ1eMEbUURjA=; b=H62xBE2FvDZ6xy
	UMJJgS5YAGMqqOQ7FPHiorRCCI8j5262Lzr3hgObTuQU9TH+C22yRtU4JGd8YYm/ZwJBILG9el4Gu
	sVzrfmRQlchOtSvDPXp0GGszZJ2SAOvCHbh2UQ7ecUj4uul7XDod3dAdJExvN+Shz4xanYvgTkIId
	3C5FS2SOgk0N/BIf16vWIyapFGaCK56GpEnmqQwJncqe+xIzmjpvg+Ft+/gUlOs4/3aKH4hkz0B83
	UiUWmd2UJznAeqjRUlX1cpw44pc+Eh6cyNonaGs5yYJHUxP1IXP9xJFV6hP+ZgpSX+94O2HtF+Lgq
	UopJH3o1e4chzULEeT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9oAq-004YTQ-CA; Mon, 26 Dec 2022 14:09:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9oAm-004YNp-A5
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 14:09:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7D159B80C02;
	Mon, 26 Dec 2022 14:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB609C433EF;
	Mon, 26 Dec 2022 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672063785;
	bh=FwZL47HU0SHBwhLkhszN//dJR6yMZBr076Sf6iCF2tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5tgcxVU5YJXRveXtv0fSANlGN2ST9duaXI6fzKEk1qlJChkCzGu3PpTQ1SvDXU9E
	 kefsIcyI9VLVRGUPQa6DGuSf3blgIuFxCCZ8jDzREHPVu1Gbd5Fb4jEVcSku7E2fYk
	 xktEXi3Pg2eEvAoZ/d09d1kUrvp4xuugrIW3kifGerbY1l6vuCT8xjP0xcj5QHf/kM
	 bboPWpkE2+aj2IlXVE/rJ8ORHdVsxHDHqITJHLBzUzfYXBMNIkBp+LuAeYHm4xW3K5
	 Lw4ATLHSnBtP8fKoe9/FKyZqouXJV0hFtPFljUeenl9KhR0bYi/8YsXdazqIwT5wFK
	 lFz2orlWMXRtQ==
Date: Mon, 26 Dec 2022 15:09:42 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
	michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for
 optional parameter tables
Message-ID: <20221226140942.olwf6kqmw7brkfq3@yadavpratyush.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
 <48cb008b40fdef4bf7f87e37029efaa2bfefa9ef.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48cb008b40fdef4bf7f87e37029efaa2bfefa9ef.1672026365.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_060948_906974_6F9EFD42 
X-CRM114-Status: UNSURE (   7.07  )
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

On 26/12/22 01:02PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Change 0-based indexing values of parameter tables to 1-based ones by
> SFDP_DWORD() macro.
> 
> Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
