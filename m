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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30122C54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C5420733
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeluiBHP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFFfkHPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4C5420733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Xx3KhsQUI48Q0xxKE/1gVysz70Vm2d891fx5g8xG8c=; b=TeluiBHPJdE4va
	J6yXozR/Cu8q3r0ekBKWDFS+m2xK82koTrPt9mYIyH7Gkc2jnXlJRxtqYeX/av+EhUtYxZ8Gkii9i
	2e101km9qdylB2ppgWFa3/+Nu80ML4NDa+rsN60T+bVpsp/qEyrVoQHttG/2UArQqoxsbqzCii5Vq
	3Vxw/RDmWf06JWFGO1MJ+fNoLMl/Zrnp5ijag86TSLonOSZtdkJE4AV25T6nsUwSFKSdCiCTXNOWg
	TkjLCnTjkgO9zkEpVBKveZcJfUrd4YV8S6NSPlJJwV1pf44y4TVZZ2KK6qqRnkDbKQWPhqup4BPBT
	eevEP5e4kVZEi7IUeBlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPQV-0005AY-26; Tue, 12 May 2020 07:34:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPQ0-0004dv-VH
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:33:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id d207so5706609wmd.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQ8y/gqu4ixgcZle26aEK4aRfb9gxDM111a2MEV0O/g=;
 b=CFFfkHPeWAA6BWb6cFCjifEnJfjfyW8vqr5uZuCntCcA6PiJplULoRvFSupY7gbk2i
 W/hBRBIDIDH8dYhGpppydhOGeeDHR6G0rfEeKwaZFNtZkfRrv2i4wd2Yt3gpmA1PtbCL
 A/bzbOJbOehSlzuI9ZfXvQMrdgvMKWAVpz6SUyd6+ToP7RIds6fmAkDcyK6KMGsLwOev
 DaY3NTsrFW0bpILRbx64bx4W20dks7qPpLulwCNdFvtWrsJgyZaRSsNMJdzpjStm0YOJ
 PpvK2VVOruCqRzQxSoI93rCkDeoDEkhhyF1NLfWqV3L/plT/67JGqKsRayNoI0vMuJay
 BSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQ8y/gqu4ixgcZle26aEK4aRfb9gxDM111a2MEV0O/g=;
 b=SnI+658dNtbVrVRL788huayj6S7c9a3IMsyZFS+5HFn50Vclnm9tW3/O4l9oekcU/Y
 3yLcFcg2Z7KV16WnfPjbegIdwD7YCRs7snah00BbOQCZXzjhqk3r3GjvBDjPIHX4zk92
 igqD9pv3YnPX4oOFC+ZQUORMnVe5NwooHYwQ2F5ws1RBAy6APOMfEaKaFC0HRbgK9bj8
 tCAKe9Eie/Swm2AAmqBrimFNjsBGcA7SLhRVO9yhCCekqNRmlyYU3baq7OG9NG6ae2uL
 rVD8zz0CvTbBW+/aocozB+02BHCgMsVhnSX2eVRfQGCu/8XFg3TKtmgYZfN807xJ9BAX
 LbPw==
X-Gm-Message-State: AGi0PubKVP2JbK+Aqrw9aD7i7EovPf1c4g6GJ2YvpWTIhrB/N+1F0a48
 oACY4lf+/aa2Z/cMzE9zfoI=
X-Google-Smtp-Source: APiQypJHlU7E9KgvyqCnZSJ9eLmQdj13uPEZz/FURvTrOPOTv+arPqj9HTfqURAv8oZpNu18CNr2DQ==
X-Received: by 2002:a1c:9ac3:: with SMTP id c186mr5172702wme.150.1589268815649; 
 Tue, 12 May 2020 00:33:35 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:35 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date: Tue, 12 May 2020 09:33:26 +0200
Message-Id: <20200512073329.742893-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_003337_007136_1130A7C9 
X-CRM114-Status: GOOD (  10.47  )
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
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYyOiBmaXggY29tbWl0IGxvZy4KCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgNSArKystLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwppbmRleCA2YTA4ZGQwN2IwNTguLjcyYjI2OGQ4ZTNh
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwor
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC02MDYsOCAr
NjA2LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0cnVjdCBicmNtbmFu
ZF9jb250cm9sbGVyICpjdHJsKQogCX0gZWxzZSB7CiAJCWN0cmwtPmNzX29mZnNldHMgPSBicmNt
bmFuZF9jc19vZmZzZXRzOwogCi0JCS8qIHY1LjAgYW5kIGVhcmxpZXIgaGFzIGEgZGlmZmVyZW50
IENTMCBvZmZzZXQgbGF5b3V0ICovCi0JCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPD0gMHgwNTAw
KQorCQkvKiB2My4zLTUuMCBoYXZlIGEgZGlmZmVyZW50IENTMCBvZmZzZXQgbGF5b3V0ICovCisJ
CWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwMzAzICYmCisJCSAgICBjdHJsLT5uYW5kX3Zl
cnNpb24gPD0gMHgwNTAwKQogCQkJY3RybC0+Y3MwX29mZnNldHMgPSBicmNtbmFuZF9jc19vZmZz
ZXRzX2NzMDsKIAl9CiAKLS0gCjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
