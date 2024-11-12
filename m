Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D46D32D8D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOOAtgXar4o2oKfQ4E5n2kxH/rzaC2NOomJQKc/jpNk=; b=igQYqQN7jMbNZH
	K5pdmcUPI7CaO6r3ds0ToS4a2xzpvCBbwflnq8Tif34IEkJVoj7PGfllsdyQssCbtIZu1zmjoZfKD
	Ls5s5Zr1piUv/cva7HTBcqNvHA5iwR0TWBhE17n19jj9qeoz1qy6+QyvVzNgnZuAr0qO2+I1ZQ7mT
	CSMxPnawf9VxpV3tbCn5SqUyjWEmog7B3tkRF5bdeXvMLSAJGlnL7z5VPGkEqj7nAWB2ww3iHkbGI
	+ZWpmiTTiV8bA4fXFwwWW272dr6fbJnjKjIGi3kCFlQvtpASmuR8/VkEXZIw9yhyyOpAkLiPM+TXC
	nQjZUydFxEZcIcPrGKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqbJ-00000003Umm-435z;
	Tue, 12 Nov 2024 13:06:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqY7-00000003U78-3RDb;
	Tue, 12 Nov 2024 13:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 947BFA41A60;
	Tue, 12 Nov 2024 13:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DD0C4CECD;
	Tue, 12 Nov 2024 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416594;
	bh=ECj5XhRXQ/Zst8H3AmAZiJNySS2gWUlAEVZ/YWBAayA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QpwAvlnnxlHt865i/XRmNcaI0OA4JQqJXEz5crxqmyEuz9s9SLx9HXAvvt0iAPPNT
	 YxnWrQvcL6AgHJ2BrLQ4QRcG79YChUQVSwcuOGKPwC4LKSDDF5xZa8uP3dW7l19YZ/
	 SPFQGwoJoSweQOyWofxLHWCgitcHl0/lsI5CNiR6yhW0ZJgwfyPdm1ChaJ9pMO7CVD
	 6f2FG/zprkAyXEER9zc7AG0baJ0axKilO2f+U823YiKQmqjjdYSh4hlhHZc2+lnl+K
	 B9GGTfoQFqHe4MU2wLumlDpoIFPLuADA3U3LO5KFeP/GxHbrg4/v5mPD+aoKcNiIzy
	 /hXAwMEUZ3CFg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peng.fan@oss.nxp.com,  m.felsch@pengutronix.de,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  shawnguo@kernel.org,  s.hauer@pengutronix.de,  kernel@pengutronix.de,
  festevam@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,  Peng Fan
 <peng.fan@nxp.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org> (Tudor Ambarus's
	message of "Mon, 11 Nov 2024 13:19:44 +0200")
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
Date: Tue, 12 Nov 2024 13:03:10 +0000
Message-ID: <mafs0msi47gfl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050316_152688_1F5E1982 
X-CRM114-Status: UNSURE (   5.76  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce optional vcc-supply property, SPI NOR flashes needs power supply
> to work properly. The power supply maybe software controlable per board
> design.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
