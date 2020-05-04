Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1F9C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:31:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61773206D9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZPc4AVMz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/Ws8Bmy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61773206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=quhI3lI2dO+2vXU/3IVeE+QiF2Im7ef2LOt/8OqYdvM=; b=ZPc4AVMzCHmvJG
	tdwClBPh2iCncsrJ10EwAKkjXJMqRZ6tjWA7C8WIG+Ftn+8CF+CffelTeMaQgASDv3vpZ1acX0muW
	yDSd3ZG4wclM19TCyDharTlRAz75Metsgv9Q7ZkkWorrrKtYAzxVu+kn+AkMGijKcF0emwR1HMzQt
	drkgIgzChBD9P/EixZYmor0TH4QuADMv7qCHEo/IaV/DNFt4EnujHG9ehwEeJMUcah+EpkrvZ52Qn
	7gw5XIi7zRNtiIAWkNEHVaxYvufCbYrxLJl+k2BbQHQeXNZwwLP8qPJjdI+k7li0RtpPW/WTz1/cB
	fnSokJgzjNwY9ekJJQZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVXRO-0005sT-EL; Mon, 04 May 2020 09:31:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVXQF-0002V5-2H
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 09:30:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id i10so20039885wrv.10
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2YxkH/lWbx8jjAhy6XV0nL4qLMq1MOAjY7RA6k/WB4=;
 b=K/Ws8BmyoqGZGLQYHin3HwA+JMkgqMir7wNzB+pLnNTGxSTZUQHt0DLXMzAsIQEzcP
 9QJhcV4cq2WOOptbt+J4xCmszcY31/GvEuCAPr3uqFtzKXNVWE9T/Kza5Y0rT/KzbyaA
 hL9Sre8KAx8xY1lePcT+QeEx4d81BJyyb6c2/KPjBTx0YLLH0EjrYv/y0BcbiMjfluoR
 /coNr6jJ3H+bn0ZuQ+DREJfJeSjZ+oxvg21BqHTIWsOJVyJypNsL7X5HEHOoYc8ma5E/
 0ivUVZdwJXvWcE79pxbu0EAW9Gw1v5obnDV/lGVFG6/5I6LqZCBBtLvoTR3myFpzLxE7
 lKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2YxkH/lWbx8jjAhy6XV0nL4qLMq1MOAjY7RA6k/WB4=;
 b=GsStGaOOssKQlLGeq0JDbnZDxqhRsF3ZqtKcRv7aqHbRdXKrGDmGBcS2Hc7T4LvlOQ
 5fc33arf1PRRXsTC9WxechSnolU4MaB/kvpSSKRL/PdxGDEh9iLbf3oYT0OL29X6LcH+
 jhtUQNXJrOqrAV70XcFJB36KaM6JjDShJv0wiE7nwZFi+nDYrfKLdOznCdz5Ebb+ut9f
 v/k3t/Pr7DvlFjUhCMXhfdebwbLb8jNwr3FETXuR1f+0JKhEwGAM0ZFS+cGAGBB5N1xd
 IRkXxmsUj2Q5x/rR5P1USizbZFrUYT8pFimEfhyw8XULowW7al3D6LfhL9JbXxLjLNAz
 KdVA==
X-Gm-Message-State: AGi0PuZD3Ia3Qob1vsonbw+e8p8/lS3UYzgYG4NlH2v0Ou33q7i0Bv22
 Aj5xwfVkWh4aTuHCrHbrMt0=
X-Google-Smtp-Source: APiQypIkkbhC2pp71xWc4qJpvnWgeLLvCX9aOOoVg4impVPijmMMmbwo6MgNbyyZOaF+TmYb8rAXSw==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr314819wrm.399.1588584596171;
 Mon, 04 May 2020 02:29:56 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id s8sm17334965wru.38.2020.05.04.02.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:29:55 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] nand: brcmnand: correctly verify erased pages
Date: Mon,  4 May 2020 11:29:43 +0200
Message-Id: <20200504092943.2739784-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_022959_119521_86FBF858 
X-CRM114-Status: GOOD (  12.01  )
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

VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
LgpUaGlzIGlzIGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8g
dGhlIE9PQiwgc2luY2UgaXQgd2lsbApmYWlsIGR1ZSB0byB0aGUgdXNhYmxlIE9PQiBieXRlcyBu
b3QgYmVpbmcgMHhmZi4KQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCB0aGUgRUND
IGFyZW4ndCAweGZmLgoKU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxu
b2x0YXJpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMKaW5kZXggZTRlM2NlZWFjMzhmLi41NDZmMDgwN2I4ODcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMjAxOCw2ICsyMDE4LDcgQEAgc3Rh
dGljIGludCBicmNtbmFuZF9yZWFkX2J5X3BpbyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgYnJjbXN0Yl9uYW5kX3ZlcmlmeV9lcmFzZWRf
cGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAkJICBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB2
b2lkICpidWYsIHU2NCBhZGRyKQogeworCXN0cnVjdCBtdGRfb29iX3JlZ2lvbiBvb2JlY2M7CiAJ
aW50IGksIHNhczsKIAl2b2lkICpvb2IgPSBjaGlwLT5vb2JfcG9pOwogCWludCBiaXRmbGlwcyA9
IDA7CkBAIC0yMDM1LDExICsyMDM2LDI0IEBAIHN0YXRpYyBpbnQgYnJjbXN0Yl9uYW5kX3Zlcmlm
eV9lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAlpZiAocmV0KQogCQlyZXR1cm4g
cmV0OwogCi0JZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2IgKz0gc2Fz
KSB7CisJZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrKSB7CiAJCWVjY19jaHVu
ayA9IGJ1ZiArIGNoaXAtPmVjYy5zaXplICogaTsKLQkJcmV0ID0gbmFuZF9jaGVja19lcmFzZWRf
ZWNjX2NodW5rKGVjY19jaHVuaywKLQkJCQkJCSAgY2hpcC0+ZWNjLnNpemUsCi0JCQkJCQkgIG9v
Yiwgc2FzLCBOVUxMLCAwLAorCisJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhl
Y2NfY2h1bmssIGNoaXAtPmVjYy5zaXplLAorCQkJCQkJICBOVUxMLCAwLCBOVUxMLCAwLAorCQkJ
CQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOworCQlpZiAocmV0IDwgMCkKKwkJCXJldHVybiByZXQ7
CisKKwkJYml0ZmxpcHMgPSBtYXgoYml0ZmxpcHMsIHJldCk7CisJfQorCisJZm9yIChpID0gMDsg
bXRkLT5vb2JsYXlvdXQtPmVjYyhtdGQsIGksICZvb2JlY2MpICE9IC1FUkFOR0U7IGkrKykKKwl7
CisJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhOVUxMLCAwLAorCQkJCQkJICBv
b2IgKyBvb2JlY2Mub2Zmc2V0LAorCQkJCQkJICBvb2JlY2MubGVuZ3RoLAorCQkJCQkJICBOVUxM
LCAwLAogCQkJCQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOwogCQlpZiAocmV0IDwgMCkKIAkJCXJl
dHVybiByZXQ7Ci0tIAoyLjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
