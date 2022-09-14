Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3164ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Sep 2022 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbvHUpyWNaHbHhfHGQaRre5K1+ky7+BhOLJ7jCyaIRo=; b=PkVMXqI6m5us9P
	sccGqhukxHLYofvOLHwq9sCIFsQqNdGNCiK3doGLzyNsQD+/0cjlcYW3KSAV3wh4+GAFlFgUXOlj9
	G+hnSCbrqU07/X9y6d7kXZhOKHzBCnR7d14FgY2tzKi21OB72dJtobZP1ojXn3zxDcWUS3V+V/vsS
	qRy7mQBK5xmpXA8zNXHPpP7IjOtwO6ohJ3nMO6RXcoxY4fQALNxGx0+JcvAqm/m9GocaUS9YyxEVQ
	fSrPd8hav+bDNlFQILnD4KCHEQZYepMXV+DqOGKtGZd5C6or+vsUm5XF1LQec4RfVf5XYsSlfFu4J
	G8BpJHrwvYFqEVQwnHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOND-00Dudd-8c; Wed, 14 Sep 2022 09:07:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYO8V-00Dj3k-2B; Wed, 14 Sep 2022 08:52:50 +0000
Received: from [89.101.193.68] (helo=phil.sntech)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYO8L-0004ae-5u; Wed, 14 Sep 2022 10:52:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>,
	kever.yang@rock-chips.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	vkoul@kernel.org,
	vigneshr@ti.com,
	linux@roeck-us.net,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	u.kleine-koenig@pengutronix.de,
	linux-mtd@lists.infradead.org,
	zhangqing@rock-chips.com,
	linux-pwm@vger.kernel.org,
	jamie@jamieiles.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-spi@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	sjg@chromium.org,
	philipp.tomsich@vrull.eu,
	kishon@ti.com,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	robh+dt@kernel.org,
	linux-mmc@vger.kernel.org,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com
Subject: Re: (subset) [PATCH v1 01/11] dt-bindings: serial: rockchip: add rockchip,rk3128-uart
Date: Wed, 14 Sep 2022 10:52:33 +0200
Message-Id: <166314554237.197444.11513118217413767473.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015247_162593_3905D6D3 
X-CRM114-Status: UNSURE (   5.55  )
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

On Sat, 10 Sep 2022 00:01:28 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.

Applied, thanks!

[08/11] dt-bindings: arm: rockchip: pmu: add rockchip,rk3128-pmu
        commit: 9c2f4521344f3b14fa0be050100ef726edc36cbc
[10/11] dt-bindings: soc: rockchip: grf: add rockchip,rk3128-grf
        commit: adc4f190260a6c004f950992d8c9ee3aec8da38b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
