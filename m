Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBF4FF885A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2026 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnwK7mcLzy8Iu6VQcugVki8Bm/FEvlEc3psNRXqt94Y=; b=s2NhpQtZmc1l9C
	lkNI75ejOy6ZMU2X+8lNNwVOPWU9g+3QeCizbVEf3Ne91K60RKCJqh8oYmTe3xARnxHgfyT1CagOm
	HXJN1fGwQgSl5JNESL2t/TTHxNN+4SHa7uBT7fw3a0ZwtFVCI+3F4VmIBMvk3wXvJVFErhCVE9HnQ
	jOihH/ALne+F3qPxwlFPCww98xSQ4zEliI5DKalBbH6JSUwKryRYaZX5kfVKmEWJu1jRkftuxjqqU
	1bDlzQCbNv757J/7N4Jd9uP/kswY8c22Bzah75SJYgkZqS+7vtIvvM1rpvGSWIVK1pLQbkQna3asG
	VHAw0GoXpU4RUH7wj1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxOr-0000000DtWq-0gYd;
	Mon, 04 May 2026 17:48:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxOp-0000000DtWZ-3hpZ;
	Mon, 04 May 2026 17:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F292B60121;
	Mon,  4 May 2026 17:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AB1C2BCB8;
	Mon,  4 May 2026 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916886;
	bh=/3g7lvlSwRiq70E1vvvgAFrlVJw6GAXpNdIwVjWsoCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JbnXedo3AK7ZISss5kOZ3g5EbeApjZuXQG5TjqviDvYOVWcFEITaivXCPdUcJXUuP
	 MgINhIUGbSJRnZ1C6N3og8G2fLhnSrGKa1l580WoVid1YF8CzsB1TtJwpJq0r7+xZP
	 rkJrfNbcRnKFFja0Brj2p/+K+7aTHg0tFaSehxorBvxDoKl1neEA5RHb+msEDV5wHa
	 3EFuDAEcIHJpjkjj8/V2DtNz788Xqn1JOVcZ7EJo4sYL6cfwhx5vcpCt6brSxCw1EZ
	 m7ytF6Lf/0V7+BWZ5C1EaVkz+cNXdiMoCqWdupFtqFYzO5bKztSZp0vlv8z/l6iusr
	 CMkbENVomJRkg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Alexander Dahl <ada@thorsis.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd@lists.infradead.org, stable@vger.kernel.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 "Rob Herring (Arm)" <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260429125930.844790-1-ada@thorsis.com>
References: <20260429125930.844790-1-ada@thorsis.com>
Subject: Re: [PATCH] memory: atmel-ebi: Allow deferred probing
Message-Id: <177791688430.723206.2269403194221624148.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
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


On Wed, 29 Apr 2026 14:59:30 +0200, Alexander Dahl wrote:
> After removing of_platform_default_populate() calls the atmel-ebi driver
> was affected by deferred probing.  platform_driver_probe() is
> incompatible with deferred probing.  This led to atmel-ebi driver
> eventually not being probed on at91 sam9x60-curiosity and other sam9x60
> based boards.  Subsequently the nand-controller driver (nand-controller
> being a child node of ebi) on that platform was not probed and thus raw
> NAND flash was inaccessible, preventing devices to boot with rootfs on
> raw NAND flash (e.g. with UBI/UBIFS).
> 
> [...]

Applied, thanks!

[1/1] memory: atmel-ebi: Allow deferred probing
      https://git.kernel.org/krzk/linux-mem-ctrl/c/754d60ad1c91895be0bc7d771fbf9fb3c9448640

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
