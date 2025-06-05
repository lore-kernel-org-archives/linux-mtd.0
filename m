Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B7CC5B543
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jun 2025 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y5rg4zqOVGD/fbQ3UzJp8Yix+3zIlMnVGvvyAjIDzo=; b=ZwfT8Iwrxwj6jk
	xDh+yXLwl0b/eXfojqvbTzh1jFv/ShRXFH5rAbCR1Ztdd/esoyfNS4ecodM6QMhFvstrhX0nIQy0h
	pGrRt44m27vImh0RZUmKWuibeLgRd+bSNROU+eQ8A7H22xPJwjp24N/pwllsTZrJNEmcBB2HZaStz
	9q5bGnVrWdQqDtYynawSoaa4XxiZtSo0aqpMPUQpkz0cdGT7ii6R3hseJoVIo275CfPv+CdnNW/ZN
	mqRlI1ueirhfA9H2L8obfPWMfvlUhYRNgpHFDg2dby74kroqS+cFjMy/bFx6KupfTPrxOD+oJZDIl
	UY2kcqVEU1ZWyu3OSb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEw3-0000000GDNp-3aAC;
	Thu, 05 Jun 2025 18:03:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEtq-0000000GD9v-1T6o;
	Thu, 05 Jun 2025 18:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF47D5C592A;
	Thu,  5 Jun 2025 17:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B252C4CEE7;
	Thu,  5 Jun 2025 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146468;
	bh=FFaPKo3Niu9RqMBqouhyjsr5pkbat3ko58gh0kIaygI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsISSBDmLN/LacoCwnMZjX5AwlQ7v2Rd24XpsPDo7CB7dKlFPq3TSnSLcJbXoqe9z
	 BLONc5ERjnWhh8IkPkc+EPWwo4OpF5rIWXslyj63jMMkTqwkCpbUw3S2cqFDsOYtvY
	 2CM2Vv4P8LwAtN6HwUx/HHYiTM7BuFqyBrfWCjMjSDa/cVnkD/IK+0wx+z/ECTAwMI
	 EIUgu+D3+HqTv1joPgZO+gYKRffxar6Eqttl6hOQyhmyt4RO1BDynBzoKtjduYwwQR
	 nwop7WMcExp/55hMMt/dejvUObz0mERk4Cx4e/8N8VQLRrG1gOPuuMQwcIwZXCwVGP
	 elx6AsZdDtHew==
Date: Thu, 5 Jun 2025 13:01:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, vigneshr@ti.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, richard@nod.at
Subject: Re: [PATCH v3 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
Message-ID: <174914646334.2943943.16175676311352783500.robh@kernel.org>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_110110_432662_BB4E7D14 
X-CRM114-Status: UNSURE (   6.94  )
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


On Mon, 02 Jun 2025 11:05:05 +0530, Balamanikandan Gunasundar wrote:
> Add bindings for programmable multibit error correction code controller
> (PMECC).
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt    | 61 ------------------
>  .../bindings/mtd/microchip,pmecc.yaml         | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
