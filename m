Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4038C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690DE20769
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AF8CrWcB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9eV/Zf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690DE20769
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUy4S4+d+OzCTUQDD+Tt7R+X47IQZkjgFAGZ9Kjlah8=; b=AF8CrWcBdpEvDa
	thwuCYM5+hrIvuNLH6rnXP1Ha5jr4uPdK0bF4380QbAb0Pf/Mh5LunXsqCzJXYrk8Nqqu/xqmqpRI
	Q1NNhuBJwjGpMY8AV7Z9109Rw/BaaAzFeLfaFFgKc2KpRJKVEGTFI0fj9nzR2zhjc3k8l9gr+IvBS
	/wXTdXPL2YymByEsyVkzAxxDX8EF6e0WBelS80GhO+1oa8PP91GVxCHR1N7+YQGqQtZQzBb+YVkN9
	y70ar+t9d8xlitU/f51Sg0zW8qOE2g5t4bRl5mxm1deYGAeoX6pUI3XviRXMSdkxaRj5JrbXzOW1w
	t3RhYACao7pEBAoVNoiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYNy9-0002OK-QU; Tue, 12 May 2020 06:00:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYNxw-0002C7-BV
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 06:00:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id e26so20337680wmk.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 23:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqMgmNOYwrxdY+o1DnJ61eJdUyKQzmC6mhNhV0fXE88=;
 b=D9eV/Zf54+ehFvlVaYySHF1yxDS1BGjbh6+228BirDrpdom0MfF2DPTvrOx2PKqeqn
 msk0n3K9GPL+VHGSRvIHtUus4pCZqaqd3gAF8hfWLRyTj7xsOa9HsGZHUj4gpWc9Hkrw
 zHyu8JUu/7+BNPXx37aWLX4tFqwJHBk5qqyTa6IGtdBzKqnMJPAUGFDrHD/UXue2WOVn
 DdCazsjpbK7BT0mG9l+GrVhJfMbdFhEPdf64dxv0ES+GbH5Ft1cOo04SGO0mspp70c0w
 7OpSWbgz92HLJOSQ8ByE+aZrZ4qCkvazVxoLZ1K3Ciy2wq4fjmCpm8qCXF/QuIgwrvRc
 rc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqMgmNOYwrxdY+o1DnJ61eJdUyKQzmC6mhNhV0fXE88=;
 b=TF+JrcOWcwwoI9dMEPg10vtcGxzkF94UNRT66YGAfF0jezGxI8nZKxnmbk9P/zyTKw
 rvCGBnkYYrpYdKowp3UYTUd7VwmCduWD3+53zgI7heG2UwqFMlz32ZW15/iy8kz/ioSD
 eM1z8ROl8qZCmz+++4qAQkiWf6pRfS6ZJ8Wd1xS3H3+EBJCSkuTSbrQjpkmwxHL+uSqq
 BXXqB0xOunGbsR6rPmi3I3vtnwKW+6r2/pQudmNyr4t3vS3LgnlUAOmfi8AfS/QkBwuh
 NJNWpgcG64swf5AR1oKjGfnjbdhme1VRgOQbL5hrzQg2DtrC8yu/w3bG+fJOYoIATmcS
 WxsQ==
X-Gm-Message-State: AGi0PuZMwbjRTjLqa7p2/G1pLWtXT/m9S136V7pBa7mevz9ZgbIyij5E
 kq0iw6KJFsA1SSoxXreDxSo=
X-Google-Smtp-Source: APiQypJChnU7y6gqwA6+tQ/g42zXUMKmCWgR04qMmUVzGvHla1KX0Ibexk1/9cnyXDApm2t7GubW/A==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr36219836wmj.86.1589263230616; 
 Mon, 11 May 2020 23:00:30 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:00:30 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 1/2] mtd: rawnand: brcmnand: fix hamming oob layout
Date: Tue, 12 May 2020 08:00:22 +0200
Message-Id: <20200512060023.684871-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_230032_393095_D269724F 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rmlyc3QgMiBieXRlcyBhcmUgdXNlZCBpbiBsYXJnZS1wYWdlIG5hbmQuCgpGaXhlczogZWY1ZWVl
YTZlOTExICgibXRkOiBuYW5kOiBicmNtOiBzd2l0Y2ggdG8gbXRkX29vYmxheW91dF9vcHMiKQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYzOiBpbnZlcnQgcGF0Y2ggb3JkZXIK
IHYyOiBleHRlbmQgb3JpZ2luYWwgY29tbWVudAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwppbmRleCBlNGUzY2VlYWMzOGYuLjFjMTA3MDExMWViYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0xMTE2LDExICsxMTE2LDE0IEBAIHN0YXRp
YyBpbnQgYnJjbW5hbmRfaGFtbWluZ19vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgaW50IHNlY3Rpb24sCiAJCWlmICghc2VjdGlvbikgewogCQkJLyoKIAkJCSAqIFNtYWxsLXBh
Z2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hpbGUgbGFyZ2UtcGFnZQotCQkJICogTkFORCB1
c2UgYnl0ZSAwLgorCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KIAkJCSAqLwotCQkJaWYg
KGNmZy0+cGFnZV9zaXplID4gNTEyKQotCQkJCW9vYnJlZ2lvbi0+b2Zmc2V0Kys7Ci0JCQlvb2Jy
ZWdpb24tPmxlbmd0aC0tOworCQkJaWYgKGNmZy0+cGFnZV9zaXplID4gNTEyKSB7CisJCQkJb29i
cmVnaW9uLT5vZmZzZXQgKz0gMjsKKwkJCQlvb2JyZWdpb24tPmxlbmd0aCAtPSAyOworCQkJfSBl
bHNlIHsKKwkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOworCQkJfQogCQl9CiAJfQogCi0tIAoyLjI2
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
