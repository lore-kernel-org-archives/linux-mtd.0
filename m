Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF01C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 06:50:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCB76121D
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 06:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCB76121D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usFI6xbEebMN3c8x2mTKNP+5y9T5i44MmeK1is0DlW0=; b=UVZd/ND2LJaoy+
	hOr91BLpyXYAAbs+xrW3jGIJVQkKpRwHESx/3oyI7SZUqDq3q19nrPoC3KOGCX8RsEVMyu5RFg3PW
	uz/NDn6ARKal2k4ox9BD+3IXtxMfN3eXWVuqQpQF0dPM1RVWu40diM3yP+OFj92RXXYgE0ktMn9Mf
	qrX8gj6SzMBGZ79aaXy8HJgk0Ug41LCM54Dr3SzF/KJk92MeHKfWIG60xGv+OFeqdC0z/EcmJy1MQ
	bTGn/ghcuoXDxeRteGzW8HTD7THgIBcMC9AHPjamst+In3/BqpUnJW5XzYijyblpUjcIyyDR96Y8B
	O6/gI4z8WFzzMJLh8yhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqNz-005rGs-V4; Mon, 12 Apr 2021 06:49:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqNp-005rFH-Gi
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 06:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=grI+EVEo5XZwJtWBPdfa9Y6OtBgH1zGpKP+CRqhSS3M=; b=Xb9qw4FEvVomlWugwi+Maexvwq
 zO3bWKniXFGaCSFHP0AneaAKr7ob6P1qegmxMgFZ5rwC0aaX8anyB6F2HJGxgchgkmPnVQtrXdP9r
 WeK1DzVnIzjBi4SRIaa6vgZGsGyR9c99dfwAZdviOZB44HWfpkJEz4blQblJnVqzv4YB1EKNFyGF1
 6lkqVG1J75TQfSn3fK+O8kOpw7qXivR1LxK2fYo8unEMjveBLEmOCpppDNtSuM1hlzxaSKrZDu3fY
 nwzSYzodQWI8gYRYSh79I859wwg4VLUKH1gDbCUbT35ZwIomOIW+Ha/tEJ2k+7UconHwUyMc1hc2R
 lsF2y2Dg==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqNm-005uTe-81
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 06:49:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B42E06122D74;
 Mon, 12 Apr 2021 08:49:02 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6FNPy8Bzq4vH; Mon, 12 Apr 2021 08:49:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BB8416122D72;
 Mon, 12 Apr 2021 08:49:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lMqV7nKKnHlx; Mon, 12 Apr 2021 08:49:00 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 997D76122D59;
 Mon, 12 Apr 2021 08:49:00 +0200 (CEST)
Date: Mon, 12 Apr 2021 08:49:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tian Tao <tiantao6@hisilicon.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <614928182.172774.1618210140227.JavaMail.zimbra@nod.at>
In-Reply-To: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
References: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
Subject: Re: [PATCH] mtd: core: Convert sysfs sprintf/snprintf family to
 sysfs_emit
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: Convert sysfs sprintf/snprintf family to sysfs_emit
Thread-Index: Ti7cLZt2tlFu9NiEvwK1Dak/niesdg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_234914_452595_134B5FD2 
X-CRM114-Status: UNSURE (   3.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGlhbiBUYW8sCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiVGlhbiBU
YW8iIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25l
c2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJUaWFuIFRhbyIgPHRpYW50YW82QGhpc2lsaWNv
bi5jb20+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMTIuIEFwcmlsIDIwMjEgMDg6NDQ6MzIKPiBCZXRy
ZWZmOiBbUEFUQ0hdIG10ZDogY29yZTogQ29udmVydCBzeXNmcyBzcHJpbnRmL3NucHJpbnRmIGZh
bWlseSB0byBzeXNmc19lbWl0Cgo+IEZpeCB0aGUgZm9sbG93aW5nIGNvY2NpY2hlY2sgd2Fybmlu
ZzoKPiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6Mjk2OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmlu
dGYgb3Igc3ByaW50Zgo+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzozMDY6OC0xNjogV0FSTklORzog
dXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjIzNzo4LTE2
OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPiBkcml2ZXJzL210ZC9tdGRjb3Jl
LmM6Mjc1OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+IGRyaXZlcnMv
bXRkL210ZGNvcmUuYzoyODY6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRm
Cj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjI2NDo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRm
IG9yIHNwcmludGYKPiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MjI3OjgtMTY6IFdBUk5JTkc6IHVz
ZSBzY25wcmludGYgb3Igc3ByaW50Zgo+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNjI6OC0xNjog
V0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4gZHJpdmVycy9tdGQvbXRkY29yZS5j
OjE0Mzo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPiBkcml2ZXJzL210
ZC9tdGRjb3JlLmM6MjE4OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+
IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoyMDg6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBv
ciBzcHJpbnRmCj4gZHJpdmVycy9tdGQvbXRkY29yZS5jOjE5OTo4LTE2OiBXQVJOSU5HOiB1c2Ug
c2NucHJpbnRmIG9yIHNwcmludGYKPiBkcml2ZXJzL210ZC9tdGRjb3JlLmM6MTkwOjgtMTY6IFdB
Uk5JTkc6IHVzZSBzY25wcmludGYgb3Igc3ByaW50Zgo+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzox
NTI6OC0xNjogV0FSTklORzogdXNlIHNjbnByaW50ZiBvciBzcHJpbnRmCj4gZHJpdmVycy9tdGQv
bXRkY29yZS5jOjE4MTo4LTE2OiBXQVJOSU5HOiB1c2Ugc2NucHJpbnRmIG9yIHNwcmludGYKPiBk
cml2ZXJzL210ZC9tdGRjb3JlLmM6MTM0OjgtMTY6IFdBUk5JTkc6IHVzZSBzY25wcmludGYgb3Ig
c3ByaW50Zgo+IGRyaXZlcnMvbXRkL210ZGNvcmUuYzoxNzE6OC0xNjogV0FSTklORzogdXNlIHNj
bnByaW50ZiBvciBzcHJpbnRmCgpzZWU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10
ZC9DQUZMeEd2eEM0S3R2dFUycnphX2FHeDJSUE9OeHI3WHlnVXdYQ0RyaVlpQ3I4cU4zcWdAbWFp
bC5nbWFpbC5jb20vCgpQbGVhc2UgZXhwbGFpbiB3aHkgYSBwYXRjaCBpcyBuZWVkZWQgYW5kIHdo
YXQgaXQgZml4ZXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
