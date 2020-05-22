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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3932C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:16:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9143D20756
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/h36tQZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWpewjZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9143D20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBTNl5qS0CTfJZytYcupMkBx5ZakiL1ooII9qk3/Oio=; b=G/h36tQZkHj/nQ
	BJaKX68cGqMArGax9+WmVDIT1QrVfeN+GstdKweWGJYEBWHny5/9ofLiWO9Cps9fs5LK5FiU5TR4r
	cA3OcFkTK8eaZgc2PGgrgcnpj6KubMETksUwOWfINn2pMtTogsdCSkJIlAbh4H9S/F/tvEfFksLA6
	WSfNq5fCaDWe+Tpor22eADs+ISTN5X+jq7arSPvupG4AjmAnuh0ZjrTbi1n9rAYp2kqX4JqWzfj6o
	dHniLd2lA0hjxDdRbV6sYkhfx2s4b6J/+f2Im49gkr4fLlq5+QBtoG9Zx/Wq0l/a6Yu5ZyjlbTNJe
	Qic1cbv1oEjwVeBxNPnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6aq-0006Ii-4e; Fri, 22 May 2020 12:16:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6aI-0005p0-KF
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 12:15:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id k13so9987320wrx.3
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhBfaAImjH2UVNRp7gKxiak61uswGVZG6aVigHmQNUc=;
 b=sWpewjZWkT+NsuGQ9V+NV3Ou/yoW5k8zRfTnkglOttebJ5WzHRM7uiYYMn7snG5wyj
 r+lq3QRljMG9Ia07D8Gb/x2i/yiAZ2tFBzG+LO5NnBSoDxAwVlCEnA7Qc5aQqPGae2oo
 0jnuAvYjsnG03rRJgj48v5OXKWkuSRS80s6PmGz0/tKqaUJe2DEg/Po0OtnsoGvXwtzP
 BrbUPNhzqvhSJX2gwm/Kw2i4k9oZNgx7Nya+Vz8+g9nQZ7S1KENQyxF6vL/8DgK8RlIQ
 9CvdMRL3BQTqBbeleKeuHdDiSqI3S4rTqoY3lfjDvQiDeBw2SsiT+p+voIsLZzADZr3A
 Ip8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhBfaAImjH2UVNRp7gKxiak61uswGVZG6aVigHmQNUc=;
 b=VhvNGWmE0qQ71zV5+9oKanRPEOT5oUITM/rUAQ5iicuTgPumb2k+EFMiqMqFjP0HwV
 j90X8wpOP05jq+EeU1LMKXeQHrwKoeiul8KuCmGIahEzchPBHK0L7T8Mdwra0c6bknkl
 wSqk5s4yzLLL5ZCkshC1hc4lYlfMPTql6+Wr6RYcINZlp31mcT6nTUCTfhlcZqEDr8TD
 y6XPLDCrOWBxhcEY4vEqz/9eN3HtzcgYelBX8MjKQ9SRwh+4Oh9kEsxmZoL9DD1n0zrT
 kvZqFVvdpKYnCk7JIA/TO/mpJmX0+eR6D8H/ZdYwu3c2znfVnHHIiiCWSCAZ1M2xwKtS
 TY3w==
X-Gm-Message-State: AOAM532vuBf2jUKvc/2ALT8Dn/Gc+sssLy9iMGhVjRBDRpkmN6622kNb
 AzKRV47iYkLT1ZctB5LlZw0=
X-Google-Smtp-Source: ABdhPJxuqavo8Zcw+Zlj4qPhljdlh+JK+KhGZ1yZnzVuNPR33zxb13loGaNaVUMz36J0YlmudwFSOQ==
X-Received: by 2002:adf:decb:: with SMTP id i11mr3485439wrn.172.1590149729304; 
 Fri, 22 May 2020 05:15:29 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:28 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date: Fri, 22 May 2020 14:15:21 +0200
Message-Id: <20200522121524.4161539-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_051530_662972_D9ABD73A 
X-CRM114-Status: UNSURE (   9.09  )
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

T25seSB2My4zLXY1LjAgaGF2ZSBhIGRpZmZlcmVudCBDUzAgbGF5b3V0LgpDb250cm9sbGVycyBi
ZWZvcmUgdjMuMyB1c2UgdGhlIHNhbWUgbGF5b3V0IGZvciBldmVyeSBDUy4KCkZpeGVzOiAyN2M1
YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2Fk
Y29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKQpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHY0OiBubyBjaGFuZ2VzLgogdjM6IG5v
IGNoYW5nZXMuCiB2MjogZml4IGNvbW1pdCBsb2cuCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKaW5kZXggNmEwOGRkMDdiMDU4Li43MmIyNjhkOGUzYTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtNjA2LDggKzYwNiw5IEBAIHN0YXRpYyBpbnQgYnJj
bW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKIAl9
IGVsc2UgewogCQljdHJsLT5jc19vZmZzZXRzID0gYnJjbW5hbmRfY3Nfb2Zmc2V0czsKIAotCQkv
KiB2NS4wIGFuZCBlYXJsaWVyIGhhcyBhIGRpZmZlcmVudCBDUzAgb2Zmc2V0IGxheW91dCAqLwot
CQlpZiAoY3RybC0+bmFuZF92ZXJzaW9uIDw9IDB4MDUwMCkKKwkJLyogdjMuMy01LjAgaGF2ZSBh
IGRpZmZlcmVudCBDUzAgb2Zmc2V0IGxheW91dCAqLworCQlpZiAoY3RybC0+bmFuZF92ZXJzaW9u
ID49IDB4MDMwMyAmJgorCQkgICAgY3RybC0+bmFuZF92ZXJzaW9uIDw9IDB4MDUwMCkKIAkJCWN0
cmwtPmNzMF9vZmZzZXRzID0gYnJjbW5hbmRfY3Nfb2Zmc2V0c19jczA7CiAJfQogCi0tIAoyLjI2
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
