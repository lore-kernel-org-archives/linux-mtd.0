Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61019FD2D78
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cC7xjfAEn5IsE3DwWr+9kOBgUuGg33idsWvQWUd1ikE=; b=juevI3y5HuD5gy
	qJYFgxCSG6789DQdMRsYsTzMtgZxFSGS3PivJ9VkaPxhFKsDMtAplikbywx+qU9+DKBxrS4/HBh7X
	2PkPMr9Z8josydNSakKNXOH4bmmQV+r7ap3J9xbnbJuhUxFxEZw3mTx6Eau9vhQUWMaJr96weW2KK
	o9PdeWSJlC79WguTUobdqQIQfQqd3pgJB80Iziy7by0ad1nZPd89BnXGpSCx5yJEGs7i+tPYpTrmu
	epuBk0ZzBNVyigmUg++NGFvbV5gdyEn1zOy2EuxaT5YbAq1QeN9Idt3Y6VzpiEfBcjiWXUlKtoCm9
	xMurS/i4aUYmItAWZ7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvii-00000009ODQ-03k1;
	Tue, 10 Mar 2026 11:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgj-00000009Kna-2axN;
	Tue, 10 Mar 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CMAEotzjl80q/k3AHUpFdsqecrdK0X6tjqiBMW6zbGo=; b=aY7kUwner0/lRi0Wwv5i8g2Fpa
	C+lp5ZrIZp0yatatBQ5dm+19Kt4ms0T9IFi3oGXugYGjjWjoV6QmQ0zi1iyQ6HfxLvWjsidHMpd86
	9FBEmudD8dwI0lT5eMR72883LBBLq1iGGnDcjqM1CdlMHqsyKA86XR9yz6yT3NbLEYOOndaJkizIc
	L9Pu6IM3l9rStDBD6tqA2hsCiZ/Wg2oiAgyZ7zb0WLmso32ra2W6iXRRfTcreywzelZjJSnv8vgY4
	zj83e7J7ZsdxNciKNmEjPjCCF48swXrLkXXu0bho3CtigywOJLbBhr2YukwHm/Zht23Wbu3bfCmUz
	LYnAWaxg==;
Received: from mail.avm.de ([212.42.244.120])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-0000000EQ7U-3yMP;
	Tue, 10 Mar 2026 11:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143726; bh=g4FFdRUzUDur+rKeacaiCQZ+hQh7tI9Z6NjRyFnQc8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rRX3stPQMInmxRJPEzximgG0zMf53EmXskDxqUtsKeYEkVQ/dYQttdiJ1RwUnbcpz
	 vUIyMp9GJewHbVUEmLcfea/7Tczz6UnxZqIBZpZCQjil3jUyfWJvjrL+lRSOeW+TzV
	 m1ne+0b2SGo4W3cNeV9kwvYwa/se7AsaBn9ffb+U=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-b734-7f0000032729-7f000001c092-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:05 +0100
Subject: [PATCH 39/61] irqchip: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-39-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=g4FFdRUzUDur+rKeacaiCQZ+hQh7tI9Z6NjRyFnQc8w=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZajgCYubaE210ybXd9Qufza8n+eFtBCfTFO
 oQVV6kxanqJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGWgAKCRA0LQZT0ays
 28ISB/9piM+RbVSziEng1t7dun6orhPWKQV9naYfNjFW3SarwsnzmnBDz0nuaGgkwHFCge92/YT
 C6PE2tX58vKdugSVIB0D9NRq5gq4thjVq3D0H2GAQlza/oKxurc4wdXC5dXInbYl5OUB2w09WQy
 fMKAkwG0m3WFPKRgizEtCKM6l/9q3B4q2rnnpcRKQx0iNvhf+dUkY5BUPSwCcfQvJK7+4PoC/ZE
 ddAoJcpror4/MCI0j47/BVNaHIB5K9WykFVMhov3BZvNavqXT9C64hKXxD2btf1UcwShvWKloSd
 PxNXkra2HopfIdMjPOY9w4hG57NjkAcqg0vkRHvvtwjYvgsZ
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-DB5DFA3D-FD67F9DA/0/0
X-purgate-type: clean
X-purgate-size: 1799
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115540_972387_F89EBE60 
X-CRM114-Status: GOOD (  12.41  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
To: Gregory Clement <gregory.clement@bootlin.com>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/irqchip/irq-gic-v3.c     | 2 +-
 drivers/irqchip/irq-mvebu-odmi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab22faf722dd2b24faf96af636a4bbd..6dc9827357a21ae05dd838fb717871c73f3c7562 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2252,7 +2252,7 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 
 out_unmap_rdist:
 	for (i = 0; i < nr_redist_regions; i++)
-		if (rdist_regs[i].redist_base && !IS_ERR(rdist_regs[i].redist_base))
+		if (!IS_ERR_OR_NULL(rdist_regs[i].redist_base))
 			iounmap(rdist_regs[i].redist_base);
 	kfree(rdist_regs);
 out_unmap_dist:
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index b99ab9dcc14b3ba982876cf5525499d02bc1c997..94e7eda46e81833cfe0479b6fabba715bf4ef6b8 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -217,7 +217,7 @@ static int __init mvebu_odmi_init(struct device_node *node,
 	for (i = 0; i < odmis_count; i++) {
 		struct odmi_data *odmi = &odmis[i];
 
-		if (odmi->base && !IS_ERR(odmi->base))
+		if (!IS_ERR_OR_NULL(odmi->base))
 			iounmap(odmis[i].base);
 	}
 	bitmap_free(odmis_bm);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
