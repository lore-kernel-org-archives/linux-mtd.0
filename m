Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A2FC54E41
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGEjfy7QLDIQFl2yVPY/nL4BjChTGmyjPdDb0b4jyGU=; b=jvbRNGzATg8rlt
	+R0Vud8KiwUyCVxiwvntaO+r9sZzJI9CrjW32E+0NvSqMk04bVKqQriCLwyIq+zyoWNwdbLJxo9E1
	wPcb/KbObjyzsRFU09I/7GfFnKbjNMRfxnA2uvR7mRkMPx9KhuHJqo4UCszQZtZob2h3BmGmAhcC9
	DIUVnSbIYSGyfJL126/HmzOKcJEjbHmmc0gQKWLR146q9k79dRwbg+l1eccQ7mUbXfktGj7PbrSOl
	IplV0N00pW6l9w8g0YHrYIdRKBpi7hE5pk/n8YOW9kcG0mt6CLjf3oOKED9XU+hnOaLykS9l0sZST
	mYGLFt8CzCcgjNgaswOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebXz-00000000xzj-0gMp;
	Mon, 26 Feb 2024 14:01:35 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTF-0000000098P-29mD;
	Mon, 26 Feb 2024 10:44:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8AC8240003;
	Mon, 26 Feb 2024 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HtJbw8drebThVn+++F6e1cdtMET0CoLNh6oFq9m0eQw=;
	b=Vt8SWyJzgk6IKZnzFORX4BEe5ryE1AkAm+FY/06nKZsWKYs8/Sg8xziXPSQPXUpiHBiIrY
	p4wS+HHnJnSSY3rYB/b3Vefc0cmaIUS+MjKCM8AfjXOscjMhFd4fSq+/K/h5dszmxu1vE1
	I0+8IoMNY2pGUexKXjrlKBzifLZBtHfnRXpL88qsVkTDZI4K/FCMd52FTMq6cAIoPrXl7a
	zXDmEoowyLQo8U8/Mk5MGEhgYsRmBor38BGPsK3yvMkGTMC5HVhjKUej58KSI7ODE7uinE
	RVtiYBAKxXg1IbfjJc/SkO+DsBVMKUiFaYE9X8r2Tzvrch8jiKLqyII5zrwkqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 04/13] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Date: Mon, 26 Feb 2024 11:44:26 +0100
Message-Id: <20240226104426.489713-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-5-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'59e8c2e011160551124df919c5bd8689760dcea1'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024432_522410_49E2CB6A 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, 2024-02-23 at 03:47:49 UTC, William Zhang wrote:
> Update the descriptions to reflect different families of broadband SoC and
> use the general name bcmbca for ARM based SoC.
> 
> Remove the requirement of interrupts property to reflect the driver
> code and only require interrupt-names when interrupts property present.
> 
> Also add myself to the list of maintainers.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
