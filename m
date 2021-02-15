Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061AAC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 09:39:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926D164DF4
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 09:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926D164DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hueyx084s9gWQZ8NTWw26mowPuutVrUv066YBC6ysNI=; b=Tn+Pf0diT5E/thSLJUykQSn5BS
	4aLi4jCt3VrenogDxuABRTQgxr1aAJ/sZV7AqsVE8gAoj80VHqiLggszL1llWOxwahrf1Vl1sboW6
	0el3YhdgB9lzj8Nwa8kSOXOruvfiju68OjqYoKQGq2WZxOGIaNrL6YyQCnkxxxyrLZNVgzjk++OyY
	OiFxGekNKadT2IvgF1G4r8uYXI6DQ2yQpCl/A6gODvPRMKni/zmXUBuFjMunvkCHokL/hZQ5Cx2ke
	+hPV5WDtLL5fay+ACG+5M3jVRCZ1jSurJK3oLuRJixczqfRBZ/Z8EXdUk2My6G7oi62eXmf09/0I3
	r8GhwC9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBaKO-0000b2-Rf; Mon, 15 Feb 2021 09:38:00 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBaKL-0000aY-VK
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 09:37:58 +0000
Received: by mail-lj1-x231.google.com with SMTP id x1so6899069ljj.11
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2021 01:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3ckuPrqHhj+a9wM1FpqARhpl+yXkW6M1ONJjD4HIFU=;
 b=MTsSPieEeX4km2tagPGx8RvLv5f+XB7O2V2K2REq8f/x+EqJW31CA0aYINGF49Di6E
 xylN3jtjbn18pW9Tzfn5iJiAeSRFJTPFJQ+Tj45xqZ7+eOneojyqhsAkhEfINWf6PFUU
 Ug71oVnaT5McTA+cPrYVX2RFwZhW9Jw5XrN+A7qFWOHdRp8oUAYbfCGO3t4NJHRmPUY9
 10vRn/BLgwPDfzL9hzmM7q18UXNJLbb7APR4BLzNoGTeNnL8uI16wFeWRUrfLAnKIUmQ
 XEja8KcjWSKkllNC/k0bteEQfldN54ZdOy3nWKZZg1nzHl5PbxExI4ykabdN0akIbch1
 h9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3ckuPrqHhj+a9wM1FpqARhpl+yXkW6M1ONJjD4HIFU=;
 b=VBCD5SS1T/D/LN8nO3gboq0L3K13nMnbEnjIcib5kiD1qX40SlUBP+CPhVOP1Fn5n/
 WJSQTJ+GIgT1g01EPAz3LyRn2809n8NwkL4RH+35wDmv2YUk3BNR40Lx/HMSgkO82uYM
 L1OOe5GZ69V25KpbICkaj1egqcw2c2VKMlJOXBqzqHVjwkuooo+DooQPkZheR9hhxEI0
 SzVzyU7yO4ZEX8OqBxSc2jXl1OxQmCjsRmnKGGD7wTiPzfHMqy194Gd5m7H/XHzQDh5m
 TAYaEAdt43LroOqlvKR94NzIaXzY729lWgmoQr6hxMjY5kfIzFUq9uusZPBZmt5GCUma
 1TdQ==
X-Gm-Message-State: AOAM533oBJSxZykLTQLPDQpfHZmXqWY/+C7YlAKcQSSft3YE6it9K7de
 3RllXRHNkG3bAOC+WFc1Tjk=
X-Google-Smtp-Source: ABdhPJyrlMXsFhRD4Hwqt37Q625ONHuhehs+5US0UQ2P7CRdqld15xiv38CJ1dOSAsR9o9VVkkCOWQ==
X-Received: by 2002:a2e:730f:: with SMTP id o15mr9360582ljc.145.1613381876281; 
 Mon, 15 Feb 2021 01:37:56 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id i21sm2733258lfe.102.2021.02.15.01.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:37:55 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] mtd: parsers: add MTD_OF_PARTS_BCM4908 config option
Date: Mon, 15 Feb 2021 10:37:40 +0100
Message-Id: <20210215093740.20080-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_043758_147756_6A7E07D2 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKUmlnaHQgbm93IG9mcGFy
dCBwYXJzZXIgZ2V0cyBhbHdheXMgY29tcGlsZWQgd2l0aCB0aGUgQkNNNDkwOCBzdXBwb3J0LgpJ
dCdzIG5vdCBhIGJpZyBpc3N1ZSBhdCB0aGlzIHBvaW50IGFzIEJDTTQ5MDggcGFydGl0aW9uaW5n
IHN1cHBvcnQgY29tZXMKYXQgY2xvc2UtdG8temVybyBjb3N0LiBJdCBtYXkgZGlmZmVyIGZvciBw
b3NzaWJsZSBmdXJ0aGVyIG9mcGFydCBxdWlya3MKdGhvdWdoLgoKTWFrZSBCQ000OTA4IHN1cHBv
cnQgc2VsZWN0YWJsZSB0byBzZXQgYSBjbGVhbiBwYXR0ZXJuIGZvciBhZGRpbmcgZnVydGhlcgpx
dWlya3MuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Ci0tLQpUaGlzIGlzIE5PVCB1cmdlbnQgYW5kIGlzIE5PVCBpbnRlbmRlZCBmb3IgdGhlIDUuMTIu
IFBsZWFzZSByZXZpZXcgdGhpcwpjaGFuZ2UgaW4gYSBmcmVlIG1vbWVudCwgcHJvYmFibHkgYWZ0
ZXIgbWVyZ2Ugd2luZG93IGNsb3Nlcy4KLS0tCiBkcml2ZXJzL210ZC9wYXJzZXJzL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrCiBkcml2ZXJzL210ZC9w
YXJzZXJzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKystCiAuLi4v
cGFyc2Vycy97YmNtNDkwOC1wYXJ0aXRpb25zLmMgPT4gb2ZwYXJ0X2JjbTQ5MDguY30gICB8IDIg
Ky0KIC4uLi9wYXJzZXJzL3tiY200OTA4LXBhcnRpdGlvbnMuaCA9PiBvZnBhcnRfYmNtNDkwOC5o
fSAgIHwgOCArKysrKysrKwogZHJpdmVycy9tdGQvcGFyc2Vycy97b2ZwYXJ0LmMgPT4gb2ZwYXJ0
X2NvcmUuY30gICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgZHJpdmVycy9tdGQvcGFyc2Vycy97YmNtNDkwOC1w
YXJ0aXRpb25zLmMgPT4gb2ZwYXJ0X2JjbTQ5MDguY30gKDk3JSkKIHJlbmFtZSBkcml2ZXJzL210
ZC9wYXJzZXJzL3tiY200OTA4LXBhcnRpdGlvbnMuaCA9PiBvZnBhcnRfYmNtNDkwOC5ofSAoNTIl
KQogcmVuYW1lIGRyaXZlcnMvbXRkL3BhcnNlcnMve29mcGFydC5jID0+IG9mcGFydF9jb3JlLmN9
ICg5OSUpCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9LY29uZmlnIGIvZHJpdmVy
cy9tdGQvcGFyc2Vycy9LY29uZmlnCmluZGV4IGQ5MGMzMDIyOTA1Mi4uMDViNmEyNGNlZGQ4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL0tjb25maWcKKysrIGIvZHJpdmVycy9tdGQv
cGFyc2Vycy9LY29uZmlnCkBAIC02Nyw2ICs2NywxNSBAQCBjb25maWcgTVREX09GX1BBUlRTCiAJ
ICBmbGFzaCBtZW1vcnkgbm9kZSwgYXMgZGVzY3JpYmVkIGluCiAJICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbi50eHQuCiAKK2NvbmZpZyBNVERfT0ZfUEFS
VFNfQkNNNDkwOAorCWJvb2wgIkJDTTQ5MDggcGFydGl0aW9uaW5nIHN1cHBvcnQiCisJZGVwZW5k
cyBvbiBNVERfT0ZfUEFSVFMgJiYgKEFSQ0hfQkNNNDkwOCB8fCBDT01QSUxFX1RFU1QpCisJZGVm
YXVsdCBBUkNIX0JDTTQ5MDgKKwloZWxwCisJICBUaGlzIHByb3ZpZGVzIHBhcnRpdGlvbnMgcGFy
c2VyIGZvciBCQ000OTA4IGZhbWlseSBkZXZpY2VzCisJICB0aGF0IGNhbiBoYXZlIG11bHRpcGxl
ICJmaXJtd2FyZSIgcGFydGl0aW9ucy4gSXQgdGFrZXMgY2FyZSBvZgorCSAgZmluZGluZyBjdXJy
ZW50bHkgdXNlZCBvbmUgYW5kIGJhY2t1cCBvbmVzLgorCiBjb25maWcgTVREX1BBUlNFUl9JTUFH
RVRBRwogCXRyaXN0YXRlICJQYXJzZXIgZm9yIEJDTTk2M1hYIEltYWdlIFRhZyBmb3JtYXQgcGFy
dGl0aW9ucyIKIAlkZXBlbmRzIG9uIEJDTTYzWFggfHwgQk1JUFNfR0VORVJJQyB8fCBDT01QSUxF
X1RFU1QKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvTWFrZWZpbGUgYi9kcml2ZXJz
L210ZC9wYXJzZXJzL01ha2VmaWxlCmluZGV4IGJmNThhNTIyMTczMC4uMmRmZTlmYjYwMmRlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvbXRk
L3BhcnNlcnMvTWFrZWZpbGUKQEAgLTQsNyArNCw4IEBAIG9iai0kKENPTkZJR19NVERfQkNNNDdY
WF9QQVJUUykJCSs9IGJjbTQ3eHhwYXJ0Lm8KIG9iai0kKENPTkZJR19NVERfQkNNNjNYWF9QQVJU
UykJCSs9IGJjbTYzeHhwYXJ0Lm8KIG9iai0kKENPTkZJR19NVERfQ01ETElORV9QQVJUUykJCSs9
IGNtZGxpbmVwYXJ0Lm8KIG9iai0kKENPTkZJR19NVERfT0ZfUEFSVFMpCQkrPSBvZnBhcnQubwot
b2ZwYXJ0LW9ianMJCQkJOj0gYmNtNDkwOC1wYXJ0aXRpb25zLm8KK29mcGFydC15CQkJCSs9IG9m
cGFydF9jb3JlLm8KK29mcGFydC0kKENPTkZJR19NVERfT0ZfUEFSVFNfQkNNNDkwOCkJKz0gb2Zw
YXJ0X2JjbTQ5MDgubwogb2JqLSQoQ09ORklHX01URF9QQVJTRVJfSU1BR0VUQUcpCSs9IHBhcnNl
cl9pbWFnZXRhZy5vCiBvYmotJChDT05GSUdfTVREX0FGU19QQVJUUykJCSs9IGFmcy5vCiBvYmot
JChDT05GSUdfTVREX1BBUlNFUl9UUlgpCQkrPSBwYXJzZXJfdHJ4Lm8KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3BhcnNlcnMvYmNtNDkwOC1wYXJ0aXRpb25zLmMgYi9kcml2ZXJzL210ZC9wYXJz
ZXJzL29mcGFydF9iY200OTA4LmMKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gZHJp
dmVycy9tdGQvcGFyc2Vycy9iY200OTA4LXBhcnRpdGlvbnMuYwpyZW5hbWUgdG8gZHJpdmVycy9t
dGQvcGFyc2Vycy9vZnBhcnRfYmNtNDkwOC5jCmluZGV4IGFjNjlhMjE2OTc2My4uM2NmYTRmNGVj
NTYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ5MDgtcGFydGl0aW9ucy5j
CisrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2JjbTQ5MDguYwpAQCAtMTAsNyArMTAs
NyBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0
aW9ucy5oPgogCi0jaW5jbHVkZSAiYmNtNDkwOC1wYXJ0aXRpb25zLmgiCisjaW5jbHVkZSAib2Zw
YXJ0X2JjbTQ5MDguaCIKIAogI2RlZmluZSBCTFBBUkFNU19GV19PRkZTRVQJCSJOQU5EX1JGU19P
RlMiCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNDkwOC1wYXJ0aXRpb25z
LmggYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9iY200OTA4LmgKc2ltaWxhcml0eSBpbmRl
eCA1MiUKcmVuYW1lIGZyb20gZHJpdmVycy9tdGQvcGFyc2Vycy9iY200OTA4LXBhcnRpdGlvbnMu
aApyZW5hbWUgdG8gZHJpdmVycy9tdGQvcGFyc2Vycy9vZnBhcnRfYmNtNDkwOC5oCmluZGV4IGRm
MjVmMDQ4N2QwYS4uODBmOGMwODY2NDFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJz
L2JjbTQ5MDgtcGFydGl0aW9ucy5oCisrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2Jj
bTQ5MDguaApAQCAtMiw2ICsyLDE0IEBACiAjaWZuZGVmIF9fQkNNNDkwOF9QQVJUSVRJT05TX0gK
ICNkZWZpbmUgX19CQ000OTA4X1BBUlRJVElPTlNfSAogCisjaWZkZWYgQ09ORklHX01URF9PRl9Q
QVJUU19CQ000OTA4CiBpbnQgYmNtNDkwOF9wYXJ0aXRpb25zX3Bvc3RfcGFyc2Uoc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBtdGRfcGFydGl0aW9uICpwYXJ0cywgaW50IG5yX3BhcnRzKTsK
KyNlbHNlCitzdGF0aWMgaW5saW5lIGludCBiY200OTA4X3BhcnRpdGlvbnNfcG9zdF9wYXJzZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzLAorCQkJCQkJ
aW50IG5yX3BhcnRzKQoreworCXJldHVybiAtRU9QTk9UU1VQUDsKK30KKyNlbmRpZgogCiAjZW5k
aWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0LmMgYi9kcml2ZXJzL210
ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20g
ZHJpdmVycy9tdGQvcGFyc2Vycy9vZnBhcnQuYwpyZW5hbWUgdG8gZHJpdmVycy9tdGQvcGFyc2Vy
cy9vZnBhcnRfY29yZS5jCmluZGV4IDZiMjIxZGY4NDAxYy4uMjU4YzA2YTQyMjgzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydC5jCisrKyBiL2RyaXZlcnMvbXRkL3BhcnNl
cnMvb2ZwYXJ0X2NvcmUuYwpAQCAtMTYsNyArMTYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5oPgogCi0jaW5jbHVkZSAiYmNtNDkw
OC1wYXJ0aXRpb25zLmgiCisjaW5jbHVkZSAib2ZwYXJ0X2JjbTQ5MDguaCIKIAogc3RydWN0IGZp
eGVkX3BhcnRpdGlvbnNfcXVpcmtzIHsKIAlpbnQgKCpwb3N0X3BhcnNlKShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwgc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzLCBpbnQgbnJfcGFydHMpOwotLSAK
Mi4yNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
