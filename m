Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C7C5AD49
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQUVxnomulFQCNUObHrwMvwnFiHeXvqkhFR53E6EIoQ=; b=mnSin25ZGhiQMz
	vV6bjfxWbuiRnLpVQza7Tdwganj0uU+jEHNSj+MeWr2jyTFSvZVKIi2ZdH8REHqI0e/IipnGg9ZXi
	Vcc05Plh+fVnyt+tAtPKz7wRWcd8oRd4fUcQSkKn2SuBTib66X0Eflx1ssWSVEjTWJ3tHYZM5M4JX
	yX67aVCEcqzyPS2Ir6DLjDsRreHXhKP/5OXBF75ZCyWOgimwHRUr7Q0hXEKLIINwfPPNr/04UPiE5
	FSgPwjSPa9t8kCG132cSzz8iroYHUGbTz4uyCxAhwhjA0783iKSsoRKM9TG1H0rYE8EBiJtQPLIwl
	VeBJmWewP6jMFCdmKl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwxZ-0000000B8Tf-1X2W;
	Tue, 27 May 2025 16:15:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwve-0000000B81C-2sAb
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 16:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95DAD5C104A;
	Tue, 27 May 2025 16:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2DEC4CEEB;
	Tue, 27 May 2025 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748362405;
	bh=+rOhBA3MDB0wclaiXc132kW6TF3NIYNXXbvmM/76Yu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gCM4Afd7hOao43lcgZKa5wIrqBtufzW6FH4r94YSR+xFhMj2+EW0AERgnc5R8R5DE
	 r9KH2tPwU8ZeIJ6I0/UxA9R1Z0FsmJA0R77pWJk8FZ333XU+SJkQDFMZW4WRp3fWa4
	 /e0rpZxTsYxRQlBRE6+B2CLzgB9+1io/WelunIbc+kNl+e+GiQuRdkqIhzYuTTIO3i
	 P5mjSBjLKovKN/OU1uVQDt9r+DRyHlM89pSXCc+gCyCiYMBEBkwLCrMaVtqVoYgYLC
	 Z+R8UVtFkBkxV6o4Z3pKq1jqWt9/JtAWvayCUjGzOSGMHMmYpUT2umT/Vhmmvbz4ks
	 1R1G5eZulcb2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org (open list:SPI NOR
 SUBSYSTEM),  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS),  linux-kernel@vger.kernel.org (open
 list),  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
In-Reply-To: <20250523155258.546003-1-Frank.Li@nxp.com>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
Date: Tue, 27 May 2025 18:13:22 +0200
Message-ID: <mafs0r00arpzx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_091326_766265_737EAEB2 
X-CRM114-Status: UNSURE (   7.93  )
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

On Fri, May 23 2025, Frank Li wrote:

> Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
>     failed to match any schema with compatible: ['atmel,at26df081a']

Is there any problem with setting the compatible to "jedec,spi-nor" in
the DTS instead? If not, it would better to do that instead.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
