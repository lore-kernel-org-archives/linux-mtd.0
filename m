Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FFEEB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7NMGE2/3WdCCga/C1pE/X+/SYZvuHsXx5oNuEsWZa4=; b=BHE47mO6nRTbjUQP4qV7+fLxCS
	nx31PbK5XRB8sxCKAOvIo3adaX2n4C8X6DidjOErHq+uMneAjvcbXWKNv6xBBZfmEP+TGr+bSBwr0
	M5J9KOYh2zrfLM2pcG8mP/hFcdyvXUDN9dfrtYSm5OmfgniVIgI82ONvgHsEUFuryOtezhf/07Eyk
	zRocK3NapckS8qHL88PHMvQsVxiBZQ7v0butaSyjHlKaDO2ApcLdrg2kspvULo15oxy+eKX+R6fJB
	xsB61NBGSu0m8ZDWXJNf4x0qjtAXZurTjuatif0qPCDEmX+PQD6Y+V4/UgLdJRsF82L0FLxIq/AcV
	JQJqOFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStyi-00GI0k-22;
	Mon, 07 Aug 2023 06:44:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStyf-00GI04-2M
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 06:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3061A614DD;
	Mon,  7 Aug 2023 06:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022DDC433C8;
	Mon,  7 Aug 2023 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691390668;
	bh=fsGPwmeAk4TBNXAYWuhCkanYO3aKX9771KSgpFRsYUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ExVPccOhTWWD4BJZ2pz43JkbLfqkUcAvtsNnkrhPuN9tRPI4vgCdWweyKsKwl4VoQ
	 qP1T6bzMob5CMSXpLx+RHBNlY9qZgH6gtcf5of6nUHSopWcdfK/+xNdeDnSceF5h2g
	 R7AbGb+Z3eQD72xVm69ql8w9EWbjFlaIeEAe16OjBO5iEFmAdfgzbDuMDRIn2A48NP
	 1oegcXQqB3q7jnDqrLOIA3YrsJDdR0O8RzGoLAts4U+JiRL0M1TF3x+rDhHuuQHy+g
	 G2TQs0Bnv6D4Sv9O6/Paezyv/qxk9JbYaPJOvf8Aw0ywkdyMdelj7BTui51C721eWq
	 7r8Nfay3mqYvA==
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 08:44:24 +0200
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <20230804095409.278419-2-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-2-jaimeliao.tw@gmail.com>
Message-ID: <06cb1125f82c36aedcbf7339ddeb166a@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_234429_815212_354EEB38 
X-CRM114-Status: UNSURE (   7.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> +	/* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data 
> A-A-B-B-C-C */
> +	for (i = 0; i < nor->info->id_len; i++)
> +		if (buf[i * 2] != nor->info->id[i])
> +			return -EINVAL;

Still wrong. See comments on previous version.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
