Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C01C388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66407223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUnMdflD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pAZZi3Ut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66407223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S5TqW60HrxSUA2zXluHY8E1gHaq+/UShAFvOrCsdgpo=; b=dUnMdflDqzlnT2CCXNPmlTsG7
	093ZNo+YOfEmhsDFBFEPC0dOxaj28mvhBNiefYWkL2x6mukn6KCscKnriklCB3wlgKFhOScksDSv8
	r/4mfdEgdJIygbil5uqYXtKIvC4k6n3+tdBwqqizdPkveKMugOGVt0TqVt1AOYvMm6yDsYAVC6YHQ
	b2yMEq7bFcgvYFpx1L0j2YQcQfh1olOF52xga3ftSR02lVNfJnPFU5DydF+Mpd5RseUBard304BDi
	ZNQsTe0tHsuQA5AmA/pSuMWe8sK4qL1/g1eTMP9xLchXVp6BSeEUkDp/V6KN5NxghGAR3REpyAnm1
	6M7HL29Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYPo-0001vA-KN; Mon, 02 Nov 2020 11:54:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPe-0001qs-6r
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id g12so14219902wrp.10
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PVJkW4LmyroUVjovOSWNFjSdGZNlIx0pxp8qFDF0ggw=;
 b=pAZZi3Uta7aFzWrgyCL6bbcYbkm9xVJ+7qQhl47RDvzTK3qvcR//TqO3RF2QKTYUSh
 MLCd7sso9gBkagrfQyXpGcm+Eqs8Z0lCu6OuIi3EDB1NDgNWpW1lrumQKcEkYMoe2+ls
 81xA9AWIFf7KAqxJ/VDxMWEkTHh+2uZkt6ktOBiDyk/DqqU1I2V0cE3WvQLt1WxzCH7d
 AT8XOYQD6Vs1uaJED/RTgZPT/7D3gDzYxhMiz1ewaFIn7F14f8bas1ODWRfDzByUoyCJ
 LM08lMsIGEQYS2tfvkiShP+jspynsO43xg8EjnF1XCHHPm5aIkIUt2y999UgRCsIlIgq
 3yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PVJkW4LmyroUVjovOSWNFjSdGZNlIx0pxp8qFDF0ggw=;
 b=SPhfR1EtTScOSjqmX721qxCJRsDBZJw+9BD+M6bixFxrmlWhrIKpXLwL1fjcHLvfVG
 4Xd2x8b6sc7hHBLdqx8YjQ4uR0urfjg5mofJ9eSS9Sriv/cQTg4BOYGx0RWdGLx/OWiE
 WYbV2RpTvSyB9zuedXk7lfj1PmojoqLzRApOzyIL+hm6/2G/l1PTgaYmoUBp75rIEmzM
 YOPNhGM/3yIrB7cXronfcnAmVX21nAVTgPQjEH7wLcfaNCvUaF3GE1HKKtED25PczsNH
 TBZ9xHbDIsXXrZiBvjqcL7egUQawWIUWhOdGTu0JjbO5vvGoAFywzhQU4KyMsz+NYOkD
 GPUA==
X-Gm-Message-State: AOAM530fp1PLUy5Gq7SRH5P7peAmX7fSVlQpxIFsWRhUc9nRgXqHtvzq
 UGKsdNliyWU4QyGO3Ba2GV9CZg==
X-Google-Smtp-Source: ABdhPJxfFP8oliMR6cPqZdYxfpBor8n3wV4rDuQzSLtZBeYIk6dWnLH46B9Z8j1GarQB0Wh806pqiQ==
X-Received: by 2002:a5d:4d0a:: with SMTP id z10mr14004647wrt.244.1604318053338; 
 Mon, 02 Nov 2020 03:54:13 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 02/23] mtd: devices: phram: File headers are not good
 candidates for kernel-doc
Date: Mon,  2 Nov 2020 11:53:45 +0000
Message-Id: <20201102115406.1074327-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065414_459419_9061648A 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Richard Weinberger <richard@nod.at>, Joern Engel <joern@lazybastard.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Jochen=20Sch=C3=A4uble?= <psionic@psionic.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9tdGQvZGV2aWNlcy9waHJhbS5jOjE5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdmbXQnIG5vdCBkZXNjcmliZWQgaW4gJ3ByX2ZtdCcKCkNjOiBKb2VybiBFbmdlbCA8
am9lcm5AbGF6eWJhc3RhcmQub3JnPgpDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CkNjOiBW
aWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+CkNjOiAiSm9jaGVuIFNjaMOkdWJs
ZSIgPHBzaW9uaWNAcHNpb25pYy5kZT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9tdGQvZGV2aWNlcy9waHJhbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9w
aHJhbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCmluZGV4IDA4N2I1ZTg2ZDFiZmIu
LjllNGQ2MGJkNDI3ZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwor
KysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKQEAgLTEsNSArMSw1IEBACiAvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Ci0vKioKKy8qCiAgKiBDb3B5cmlnaHQg
KGMpID8/Pz8JCUpvY2hlbiBTY2jDpHVibGUgPHBzaW9uaWNAcHNpb25pYy5kZT4KICAqIENvcHly
aWdodCAoYykgMjAwMy0yMDA0CUpvZXJuIEVuZ2VsIDxqb2VybkB3aC5maC13ZWRlbC5kZT4KICAq
Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
