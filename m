Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB814606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HhKNVc9l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nooWDX7o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NCHoja7DWry0krx4D0ojL3Muq49GtCCWP4W11T93UZ4=; b=HhKNVc9lUhMqDXuvlUFFrFfyAp
	ISqwxbcz3NpZ2vteJ9xpCPpzAwNg0Fj4jbVnJvZBv2aEbyozM45ANtAmi19Zznvxi39IQclu29bS+
	TofVfy40VNgUhiVdTxWIhccA91sHP+d664utXJF4y2kdaVunspQWH77LmAHPIp3pTLQzV1ubijNwf
	tE5s1TNO+CCvMgWfRttIbf1Y/4Axbdq90iLZpc3uDXPV96JlLMOnRnRPknwi+380CDFpJ+cTUO8D7
	88OwXnSpU3AcuOjPrgd6ZPcZHS8bj0PqcLOPydIEn+GS1NSMs3Wrg2HgDNf4DTOlnL4GIeMMq9AdK
	x0IuJjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYr4-0000000DDHT-1cku;
	Thu, 26 Nov 2026 12:45:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYr1-0000000DDGZ-3eOS
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 12:45:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2524E61CD9;
	Thu, 26 Nov 2026 12:45:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697134;
	b=lMX8PlW7bmd/JSyqlYPyQKCn//y3tldhit81O2DNH198MJH8P1Ui3f1cxilYo6Y6V5La
	 vgxBg5NeZG36xWxO3+o3fmhGjI/GZiSqn5V37cJmXltXE3IZ1tjL9HFJ2vXPFjny70Pwo
	 n9wDzeeN2he8pEesI1RqL4TcSrL5rPTbf1aXesGwvl3KqxLDbZ17yhnIYLJegxX3uH79F
	 DlqgOD4RiMhX5V6kAFXvQ6C3Tg+AbYK1Cso4WjNcQ5isfYVBkrXaYCG1F+ktzwEmbD18e
	 0y3/Q3trY8n6DK80WlJNzqbXoT6AuGBuxYqRu6wFNqdxaLwC2yvVYDSBm21kthTTbKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=vVqxi2whhnOCTfcxfrgemSevZOIyf0WhQKPJjSPzS1D0+FIXWJ2wqicJzK9my+0qpIlL
	 RzmFMd5EczfiTe5guNZJ2pkscpiNLP7X2MyFmMkUgumOlV/1ig0YNKa0w7Gz6nE1VAhID
	 nu7Xg/7vQf45ud+JEuzAxDWu7vsbm3o96SC5Yj0wFdvKHMPBQibJwPg1tRT91H2OH3wAy
	 04y7+sVIkBQYYWKHKzVNyIaUKvqV0q/HFbJR6MKy4FrmD+t33ZyalUbu/dl+rKoE9Ap5h
	 c2WG9tmHA1fJrTvmM1M9s1ExFBBXGZcRvvFqxsmwzrNV0ukbRLODSpJwMbUylZ8HZWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1A951F000CF;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697134;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nooWDX7oD45EOOfnALZ3jrdd/62pueHRvUs2wlf8NRYFCkbE/elyGZfEM4hLsE1R+
	 4RtzJQeANsJybX4/Ky2Lfp907oVHRcO8U/+mVban93G8IFEYEm1pexa6qQwN36kJzh
	 2UcRphA1P5qdUcvLnD679DcEIQCQuj4vv/uEYvxHW5IxOFyXlNccLZWbq43E4D6YM+
	 +/5BdbXQpTPVre3wkbpVFvUCsRmnt4O9ryY4LHaaSDU1FgZUut5of3XGq20BF5dERK
	 BVkKq8ModLcWrhnUDbOyWNJ8shm8zlJBPA5FpgFfjOqImv5DPDAk3L89rZhgYVEcIc
	 dehmbUCzVryNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4288C4D502;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:29 +0300
Subject: [PATCH v4 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller
 entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-b4-cs7542-nand-v4-3-38e488f6f8b1@gmail.com>
References: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
In-Reply-To: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697127; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=DX49uaJOygayTJxAeFhARcL77GaPX1PV67f788z1vIcb9VF9oumQ66FS19jV2Njpo4I8x1yuz
 emaI5aJrAXiAjOc6ZHQLopF5j4KuTgZBPZZl37PPUHDcV0ksFiP+ER3
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
