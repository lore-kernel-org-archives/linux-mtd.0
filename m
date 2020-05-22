Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B25C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:25:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4E3207F9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Co4/9qqp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oATR3FF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D4E3207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpgcbuutkkHz7ZPjYieRK5kROHpIQc5NHh0lnZi9VQc=; b=Co4/9qqpy0thCZ
	DM6xPcve3RRCBdnWTuhDH9UsugJM7ZhRMyB/Szp1WJ+dMGIJ/zVwUp5EcHxuDn+QF3hyqmCnwSE5T
	lfPFfv5HvuTVotBi4ANSYw1lOqNztzHXC6E0bKBKUARTNAJScpUJK0HdW1FJ7WipdED7sPcDC3rAf
	Cc+fEs+qIjhXYl8bylIinhU/8UNAozbzDSbDkRGCh+zwRRdgRY/fDICbtqYWAzohZirBRTxZuOqD4
	XLBa+Y+ymBcLAF1RXkMDnr9A0aNLIvtzCVI7zIBAkCT10sGXDbluFTjfFeeHgV+TLW7F/6UIyJj7U
	xG3rXGfEyB6nOD00dPEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc23h-00060Z-2m; Fri, 22 May 2020 07:25:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc23e-0005zO-MY
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 07:25:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id f13so7711202wmc.5
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 00:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZLZqiPmSDvovjhwGm4w627YXSjaGWbzcz2M2rVZdomQ=;
 b=oATR3FF6mh22GdA5Shgwzt7kSFsqqxk32t2cCBJuGQZUet9G3vkl+fJD6Eg5tKiK70
 lLKjarlUi1zCwgNx+s04jZ8UJkc1xGzejYUMsUbh/edZONvt9eSiqFrz7YBmeAItHsvE
 yo0pnKdrth0FO0mK/b/bgT7jAQG8J79ezXVlZHZO6JVu1aMv4HLixbeTKUuHeKpg6D5v
 YUoWbhjRLUin+sGsfwIfmmASbyr0xTSFJVOwPLiuhwJm4x8EPOiFf/UV44jvlaG5SagS
 8Ac+YtQLVgC5Hi5uM24l6/v57CoflPE/RSiNBaJyMS5MxyA7A5LsMzUHRFqdpI4a0OYl
 wBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZLZqiPmSDvovjhwGm4w627YXSjaGWbzcz2M2rVZdomQ=;
 b=hq18mslurJuAliRUYhjfa1panYGH+Rvhi6dyABe1r28byAx39a2lT8itGPxcY/UM//
 TMw2sbfwaJy8piGBBYg9OqBmcD3wLyKHE9kqtxzq7/aNCEy2S8D+kI6L1wUFMr63D3a5
 AHYmTpep+hhPePQ1fQXQDALSJyaZkxavErF9tgyaQGGz6rqc1gr3EkbR7ckyqrfdzh5B
 euuFxqIc6SXIGnW9Hbzowl6yxAy6fk390UMO5bgj+PwfED0tC5Z9KIqaep9SsRJcHKt8
 pvCcKmIqMrmiwntI699T1XsuDkJ8eJ+KoYv3P4AnDeyqaPFpY8FUJgg/rgEQL0HMFz7D
 Fn7A==
X-Gm-Message-State: AOAM530QOaOLVlK3cRbIqVJhHPlTIvTfu3RWkTx50CIlH4a7rlYNYydW
 bBq9PtOqqJ2MZYQrgi1s+Yw=
X-Google-Smtp-Source: ABdhPJwu42LmV04Uv0SXsBsA+CPRsY5XoQxYdUKzxlKZnRrbArAX7FQTVSP60lbhmk3O4xW9mgutLQ==
X-Received: by 2002:a1c:6784:: with SMTP id b126mr6601248wmc.80.1590132328483; 
 Fri, 22 May 2020 00:25:28 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:28 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date: Fri, 22 May 2020 09:25:20 +0200
Message-Id: <20200522072525.3919332-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_002530_761908_3BBBBFC6 
X-CRM114-Status: UNSURE (   6.58  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkIHN1cHBvcnQgZm9yIHYyLjEgYW5kIHYyLjIgTkFORCBjb250cm9sbGVycy4KCnYzOiBmaXgg
djIuMSBwYWdlIHNpemUgc2hpZnQKdjI6IGludHJvZHVjZSBjaGFuZ2VzIHN1Z2dlc3RlZCBieSBN
aXF1w6hsLgoKw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzICg1KToKICBtdGQ6IHJhd25hbmQ6IGJy
Y21uYW5kOiByZW5hbWUgdjQgcmVnaXN0ZXJzCiAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogZml4
IENTMCBsYXlvdXQKICBtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiByZW5hbWUgcGFnZSBzaXplcwog
IGR0OiBiaW5kaW5nczogYnJjbW5hbmQ6IGFkZCB2Mi4xIGFuZCB2Mi4yIHN1cHBvcnQKICBuYW5k
OiBicmNtbmFuZDogc3VwcG9ydCB2Mi4xLXYyLjIgY29udHJvbGxlcnMKCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQgfCAgIDIgKwogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyAgICAgIHwgMTAwICsrKysrKysrKysrKysrKy0tLQog
MiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIAoy
LjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
