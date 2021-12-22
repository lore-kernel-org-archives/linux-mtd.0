Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC0C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oqv8SGPZSeaL/Pw6cc6G/bKeNRGjR9iHoWocTX5NLU=; b=mu8y6UvJQitaEA
	Y+ol8zZuJhyMdpvzi7iQQ1JMyXUtGToRSmQrVFU1xD84nPWF5HSyGieuinj6y7NTFY061nOQYfBGH
	c5P5Gstzjdtv4sZcOuZI1aMrtDR7oDMeapzfygQO7gSqN6bZNFu9JOdMYmsjCz2o7Kd75C9sK8z8l
	KF4Cpglni8EaIf7qrGMUDy79t0OCv+goJRA4TEk8vpV1jJj2uFn6Sm/7TEBdv8V0WvjhXmkFDKS67
	EgWFUEVTQPG2Z99xsVSPkHbh7dGBNgUDmHqxp81vrLzZberTqlGQ+rzILZS1fmtpgRlOs28xQqAP3
	u501Q0Tykqnw7jKpdo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n07DG-00BDih-85; Wed, 22 Dec 2021 19:23:46 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n07D1-00BDft-1A
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 19:23:32 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bt1so7448776lfb.13
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnMHNj6u7HaHgpLVLKeM6nSGjSJw2q61Bxw5Xl/ukmM=;
 b=Xiyb+qLClCl7Pu3HgsGA1CRIe4oxKjaxidZtnc2DhR71a0wt6QbvrsXQ+GkeN3mNQi
 5fjoJyR5RfCHD6wZ8pJlJ2eeVcitm2Rk7YZ/JoFYRcZB715QIj75Mcd1VcneXf/MlA1O
 fuOFY2opBTvmP1vj3T7kn0m+/elI9kwvTx7h1JeV1/Uwxmi7u9UEGBOsv2GfKHV5WsU+
 ckTpY6CigzGd2F9k4GkiZO/Mjex/gL4sJZHj27ygx+brHfevAwIKi7+XgSNAqk71vVmZ
 3uyHorjbfpoCRvzJ20xG90RuyoReVd8URTQn/8UCg5aDQBqwvDq9qa7o3wFMDRNNVBJJ
 yV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnMHNj6u7HaHgpLVLKeM6nSGjSJw2q61Bxw5Xl/ukmM=;
 b=f5+CTihJEe2hQPmznRKnExG+7fqj7qOLge9dYTkBShfW5xmGNAp3225APBKKaqmsbw
 Z7kICG4G3LfFYKTncB+WQki238C6Qs9BOggLMse4jXMhU32vniT4N8okRZq9P2HReEBG
 UZxpCIjUjVBVEuDKj9u1zf3ZdRUCrJuucmRf8fq1EYSgKXwzpxmtWy54D89oR2/OxoMk
 0TUzpKht1D7F3gXt/4gvq/F+zJXiv1kmP5VKsusNiqV5axgRrk4d0RP0bz0EQ4p+YApL
 xXFfJ+jjVGsw2i/H62w293RAS0hoPrtQNrMrT/i8aOSYADKxh8mlY7gyqU+oNUi1c+t7
 +kFA==
X-Gm-Message-State: AOAM533hbzh2lfO292BMezB/c4+bpFsjsSgeTs6iUU+cuRL5bRo6wRii
 LCq9IkyebW6J3RaXOLZKdzk=
X-Google-Smtp-Source: ABdhPJxrlcBFE05Qdt3pla4vKu9cuel8MOEK+s8D2N0uphrADifmn9B4e9V0aEdS4UAho1nrT/S2Jw==
X-Received: by 2002:a05:6512:40d:: with SMTP id
 u13mr3236080lfk.327.1640201009043; 
 Wed, 22 Dec 2021 11:23:29 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id q10sm242070lfm.163.2021.12.22.11.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:23:28 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/3] dt-bindings: nvmem: add U-Boot environment variables
 binding
Date: Wed, 22 Dec 2021 20:23:19 +0100
Message-Id: <20211222192320.21974-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222192320.21974-1-zajec5@gmail.com>
References: <20211222192320.21974-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_112331_110294_8B7F38EA 
X-CRM114-Status: GOOD (  15.70  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBiaW5kaW5nIGFs
bG93cyBkZXNjcmliaW5nIGEgKHBhcnQgb2YpIE1URCBkZXZpY2UgKHBhcnRpdGlvbikgdGhhdApj
b250YWlucyBhIGJsb2NrIHdpdGggZW52aXJvbm1lbnQgdmFyaWFibGVzLiBPcGVyYXRpbmcgc3lz
dGVtIHVzdWFsbHkKbmVlZHMgdG8gcGFyc2UgdGhhdCBibG9jayB0byByZWFkIHZhcmlhYmxlcyB2
YWx1ZXMgdGhhdCBtYXkgYWZmZWN0CmJvb3RpbmcgcHJvY2VzcyAmIGRldmljZSBjb25maWd1cmF0
aW9uLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgot
LS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCB8IDU2ICsr
KysrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA1ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1i
b290LGVudi55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi4wZjgwODg2OGZmZjMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCkBAIC0wLDAgKzEsNTYg
QEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xh
dXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
bnZtZW0vdS1ib290LGVudi55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFi
bGVzCisKK2Rlc2NyaXB0aW9uOiB8CisgIFUtQm9vdCB1c2VzIGVudmlyb25tZW50IHZhcmlhYmxl
cyB0byBzdG9yZSBkZXZpY2UgcGFyYW1ldGVycyBhbmQKKyAgY29uZmlndXJhdGlvbi4gVGhleSBt
YXkgYmUgdXNlZCBmb3IgYm9vdGluZyBwcm9jZXNzLCBzZXR1cCBvciBrZWVwaW5nIGVuZCB1c2Vy
CisgIGludGVyZXN0aW5nIGluZm8uCisKKyAgRGF0YSBpcyBzdG9yZWQgb24gZmxhc2ggcGFydGl0
aW9uIGluIGEgVS1Cb290IHNwZWNpZmljIGZvcm1hdCAoQ1JDMzIgYW5kIE5VTAorICBzZXBhcmF0
ZWQga2V5LXZhbHVlIHBhaXJzKS4KKworICBUaGlzIGJpbmRpbmcgYWxsb3dzIHNwZWNpZnlpbmcg
ZGF0YSBsb2NhdGlvbiBhbmQgZm9ybWF0IChkZWZhdWx0IG9uZSBvciB2ZW5kb3IKKyAgc3BlY2lm
aWMpLgorCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+CisKK2FsbE9mOgorICAtICRyZWY6IG52bWVtLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNv
bXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gdSxib290LGVudgorICAgICAgLSBicmNtLGVu
dgorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZh
bHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAgICAgY29tcGF0
aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHBhcnRpdGlvbkAwIHsKKyAg
ICAgICAgICAgIGxhYmVsID0gInVib290IjsKKyAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxMDAw
MDA+OworCisgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICNz
aXplLWNlbGxzID0gPDE+OworCisgICAgICAgICAgICBudm1lbUAxMDAwMCB7CisgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJ1LGJvb3QsZW52IjsKKyAgICAgICAgICAgICAgICByZWcgPSA8
MHgxMDAwMCAweDEwMDAwPjsKKyAgICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNjc1NTgwOTdiYjY2Li4y
NzFjMjljODRjN2QgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC0xOTYyNCw2ICsxOTYyNCwxMSBAQCBXOglodHRwOi8vbGludXh0di5vcmcKIFQ6CWdpdCBnaXQ6
Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdAogRjoJZHJpdmVycy9tZWRpYS9wY2kvdHc2ODZ4
LwogCitVLUJPT1QgRU5WSVJPTk1FTlQgVkFSSUFCTEVTCitNOglSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+CitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCisKIFVBQ0NFIEFDQ0VMRVJBVE9SIEZS
QU1FV09SSwogTToJWmhhbmdmZWkgR2FvIDx6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZz4KIE06CVpo
b3UgV2FuZyA8d2FuZ3pob3UxQGhpc2lsaWNvbi5jb20+Ci0tIAoyLjMxLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
