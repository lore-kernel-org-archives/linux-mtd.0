Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04824606A32C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IIjhcnWR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9znuZVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NCHoja7DWry0krx4D0ojL3Muq49GtCCWP4W11T93UZ4=; b=IIjhcnWRAOqlMfpySGOQ9dZuxA
	LrSrHunKlxeMQRWJzvvG5EvgicjCxGhxzTI1diw1d9EEiiXVDUBjJ2sKWzfU5bQaP3X43jPlmOJgS
	qneAcKqpGJf5oMycn+QbW8u5oUTVVSu+UmbEc77LPbFNI2MS6tlwSgquzAiyxXn5EWtGokO/Wy7C0
	yW0pD4BdjiaNuLTRtBgTfnDZie3ymZyzXWcFTnLa8iMqUxCGqhraZAd0mEvnvfofye3DhfFuY5seX
	AKn4cDlnZ++xi06uex+BTyfE0+C0UwqJ0uY0myvF9TjDG+vLgg9fwelACbDzb31VJCXpU8Z+8DW9G
	azqGMtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHXM-0000000AyW6-30ae;
	Wed, 25 Nov 2026 18:16:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHWw-0000000AySc-2yee
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1773B62675;
	Wed, 25 Nov 2026 18:15:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630541;
	b=FrSi4VqyvQ3peeW2ia4f0ltTA0qccsNlj5G/AvpI5HPxUKcGzLhYIE8p5EIFIysV9w0V
	 7kfa+yqSxqJjNghfZJXnc5K9YK3A6xsMBrBXK5sn972Ev/ncBw/+XTFDR9FTwIl6f0n+U
	 3vR1zPzM0drIKn//uVrtAliyl5b2WnSjZsu+MHesl+HMj7h73h0AgiVC+d+nzGP+WO32w
	 00rKjdJ2QWtpn852kdmUMo3PrKDh2Xg/QHxj9KRFFpRhpIlUJfutR/YfDBOtOTaFwBBrv
	 C7o1zJgJHmHRIYcx+IvfzAd2A9X8W/MIOEIlRdrgoTmicdOWiy4OBT8vXNARmGTAOdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630541;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=lbAj6pCnFao7yHaiIQju2N2rKHFbgC0eay4lUC2VXkDCuqUYLNXZQupC5TQYMwU4MjnA
	 NTtENxkHZOINiq7B4mBGzerpvRE1vora/Vlv7aHYrjPmqgHbT1iRiXAysdEcXi/rwJSTc
	 YMDzYpgTO0kE7yzMH8GkYsr4LotdVvTBnn1WxB/IHtQXCZ2I1r71+1IgjMAA/hfy8rrYS
	 NAWZU1tKMBhloQylP4/Ou1nqNEMh9PHFI49UdnRW1PZUtIzFFf2A7BfMfpvhn0t/zfavc
	 kkT34If9UDgE+qzS7P40IOOXwiSZ94wHKJh3PNU0bvrxgXWoTsLgegfCCDOOpBv46dA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 656B31F000D1;
	Wed, 25 Nov 2026 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630541;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n9znuZVuxJGRRUbpODpx+SjC6HjR3NacCDLEft25SkzBZFQb1wLKLZwocd+o7I9Ga
	 +CK8CJ9o3yW1rGNPksT7ZraolSFowN1NbEp+CNrRrUqgip+yumZEuxW5v5BTV1M5N9
	 N3JZ9Gu8IpWk7+2YC6emiekLYkEHlSDc3fmPMolp1DkBrZ0/Us+0T7e2w3brR6uPZO
	 8Qvyj62mcjuaY69YDPeCbSZcMsomJ0m3Akoof7fb56IWKrvNVuDb1YXogJfo9owZoY
	 IP8SMB1bCC7sQOv0wGqV5K4tO9NXwLoKZ+9AxqxlZ8Enp6s2u3PKc5Biv3XCNlWDH2
	 XS3QjUp9EYIlg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E56974CFD1;
	Wed, 25 Nov 2026 18:15:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 21:15:30 +0300
Subject: [PATCH v3 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller
 entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-b4-cs7542-nand-v3-3-0b6d141c102e@gmail.com>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
In-Reply-To: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795630527; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=HTTxtWnubcKlqAAHEifZQNnhvRKw7/xLuYWtF1TklVw+o/qGeJlfmIwTd11Q3gd3leFcZH5zq
 L3PzBZtwKXIDIwam+AXsJHEiU3U5k1qwBcOdzCBk8gVna50rzbDVGlg
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

List the binding and driver under the author maintaining the Almond+
platform support, together with the appropriate subsystem mailing list.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..2524c5d59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,13 @@ S:	Maintained
 F:	Documentation/hwmon/corsair-psu.rst
 F:	drivers/hwmon/corsair-psu.c
 
+CORTINA SYSTEMS CS7542 NAND CONTROLLER
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
+F:	drivers/mtd/nand/raw/cs752x_nand.c
+
 COUNTER SUBSYSTEM
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.53.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
