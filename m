Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D168C433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2419B610C7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2419B610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cj8RdzQQTbwM+po6GpyXd5no9DaMWZYB1jenvw8rf/E=; b=Rk/AQqolNAQoCCBQh3C02gxfj
	KK2tETnU0ECWtwMaaTmlHITcrfafnnSh79Jq8xBa+wQdEYx5fkQ/0g8iEhcjxP2RMRYcHxQX+Uot/
	6lFgHcd5847Ox81699ZMn9TTPvgYzjbkg2UcSC+OayCfIEiOo1iE33+PBSpu1jRzCX7QONdgVtMLt
	E+JAOokeygxZquhZIw3sFgfD2uJ2wiuhqSMrILrjC13VBPvBoVUuJlbAk7GP8t2WvUDj1/7XbVT7U
	ljwpJaiNYF9vAT5OA6jgqN05RaO5XlepNnGMF5aqDyPFRMFZW+nmW2GBhCyl0lpoqoyYiUcBWUZgB
	S1JTdM3Ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYFGB-008eLo-US; Sun, 18 Apr 2021 21:47:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFY-008eHF-QA
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 21:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BSbzocSJtqcRqnD11Rk162GVrrcMEkMuItGwLungsBg=; b=o1O1AGF/GENZknkzD5xmpyn7ZF
 9Coz3o7YslwMbaLYjQ8yEy4GZuw9zV2BjJdl+8rtAt7bJDD6zKq0i/cKz/FSVRSvHiW8DEq35vl+N
 3Wg1RPLVT1oLlKJZx8KNAaucvzujFGGUDKbyxjkXmY5qGpazKj3fx4vhMn0BBsLiIeuo61MZLY1Sb
 /T2LErIYXS7k+PtiyBHKixCI5k4J+DLD7jHNyZNaFqPPlfBAgD1zaQ2jGiQX8PJuRvh8Q0dz1QIgP
 AFMI1eXKjzPyGrGizSYBNwzMX/FaE/fe3Usmbd6peYQTsSRqMrFfnqI6aluYibbg5r5ex/bMCsD5s
 6qJBS2NQ==;
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFT-00Ai3i-5C
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 21:46:39 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4FNk6W4JDvzQjxP;
 Sun, 18 Apr 2021 23:46:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618782385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSbzocSJtqcRqnD11Rk162GVrrcMEkMuItGwLungsBg=;
 b=AXsxauBtoib6ldGrT0Ek4ra/si98FcirSHTRgF2mlWSmlrHGm0kp9fNTtK9pSFCDFv8w6W
 YBC6L9hKLJAXReZHZyp7cTstNs7hsSAUnoATiM136HidTy7GYMJuZPkc/rdA/BXhV75WOu
 5JzO2h2wtxs1wJK4hP/NIOU4QEmVw3OXTIZVIhzuT7ilIc7FZduPha95KPfhQlBDc54tgd
 0OL4GPrnEW+EdHG85Muys2+dVKgGQ+TxJ9tFRVRrIIQqGcJ+yhjpmdTiiVnnI0ad5hYgdN
 1FLHS/E8aZYvriuvOSDxugqbZsZwNsVGU7oeEQaB4OSLbTBeGLn5pe1e83XpSg==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id i_vWG_u9kSIV; Sun, 18 Apr 2021 23:46:24 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 1/3] dt-bindings: mtd: brcm,trx: Add brcm,trx-magic
Date: Sun, 18 Apr 2021 23:46:14 +0200
Message-Id: <20210418214616.239574-2-hauke@hauke-m.de>
In-Reply-To: <20210418214616.239574-1-hauke@hauke-m.de>
References: <20210418214616.239574-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.12 / 15.00 / 15.00
X-Rspamd-Queue-Id: 95C3B17FA
X-Rspamd-UID: 2c6a5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_144635_369368_0F700BD8 
X-CRM114-Status: UNSURE (   7.79  )
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

This adds the description of an additional property which allows to
specify a custom partition parser magic to detect a trx partition.
Buffalo has multiple device which are using the trx format, but with
different magic values.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 .../devicetree/bindings/mtd/partitions/brcm,trx.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
index b677147ca4e1..c2175d3c82ec 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
@@ -28,6 +28,11 @@ detected by a software parsing TRX header.
 Required properties:
 - compatible : (required) must be "brcm,trx"
 
+Optional properties:
+
+- brcm,trx-magic: TRX magic, if it is different from the default magic
+		  0x30524448 as a u32.
+
 Example:
 
 flash@0 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
