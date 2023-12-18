Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C8C46CCD
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzYkYCOOI26VbFJ9DVi1GY/0I/RlNEQgCUwAWT/64Ik=; b=WF+CmFQlXAp6D+
	lE6Ck9pKFiSD8zfMJ8JV7Mzsc1skCNdn62AYazwyvVFcC+ffnVsrF7PiuOl/+ZTaFU0qRSvj+2nCK
	/5o1oVjrg39pumF4YRu4m6IX2mCXjBUFjwVCmdoAt3g0CaaWJOWuY4jGzIFGCgNV6TWaPWrH6vPNi
	V0rz3cjldzQsP/4ngq0b1kAH764BDcywZdxSCRDw2jK4ZVhF9oJmI4NqhUASQ+zbhkxPBSDYqU/Rh
	cJqPHh8pPTueq1a7CiVXtsrzS5M4dqzIsJvOyNsaEZPyBF6A/tKMVBaoW85Di6HfQBpHwQi/81sy5
	mcNW881mwXYDNsA8mOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDwg-00Aurf-0g;
	Mon, 18 Dec 2023 13:46:10 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDwd-00Aup0-1U;
	Mon, 18 Dec 2023 13:46:09 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so2685248a12.2;
        Mon, 18 Dec 2023 05:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702907164; x=1703511964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWStvqK6KrlPpDCxoD+LXp2BPwdp0DZEpw1OHP4LGGI=;
        b=a+IdPjTijvOxz4jLJoCAi8a9vQtIeIkPPn2+DT1NCt3xLsLTXWWfTv77Ox91yh7rWC
         0oJ+AI0ZzVaUROmQeooPqktodsxEHmGu5OlbkSaUvCA2IXAWQqZH0A3s44tmW3V7toKG
         2O2HlO5kB1oFfr89JWlQz1AE0tesx12choYm6cWloIbzSdtD+fWeRzVdAc/fG9x3N1W/
         eNmarDoU/vcUtLa3hsoPOaSdiy6/pmNL5l1oXPYVYj7j81ffFTahgejsnPGyIfIpvUMa
         G5tPXCtmvFIdTMkXK4ic46nBrGAv6k8hgsX943wiF/gjVyEld/2Jd+b+rDA4lh/FTsnA
         uHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907164; x=1703511964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWStvqK6KrlPpDCxoD+LXp2BPwdp0DZEpw1OHP4LGGI=;
        b=cvvfAlYm27CkY8Qg2yqVSKGfCztVoxKJhMudvh5CpNgEoFHijCihml/OGEb6qJuXTC
         DWiF1Rr8M3Lg+jWjfEG/omzNAanGKKh/4FTH8/mZU2g92rwoMIvbCTKwxyf1/nWMifIR
         I6Qr5vMg5T78YGbDg5j2+qwBAvDka1XADnY3N5QbOcGjwfOtjaw4Sj9UtwzWfiB/f3bn
         nW56HAXYETTYNUG6AdeFWwiztoQ9mVMIwJpq7fq97NaVNr2A8I0IV5fS9HUfwvhHFtPO
         5VdURxDgxISqbFBzzCyEAKWABHKAcNBbSjj86ZnM9aSLV4ycX1V5s11QsyvKv3fEUqyi
         IT1w==
X-Gm-Message-State: AOJu0YzZwqFuPcorKbpy6JZSfchZ8ra8W286RxPp2WYjtyxRUwpwefie
	jE06/NYLz+p7gQBA3qs/eK3AmFNAC5A=
X-Google-Smtp-Source: AGHT+IHp95pnHBpGST+4vtRvNyTH5biaemOYZgB8XiiCBPCxXrTDcGLJjvu3bDnbMTy8rJsQqRJ+XQ==
X-Received: by 2002:a05:6512:39cb:b0:50b:f03c:1ea2 with SMTP id k11-20020a05651239cb00b0050bf03c1ea2mr10860168lfu.84.1702906664468;
        Mon, 18 Dec 2023 05:37:44 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id f20-20020a1709067f9400b00a234907311asm1891537ejr.55.2023.12.18.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 05:37:44 -0800 (PST)
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
Subject: [PATCH 3/4] nvmem: u-boot-env: use more nvmem subsystem helpers
Date: Mon, 18 Dec 2023 14:37:21 +0100
Message-Id: <20231218133722.16150-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231218133722.16150-1-zajec5@gmail.com>
References: <20231218133722.16150-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_054607_661730_48A6DFA8 
X-CRM114-Status: GOOD (  20.32  )
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
bEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jIHwgNzkgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL3Ut
Ym9vdC1lbnYuYyBiL2RyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jCmluZGV4IGM0YWU5NGFmNGFm
Ny4uYWI4YzliZjYzZDk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYwor
KysgYi9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYwpAQCAtMjMsMTMgKzIzLDEwIEBAIGVudW0g
dV9ib290X2Vudl9mb3JtYXQgewogCiBzdHJ1Y3QgdV9ib290X2VudiB7CiAJc3RydWN0IGRldmlj
ZSAqZGV2OworCXN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtOwogCWVudW0gdV9ib290X2Vudl9m
b3JtYXQgZm9ybWF0OwogCiAJc3RydWN0IG10ZF9pbmZvICptdGQ7Ci0KLQkvKiBDZWxscyAqLwot
CXN0cnVjdCBudm1lbV9jZWxsX2luZm8gKmNlbGxzOwotCWludCBuY2VsbHM7CiB9OwogCiBzdHJ1
Y3QgdV9ib290X2Vudl9pbWFnZV9zaW5nbGUgewpAQCAtOTQsNzIgKzkxLDY5IEBAIHN0YXRpYyBp
bnQgdV9ib290X2Vudl9yZWFkX3Bvc3RfcHJvY2Vzc19ldGhhZGRyKHZvaWQgKmNvbnRleHQsIGNv
bnN0IGNoYXIgKmlkLCBpCiBzdGF0aWMgaW50IHVfYm9vdF9lbnZfYWRkX2NlbGxzKHN0cnVjdCB1
X2Jvb3RfZW52ICpwcml2LCB1aW50OF90ICpidWYsCiAJCQkJc2l6ZV90IGRhdGFfb2Zmc2V0LCBz
aXplX3QgZGF0YV9sZW4pCiB7CisJc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0gPSBwcml2LT5u
dm1lbTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwcml2LT5kZXY7CiAJY2hhciAqZGF0YSA9IGJ1
ZiArIGRhdGFfb2Zmc2V0OwogCWNoYXIgKnZhciwgKnZhbHVlLCAqZXE7Ci0JaW50IGlkeDsKLQot
CXByaXYtPm5jZWxscyA9IDA7Ci0JZm9yICh2YXIgPSBkYXRhOyB2YXIgPCBkYXRhICsgZGF0YV9s
ZW4gJiYgKnZhcjsgdmFyICs9IHN0cmxlbih2YXIpICsgMSkKLQkJcHJpdi0+bmNlbGxzKys7CiAK
LQlwcml2LT5jZWxscyA9IGRldm1fa2NhbGxvYyhkZXYsIHByaXYtPm5jZWxscywgc2l6ZW9mKCpw
cml2LT5jZWxscyksIEdGUF9LRVJORUwpOwotCWlmICghcHJpdi0+Y2VsbHMpCi0JCXJldHVybiAt
RU5PTUVNOwotCi0JZm9yICh2YXIgPSBkYXRhLCBpZHggPSAwOworCWZvciAodmFyID0gZGF0YTsK
IAkgICAgIHZhciA8IGRhdGEgKyBkYXRhX2xlbiAmJiAqdmFyOwotCSAgICAgdmFyID0gdmFsdWUg
KyBzdHJsZW4odmFsdWUpICsgMSwgaWR4KyspIHsKKwkgICAgIHZhciA9IHZhbHVlICsgc3RybGVu
KHZhbHVlKSArIDEpIHsKKwkJc3RydWN0IG52bWVtX2NlbGxfaW5mbyBpbmZvID0ge307CisKIAkJ
ZXEgPSBzdHJjaHIodmFyLCAnPScpOwogCQlpZiAoIWVxKQogCQkJYnJlYWs7CiAJCSplcSA9ICdc
MCc7CiAJCXZhbHVlID0gZXEgKyAxOwogCi0JCXByaXYtPmNlbGxzW2lkeF0ubmFtZSA9IGRldm1f
a3N0cmR1cChkZXYsIHZhciwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghcHJpdi0+Y2VsbHNbaWR4XS5u
YW1lKQorCQlpbmZvLm5hbWUgPSBkZXZtX2tzdHJkdXAoZGV2LCB2YXIsIEdGUF9LRVJORUwpOwor
CQlpZiAoIWluZm8ubmFtZSkKIAkJCXJldHVybiAtRU5PTUVNOwotCQlwcml2LT5jZWxsc1tpZHhd
Lm9mZnNldCA9IGRhdGFfb2Zmc2V0ICsgdmFsdWUgLSBkYXRhOwotCQlwcml2LT5jZWxsc1tpZHhd
LmJ5dGVzID0gc3RybGVuKHZhbHVlKTsKLQkJcHJpdi0+Y2VsbHNbaWR4XS5ucCA9IG9mX2dldF9j
aGlsZF9ieV9uYW1lKGRldi0+b2Zfbm9kZSwgcHJpdi0+Y2VsbHNbaWR4XS5uYW1lKTsKKwkJaW5m
by5vZmZzZXQgPSBkYXRhX29mZnNldCArIHZhbHVlIC0gZGF0YTsKKwkJaW5mby5ieXRlcyA9IHN0
cmxlbih2YWx1ZSk7CisJCWluZm8ubnAgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShkZXYtPm9mX25v
ZGUsIGluZm8ubmFtZSk7CiAJCWlmICghc3RyY21wKHZhciwgImV0aGFkZHIiKSkgewotCQkJcHJp
di0+Y2VsbHNbaWR4XS5yYXdfbGVuID0gc3RybGVuKHZhbHVlKTsKLQkJCXByaXYtPmNlbGxzW2lk
eF0uYnl0ZXMgPSBFVEhfQUxFTjsKLQkJCXByaXYtPmNlbGxzW2lkeF0ucmVhZF9wb3N0X3Byb2Nl
c3MgPSB1X2Jvb3RfZW52X3JlYWRfcG9zdF9wcm9jZXNzX2V0aGFkZHI7CisJCQlpbmZvLnJhd19s
ZW4gPSBzdHJsZW4odmFsdWUpOworCQkJaW5mby5ieXRlcyA9IEVUSF9BTEVOOworCQkJaW5mby5y
ZWFkX3Bvc3RfcHJvY2VzcyA9IHVfYm9vdF9lbnZfcmVhZF9wb3N0X3Byb2Nlc3NfZXRoYWRkcjsK
IAkJfQotCX0KIAotCWlmIChXQVJOX09OKGlkeCAhPSBwcml2LT5uY2VsbHMpKQotCQlwcml2LT5u
Y2VsbHMgPSBpZHg7CisJCW52bWVtX2FkZF9vbmVfY2VsbChudm1lbSwgJmluZm8pOworCX0KIAog
CXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcGFyc2Uoc3RydWN0IHVfYm9v
dF9lbnYgKnByaXYpCiB7CisJc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0gPSBwcml2LT5udm1l
bTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwcml2LT5kZXY7CiAJc2l6ZV90IGNyYzMyX2RhdGFf
b2Zmc2V0OwogCXNpemVfdCBjcmMzMl9kYXRhX2xlbjsKIAlzaXplX3QgY3JjMzJfb2Zmc2V0Owog
CXNpemVfdCBkYXRhX29mZnNldDsKIAlzaXplX3QgZGF0YV9sZW47CisJc2l6ZV90IGRldl9zaXpl
OwogCXVpbnQzMl90IGNyYzMyOwogCXVpbnQzMl90IGNhbGM7Ci0Jc2l6ZV90IGJ5dGVzOwogCXVp
bnQ4X3QgKmJ1ZjsKKwlpbnQgYnl0ZXM7CiAJaW50IGVycjsKIAotCWJ1ZiA9IGtjYWxsb2MoMSwg
cHJpdi0+bXRkLT5zaXplLCBHRlBfS0VSTkVMKTsKKwlkZXZfc2l6ZSA9IG52bWVtX2Rldl9zaXpl
KG52bWVtKTsKKworCWJ1ZiA9IGtjYWxsb2MoMSwgZGV2X3NpemUsIEdGUF9LRVJORUwpOwogCWlm
ICghYnVmKSB7CiAJCWVyciA9IC1FTk9NRU07CiAJCWdvdG8gZXJyX291dDsKIAl9CiAKLQllcnIg
PSBtdGRfcmVhZChwcml2LT5tdGQsIDAsIHByaXYtPm10ZC0+c2l6ZSwgJmJ5dGVzLCBidWYpOwot
CWlmICgoZXJyICYmICFtdGRfaXNfYml0ZmxpcChlcnIpKSB8fCBieXRlcyAhPSBwcml2LT5tdGQt
PnNpemUpIHsKLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVhZCBmcm9tIG10ZDogJWRcbiIs
IGVycik7Ci0JCWdvdG8gZXJyX2tmcmVlOwotCX0KKwlieXRlcyA9IG52bWVtX2RldmljZV9yZWFk
KG52bWVtLCAwLCBkZXZfc2l6ZSwgYnVmKTsKKwlpZiAoYnl0ZXMgPCAwKQorCQlyZXR1cm4gYnl0
ZXM7CisJZWxzZSBpZiAoYnl0ZXMgIT0gZGV2X3NpemUpCisJCXJldHVybiAtRUlPOwogCiAJc3dp
dGNoIChwcml2LT5mb3JtYXQpIHsKIAljYXNlIFVfQk9PVF9GT1JNQVRfU0lOR0xFOgpAQCAtMTc5
LDggKzE3Myw4IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1Y3QgdV9ib290X2Vu
diAqcHJpdikKIAkJYnJlYWs7CiAJfQogCWNyYzMyID0gbGUzMl90b19jcHUoKihfX2xlMzIgKiko
YnVmICsgY3JjMzJfb2Zmc2V0KSk7Ci0JY3JjMzJfZGF0YV9sZW4gPSBwcml2LT5tdGQtPnNpemUg
LSBjcmMzMl9kYXRhX29mZnNldDsKLQlkYXRhX2xlbiA9IHByaXYtPm10ZC0+c2l6ZSAtIGRhdGFf
b2Zmc2V0OworCWNyYzMyX2RhdGFfbGVuID0gZGV2X3NpemUgLSBjcmMzMl9kYXRhX29mZnNldDsK
KwlkYXRhX2xlbiA9IGRldl9zaXplIC0gZGF0YV9vZmZzZXQ7CiAKIAljYWxjID0gY3JjMzIofjAs
IGJ1ZiArIGNyYzMyX2RhdGFfb2Zmc2V0LCBjcmMzMl9kYXRhX2xlbikgXiB+MEw7CiAJaWYgKGNh
bGMgIT0gY3JjMzIpIHsKQEAgLTE4OSw3ICsxODMsNyBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZf
cGFyc2Uoc3RydWN0IHVfYm9vdF9lbnYgKnByaXYpCiAJCWdvdG8gZXJyX2tmcmVlOwogCX0KIAot
CWJ1Zltwcml2LT5tdGQtPnNpemUgLSAxXSA9ICdcMCc7CisJYnVmW2Rldl9zaXplIC0gMV0gPSAn
XDAnOwogCWVyciA9IHVfYm9vdF9lbnZfYWRkX2NlbGxzKHByaXYsIGJ1ZiwgZGF0YV9vZmZzZXQs
IGRhdGFfbGVuKTsKIAlpZiAoZXJyKQogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgY2Vs
bHM6ICVkXG4iLCBlcnIpOwpAQCAtMjA5LDcgKzIwMyw2IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vu
dl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsK
IAlzdHJ1Y3QgdV9ib290X2VudiAqcHJpdjsKLQlpbnQgZXJyOwogCiAJcHJpdiA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOwogCWlmICghcHJpdikKQEAgLTIy
NCwxNyArMjE3LDE1IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihwcml2LT5tdGQpOwogCX0KIAotCWVy
ciA9IHVfYm9vdF9lbnZfcGFyc2UocHJpdik7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKLQog
CWNvbmZpZy5kZXYgPSBkZXY7Ci0JY29uZmlnLmNlbGxzID0gcHJpdi0+Y2VsbHM7Ci0JY29uZmln
Lm5jZWxscyA9IHByaXYtPm5jZWxsczsKIAljb25maWcucHJpdiA9IHByaXY7CiAJY29uZmlnLnNp
emUgPSBwcml2LT5tdGQtPnNpemU7CiAKLQlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGRldm1fbnZt
ZW1fcmVnaXN0ZXIoZGV2LCAmY29uZmlnKSk7CisJcHJpdi0+bnZtZW0gPSBkZXZtX252bWVtX3Jl
Z2lzdGVyKGRldiwgJmNvbmZpZyk7CisJaWYgKElTX0VSUihwcml2LT5udm1lbSkpCisJCXJldHVy
biBQVFJfRVJSKHByaXYtPm52bWVtKTsKKworCXJldHVybiB1X2Jvb3RfZW52X3BhcnNlKHByaXYp
OwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB1X2Jvb3RfZW52X29mX21h
dGNoX3RhYmxlW10gPSB7Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
