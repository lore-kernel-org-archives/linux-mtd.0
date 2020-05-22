Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEDDC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:26:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D57206DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MbgL5dX5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD8c4JEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4D57206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBHm+G6NVGU8/gsqdi5/5esc1u62vCjEopCKUz2H5ac=; b=MbgL5dX5IlYv9S
	wHxPpozXVocdByV6sQ5zYd+pBTuQ6/jQGM6lQroWuziFHxlhN7FHE2Amz9FGNMw8V5vfrYGYn9iDc
	I8l9jLJ+k9whI82YPGRp2Azu5Iyrn/WD/pnDl+DuBU3vP40ra83JL/mrxtXTj5/zurliopTc81D8N
	FMeKhDecT2rwgInzpTsD0C+yqGibkfEAo971Lc+B1KxB6eQovJLT0RxB1IRE9Sb0Qc0pvHF1AGk7K
	PFrWL1e/qot2M+NO10IdquUKQLBwj6ZAAVM45NROlB7AWfgr6io2qhJkZz/FHL2+PAbDZLjrCRVs6
	Pbdmf7T9LoS5ighrLqIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc23p-00069Z-RH; Fri, 22 May 2020 07:25:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc23f-0005zT-65
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 07:25:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id u12so4049211wmd.3
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHgeS900C8sjZPSNqdj5fllI3ugne42uY2C7wCBS5Gc=;
 b=lD8c4JEKWp4wF+rIFa4eB53uzn67CvhVIXCJdVVeXQami4aGZ9RQI+9IC7Q56X9Vxp
 o35EnfKJOJE2FxKUDHkBZXVHu3dt5Mds4QGISSRoPaXCsRivc/sKiC9/K4y5V2svIlA8
 7cESVc1bQfp4oBkny2cx7z7MH31BO7Hyi2vQsIIf7qG+DzWBKej+wTexUk8VSeqdFppN
 Hz9rdN1eY00OtieXvWRiwGNFFYjUw1yVoJzqKM7WBvSoNHkAf6cMoHA9FYAeHxEQgN89
 gAdK75z09uo6bbtcFf6tjWgk0WlNy6rFg7FM/SWtjgL4/ACRUJZmk+k2MWswrAtbyNfz
 Bwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHgeS900C8sjZPSNqdj5fllI3ugne42uY2C7wCBS5Gc=;
 b=KaKnRZV67c9MsK4QCeVY2J8OS31jpafjq4ClKWP4mXuZq6FclEwtqvZIW4UO4dJsuK
 l1BXW1w8NINjFCFc2c29BivryvnlehS2lsIrQxWbgOemYecJmR0qF/5QafGEp9/ld1Qe
 ZNyVWTFsxPXrUWrnJsuSljLLtlROD6Cxqr7j3QTFd7OqI2VpxTSQdbRBM3dqiQqf9AsD
 sM1dU6Xn3lPnfM/Rwdb8ahCCEZp0h4JGtVX7bWOyo7Y9yeUpzVXJKgrKuuj1mcdMl03m
 Ow5/qfYldP0eFe/0tHWKWeZnHu2U1wtkXXIm8gCgGLJghAmWHSRPnwbTTEY3gJ+CxuJv
 qg1g==
X-Gm-Message-State: AOAM5338zEyQCQ43N+gn5nxRQsi9hfYrn/6bLo7NIRemXF0D5/tD57Lu
 w5wxqm9yB2gPTAvXRUHT56c=
X-Google-Smtp-Source: ABdhPJzZtAzIjrObPOreEvfAVtffck8CKlAUsXZQXdOeijTaDTKBgecBn4czPLCpDMJ3+PcRdNzZUA==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr13114869wmm.155.1590132329602; 
 Fri, 22 May 2020 00:25:29 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:29 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date: Fri, 22 May 2020 09:25:21 +0200
Message-Id: <20200522072525.3919332-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_002531_222659_7126470B 
X-CRM114-Status: UNSURE (   8.87  )
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

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIHYzOiBubyBjaGFu
Z2VzLgogdjI6IGZpeCBjb21taXQgdGl0bGUuCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKaW5kZXggZTRlM2NlZWFjMzhmLi42YTA4ZGQwN2IwNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMzM4LDggKzMzOCw4IEBAIGVudW0gYnJjbW5hbmRf
cmVnIHsKIAlCUkNNTkFORF9GQ19CQVNFLAogfTsKIAotLyogQlJDTU5BTkQgdjQuMCAqLwotc3Rh
dGljIGNvbnN0IHUxNiBicmNtbmFuZF9yZWdzX3Y0MFtdID0geworLyogQlJDTU5BTkQgdjMuMy12
NC4wICovCitzdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3NfdjMzW10gPSB7CiAJW0JSQ01O
QU5EX0NNRF9TVEFSVF0JCT0gIDB4MDQsCiAJW0JSQ01OQU5EX0NNRF9FWFRfQUREUkVTU10JPSAg
MHgwOCwKIAlbQlJDTU5BTkRfQ01EX0FERFJFU1NdCQk9ICAweDBjLApAQCAtNTkxLDggKzU5MSw4
IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29u
dHJvbGxlciAqY3RybCkKIAkJY3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFuZF9yZWdzX3Y2MDsK
IAllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNTAwKQogCQljdHJsLT5yZWdfb2Zm
c2V0cyA9IGJyY21uYW5kX3JlZ3NfdjUwOwotCWVsc2UgaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+
PSAweDA0MDApCi0JCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192NDA7CisJZWxz
ZSBpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDMwMykKKwkJY3RybC0+cmVnX29mZnNldHMg
PSBicmNtbmFuZF9yZWdzX3YzMzsKIAogCS8qIENoaXAtc2VsZWN0IHN0cmlkZSAqLwogCWlmIChj
dHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNzAxKQotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
