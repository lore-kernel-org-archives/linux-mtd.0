Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B985C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P52JwI2vJQXPOKtv+Dhm9UqgjS/zMIp0XcKS+j4CujU=; b=RfBLABXYhMqLeW
	5c1trrmK/S1R1oHN7QvpVPo3uvxCF/Wjc8NZp51w7JwAdFo1RXqadQseOVuyQrZA+pRzeUi+J6Q0z
	mdCkFznG9Mq6ZH99p2ZPJ7mYAsVMpGXbhcwUxR5p7KPJnda0mjgvQ2r+uDDFWYclPs6rBCMRxcKNd
	zAxlpNfXwrK+ZW75xNYYeYTv/dGrTKnqCLYSJhAQRS651Sj47CPt4v098chOf/D4+Qw/UQwS+kccF
	pnaCsPs1r32C4vp7/j+RQOINQDX2ZKKt6baP00lg2mGM2Sgzf1dQVuBUmli5tSw3cR074Jsryy9px
	qJzfcrikYoj8Qt7gtvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmDk-00484J-6U; Thu, 16 Dec 2021 08:34:36 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmDg-00482H-AG
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 08:34:33 +0000
Received: by mail-lj1-x236.google.com with SMTP id m12so37352674ljj.6
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 00:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bJOl4JkalmkkKaSfxJZNe6fs4zRAwFffrMK7a1d+U4I=;
 b=jnhRuiTbeU78C+OUofudoXlAy+jqgmR5VIGlzVM8fTZAVSAKBHcOURAxvOgeHA6w9D
 vMiaDZldxfTYBiw//2OLgy5H+ry3YJjMV2pFLRke2Xb/8r3zy50csfnFxqGvQpUhOgaj
 kdZUbuPncKGBnHwsT85SvH3nZT/ho+bVtQWio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bJOl4JkalmkkKaSfxJZNe6fs4zRAwFffrMK7a1d+U4I=;
 b=xzbW3RXjWf6J/h1abJ8u4sT+JvFg2pGW0VyssSxSRR3HC83bvbEFVIBP14co4jseAW
 wO3pNucMR/GhjVCPRYcJm6KsYTmzAEuTpGI+l9hNk2j2A6/3vfO5bigbvYHxkTAyYiKz
 0Oy+O7W0IejtKNofEiTxZkUtmxI3i8ySC+ncRszXTjHKa1TF8MozwAbQUUID9/b7OJjX
 vyN1FODPiDk+zx03x9iJyLyjWBpwdqlxy1YOm89dBLuzI7gK115MB5INl3B3qJXwVifS
 Lo9CEy/0CSNGE4oI9SaYeDfMr41eoveyfPLN9GcMEzu2heVXKIlN5WoJhw5VcM2YG0zH
 J8fw==
X-Gm-Message-State: AOAM530qfVFW2P9nqOtTZn8g+rfpjTfYaYKGcKttfPKjJIhClwVjGVig
 6qnUF6/8Xt5lnC2MWAfqbTl6Eg==
X-Google-Smtp-Source: ABdhPJxpEdkTJ7XAiaDmXTExNTDlhMnD5luYX0j+GFWk6L3K2/pqWTO+l2yYKH4qUJ6zfUrwOm1bzw==
X-Received: by 2002:a05:651c:106a:: with SMTP id
 y10mr14313443ljm.455.1639643669994; 
 Thu, 16 Dec 2021 00:34:29 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id c2sm985679ljf.50.2021.12.16.00.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:34:29 -0800 (PST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] mtdchar: add MEMREAD ioctl
Date: Thu, 16 Dec 2021 09:34:13 +0100
Message-Id: <20211216083418.13512-1-kernel@kempniu.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_003432_456752_CAAF4A5D 
X-CRM114-Status: GOOD (  11.20  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIG5ldyBtdGRjaGFyIGlvY3RsLCBNRU1SRUFELiAgSXRz
IHB1cnBvc2UgaXMgdG8Kc2VydmUgYXMgYSByZWFkIGNvdW50ZXJwYXJ0IG9mIHRoZSBNRU1XUklU
RSBpb2N0bCwgZXhwb3NpbmcgYSBicm9hZGVyCnNldCBvZiBjYXBhYmlsaXRpZXMgZm9yIHJlYWQg
b3BlcmF0aW9ucyAoZS5nLiB1c2Ugb2YgTVREX09QU19BVVRPX09PQiwKYWNjZXNzIHRvIEVDQyBz
dGF0aXN0aWNzKSB0byB1c2VyLXNwYWNlIGFwcGxpY2F0aW9ucyBtYWtpbmcgdXNlIG9mIE1URApk
ZXZpY2VzIHZpYSAvZGV2L210ZCogY2hhcmFjdGVyIGRldmljZXMuCgpDaGFuZ2VzIGZyb20gdjE6
CgogIC0gQWRkZWQgcGF0Y2hlcyAyLTUgd2hpY2ggZW5hYmxlIHRoZSBuZXcgTUVNUkVBRCBpb2N0
bCB0byByZXBvcnQgRUNDCiAgICBzdGF0aXN0aWNzIGZvciB0aGUgcmVhZCBvcGVyYXRpb24gYmFj
ayB0byB1c2VyIHNwYWNlLiAgKFRoZXJlIGFyZQogICAgb2J2aW91c2x5IGRpZmZlcmVudCB3YXlz
IHRoZXNlIGNoYW5nZXMgY2FuIGJlIHNwbGl0IHVwIGludG8gc2VwYXJhdGUKICAgIGNvbW1pdHM7
IEkgd2FzIGFpbWluZyBmb3IgbWF4aW11bSBlYXNlIG9mIHJldmlldy4pCgogIC0gVGhlICdyZXRs
ZW4nIGFuZCAnb29icmV0bGVuJyBmaWVsZHMgd2VyZSBub3Qgc2V0IGluIHRoZSBzdHJ1Y3QKICAg
IG10ZF9yZWFkX3JlcSByZXR1cm5lZCB0byB1c2Vyc3BhY2UuICBUaGlzIHdhcyBkb25lIHByb3Bl
cmx5IGluCiAgICBCb3Jpcycgb3JpZ2luYWwgZHJhZnQgcGF0Y2ggWzFdLCBidXQgSSBtaXNzZWQg
aXQgaW4gbXkgdjEuCgogIC0gSW52YWxpZCBJU19FUlIoKSBjaGVja3Mgd2VyZSByZXBsYWNlZCB3
aXRoIE5VTEwgY2hlY2tzLiAgVGhpcyB3YXMgYW4KICAgIGFydGlmYWN0IG9mIGNvcHktcGFzdGlu
ZyBtdGRjaGFyX3dyaXRlX2lvY3RsKCkgaW4gdjE6IHVubGlrZQogICAgbWVtZHVwX3VzZXIoKSB1
c2VkIHRoZXJlaW4sIGttYWxsb2MoKSBhbHdheXMgcmV0dXJucyBOVUxMIG9uIGVycm9yLgoKICAt
IE1pbm9yIHN1YmplY3QgcHJlZml4IGFkanVzdG1lbnQgZm9yIHBhdGNoIDEvNSAoIm10ZCIgLT4g
Im10ZGNoYXIiKS4KClsxXSBodHRwczovL3d3dy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51
eC1tdGQvMjAxNi1BcHJpbC8wNjcxODcuaHRtbAoKTWljaGHFgiBLxJlwaWXFhCAoNSk6CiAgbXRk
Y2hhcjogYWRkIE1FTVJFQUQgaW9jdGwKICBtdGQ6IHRyYWNrIG1heGltdW0gbnVtYmVyIG9mIGJp
dGZsaXBzIGZvciBlYWNoIHJlYWQgcmVxdWVzdAogIG10ZDogYWx3YXlzIGluaXRpYWxpemUgJ3N0
YXRzJyBpbiBzdHJ1Y3QgbXRkX29vYl9vcHMKICBtdGQ6IGFkZCBFQ0MgZXJyb3IgYWNjb3VudGlu
ZyBmb3IgZWFjaCByZWFkIHJlcXVlc3QKICBtdGRjaGFyOiBleHRlbmQgTUVNUkVBRCBpb2N0bCB0
byByZXR1cm4gRUNDIHN0YXRpc3RpY3MKCiBkcml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmMgICAg
ICAgICAgICAgfCAgIDggKysKIGRyaXZlcnMvbXRkL2luZnRsY29yZS5jICAgICAgICAgICAgICAg
ICB8ICAgNiArLQogZHJpdmVycy9tdGQvbXRkY2hhci5jICAgICAgICAgICAgICAgICAgIHwgMTM2
ICsrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9tdGQvbXRkY29yZS5jICAgICAgICAg
ICAgICAgICAgIHwgICA1ICsKIGRyaXZlcnMvbXRkL210ZHN3YXAuYyAgICAgICAgICAgICAgICAg
ICB8ICAgNiArLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIHwgIDE2
ICsrLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgIHwgICAyICstCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICAgICAgfCAgMTAgKysKIGRyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfYmJ0LmMgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc21fY29tbW9uLmMgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9j
b3JlLmMgICAgICAgICAgICAgfCAgMTAgKysKIGRyaXZlcnMvbXRkL25mdGxjb3JlLmMgICAgICAg
ICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvc21fZnRsLmMgICAgICAgICAgICAgICAg
ICAgIHwgICA0ICstCiBkcml2ZXJzL210ZC9zc2ZkYy5jICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KIGRyaXZlcnMvbXRkL3Rlc3RzL25hbmRiaXRlcnJzLmMgICAgICAgICB8ICAgMiArLQog
ZHJpdmVycy9tdGQvdGVzdHMvb29idGVzdC5jICAgICAgICAgICAgIHwgICA4ICstCiBkcml2ZXJz
L210ZC90ZXN0cy9yZWFkdGVzdC5jICAgICAgICAgICAgfCAgIDIgKy0KIGZzL2pmZnMyL3didWYu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogaW5jbHVkZS9saW51eC9tdGQvbXRk
LmggICAgICAgICAgICAgICAgIHwgICA3ICsrCiBpbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCAg
ICAgICAgICAgICAgfCAgNjQgKysrKysrKysrKy0KIDIwIGZpbGVzIGNoYW5nZWQsIDI3NiBpbnNl
cnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
