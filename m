Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97CAC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mDcenedIKo84kmmCFcahHZKbWbedWQZMObI7rSrYgk=; b=tZyOf2NKXAswfJ
	2SldP0ghgI0vGP+8f/bjgJj8Bh4gfIf/ZJA82ww6NLxgGBt0HZooyiXstKzWxKrJY4cJwgazZfSwS
	VbhkOEsZfoYrqYPU76JYTJPm8HdyI3YRRtn8IYEyXN2p1yV/aAsOfdncGpCODC5xyKIzCrpuh6wI+
	WEwYNpYjUv1wKJhdXbOTtIfR/CV+Kb4ot32Y0NkX7eYqTzkbvwicBX5b+Arc90cG4LlTjJkhVedZO
	bH8GWzMAQgwFinrVLDm28e6p0GAR534/TR5D0E9vCUuBfnB5GzZi8wtW6wl7qmlmM1+Dy4xBgfHmY
	qJlBdNXzqV9AJfs5u7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5O-00EyuM-2M;
	Tue, 19 Dec 2023 17:40:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5G-00EyoO-1g;
	Tue, 19 Dec 2023 17:40:48 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e33fe3856so3429770e87.1;
        Tue, 19 Dec 2023 09:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703007642; x=1703612442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ycf7wNvbkEl/9uPO9wSLuwfT5/8x2RoUUgzU3Md07E=;
        b=hHb1DOCYpF9Wrkv+flZMYJtzTlIaYA63Pnb5u3fnDkl+T0U+VHLwdRqE7xKPN7iouv
         tBuY7EOzP36T/5/sCHs9r+U0q8i3NQUJgWGvoCsjw7DWKxWnWlzdcfH1iEFJJaVhI5Zn
         kYm4/OegU7yXmjhHbDRF4kY8iMOJ1ueyoPrE5+bUuX2+PwlfzFOFcqX7+Az/hNHJIAo4
         l/QHHGwuYYBnDvdyTGheOAT7owlkvsM2dINh21I6JqniNNONuirqu4OUAQ5PE65GFsMY
         CPetrz0/HT0wnfCBihEl0pSfd9uGXYYfzZs28qhpVh0AXtaf78QmEM2SFsiiMzsg+aQ0
         ofJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007642; x=1703612442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ycf7wNvbkEl/9uPO9wSLuwfT5/8x2RoUUgzU3Md07E=;
        b=tVZmLOPoO6ec4ZvFa6m9jGf2HOBhzjZ9WLUUQb/RdtUjnJGYf1FHs8AeNmcrDUDvsU
         hOZwJYymf/7mtjHAdm1YY7IukdX2G8M4J0DHmFPwYAW3T71uK/5C9QrJuc8xwWk/4Qz5
         PIbFsheskublVE2LP5vwUhw/nPhvWAq3FUtFbyo+T18DRWVEPerikgNUQlfm44GLNQni
         TVTEzoxw6IhWyBDEzHr4zEFzk6m14zBcnQCmNMJDSo4MjfQXa+ykbYXN6fTc29AdahmC
         yf56/dotj8NQcrfH+hDkJCoAfWq7dtrYXYYFf63xy/raBbnAc8Y7hJf6o00CDnJz85cK
         elDw==
X-Gm-Message-State: AOJu0YxThEs5TjJ7UDX62X7oP510eRRwnElNY/2N2ir5rDzvIIybn/Ub
	SvEa/GXVtMCrvh58o6w5JII=
X-Google-Smtp-Source: AGHT+IFXWlg0Ca+Iule8+3trpaH6T9SLCyaiFa3AwNwMzBt2EkWWzlZdV/VpHBJalreP4HGa4oqWtA==
X-Received: by 2002:ac2:4e11:0:b0:50b:eadf:f175 with SMTP id e17-20020ac24e11000000b0050beadff175mr6460266lfr.91.1703007642136;
        Tue, 19 Dec 2023 09:40:42 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id tx27-20020a1709078e9b00b00a1c85124b08sm15834840ejc.94.2023.12.19.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:40:41 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 3/5] nvmem: u-boot-env: use more nvmem subsystem helpers
Date: Tue, 19 Dec 2023 18:40:23 +0100
Message-Id: <20231219174025.15228-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231219174025.15228-1-zajec5@gmail.com>
References: <20231219174025.15228-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094046_562678_D095E2D8 
X-CRM114-Status: GOOD (  20.53  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKMS4gVXNlIG52bWVtX2Rl
dl9zaXplKCkgYW5kIG52bWVtX2RldmljZV9yZWFkKCkgdG8gbWFrZSB0aGlzIGRyaXZlciBsZXNz
CiAgIG10ZCBkZXBlbmRlbnQKMi4gVXNlIG52bWVtX2FkZF9vbmVfY2VsbCgpIHRvIHNpbXBsaWZ5
IGFkZGluZyBOVk1FTSBjZWxscwoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KLS0tClYyOiBEb24ndCBpbnRyb2R1Y2UgbWVtbGVhayB3aGVuIGhhbmRsaW5n
IG52bWVtX2RldmljZV9yZWFkKCkgZmFpbHVyZXMKCiBkcml2ZXJzL252bWVtL3UtYm9vdC1lbnYu
YyB8IDc4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9udm1lbS91LWJvb3QtZW52LmMgYi9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYwppbmRl
eCBjNGFlOTRhZjRhZjcuLjExMTkwNTE4OTM0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lbS91
LWJvb3QtZW52LmMKKysrIGIvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMKQEAgLTIzLDEzICsy
MywxMCBAQCBlbnVtIHVfYm9vdF9lbnZfZm9ybWF0IHsKIAogc3RydWN0IHVfYm9vdF9lbnYgewog
CXN0cnVjdCBkZXZpY2UgKmRldjsKKwlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbTsKIAllbnVt
IHVfYm9vdF9lbnZfZm9ybWF0IGZvcm1hdDsKIAogCXN0cnVjdCBtdGRfaW5mbyAqbXRkOwotCi0J
LyogQ2VsbHMgKi8KLQlzdHJ1Y3QgbnZtZW1fY2VsbF9pbmZvICpjZWxsczsKLQlpbnQgbmNlbGxz
OwogfTsKIAogc3RydWN0IHVfYm9vdF9lbnZfaW1hZ2Vfc2luZ2xlIHsKQEAgLTk0LDcwICs5MSw3
MCBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcmVhZF9wb3N0X3Byb2Nlc3NfZXRoYWRkcih2b2lk
ICpjb250ZXh0LCBjb25zdCBjaGFyICppZCwgaQogc3RhdGljIGludCB1X2Jvb3RfZW52X2FkZF9j
ZWxscyhzdHJ1Y3QgdV9ib290X2VudiAqcHJpdiwgdWludDhfdCAqYnVmLAogCQkJCXNpemVfdCBk
YXRhX29mZnNldCwgc2l6ZV90IGRhdGFfbGVuKQogeworCXN0cnVjdCBudm1lbV9kZXZpY2UgKm52
bWVtID0gcHJpdi0+bnZtZW07CiAJc3RydWN0IGRldmljZSAqZGV2ID0gcHJpdi0+ZGV2OwogCWNo
YXIgKmRhdGEgPSBidWYgKyBkYXRhX29mZnNldDsKIAljaGFyICp2YXIsICp2YWx1ZSwgKmVxOwot
CWludCBpZHg7Ci0KLQlwcml2LT5uY2VsbHMgPSAwOwotCWZvciAodmFyID0gZGF0YTsgdmFyIDwg
ZGF0YSArIGRhdGFfbGVuICYmICp2YXI7IHZhciArPSBzdHJsZW4odmFyKSArIDEpCi0JCXByaXYt
Pm5jZWxscysrOwotCi0JcHJpdi0+Y2VsbHMgPSBkZXZtX2tjYWxsb2MoZGV2LCBwcml2LT5uY2Vs
bHMsIHNpemVvZigqcHJpdi0+Y2VsbHMpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXByaXYtPmNlbGxz
KQotCQlyZXR1cm4gLUVOT01FTTsKIAotCWZvciAodmFyID0gZGF0YSwgaWR4ID0gMDsKKwlmb3Ig
KHZhciA9IGRhdGE7CiAJICAgICB2YXIgPCBkYXRhICsgZGF0YV9sZW4gJiYgKnZhcjsKLQkgICAg
IHZhciA9IHZhbHVlICsgc3RybGVuKHZhbHVlKSArIDEsIGlkeCsrKSB7CisJICAgICB2YXIgPSB2
YWx1ZSArIHN0cmxlbih2YWx1ZSkgKyAxKSB7CisJCXN0cnVjdCBudm1lbV9jZWxsX2luZm8gaW5m
byA9IHt9OworCiAJCWVxID0gc3RyY2hyKHZhciwgJz0nKTsKIAkJaWYgKCFlcSkKIAkJCWJyZWFr
OwogCQkqZXEgPSAnXDAnOwogCQl2YWx1ZSA9IGVxICsgMTsKIAotCQlwcml2LT5jZWxsc1tpZHhd
Lm5hbWUgPSBkZXZtX2tzdHJkdXAoZGV2LCB2YXIsIEdGUF9LRVJORUwpOwotCQlpZiAoIXByaXYt
PmNlbGxzW2lkeF0ubmFtZSkKKwkJaW5mby5uYW1lID0gZGV2bV9rc3RyZHVwKGRldiwgdmFyLCBH
RlBfS0VSTkVMKTsKKwkJaWYgKCFpbmZvLm5hbWUpCiAJCQlyZXR1cm4gLUVOT01FTTsKLQkJcHJp
di0+Y2VsbHNbaWR4XS5vZmZzZXQgPSBkYXRhX29mZnNldCArIHZhbHVlIC0gZGF0YTsKLQkJcHJp
di0+Y2VsbHNbaWR4XS5ieXRlcyA9IHN0cmxlbih2YWx1ZSk7Ci0JCXByaXYtPmNlbGxzW2lkeF0u
bnAgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShkZXYtPm9mX25vZGUsIHByaXYtPmNlbGxzW2lkeF0u
bmFtZSk7CisJCWluZm8ub2Zmc2V0ID0gZGF0YV9vZmZzZXQgKyB2YWx1ZSAtIGRhdGE7CisJCWlu
Zm8uYnl0ZXMgPSBzdHJsZW4odmFsdWUpOworCQlpbmZvLm5wID0gb2ZfZ2V0X2NoaWxkX2J5X25h
bWUoZGV2LT5vZl9ub2RlLCBpbmZvLm5hbWUpOwogCQlpZiAoIXN0cmNtcCh2YXIsICJldGhhZGRy
IikpIHsKLQkJCXByaXYtPmNlbGxzW2lkeF0ucmF3X2xlbiA9IHN0cmxlbih2YWx1ZSk7Ci0JCQlw
cml2LT5jZWxsc1tpZHhdLmJ5dGVzID0gRVRIX0FMRU47Ci0JCQlwcml2LT5jZWxsc1tpZHhdLnJl
YWRfcG9zdF9wcm9jZXNzID0gdV9ib290X2Vudl9yZWFkX3Bvc3RfcHJvY2Vzc19ldGhhZGRyOwor
CQkJaW5mby5yYXdfbGVuID0gc3RybGVuKHZhbHVlKTsKKwkJCWluZm8uYnl0ZXMgPSBFVEhfQUxF
TjsKKwkJCWluZm8ucmVhZF9wb3N0X3Byb2Nlc3MgPSB1X2Jvb3RfZW52X3JlYWRfcG9zdF9wcm9j
ZXNzX2V0aGFkZHI7CiAJCX0KLQl9CiAKLQlpZiAoV0FSTl9PTihpZHggIT0gcHJpdi0+bmNlbGxz
KSkKLQkJcHJpdi0+bmNlbGxzID0gaWR4OworCQludm1lbV9hZGRfb25lX2NlbGwobnZtZW0sICZp
bmZvKTsKKwl9CiAKIAlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCB1X2Jvb3RfZW52X3BhcnNl
KHN0cnVjdCB1X2Jvb3RfZW52ICpwcml2KQogeworCXN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVt
ID0gcHJpdi0+bnZtZW07CiAJc3RydWN0IGRldmljZSAqZGV2ID0gcHJpdi0+ZGV2OwogCXNpemVf
dCBjcmMzMl9kYXRhX29mZnNldDsKIAlzaXplX3QgY3JjMzJfZGF0YV9sZW47CiAJc2l6ZV90IGNy
YzMyX29mZnNldDsKIAlzaXplX3QgZGF0YV9vZmZzZXQ7CiAJc2l6ZV90IGRhdGFfbGVuOworCXNp
emVfdCBkZXZfc2l6ZTsKIAl1aW50MzJfdCBjcmMzMjsKIAl1aW50MzJfdCBjYWxjOwotCXNpemVf
dCBieXRlczsKIAl1aW50OF90ICpidWY7CisJaW50IGJ5dGVzOwogCWludCBlcnI7CiAKLQlidWYg
PSBrY2FsbG9jKDEsIHByaXYtPm10ZC0+c2l6ZSwgR0ZQX0tFUk5FTCk7CisJZGV2X3NpemUgPSBu
dm1lbV9kZXZfc2l6ZShudm1lbSk7CisKKwlidWYgPSBrY2FsbG9jKDEsIGRldl9zaXplLCBHRlBf
S0VSTkVMKTsKIAlpZiAoIWJ1ZikgewogCQllcnIgPSAtRU5PTUVNOwogCQlnb3RvIGVycl9vdXQ7
CiAJfQogCi0JZXJyID0gbXRkX3JlYWQocHJpdi0+bXRkLCAwLCBwcml2LT5tdGQtPnNpemUsICZi
eXRlcywgYnVmKTsKLQlpZiAoKGVyciAmJiAhbXRkX2lzX2JpdGZsaXAoZXJyKSkgfHwgYnl0ZXMg
IT0gcHJpdi0+bXRkLT5zaXplKSB7Ci0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlYWQgZnJv
bSBtdGQ6ICVkXG4iLCBlcnIpOworCWJ5dGVzID0gbnZtZW1fZGV2aWNlX3JlYWQobnZtZW0sIDAs
IGRldl9zaXplLCBidWYpOworCWlmIChieXRlcyA8IDApIHsKKwkJZXJyID0gYnl0ZXM7CisJCWdv
dG8gZXJyX2tmcmVlOworCX0gZWxzZSBpZiAoYnl0ZXMgIT0gZGV2X3NpemUpIHsKKwkJZXJyID0g
LUVJTzsKIAkJZ290byBlcnJfa2ZyZWU7CiAJfQogCkBAIC0xNzksOCArMTc2LDggQEAgc3RhdGlj
IGludCB1X2Jvb3RfZW52X3BhcnNlKHN0cnVjdCB1X2Jvb3RfZW52ICpwcml2KQogCQlicmVhazsK
IAl9CiAJY3JjMzIgPSBsZTMyX3RvX2NwdSgqKF9fbGUzMiAqKShidWYgKyBjcmMzMl9vZmZzZXQp
KTsKLQljcmMzMl9kYXRhX2xlbiA9IHByaXYtPm10ZC0+c2l6ZSAtIGNyYzMyX2RhdGFfb2Zmc2V0
OwotCWRhdGFfbGVuID0gcHJpdi0+bXRkLT5zaXplIC0gZGF0YV9vZmZzZXQ7CisJY3JjMzJfZGF0
YV9sZW4gPSBkZXZfc2l6ZSAtIGNyYzMyX2RhdGFfb2Zmc2V0OworCWRhdGFfbGVuID0gZGV2X3Np
emUgLSBkYXRhX29mZnNldDsKIAogCWNhbGMgPSBjcmMzMih+MCwgYnVmICsgY3JjMzJfZGF0YV9v
ZmZzZXQsIGNyYzMyX2RhdGFfbGVuKSBeIH4wTDsKIAlpZiAoY2FsYyAhPSBjcmMzMikgewpAQCAt
MTg5LDcgKzE4Niw3IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1Y3QgdV9ib290
X2VudiAqcHJpdikKIAkJZ290byBlcnJfa2ZyZWU7CiAJfQogCi0JYnVmW3ByaXYtPm10ZC0+c2l6
ZSAtIDFdID0gJ1wwJzsKKwlidWZbZGV2X3NpemUgLSAxXSA9ICdcMCc7CiAJZXJyID0gdV9ib290
X2Vudl9hZGRfY2VsbHMocHJpdiwgYnVmLCBkYXRhX29mZnNldCwgZGF0YV9sZW4pOwogCWlmIChl
cnIpCiAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjZWxsczogJWRcbiIsIGVycik7CkBA
IC0yMDksNyArMjA2LDYgQEAgc3RhdGljIGludCB1X2Jvb3RfZW52X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwogCXN0cnVjdCB1X2Jvb3RfZW52
ICpwcml2OwotCWludCBlcnI7CiAKIAlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpw
cml2KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwcml2KQpAQCAtMjI0LDE3ICsyMjAsMTUgQEAgc3Rh
dGljIGludCB1X2Jvb3RfZW52X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
CXJldHVybiBQVFJfRVJSKHByaXYtPm10ZCk7CiAJfQogCi0JZXJyID0gdV9ib290X2Vudl9wYXJz
ZShwcml2KTsKLQlpZiAoZXJyKQotCQlyZXR1cm4gZXJyOwotCiAJY29uZmlnLmRldiA9IGRldjsK
LQljb25maWcuY2VsbHMgPSBwcml2LT5jZWxsczsKLQljb25maWcubmNlbGxzID0gcHJpdi0+bmNl
bGxzOwogCWNvbmZpZy5wcml2ID0gcHJpdjsKIAljb25maWcuc2l6ZSA9IHByaXYtPm10ZC0+c2l6
ZTsKIAotCXJldHVybiBQVFJfRVJSX09SX1pFUk8oZGV2bV9udm1lbV9yZWdpc3RlcihkZXYsICZj
b25maWcpKTsKKwlwcml2LT5udm1lbSA9IGRldm1fbnZtZW1fcmVnaXN0ZXIoZGV2LCAmY29uZmln
KTsKKwlpZiAoSVNfRVJSKHByaXYtPm52bWVtKSkKKwkJcmV0dXJuIFBUUl9FUlIocHJpdi0+bnZt
ZW0pOworCisJcmV0dXJuIHVfYm9vdF9lbnZfcGFyc2UocHJpdik7CiB9CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHVfYm9vdF9lbnZfb2ZfbWF0Y2hfdGFibGVbXSA9IHsKLS0g
CjIuMzUuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
