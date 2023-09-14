Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA314EDE983
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kF0bLr8nfZn+Ml9jUDULpm0xMDSbrS+HsAtRWq3HvnE=; b=mux1FhwJJtgXla
	rpPcFLlqBJnUzg4h8NKe8BdbDKmpkIZuUNm2/oxlRjPeQYEvIa7iY6pELiDSUvnqdQflfIm3XRu0q
	P6SkEX13Q/mcb5XHiZM+u9gtMw6LcvdZTdSkqiHuhAfSWijN7/Z9m3DLxKRPZao6IjexuNgtBNwFd
	X6OWleNTb/GV3K5/7EhpxY4w3HCJ8QYZI9RPPTL/+lQ0fv+D4P5+1iUeg1HXLmiVvZtud9t/ORWOu
	Y+DHFbQ8REhXcHrY0lt+uClsSZZ39Zt1A8/XBnkWEkEp1rbetc9CUOwZRLCW2XIvprg/Qi+760VQb
	RSyqHO2o5bmPFa3VnVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggAZ-007Y5D-2R;
	Thu, 14 Sep 2023 06:49:43 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggAW-007Y4L-1i;
	Thu, 14 Sep 2023 06:49:42 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bfb12b24e5so9284261fa.0;
        Wed, 13 Sep 2023 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694674176; x=1695278976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLt56x/+byFP2a42jCI16rLI5Oh2/81pcuquOpoEQwU=;
        b=BrWprnoysZ+qU/d4GNicXSoIWc2GAlSCkQpMFD6X6hw+EU0MDCi9TVHTVHSV8nQwn8
         Sw4NnaTiHuEQbqhBZ+rg9vCtU2IrNQdXwhU8yjUoxDWFZ1Swvg7NS46LZ58gl8tAbRQs
         NKZhC0tcLvqosn3XiBLKkxEq+d+zo5og+/SIyc6e5GKX0p0BWP2deVAK4SPKc3CHK5Ah
         rtnXrXjgEIeoaQCgCMZTu2dwv7GC/8m/DxgLf1HXRIxyXVEBAiCQqF/ZPI6Rs4eDmtt8
         C0bGJI2xS1dBUkUgCPY+4Ah7MxX9t3Dnujf2L5leLM8F8LXNWK23xFMr5g1I1Ifg10Iw
         FdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694674176; x=1695278976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLt56x/+byFP2a42jCI16rLI5Oh2/81pcuquOpoEQwU=;
        b=RzqohgOq4tS66DdPtcwIW9iPT8dJmEO3uYVKAPr1/c/HBvvnbJvCBM/zw6FUbb3gVp
         UGokbXfmSEDWtge/zvi8+LrIDAHSwlXsk30D/3yNW7Gu44JYAhDg/MkW9Oa7PGASDfbR
         qMIxqRrScHRZcHc42J6Ymp/0DHIKc6s+o7DIFU4UTCDjvHBWoEgGWDqRgW1rpi6OJ1z8
         EcpJNtv82xuPGXAczvogz1hmzSl4QTVodVRPlaPLOv81TPwhYcMIkgh+07hK24OZzCyG
         r80YnSZ79skC2gUnKc5ReFxb09EKiTCs2ACXCF5zxSf2MDBkIUVdiqE+jWQtfDk72MQP
         YQ3w==
X-Gm-Message-State: AOJu0YySehsRjaMir+Qj4oybcY5OKtJHUFi2qrlTx9g/onAeTFnLBboh
	JHUU8vHfpx6bQG9NjyZT0gU=
X-Google-Smtp-Source: AGHT+IGmZW4nrpil9KXEo+bbhmVfahNQoU3dZnFCrmBmZD4hG2m18HihW7kyboCIQAU1X8pIArdHsA==
X-Received: by 2002:a2e:8850:0:b0:2bb:c22a:f28c with SMTP id z16-20020a2e8850000000b002bbc22af28cmr4775114ljj.32.1694674175493;
        Wed, 13 Sep 2023 23:49:35 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id l4-20020a2e7004000000b002b9f0b25ff6sm159739ljc.4.2023.09.13.23.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:49:35 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
Date: Thu, 14 Sep 2023 08:49:22 +0200
Message-Id: <20230914064922.3986-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_234940_591490_1C37B1E4 
X-CRM114-Status: GOOD (  19.26  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBkcml2ZXIgdXNl
cyBNTUlPIGFjY2VzcyBmb3IgcmVhZGluZyBOVlJBTSBmcm9tIGEgZmxhc2ggZGV2aWNlLgpVbmRl
cm5lYXRoIHRoZXJlIGlzIGEgZmxhc2ggY29udHJvbGxlciB0aGF0IHJlYWRzIGRhdGEgYW5kIHBy
b3ZpZGVzCm1hcHBpbmcgd2luZG93LgoKVXNpbmcgTU1JTyBpbnRlcmZhY2UgYWZmZWN0cyBjb250
cm9sbGVyIGNvbmZpZ3VyYXRpb24gYW5kIG1heSBicmVhayByZWFsCmNvbnRyb2xsZXIgZHJpdmVy
LiBJdCB3YXMgcmVwb3J0ZWQgYnkgbXVsdGlwbGUgdXNlcnMgb2YgZGV2aWNlcyB3aXRoCk5WUkFN
IHN0b3JlZCBvbiBOQU5ELgoKTW9kaWZ5IGRyaXZlciB0byByZWFkICYgY2FjaGUgYWxsIE5WUkFN
IGNvbnRlbnQgZHVyaW5nIGluaXQgYW5kIHVzZSB0aGF0CmNvcHkgdG8gcHJvdmlkZSBOVk1FTSBk
YXRhIHdoZW4gcmVxdWVzdGVkLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bXRkL0NBQ25hNnJ3ZjNfOVFWalljTSs4NDdiaVRYPUswRW9XWHVYY1NNa0pPMVZ5XzV2bVZxQUBt
YWlsLmdtYWlsLmNvbS8KQ2M6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4K
Q2M6IEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPgpDYzog
U2NvdHQgQnJhbmRlbiA8c2NvdHQuYnJhbmRlbkBicm9hZGNvbS5jb20+ClNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL252bWVtL2Jy
Y21fbnZyYW0uYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9udm1lbS9icmNtX252cmFtLmMgYi9kcml2ZXJzL252bWVtL2JyY21fbnZy
YW0uYwppbmRleCA5NzM3MTA0ZjNiNzYuLmNmYzFjNDg1ZTIwYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9udm1lbS9icmNtX252cmFtLmMKKysrIGIvZHJpdmVycy9udm1lbS9icmNtX252cmFtLmMKQEAg
LTE5LDcgKzE5LDggQEAKIAogc3RydWN0IGJyY21fbnZyYW0gewogCXN0cnVjdCBkZXZpY2UgKmRl
djsKLQl2b2lkIF9faW9tZW0gKmJhc2U7CisJdWludDhfdCAqZGF0YTsKKwlzaXplX3Qgc2l6ZTsK
IAlzdHJ1Y3QgbnZtZW1fY2VsbF9pbmZvICpjZWxsczsKIAlpbnQgbmNlbGxzOwogfTsKQEAgLTM2
LDEwICszNyw4IEBAIHN0YXRpYyBpbnQgYnJjbV9udnJhbV9yZWFkKHZvaWQgKmNvbnRleHQsIHVu
c2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwKIAkJCSAgIHNpemVfdCBieXRlcykKIHsKIAlz
dHJ1Y3QgYnJjbV9udnJhbSAqcHJpdiA9IGNvbnRleHQ7Ci0JdTggKmRzdCA9IHZhbDsKIAotCXdo
aWxlIChieXRlcy0tKQotCQkqZHN0KysgPSByZWFkYihwcml2LT5iYXNlICsgb2Zmc2V0KyspOwor
CW1lbWNweSh2YWwsIHByaXYtPmRhdGEgKyBvZmZzZXQsIGJ5dGVzKTsKIAogCXJldHVybiAwOwog
fQpAQCAtNjgsNyArNjcsMTIgQEAgc3RhdGljIGludCBicmNtX252cmFtX2FkZF9jZWxscyhzdHJ1
Y3QgYnJjbV9udnJhbSAqcHJpdiwgdWludDhfdCAqZGF0YSwKIHsKIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBwcml2LT5kZXY7CiAJY2hhciAqdmFyLCAqdmFsdWUsICplcTsKKwl1aW50OF90IHRtcDsK
IAlpbnQgaWR4OworCWludCBlcnIgPSAwOworCisJdG1wID0gcHJpdi0+ZGF0YVtsZW4gLSAxXTsK
Kwlwcml2LT5kYXRhW2xlbiAtIDFdID0gJ1wwJzsKIAogCXByaXYtPm5jZWxscyA9IDA7CiAJZm9y
ICh2YXIgPSBkYXRhICsgc2l6ZW9mKHN0cnVjdCBicmNtX252cmFtX2hlYWRlcik7CkBAIC03OCw4
ICs4MiwxMCBAQCBzdGF0aWMgaW50IGJyY21fbnZyYW1fYWRkX2NlbGxzKHN0cnVjdCBicmNtX252
cmFtICpwcml2LCB1aW50OF90ICpkYXRhLAogCX0KIAogCXByaXYtPmNlbGxzID0gZGV2bV9rY2Fs
bG9jKGRldiwgcHJpdi0+bmNlbGxzLCBzaXplb2YoKnByaXYtPmNlbGxzKSwgR0ZQX0tFUk5FTCk7
Ci0JaWYgKCFwcml2LT5jZWxscykKLQkJcmV0dXJuIC1FTk9NRU07CisJaWYgKCFwcml2LT5jZWxs
cykgeworCQllcnIgPSAtRU5PTUVNOworCQlnb3RvIG91dDsKKwl9CiAKIAlmb3IgKHZhciA9IGRh
dGEgKyBzaXplb2Yoc3RydWN0IGJyY21fbnZyYW1faGVhZGVyKSwgaWR4ID0gMDsKIAkgICAgIHZh
ciA8IChjaGFyICopZGF0YSArIGxlbiAmJiAqdmFyOwpAQCAtOTEsOCArOTcsMTAgQEAgc3RhdGlj
IGludCBicmNtX252cmFtX2FkZF9jZWxscyhzdHJ1Y3QgYnJjbV9udnJhbSAqcHJpdiwgdWludDhf
dCAqZGF0YSwKIAkJdmFsdWUgPSBlcSArIDE7CiAKIAkJcHJpdi0+Y2VsbHNbaWR4XS5uYW1lID0g
ZGV2bV9rc3RyZHVwKGRldiwgdmFyLCBHRlBfS0VSTkVMKTsKLQkJaWYgKCFwcml2LT5jZWxsc1tp
ZHhdLm5hbWUpCi0JCQlyZXR1cm4gLUVOT01FTTsKKwkJaWYgKCFwcml2LT5jZWxsc1tpZHhdLm5h
bWUpIHsKKwkJCWVyciA9IC1FTk9NRU07CisJCQlnb3RvIG91dDsKKwkJfQogCQlwcml2LT5jZWxs
c1tpZHhdLm9mZnNldCA9IHZhbHVlIC0gKGNoYXIgKilkYXRhOwogCQlwcml2LT5jZWxsc1tpZHhd
LmJ5dGVzID0gc3RybGVuKHZhbHVlKTsKIAkJcHJpdi0+Y2VsbHNbaWR4XS5ucCA9IG9mX2dldF9j
aGlsZF9ieV9uYW1lKGRldi0+b2Zfbm9kZSwgcHJpdi0+Y2VsbHNbaWR4XS5uYW1lKTsKQEAgLTEw
NSw0MCArMTEzLDMyIEBAIHN0YXRpYyBpbnQgYnJjbV9udnJhbV9hZGRfY2VsbHMoc3RydWN0IGJy
Y21fbnZyYW0gKnByaXYsIHVpbnQ4X3QgKmRhdGEsCiAJCX0KIAl9CiAKLQlyZXR1cm4gMDsKK291
dDoKKwlwcml2LT5kYXRhW2xlbiAtIDFdID0gdG1wOworCXJldHVybiBlcnI7CiB9CiAKIHN0YXRp
YyBpbnQgYnJjbV9udnJhbV9wYXJzZShzdHJ1Y3QgYnJjbV9udnJhbSAqcHJpdikKIHsKKwlzdHJ1
Y3QgYnJjbV9udnJhbV9oZWFkZXIgKmhlYWRlciA9IChzdHJ1Y3QgYnJjbV9udnJhbV9oZWFkZXIg
Kilwcml2LT5kYXRhOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IHByaXYtPmRldjsKLQlzdHJ1Y3Qg
YnJjbV9udnJhbV9oZWFkZXIgaGVhZGVyOwotCXVpbnQ4X3QgKmRhdGE7CiAJc2l6ZV90IGxlbjsK
IAlpbnQgZXJyOwogCi0JbWVtY3B5X2Zyb21pbygmaGVhZGVyLCBwcml2LT5iYXNlLCBzaXplb2Yo
aGVhZGVyKSk7Ci0KLQlpZiAobWVtY21wKGhlYWRlci5tYWdpYywgTlZSQU1fTUFHSUMsIDQpKSB7
CisJaWYgKG1lbWNtcChoZWFkZXItPm1hZ2ljLCBOVlJBTV9NQUdJQywgNCkpIHsKIAkJZGV2X2Vy
cihkZXYsICJJbnZhbGlkIE5WUkFNIG1hZ2ljXG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQog
Ci0JbGVuID0gbGUzMl90b19jcHUoaGVhZGVyLmxlbik7Ci0KLQlkYXRhID0ga3phbGxvYyhsZW4s
IEdGUF9LRVJORUwpOwotCWlmICghZGF0YSkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQltZW1jcHlf
ZnJvbWlvKGRhdGEsIHByaXYtPmJhc2UsIGxlbik7Ci0JZGF0YVtsZW4gLSAxXSA9ICdcMCc7Ci0K
LQllcnIgPSBicmNtX252cmFtX2FkZF9jZWxscyhwcml2LCBkYXRhLCBsZW4pOwotCWlmIChlcnIp
IHsKLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGNlbGxzOiAlZFxuIiwgZXJyKTsKLQkJ
cmV0dXJuIGVycjsKKwlsZW4gPSBsZTMyX3RvX2NwdShoZWFkZXItPmxlbik7CisJaWYgKGxlbiA+
IHByaXYtPnNpemUpIHsKKwkJZGV2X2VycihkZXYsICJOVlJBTSBsZW5ndGggKCV6ZCkgZXhjZWVk
cyBtYXBwZWQgc2l6ZSAoJXpkKVxuIiwgbGVuLCBwcml2LT5zaXplKTsKKwkJcmV0dXJuIC1FSU5W
QUw7CiAJfQogCi0Ja2ZyZWUoZGF0YSk7CisJZXJyID0gYnJjbV9udnJhbV9hZGRfY2VsbHMocHJp
diwgcHJpdi0+ZGF0YSwgbGVuKTsKKwlpZiAoZXJyKQorCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0
byBhZGQgY2VsbHM6ICVkXG4iLCBlcnIpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xNTAsOCArMTUw
LDkgQEAgc3RhdGljIGludCBicmNtX252cmFtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJCS5yZWdfcmVhZCA9IGJyY21fbnZyYW1fcmVhZCwKIAl9OwogCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZwZGV2LT5kZXY7Ci0Jc3RydWN0IHJlc291cmNlICpyZXM7CiAJc3RydWN0IGJy
Y21fbnZyYW0gKnByaXY7CisJc3RydWN0IHJlc291cmNlICpyZXM7CisJdm9pZCBfX2lvbWVtICpi
YXNlOwogCWludCBlcnI7CiAKIAlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpwcml2
KSwgR0ZQX0tFUk5FTCk7CkBAIC0xNTksMjEgKzE2MCwyOSBAQCBzdGF0aWMgaW50IGJyY21fbnZy
YW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0dXJuIC1FTk9NRU07
CiAJcHJpdi0+ZGV2ID0gZGV2OwogCi0JcHJpdi0+YmFzZSA9IGRldm1fcGxhdGZvcm1fZ2V0X2Fu
ZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZXMpOwotCWlmIChJU19FUlIocHJpdi0+YmFz
ZSkpCi0JCXJldHVybiBQVFJfRVJSKHByaXYtPmJhc2UpOworCWJhc2UgPSBkZXZtX3BsYXRmb3Jt
X2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwLCAmcmVzKTsKKwlpZiAoSVNfRVJSKGJh
c2UpKQorCQlyZXR1cm4gUFRSX0VSUihiYXNlKTsKKworCXByaXYtPnNpemUgPSByZXNvdXJjZV9z
aXplKHJlcyk7CisKKwlwcml2LT5kYXRhID0gZGV2bV9remFsbG9jKGRldiwgcHJpdi0+c2l6ZSwg
R0ZQX0tFUk5FTCk7CisJaWYgKCFwcml2LT5kYXRhKQorCQlyZXR1cm4gLUVOT01FTTsKKworCW1l
bWNweV9mcm9taW8ocHJpdi0+ZGF0YSwgYmFzZSwgcHJpdi0+c2l6ZSk7CiAKIAllcnIgPSBicmNt
X252cmFtX3BhcnNlKHByaXYpOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKLQliY200N3h4
X252cmFtX2luaXRfZnJvbV9pb21lbShwcml2LT5iYXNlLCByZXNvdXJjZV9zaXplKHJlcykpOwor
CWJjbTQ3eHhfbnZyYW1faW5pdF9mcm9tX2lvbWVtKGJhc2UsIHByaXYtPnNpemUpOwogCiAJY29u
ZmlnLmRldiA9IGRldjsKIAljb25maWcuY2VsbHMgPSBwcml2LT5jZWxsczsKIAljb25maWcubmNl
bGxzID0gcHJpdi0+bmNlbGxzOwogCWNvbmZpZy5wcml2ID0gcHJpdjsKLQljb25maWcuc2l6ZSA9
IHJlc291cmNlX3NpemUocmVzKTsKKwljb25maWcuc2l6ZSA9IHByaXYtPnNpemU7CiAKIAlyZXR1
cm4gUFRSX0VSUl9PUl9aRVJPKGRldm1fbnZtZW1fcmVnaXN0ZXIoZGV2LCAmY29uZmlnKSk7CiB9
Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
