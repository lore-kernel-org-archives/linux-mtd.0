Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A944606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5YuJ8ED;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2KDkHp6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NCHoja7DWry0krx4D0ojL3Muq49GtCCWP4W11T93UZ4=; b=p5YuJ8EDoZrE6hwgXqbXfepDQy
	E2oVeRDVytksNrXc8EswxScGAGtjTFdB7EhhdYLA+LoE2XSSCQKeG7UEl2E8GVfgznLa/B7Fz9oVX
	m1yv+qC8J9okS2T0KGOgPjxA1/uZDd4iNIUdH7qabsy8Wn7Zx96Q+eq0GZP4yAIGu1vFVbcQlP4ed
	l4Z8+wOdTQqmIoJEuucLIg++eVE1yWf2fKyzYAANCJbC4xZe8S5K4TVbl0/ujabPrCejWUnmH4PvN
	7NTUNEgrYf1Vx9xhx67F4QfVk7Clf++J9Uo1qwFgbSGHBmj690UPW/g9R6jnhALB0GNe//pzTepxD
	fXh+yJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzx-00000004X4P-3rTD;
	Mon, 23 Nov 2026 18:42:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzO-00000004WY4-1caZ
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26A5545ABC;
	Mon, 23 Nov 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459326;
	b=xrw2FOdgcBGAYq9LRxvoJvGh+VQcok3LOObBmvFwDvUcwOqIuXzaqV0lBFQco5eu6kOv
	 XkS1MrGWENA2j61o2hCkUmn2CtCNz8noGucoajd98j9KskORcuSF48eoNDvt29f/DnFxj
	 DavBQrsCy3Qa2E9QXOF1hHN5trYMo4v2/7dVQ8SsMM7M4DdPbJV4mPUqwGpNcHXXuDWVs
	 SnG3NCGQPagIDywW4HjOKZqqBQBkB6It1svtreLwKQH3nUYiXjM6/ztQ7iniKdOwUutDN
	 TF8jsPVd8IcKF3hvBop7kKymYh3gYUkGjNe30ViqG5XCT4Apjx/L4H8b4YABN0+qnBw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459326;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=SgyJnX9wVEhzXAiTBarvx21079xqyjPkvrvwfOG5DSdxis9l/WXb+8bv55mYXzCBuyfS
	 gKf+B0xe+uaIT4lnlMXn56ZRZRk2Ug9D3AIhNUbogFE4G6Nd9osIOcr3OP21W3XJvv6qo
	 bXMrG/EKNjgYPkghI74ZoQfigfSO6iPTAMMBbeN+eTBUjp2iq1fom/HJJvm0ysp8eNmEl
	 HTF754FsHypsiRiqxuJid1aKV6E4PELAX9HkGnmX9bUqt5g0LzVUCy5zyLIWNy/2Llxed
	 CuNRobzKYZKNKqQQfSMbCUlKXeyrOt0/6R4hcjumNVskl4Z7vV/mcaEvQtlLXVi/o/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A38A1F01567;
	Mon, 23 Nov 2026 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459326;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R2KDkHp6UDvFcp9vCumjVNLRE3Wuu6mYGdcDs2EpPrJgKUr9359+XSEN/NODdREGN
	 Z15l+8yjVQ37Ju7xKqu3WhhhP3XmfXPUDdo1ih3Qo/zMIb5DvK5dfWIJu1iQHuojBK
	 vG8o+fTAZo6eBvzuyAQbkZvkyt1ktx2I72JfjHRaJohc/FCWFK9f5bHFdf4m1zxSVP
	 ZUAI28hGdfc9WFsCKLWQUnT14UNaOUATqFCcmwWMQJwHwVyjPEzvst5eZOFWtVyIUQ
	 DNc+CwScQLau5C9JFA7NYz3enRbp0SzU0zB9x5OMKdWDfSEHe+BsIs5I6L0X8tLI5d
	 lgjLJcun+OHmQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0528C4C5E9;
	Mon, 23 Nov 2026 18:41:40 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:40 +0300
Subject: [PATCH 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-b4-cs7542-nand-v1-3-7ce179c011e2@gmail.com>
References: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459297; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=mBneeyMc/WvMN34g+7Ai3fW+4kjQbVhjd5Nxjke/IPKDrD3crdoEUTW0MIqVkLtbcecH5s7dk
 IAtOqxaZE2NBloyx7YW/JBB1sm7Fczbb4xuLz2GxeMJ7xb6gwUEqnGE
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
