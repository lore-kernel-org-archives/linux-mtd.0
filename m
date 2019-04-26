Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A42FC43219
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 15:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A72F206E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 15:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tw2rjHkG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uy1VTQH1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A72F206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LzTFRc8y0KPQzw5Efp37BE/gmbWffO3NbyPCHNzuw+E=; b=Tw2rjHkGncThRt
	58tY5oyEcMwQ9Zz8EgVhRy+zBkU5NmiWGUeBthvDZwr7kZz67J3T1D/sFGhIkc4M5cuqwjhU9kw7A
	GVpQWI5R9jLgXRRtwpHfqTQ36ZvXL7Aa8GY/zFMcGwKTlnBtN1tFizUsgnsl6q0Xo6phoo5Spy2x2
	OGXkq6CoVnWJdpgQtO4XGaWJmu93gHEK7b0Zbijr3k2c4QLMEjbUHq9XZieW2CIB3p20y4FNvTY+K
	CXZDU4afrr3ckahKmlo990ph+S5Jl/9pkvxFV5az0GQpWeTpDny7FKK2XREunQloaEr3Ffkg83INH
	3W1oRHnV5g9C42yl/JZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK2RF-0002Na-N8; Fri, 26 Apr 2019 15:06:57 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK2R9-0002Ih-88
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 15:06:52 +0000
Received: by mail-lf1-x142.google.com with SMTP id i68so2596081lfi.10
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uK1bPzXfoKqtAuaxFD9Fq0QPMIelpERA39QXbQVkvIg=;
 b=Uy1VTQH1+NF1sh+lwHjoPc4Ep9K2d8TefI4IG/PIxokwnNKQ/L2A14hJhvPbRVcoFy
 RpTUAzE5j3sywdjGfCe/nBkE57lXS2tSBxovsAjCbB9pekvm0J4z7f1HjeCE+noUOOh5
 qeFybjLsuVap6L6JCZzbG3xEqymrOvMgtK7sP005PaD/WsrJeKfCB0p3rKfZ5hIc8pYC
 Nr9yeZu9lkGw6P7k+dOMPz79Hykzc3pNiMDkHQDNXA+KrpuCBRPa7gDmFt+ItDECJdsy
 MbtL5Ia6hPxfIxt034pQLeVWG6ykR46S1dp3FMPIWLco1jih118lgV6HbtO5jElM9HjF
 yqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uK1bPzXfoKqtAuaxFD9Fq0QPMIelpERA39QXbQVkvIg=;
 b=TLGS1hm55F9QY9Cc11CJ4H/wk9HRPzuSwzfsFwS6TtIQN8uXuleGFtBDerR/bUR9OR
 BKt2UsYY9i1PqovNFKtXElS867jKWSrN1GISW+Jjh0+mR9rQ+8EbjkELivBRG+CaPrdx
 ZuGZHoDx4cBNVi02ezhF0306ILMYRFMcmmlwuCvy/N60Wbb//GbnXKPp24Qp8L2+tdR5
 Evm0CjlsfFiyjDGgmu3xwTyqCzPHBaZ43bYI3+/fr4hqIvVknz2OHIKHn6kDYEjaIN6U
 5IHgFyFc0WjtexDSZhU+D+lqSvGmW4jEXw2S+MFFZYXBNaIp/ZQydwmYNK99JPfCACrQ
 W1mA==
X-Gm-Message-State: APjAAAUR951pUl5Mv5Vf4TJMmEeFzFfATI9ULfeuKTQ4S15Ha2xKSt1W
 6+YrFW76gS2wXknSSpjkmMM=
X-Google-Smtp-Source: APXvYqzBuRAqCPFkR5+/YMDV+V9w4WpXskZfYfptKWo+v6n34mGJw53MRtyvwLFksaSbZdZwCmtfmA==
X-Received: by 2002:a19:48c9:: with SMTP id
 v192mr24276282lfa.136.1556291208973; 
 Fri, 26 Apr 2019 08:06:48 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id o3sm5636622lfn.41.2019.04.26.08.06.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 08:06:48 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH] mtd: onenand: Add support for 8Gb datasize onenand
Date: Fri, 26 Apr 2019 17:06:34 +0200
Message-Id: <20190426150634.5643-1-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_080651_285221_E107E11D 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, Jonathan Bakker <xc-racer2@live.ca>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogSm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4KClVzZWQgaW4gc2V2ZXJh
bCBTNVBWMjEwLWJhc2VkIEdhbGF4eSBTIGRldmljZXMsIGFtb25nIHRoZW0gU0dILVQ5NTlWLApT
R0gtVDk1OVAsIFNHSC1UODM5LCBhbmQgU1BILUQ3MDAuCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhh
biBCYWtrZXIgPHhjLXJhY2VyMkBsaXZlLmNhPgpTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQ2htaWVs
IDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9v
bmVuYW5kL29uZW5hbmRfYmFzZS5jIHwgMiArKwogaW5jbHVkZS9saW51eC9tdGQvb25lbmFuZF9y
ZWdzLmggICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZl
cnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwppbmRleCA0Y2E0YjE5NGU3ZDcuLmFi
ZGVmMGJkMTM2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRf
YmFzZS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwpAQCAt
MzI2MCw2ICszMjYwLDggQEAgc3RhdGljIHZvaWQgb25lbmFuZF9jaGVja19mZWF0dXJlcyhzdHJ1
Y3QgbXRkX2luZm8gKm10ZCkKIAogCS8qIExvY2sgc2NoZW1lICovCiAJc3dpdGNoIChkZW5zaXR5
KSB7CisJY2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzhHYjoKKwkJdGhpcy0+b3B0aW9ucyB8
PSBPTkVOQU5EX0hBU19OT1BfMTsKIAljYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfNEdiOgog
CQlpZiAoT05FTkFORF9JU19ERFAodGhpcykpCiAJCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRf
SEFTXzJQTEFORTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmRfcmVncy5o
IGIvaW5jbHVkZS9saW51eC9tdGQvb25lbmFuZF9yZWdzLmgKaW5kZXggZDYwMTMwZjg4ZWVkLi45
NjQwZDcwN2NiZjggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmRfcmVncy5o
CisrKyBiL2luY2x1ZGUvbGludXgvbXRkL29uZW5hbmRfcmVncy5oCkBAIC04MCw2ICs4MCw3IEBA
CiAjZGVmaW5lIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMUdiCSgweDAwMykKICNkZWZpbmUgT05F
TkFORF9ERVZJQ0VfREVOU0lUWV8yR2IJKDB4MDA0KQogI2RlZmluZSBPTkVOQU5EX0RFVklDRV9E
RU5TSVRZXzRHYgkoMHgwMDUpCisjZGVmaW5lIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfOEdiCSgw
eDAwNikKIAogLyoKICAqIFZlcnNpb24gSUQgUmVnaXN0ZXIgRjAwMmggKFIpCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
