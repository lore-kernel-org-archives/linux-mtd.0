Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC5EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 16:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE89E64E8B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 16:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE89E64E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TmrI/qgx11Dqg/nK8Ocwv602lFWakK/5oSKweTbosFI=; b=AaoQWdordPjpizYAJ9MWhF/ghh
	9vvW7lkzXpxccPD1AfYUxmh8qVi0jKPWiOYIvXLrydYe9rohosnzo1Y74RRnc7SKUkzON2Mfl58RZ
	YoSWj00HF9kAqQYDaIiJOyEbPeWD1iRHXhkWU/K7F3dLG6UzOJMymBebEhYKSm+i3PF9NUvMj6GQD
	m9Qo8ML5cX29zat3k9VyQ8EWiX7jdERmJWRXAc2U4N9ydnYE5d3N90J7O1fRYUXWLLNYznMm/D3fO
	iWylWD2uhLYJcLmcNCI+EF/gQWScraswbYCRWajy0vrUDJTtYGm8z0ZVdECRToUtEyYRXnIjZD1LM
	CM6HtmdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAEhg-0006ad-RG; Thu, 11 Feb 2021 16:20:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAEhd-0006aH-0N
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 16:20:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j19so8850047lfr.12
 for <linux-mtd@lists.infradead.org>; Thu, 11 Feb 2021 08:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Klq+8tOZRYNtsr93x0bkE0OFCVkNgyAVAYrNdy6LlIA=;
 b=d7CSuissF1kLdNUvxsyMgjp5L79P0utUtQBK4o6sghIjh+anGrVTlyRDjO+3yLY0B8
 358tEQA5wtuE6d6DK7Pf7JJImbZRLmrMp5KLM8Wcry3sxOpEajJjHAZTnldJptxmuKy5
 gY+vzvpH2qkrZJra0KPAd4/OcxnSULKOKkTt9pastaCUspvfeQdkRl9SYKc8Liygo7Zn
 s/d1lIVUjUoPv78GfoPII1mXUJU/neI6JA/KVWVj7Qj6HYPj6qtNQB6KFGBYd1zGYe0d
 BTIKaf0D5CPMiM4aZJu9MA7wcAAmSxz9NfyhE1ofKmirZosXbNg6olULlD62OKi0+rop
 E26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Klq+8tOZRYNtsr93x0bkE0OFCVkNgyAVAYrNdy6LlIA=;
 b=S8en6S5b47nakmLRPSdcXQDRPIdFHrydQhIVSydX1G1Ou8fsipHdR2MefQ549fFsSP
 qUNQo6wrd7wNCT2tUtVg0SbiaS47aPDmcwqU4WlnBTFAnvR6g8tncZT7iLkj4Plr7TG+
 EyHIDQYc+Lylx6Ce2l0UfxnzojsNCjJqPhWkgssPwkyOMAsl1PK4CRpfP+cht6JCqIsM
 KY4vUZOXuDLma5R2gAnJ/T1Ml19Lan+9kXL+NvDM+yG5h4tU3ypyF9QYw3I7IzJphi7l
 HF9phWrsh7/MhQP8CRFX23Q7W/tCpKX98avqCWO18UCIjz+ah9VVRdqfUXDmi2LyWfXa
 8jSw==
X-Gm-Message-State: AOAM532u6ZCmpG7gO8JqQTgkFbe3T4kwti9c1DL4yALQh/nWseD4SkKi
 D2aljmRpr8miYBOrfOOErbk=
X-Google-Smtp-Source: ABdhPJzAho/xEpXrHRwCUYs5X/XOO5iSDUdCi+OiIBXlAlW8Hmvg9Hr9HuhT0buIhy58eiuXoCZ2Ww==
X-Received: by 2002:a19:6d0a:: with SMTP id i10mr4612142lfc.367.1613060421764; 
 Thu, 11 Feb 2021 08:20:21 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id b5sm685941lfi.3.2021.02.11.08.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 08:20:21 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V2 mtd/next 1/3] dt-bindings: mtd: move partition binding to
 its own file
Date: Thu, 11 Feb 2021 17:20:10 +0100
Message-Id: <20210211162012.27417-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_112025_310013_8578DC4A 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU2luZ2xlIHBhcnRpdGlv
biBiaW5kaW5nIGlzIHF1aXRlIGNvbW1vbiBhbmQgbWF5IGJlOgoxLiBVc2VkIGJ5IG11bHRpcGxl
IHBhcnNlcnMKMi4gRXh0ZW5kZWQgZm9yIG1vcmUgc3BlY2lmaWMgY2FzZXMKCk1vdmUgaXQgdG8g
c2VwYXJhdGVkIGZpbGUgdG8gYXZvaWQgY29kZSBkdXBsaWNhdGlvbi4KClNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRp
dGlvbnMueWFtbCAgICAgIHwgMzMgKy0tLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL3BhcnRpdGlvbi55YW1sICAgIHwgNDcgKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
cGFydGl0aW9uLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFt
bAppbmRleCA2ZDRhMzQ1MGUwNjQuLmVhNGNhY2U2YTk1NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCkBAIC0yNywzOCArMjcsNyBAQCBwcm9wZXJ0aWVzOgog
CiBwYXR0ZXJuUHJvcGVydGllczoKICAgIkBbMC05YS1mXSskIjoKLSAgICBkZXNjcmlwdGlvbjog
bm9kZSBkZXNjcmliaW5nIGEgc2luZ2xlIGZsYXNoIHBhcnRpdGlvbgotICAgIHR5cGU6IG9iamVj
dAotCi0gICAgcHJvcGVydGllczoKLSAgICAgIHJlZzoKLSAgICAgICAgZGVzY3JpcHRpb246IHBh
cnRpdGlvbidzIG9mZnNldCBhbmQgc2l6ZSB3aXRoaW4gdGhlIGZsYXNoCi0gICAgICAgIG1heEl0
ZW1zOiAxCi0KLSAgICAgIGxhYmVsOgotICAgICAgICBkZXNjcmlwdGlvbjogVGhlIGxhYmVsIC8g
bmFtZSBmb3IgdGhpcyBwYXJ0aXRpb24uIElmIG9taXR0ZWQsIHRoZSBsYWJlbAotICAgICAgICAg
IGlzIHRha2VuIGZyb20gdGhlIG5vZGUgbmFtZSAoZXhjbHVkaW5nIHRoZSB1bml0IGFkZHJlc3Mp
LgotCi0gICAgICByZWFkLW9ubHk6Ci0gICAgICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFtZXRl
ciwgaWYgcHJlc2VudCwgaXMgYSBoaW50IHRoYXQgdGhpcyBwYXJ0aXRpb24KLSAgICAgICAgICBz
aG91bGQgb25seSBiZSBtb3VudGVkIHJlYWQtb25seS4gVGhpcyBpcyB1c3VhbGx5IHVzZWQgZm9y
IGZsYXNoCi0gICAgICAgICAgcGFydGl0aW9ucyBjb250YWluaW5nIGVhcmx5LWJvb3QgZmlybXdh
cmUgaW1hZ2VzIG9yIGRhdGEgd2hpY2ggc2hvdWxkCi0gICAgICAgICAgbm90IGJlIGNsb2JiZXJl
ZC4KLSAgICAgICAgdHlwZTogYm9vbGVhbgotCi0gICAgICBsb2NrOgotICAgICAgICBkZXNjcmlw
dGlvbjogRG8gbm90IHVubG9jayB0aGUgcGFydGl0aW9uIGF0IGluaXRpYWxpemF0aW9uIHRpbWUg
KG5vdAotICAgICAgICAgIHN1cHBvcnRlZCBvbiBhbGwgZGV2aWNlcykKLSAgICAgICAgdHlwZTog
Ym9vbGVhbgotCi0gICAgICBzbGMtbW9kZToKLSAgICAgICAgZGVzY3JpcHRpb246IFRoaXMgcGFy
YW1ldGVyLCBpZiBwcmVzZW50LCBhbGxvd3Mgb25lIHRvIGVtdWxhdGUgU0xDIG1vZGUKLSAgICAg
ICAgICBvbiBhIHBhcnRpdGlvbiBhdHRhY2hlZCB0byBhbiBNTEMgTkFORCB0aHVzIG1ha2luZyB0
aGlzIHBhcnRpdGlvbgotICAgICAgICAgIGltbXVuZSB0byBwYWlyZWQtcGFnZXMgY29ycnVwdGlv
bnMKLSAgICAgICAgdHlwZTogYm9vbGVhbgotCi0gICAgcmVxdWlyZWQ6Ci0gICAgICAtIHJlZwor
ICAgICRyZWY6ICJwYXJ0aXRpb24ueWFtbCMiCiAKIHJlcXVpcmVkOgogICAtICIjYWRkcmVzcy1j
ZWxscyIKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLmUxYWMwODA2NDQyNQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFt
bApAQCAtMCwwICsxLDQ3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCMKKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUGFy
dGl0aW9uCisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgYSBzaW5n
bGUgZmxhc2ggcGFydGl0aW9uLiBFYWNoIHBhcnRpdGlvbiBtdXN0IGhhdmUgaXRzCisgIHJlbGF0
aXZlIG9mZnNldCBhbmQgc2l6ZSBzcGVjaWZpZWQuIERlcGVuZGluZyBvbiBwYXJ0aXRpb24gZnVu
Y3Rpb24gZXh0cmEKKyAgcHJvcGVydGllcyBjYW4gYmUgdXNlZC4KKworbWFpbnRhaW5lcnM6Cisg
IC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorCitwcm9wZXJ0aWVzOgorICBy
ZWc6CisgICAgZGVzY3JpcHRpb246IHBhcnRpdGlvbidzIG9mZnNldCBhbmQgc2l6ZSB3aXRoaW4g
dGhlIGZsYXNoCisgICAgbWF4SXRlbXM6IDEKKworICBsYWJlbDoKKyAgICBkZXNjcmlwdGlvbjog
VGhlIGxhYmVsIC8gbmFtZSBmb3IgdGhpcyBwYXJ0aXRpb24uIElmIG9taXR0ZWQsIHRoZSBsYWJl
bAorICAgICAgaXMgdGFrZW4gZnJvbSB0aGUgbm9kZSBuYW1lIChleGNsdWRpbmcgdGhlIHVuaXQg
YWRkcmVzcykuCisKKyAgcmVhZC1vbmx5OgorICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFtZXRl
ciwgaWYgcHJlc2VudCwgaXMgYSBoaW50IHRoYXQgdGhpcyBwYXJ0aXRpb24KKyAgICAgIHNob3Vs
ZCBvbmx5IGJlIG1vdW50ZWQgcmVhZC1vbmx5LiBUaGlzIGlzIHVzdWFsbHkgdXNlZCBmb3IgZmxh
c2gKKyAgICAgIHBhcnRpdGlvbnMgY29udGFpbmluZyBlYXJseS1ib290IGZpcm13YXJlIGltYWdl
cyBvciBkYXRhIHdoaWNoIHNob3VsZAorICAgICAgbm90IGJlIGNsb2JiZXJlZC4KKyAgICB0eXBl
OiBib29sZWFuCisKKyAgbG9jazoKKyAgICBkZXNjcmlwdGlvbjogRG8gbm90IHVubG9jayB0aGUg
cGFydGl0aW9uIGF0IGluaXRpYWxpemF0aW9uIHRpbWUgKG5vdAorICAgICAgc3VwcG9ydGVkIG9u
IGFsbCBkZXZpY2VzKQorICAgIHR5cGU6IGJvb2xlYW4KKworICBzbGMtbW9kZToKKyAgICBkZXNj
cmlwdGlvbjogVGhpcyBwYXJhbWV0ZXIsIGlmIHByZXNlbnQsIGFsbG93cyBvbmUgdG8gZW11bGF0
ZSBTTEMgbW9kZQorICAgICAgb24gYSBwYXJ0aXRpb24gYXR0YWNoZWQgdG8gYW4gTUxDIE5BTkQg
dGh1cyBtYWtpbmcgdGhpcyBwYXJ0aXRpb24KKyAgICAgIGltbXVuZSB0byBwYWlyZWQtcGFnZXMg
Y29ycnVwdGlvbnMKKyAgICB0eXBlOiBib29sZWFuCisKK3JlcXVpcmVkOgorICAtIHJlZworCith
ZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
