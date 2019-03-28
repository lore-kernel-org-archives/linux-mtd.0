Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D57C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:59:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC82A2075E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PnorP7zx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LF1mrqe7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC82A2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NKLLet8oWRX7LKRPOp+ZDqjXADRUoZ4gBMi0SgxljXw=; b=PnorP7zxnbIW8n
	6n3LFxrZwg5XsvcI454cxhRNYiRKJwnHKrqP0qfmLbmI/kiwJn3mNoDJGhxuvHvenMKNSr25+2uwU
	TJWbZU4+bU5zMQSzNZF6DZWp5/m6DZjevxuA93Z77gZBcZHBoDgSh3MOf/QQy0Oq2jCcx4VAr3gqJ
	AC7Y9gz6naxfqPAn6pIw4bmD1QbYJARC+P9UIQdsWUe+iPlZpnDiyZ65+PsPsdlJPk9+lanmxuQJa
	5scdfR6KYSqRm+B+bg4VYVjmmAMgnL/35tCk9f6WeCCIB6+z8neHqNA8+bthmTKgiNaYzqORC5cTY
	L4ZydHvdEmXw/s9eRrWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9N8p-00005f-3m; Thu, 28 Mar 2019 04:59:51 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9N8k-00005H-QG
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 04:59:48 +0000
Received: by mail-pg1-x541.google.com with SMTP id j26so9029416pgl.5
 for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2019 21:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoJTJgIS3SN73gASZI6+9lIVM2vPmrO7wvZ1LHJGqio=;
 b=LF1mrqe7gJ/l3Uv1aBjzOX8N8IkFij5ktM+C/CN843MVPQT493f+VT+sB3VMl0WYBh
 x6AVn7iTVNiVCQ318SeFlaa5Oh4QqqEc3TC/vOqQH0PaLUK29K+gsmVx/S45ZeGnGV3O
 8h0vjxGW1Yzuzk96h5tP2JjfFypDZNYyJWezQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoJTJgIS3SN73gASZI6+9lIVM2vPmrO7wvZ1LHJGqio=;
 b=tXVuK7qqUeVtGs3PZRKCuAIw6m6j+RT0s3xjfZtYFK6PvqSTHlnTwgANF3iG76wo81
 9j0VlBsZfNUhTONd1A38F6pZViW5UMHFLBIa2Wkm/ygzDeXI5Xu+NKRrAPHIVTB+qKAG
 TrJahOXd75LO3qCfPIy0Fbp3ooOOlBKXggVoMNeNgrwM/7E6ksLoJzSMojiDeipFzHCS
 udk+jFV+fEjqhCFyYO/R852ErzBLvuO9FDPUwUHb4BdpmzJNWXJF+fLUo/XCOZqnOz5i
 Ot6qAKeNSnxNs4wHLVS7VncFJiBXdoFXlRYEWzxSCC62Du6V1MXZLy5jDq2onbBtgWvM
 MCMg==
X-Gm-Message-State: APjAAAVUkci885Q89lIVYjtIrcrD0dHlVq2x55uvY7LIvD/Qcib3hRMJ
 cFgf9q/zeFtmS2aeQksthRL/NI6ry7k=
X-Google-Smtp-Source: APXvYqxMTgtBRgapTTkkWRtEm6If4XnlbsryOgZkA/Bp9MwcmsJ2OhIPFH8OHgvX7ydJIfpLuTTw+A==
X-Received: by 2002:a63:c204:: with SMTP id b4mr37779763pgd.335.1553749183723; 
 Wed, 27 Mar 2019 21:59:43 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id y23sm20312665pfn.25.2019.03.27.21.59.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Mar 2019 21:59:43 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1] mtd: core: add sysfs nodes for querying the flash name and
 id
Date: Thu, 28 Mar 2019 12:59:10 +0800
Message-Id: <20190328045910.98250-1-zhuohao@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_215946_905087_FF1E5536 
X-CRM114-Status: GOOD (  14.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, zhuohao@chromium.org, bbrezillon@kernel.org,
 richard@nod.at, briannorris@chromium.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q3VycmVudGx5LCB3ZSBkb24ndCBoYXZlIHN5c2ZzIG5vZGVzIGZvciBxdWVyeWluZyB0aGUgdW5k
ZXJseWluZyBmbGFzaApuYW1lIGFuZCBmbGFzaCBpZC4gVGhpcyBpbmZvcm1hdGlvbiBpcyBpbXBv
cnRhbnQgZXNwZWNpYWxseSB3aGVuIHdlCndhbnQgdG8ga25vdyB0aGUgZmxhc2ggZGV0YWlsIG9m
IHRoZSBkZWZlY3RpdmUgc3lzdGVtLiBJbiBvcmRlciB0bwpzdXBwb3J0IHRoZSBxdWVyeSwgd2Ug
YWRkIHR3byBwb2ludGVycyAoKmZsYXNobmFtZSwgKmlkKSBpbnRvIHRoZQptdGRfaW5mbyBzdHJ1
Y3R1cmUgYW5kIGNyZWF0ZSB0d28gc3lzZnMgbm9kZXMgKGZsYXNobmFtZSwgaWQpLiBUaGlzCnBh
dGNoIGlzIG1vZGlmaWVkIGJhc2VkIG9uIHRoZSBTUEktTk9SIGZsYXNoIHN5c3RlbSBhcyB3ZSBv
bmx5IGhhdmUKdGhhdCBzeXN0ZW0gbm93LiBCdXQgdGhlIGlkZWEgc2hvdWxkIGJlIGFwcGxpZWQg
dG8gdGhlIG90aGVyIGZsYXNoCmRyaXZlciBsaWtlIE5BTkQgZmxhc2guCgpUaGUgb3V0cHV0IG9m
IG5ldyBzeXNmcyBub2RlcyBvbiBteSBkZXZpY2UgYXJlOgpjYXQgL3N5cy9kZXZpY2VzL3BsYXRm
b3JtL3NvYy8xMTAxMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9tdGQvbXRkMC9mbGFz
aG5hbWUKdzI1cTY0ZHcKY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTEwMTAwMDAuc3Bp
L3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvbXRkL210ZDAvaWQKZWY2MDE3CgpTaWduZWQtb2ZmLWJ5
OiBaaHVvaGFvIExlZSA8emh1b2hhb0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9tdGQvbXRk
Y29yZS5jICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jIHwgIDMgKysrCiBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCAgICAg
ICB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmluZGV4IDNl
ZjAxYmFlZjliNi4uZGNiZTY3MTlhZDY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMKKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCkBAIC0yNDEsNiArMjQxLDI4IEBAIHN0YXRp
YyBzc2l6ZV90IG10ZF9uYW1lX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAogfQogc3RhdGljIERF
VklDRV9BVFRSKG5hbWUsIFNfSVJVR08sIG10ZF9uYW1lX3Nob3csIE5VTEwpOwogCitzdGF0aWMg
c3NpemVfdCBtdGRfZmxhc2huYW1lX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAorCQlzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQoreworCXN0cnVjdCBtdGRfaW5mbyAq
bXRkID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwlpZiAoIW10ZC0+Zmxhc2huYW1lKQorCQly
ZXR1cm4gMDsKKwlyZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlc1xuIiwgbXRkLT5m
bGFzaG5hbWUpOworfQorc3RhdGljIERFVklDRV9BVFRSKGZsYXNobmFtZSwgU19JUlVHTywgbXRk
X2ZsYXNobmFtZV9zaG93LCBOVUxMKTsKKworc3RhdGljIHNzaXplX3QgbXRkX2lkX3Nob3coc3Ry
dWN0IGRldmljZSAqZGV2LAorCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAq
YnVmKQoreworCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisK
KwlpZiAoIW10ZC0+aWQpCisJCXJldHVybiAwOworCXJldHVybiBzbnByaW50ZihidWYsIFBBR0Vf
U0laRSwgIiUqcGhOXG4iLCBtdGQtPmlkX3NpemUsIG10ZC0+aWQpOworfQorc3RhdGljIERFVklD
RV9BVFRSKGlkLCBTX0lSVUdPLCBtdGRfaWRfc2hvdywgTlVMTCk7CisKIHN0YXRpYyBzc2l6ZV90
IG10ZF9lY2Nfc3RyZW5ndGhfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQkJICAgICBzdHJ1
Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQogewpAQCAtMzQwLDYgKzM2Miw4
IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICptdGRfYXR0cnNbXSA9IHsKIAkmZGV2X2F0dHJf
b29iYXZhaWwuYXR0ciwKIAkmZGV2X2F0dHJfbnVtZXJhc2VyZWdpb25zLmF0dHIsCiAJJmRldl9h
dHRyX25hbWUuYXR0ciwKKwkmZGV2X2F0dHJfZmxhc2huYW1lLmF0dHIsCisJJmRldl9hdHRyX2lk
LmF0dHIsCiAJJmRldl9hdHRyX2VjY19zdHJlbmd0aC5hdHRyLAogCSZkZXZfYXR0cl9lY2Nfc3Rl
cF9zaXplLmF0dHIsCiAJJmRldl9hdHRyX2NvcnJlY3RlZF9iaXRzLmF0dHIsCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3Bp
LW5vci5jCmluZGV4IDZlMTNiYmQxYWFhNS4uMGUxMDg1OGU1MzJjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYwpAQCAtNDAyNyw2ICs0MDI3LDkgQEAgaW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25v
ciAqbm9yLCBjb25zdCBjaGFyICpuYW1lLAogCiAJaWYgKCFtdGQtPm5hbWUpCiAJCW10ZC0+bmFt
ZSA9IGRldl9uYW1lKGRldik7CisJbXRkLT5mbGFzaG5hbWUgPSBpbmZvLT5uYW1lOworCW10ZC0+
aWQgPSBpbmZvLT5pZDsKKwltdGQtPmlkX3NpemUgPSBpbmZvLT5pZF9sZW47CiAJbXRkLT5wcml2
ID0gbm9yOwogCW10ZC0+dHlwZSA9IE1URF9OT1JGTEFTSDsKIAltdGQtPndyaXRlc2l6ZSA9IDE7
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaCBiL2luY2x1ZGUvbGludXgvbXRk
L210ZC5oCmluZGV4IDY3Nzc2OGIyMWExZC4uMGE4MTU2OWZhNGY2IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L210ZC9tdGQuaAorKysgYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaApAQCAtMjEw
LDYgKzIxMCw5IEBAIHN0cnVjdCBtdGRfaW5mbyB7CiAJdWludDMyX3QgZmxhZ3M7CiAJdWludDMy
X3Qgb3JpZ19mbGFnczsgLyogRmxhZ3MgYXMgYmVmb3JlIHJ1bm5pbmcgbXRkIGNoZWNrcyAqLwog
CXVpbnQ2NF90IHNpemU7CSAvLyBUb3RhbCBzaXplIG9mIHRoZSBNVEQKKwljb25zdCBjaGFyICpm
bGFzaG5hbWU7IC8qIFRoZSB1bmRlcmx5aW5nIGZsYXNoIG5hbWUgKi8KKwljb25zdCBjaGFyICpp
ZDsgLyogVGhlIElEIG9mIHRoZSBmbGFzaCAqLworCWludCBpZF9zaXplOyAvKiBOdW1iZXIgb2Yg
Ynl0ZXMgb2YgaWQgYXJyYXkgKi8KIAogCS8qICJNYWpvciIgZXJhc2Ugc2l6ZSBmb3IgdGhlIGRl
dmljZS4gTmHDr3ZlIHVzZXJzIG1heSB0YWtlIHRoaXMKIAkgKiB0byBiZSB0aGUgb25seSBlcmFz
ZSBzaXplIGF2YWlsYWJsZSwgb3IgbWF5IHVzZSB0aGUgbW9yZSBkZXRhaWxlZAotLSAKMi4yMS4w
LjM5Mi5nZjhmNjc4NzE1OWUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
