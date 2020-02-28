Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ABAC3F2D1
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 10:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88795246AF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 10:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWBGiZBZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88795246AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lRgiWdz8QC8CgeN2yqQ3e8GeOEeuNBlhDUT6bIhkxww=; b=bWBGiZBZCtjJ3Ve4OlZQ27ktXu
	3rFm9Hlygh61c4aHugUaoAbpYZaCwb8w3S+pMrqTqQ+13KBke40Fq3ld06l6oQir/uSZDLTuXmjW9
	2nZ/XleFBd5hUya7BgrwZljy0ZDrCjTg377rYlqCjDeNOY+P5G1WBg+8K0HV6IajY1jbCxIeKaKHO
	loO7pyTC35QG9VjVhz9w0413BWx5rggNLXNKP0chxF5NxBgYVuFjBPcGV56pUtcyfaZ4ARq8GYkEF
	w8mXt9Q6EA3bQw6EsxlG06FnDVpPBsPTkV4w2ZHZ7oarrvf2iHmQSPY+U+3ksZi1Cs1OWKmuGTiOP
	SfXQNDrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7cir-0001dd-Fp; Fri, 28 Feb 2020 10:18:21 +0000
Received: from lucky1.263xmail.com ([211.157.147.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7cio-0001dA-S8; Fri, 28 Feb 2020 10:18:20 +0000
Received: from localhost (unknown [192.168.167.8])
 by lucky1.263xmail.com (Postfix) with ESMTP id 555FCA1E98;
 Fri, 28 Feb 2020 18:01:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P12225T140183993132800S1582884093668539_; 
 Fri, 28 Feb 2020 18:01:49 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8bee6ba962c1f6e2ebfdeb9144fdcb05>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Yifeng Zhao <yifeng.zhao@rock-chips.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 3/3] MAINTAINERS: add maintainers to rockchip nfc
Date: Fri, 28 Feb 2020 18:01:16 +0800
Message-Id: <1582884076-27615-4-git-send-email-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1582884076-27615-1-git-send-email-yifeng.zhao@rock-chips.com>
References: <1582884076-27615-1-git-send-email-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_021819_166431_1C9B329E 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 linux-mtd@lists.infradead.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4017e6b760be..79cfad293549 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2242,6 +2242,7 @@ L:	linux-rockchip@lists.infradead.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
+F:	Documentation/devicetree/bindings/*/*rockchip*.yaml
 F:	arch/arm/boot/dts/rk3*
 F:	arch/arm/boot/dts/rv1108*
 F:	arch/arm/mach-rockchip/
@@ -2249,6 +2250,7 @@ F:	drivers/clk/rockchip/
 F:	drivers/i2c/busses/i2c-rk3x.c
 F:	drivers/*/*rockchip*
 F:	drivers/*/*/*rockchip*
+F:	drivers/*/*/*/*rockchip*
 F:	sound/soc/rockchip/
 N:	rockchip
 
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
