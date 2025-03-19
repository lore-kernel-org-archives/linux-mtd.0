Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A36C35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 23:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKGb4F1xtfzvq03PSOU1Z3yk4Mxob6ukkDh5I2nl+F4=; b=uJY+f9xG8JUl+9
	Vh0HAGq+NiZ6nn500+xOgEnpReKqx00TreOTfihse1XeyChozFLd/bSJUEe3238uNrxgkkYoiJGIt
	E0ib7wA6kveGXeBnkz1Q0DiR37RJmwd4p9HyvW9aElSNd23bmqOd0UPBwR3eC6dP2+NPa5vgrWg6d
	PbV+ESzTB8PQKfuUps5m8DB3ziU36ql6/7lSJGfdbamIk3q3baBYkMwfTOR7Itlw60aEhAoSe9grc
	PKoubDXnxsCjMsLGObB2T0ceoTroudy1GlY/MY8UPIBCVI3CNxX11BJTPZ8RJrTbOcT3yGk+OqWM6
	escaXpgLLrfOdd3x/Qbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2sp-0000000ATIa-2kV3;
	Wed, 19 Mar 2025 23:31:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2rj-0000000ASye-2Iue
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 23:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6476468314;
	Wed, 19 Mar 2025 23:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231C5C4CEE4;
	Wed, 19 Mar 2025 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742427025;
	bh=OMKglMOygBYF+GG2fB4Gz4YtFSBhCmTJHwE7Jwd+DPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8aMbSk6gk0jUPfw0KamMBrUIQAlPfmzC0Wrh9KojGMEy3e+Bb5vLcGRoeHIStYKI
	 xPSVrZ70gq2E7N8Cg0TrSy8YipjQMmcC3j4R8vBpbDFJIO7xRS/E10ScszoFE0U2L5
	 WY9nmFrlByE+J1JCk0thE5kI9yILDh7VytYqpCbdXfi1jZ6wDh+jK7OAlBgh4gK0TE
	 mHZa9CmOd/4wEcapKDv95Ka7Jy7FPTUmNwLmCm1q7Qo9iWb1k9y0G8KRDT+zFiTJRB
	 dXMocwHJTnSAzSA6+6mamUAt5BJLRj4OXYR+mt0XFejo6srOk0deA8VXo1x5FYFQMi
	 OmpFuDuFxSrYw==
Date: Wed, 19 Mar 2025 18:30:24 -0500
From: Rob Herring <robh@kernel.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bacem Daassi <Bacem.Daassi@infineon.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
Message-ID: <20250319233024.GA2625856-robh@kernel.org>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
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

On Wed, Mar 19, 2025 at 06:47:44PM +0900, Takahiro Kuwano wrote:
> There are infineon flashes [1] that require 8 dummy cycles for the
> 1-1-1 Read ID command. Since the command is not covered by JESD216
> or any other standard, get the number of dummy cycles from DT and use
> them to correctly identify the flash.

If Read ID fails, then couldn't you just retry with dummy cycles? Or 
would unconditionally adding dummy cycles adversely affect other chips?

Otherwise, add a specific compatible to imply this requirement. Adding 
quirk properties doesn't scale.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
