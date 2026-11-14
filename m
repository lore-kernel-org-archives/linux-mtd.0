Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED068606A882
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eHbQfgQU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=gMQ9PjG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9ghfYVcAlySgilgaZD+U+v0zBcUbV9kpknM/yTTzw3Y=; b=eHbQfgQUG1otnVXXQ64/DJxzGG
	FViyaSZEMcV/zBm1sbSEoNEKazH8fg1kYJ8Db4jeX+lGQmJ9pTZbO+r1S8OFrrYBpA6RgB85N7UA1
	DEEkKUCc4AvSjmg/cbqJQ4guaqEv7L+OBrZ6q1OQjl8lw6S9Pn/TwDSPFSLh5pd3T65OsvoHEf4Kd
	60wRUpO9cOouUZm3Mz10nukZIc3fLMLQiS/86D0I2jMVoz82SfWduCQxb6arzC+sd769ZNRGiqMS5
	EFS9Vm5j7I+V43eNYOrF2NsEFVzdfJndHyY2jr6dEX+6nx80F+DiifSal1wz1Tu7ltH4g4SvZipc5
	henPvfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeK-0000000FjA6-3Yc8;
	Sat, 14 Nov 2026 10:06:20 +0000
Received: from mail.simonwunderlich.de ([23.88.38.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeH-0000000Fj6z-0iFX
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 10:06:19 +0000
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 69788FA039;
	Sat, 14 Nov 2026 11:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SJpaviNw/oXnCM78tuQ2OquVgPKd3gStpG/K/sFxuOo=;
	b=gMQ9PjG5YLBw9JzmBz9vCetBM6wqm/jF1yruFXOiX4AP6NdSNTzFJKaN7kuxP1/HG/OJQi
	XWDfVoJVAogNAm/NUFgAOVb/VivEdjL+f8YZsc+r9OMyFRToUjfHp6t1wqnFq5But2z7OT
	kHScP8nXm96hZ2pQczEP+zPhLI4UmqIdJlPOhkAzh4/2+Wb8SGHlG3sNeCN/sr7sbaeiPg
	uECt1ZDKyKJ1+LW2bGw39oyDOT4Y6iIkPYMdcYw2qRnYiwNGORGbBY1uTq0sCreS2oP+8u
	OuxuGEJizYwm5NVt3nTJO1XlVJAjkl+Mk2QlkY2ypMQaaztQucFdgEIvie0Hyw==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 0/5] mtd: maps: lantiq-flash: support boot loaders using the EBU endianness swap
Date: Sat, 14 Nov 2026 11:06:02 +0100
Message-ID: <20261114100608.3432120-1-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020617_366825_B5996D97 
X-CRM114-Status: GOOD (  13.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some Lantiq boards, like the bintec elmeg RS123 and RS353, have a boot
loader that enables the EBU's own endianness swapping for the NOR flash
chip select. lantiq-flash then fails to probe the flash. Patch 4 lets
such boards opt in to honouring that bit with a new
"lantiq,ebu-swap-check" property. The bit only works on VR9 from
revision 1.2 and on AR10, so the driver cannot rely on it on every SoC.
The property follows Hauke's review of an earlier attempt at this fix
in 2017 [1].

While porting the change from OpenWrt to mainline I noticed that
lantiq-flash dereferences a NULL pointer on probe since v6.6. Patch 1
fixes that and can go to mtd/fixes on its own. OpenWrt never ran into
it because it carries a downstream rework of the probe function.

Patch 2 documents the "lantiq,nor" binding, which was never documented,
together with the new property. Patch 3 exports ltq_ebu_membase so that
lantiq-flash still builds as a module. It would need an Acked-by from
Thomas to go through the MTD tree together with patch 4. Patch 5
renames the NOR node of the only in-tree user, danube_easy50712.dts, so
that it validates against the new binding. It is meant for the MIPS
tree and does not depend on the other patches.

The EBU swap change is used in OpenWrt on the RS123 with a 6.18 kernel,
on top of OpenWrt's reworked probe function. The series itself is
build-tested on mtd/next for XWAY (built-in and as a module) and Falcon
with W=1, the binding passes dt_binding_check and dt-check-style, and
danube_easy50712.dtb passes dtbs_check against it.

[1] https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818.html

Simon Wunderlich (5):
  mtd: maps: lantiq-flash: fix NULL pointer dereference on probe
  dt-bindings: mtd: Add lantiq,nor
  mips: lantiq: xway: sysctrl: export ltq_ebu_membase
  mtd: maps: lantiq-flash: honour the EBU's own endianness swap
  mips: lantiq: danube: rename NOR node on EASY50712 reference board

 .../devicetree/bindings/mtd/lantiq,nor.yaml   | 79 +++++++++++++++++++
 .../mips/boot/dts/lantiq/danube_easy50712.dts |  2 +-
 arch/mips/lantiq/xway/sysctrl.c               |  1 +
 drivers/mtd/maps/lantiq-flash.c               | 39 +++++++--
 4 files changed, 112 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/lantiq,nor.yaml


base-commit: 0ef71adafaa9b36a06dd5b823aebcd2fa9b9b9c2
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
