Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF8C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HBnlrBWfIPwl77JxMUc8t1lT9kYlmY7a10ar487jHE=; b=Qplb01tAtp32aD
	zfvdcqJaLEwfvfp6fTiOtKHVnJr3hWSTEXHKQgJYlNrPrEVEZ8hSYol4TTDk5js0HAEPwopTyzCSy
	H+bi65zNOAftsa92Txnel1MmwQ8p5WNw27Pps3zD6fbsd+8o6vH0d0xrNdYA8SKKrqyXgENf3LThL
	ZxQGf9+sylHkDO2LerbFgqtdp6sMF+ob7QUojiYNLKPx82QAe0xC1dtbRcTy1hO7AU7Sezq0vI1xm
	+5Dh7BAD8m9pXw0aDrlIcoIJ+ElSYYSCvSpUfIwy77Ccj3MEW/umzueAJH06TxTzXw79MISgs2KBP
	zk7Q7GLkWAZ8dCiDYh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdQd-008yRm-IC; Tue, 04 Oct 2022 08:37:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdQa-008yPq-5Z
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 08:37:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id qx23so9215600ejb.11
        for <linux-mtd@lists.infradead.org>; Tue, 04 Oct 2022 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6398PXCM0Z75TAhOXIJvZ7VMvOm+wU8M/apzJQ0fPNo=;
        b=Jj8QhHRVv8XhN9gn3Zy3845Ep6P4N74frrh8J0sNy9Nvw6cZWznxO4pAfFKytDI/eI
         hxT50YyaGei0d7lEZGu5Tjq1q5j2QqMGVH46bdZAvFqoWOFZi+iNpiQaLIrDiTskySPy
         NAjOl+xcOvnGKdpu4PyMmTpGjV8VaFqhFpkZjKSdXnx/N6FNXcc/no5e9ku9J5Bcj8Xp
         ICAFBJ5HnF1XGxuI0aSIZpzIRWtNNDXVd+cdct8UjrTwEZIqswMZMRar4T99qJLnjY68
         IK8QbPlcw+DznnZ27auF6JEbvLSc73GnTbAu2YYvw0ZhOoJmx3orZmn6Bx8yKNJ27c1w
         xR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6398PXCM0Z75TAhOXIJvZ7VMvOm+wU8M/apzJQ0fPNo=;
        b=q3m9wYI2eWdsl36HsQcmITzD30pHaw6423FXGuFNG2Cz23F1uLJ6ksUVECJqpkMs6F
         +zfxvmK8FCvEYUf3P/Un+uMn4J1zsFHuZkYqOYGUAc90a3TzlQIjFRIbjrQOJZhEAIWR
         SBhzKxGDLCns7cwcF9RgtLkzIGB4fF0RHI7zkqFXFbNUyn7ZKEjvwcUhQOS0mG3/U0XP
         phD/qcRBo86hHgdr8+ixnL0STe/hk2QmTlpnLA9Fmo8Q+aYpUY04WliC5CBMXXUceJ9K
         //QcESFxT7aNyWVmalfBWoPQH7VnhTZ45mTiWnfqApCD6u01N5UEtrzmMg3fqouIN1Mi
         2fWw==
X-Gm-Message-State: ACrzQf1h2UIGWxB7svoyH3br6+Lw4O+udspAwMN/5hILf/p0w1BYq7yl
	cjSAvQZ/BnT0S5QKb4z5yuBmgSTfqY0=
X-Google-Smtp-Source: AMsMyM7cfAEIqqHDiP3VOzpl6zLgLsij94Pp+OMaOlNjEIfk1WYSByfc/0f+6a0AmTLhdUg0r58joA==
X-Received: by 2002:a17:906:5d16:b0:783:78d5:e47a with SMTP id g22-20020a1709065d1600b0078378d5e47amr18495748ejt.453.1664872640525;
        Tue, 04 Oct 2022 01:37:20 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b00787a6adabe9sm6598376ejc.75.2022.10.04.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 01:37:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] mtd: core: try to find OF node for every MTD partition
Date: Tue,  4 Oct 2022 10:37:10 +0200
Message-Id: <20221004083710.27704-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004083710.27704-1-zajec5@gmail.com>
References: <20221004083710.27704-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_013724_233083_2CD1B308 
X-CRM114-Status: GOOD (  15.62  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU28gZmFyIHRoaXMgZmVh
dHVyZSB3YXMgbGltaXRlZCB0byB0aGUgdG9wLWxldmVsICJudm1lbS1jZWxscyIgbm9kZS4KVGhl
cmUgYXJlIG11bHRpcGxlIHBhcnNlcnMgY3JlYXRpbmcgcGFydGl0aW9ucyBhbmQgc3VicGFydGl0
aW9ucwpkeW5hbWljYWxseS4gRXh0ZW5kIHRoYXQgY29kZSB0byBoYW5kbGUgdGhlbSB0b28uCgpU
aGlzIGFsbG93cyBmaW5kaW5nIHBhcnRpdGlvbi0qIG5vZGUgZm9yIGV2ZXJ5IE1URCAoc3ViKXBh
cnRpdGlvbi4KClJhbmRvbSBleGFtcGxlOgoKcGFydGl0aW9ucyB7Cgljb21wYXRpYmxlID0gImJy
Y20sYmNtOTQ3eHgtY2ZlLXBhcnRpdGlvbnMiOwoKCXBhcnRpdGlvbi1maXJtd2FyZSB7CgkJY29t
cGF0aWJsZSA9ICJicmNtLHRyeCI7CgoJCXBhcnRpdGlvbi1sb2FkZXIgewoJCX07Cgl9Owp9OwoK
Q2M6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1i
eTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbXRkL210
ZGNvcmUuYyB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29y
ZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmluZGV4IDIyMTFlMGVkNmNjOS4uMDcyNDlhZjRm
ODkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQv
bXRkY29yZS5jCkBAIC01NTEsMjAgKzU1MSwyMiBAQCBzdGF0aWMgdm9pZCBtdGRfY2hlY2tfb2Zf
bm9kZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnRpdGlv
bnMsICpwYXJlbnRfZG4sICptdGRfZG4gPSBOVUxMOwogCWNvbnN0IGNoYXIgKnBuYW1lLCAqcHJl
Zml4ID0gInBhcnRpdGlvbi0iOwogCWludCBwbGVuLCBtdGRfbmFtZV9sZW4sIG9mZnNldCwgcHJl
Zml4X2xlbjsKLQlib29sIGZvdW5kID0gZmFsc2U7CiAKIAkvKiBDaGVjayBpZiBNVEQgYWxyZWFk
eSBoYXMgYSBkZXZpY2Ugbm9kZSAqLwogCWlmIChtdGRfZ2V0X29mX25vZGUobXRkKSkKIAkJcmV0
dXJuOwogCi0JLyogQ2hlY2sgaWYgYSBwYXJ0aXRpb25zIG5vZGUgZXhpc3QgKi8KIAlpZiAoIW10
ZF9pc19wYXJ0aXRpb24obXRkKSkKIAkJcmV0dXJuOworCiAJcGFyZW50X2RuID0gbXRkX2dldF9v
Zl9ub2RlKG10ZC0+cGFyZW50KTsKIAlpZiAoIXBhcmVudF9kbikKIAkJcmV0dXJuOwogCi0JcGFy
dGl0aW9ucyA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKHBhcmVudF9kbiwgInBhcnRpdGlvbnMiKTsK
KwlpZiAobXRkX2lzX3BhcnRpdGlvbihtdGQtPnBhcmVudCkpCisJCXBhcnRpdGlvbnMgPSBvZl9u
b2RlX2dldChwYXJlbnRfZG4pOworCWVsc2UKKwkJcGFydGl0aW9ucyA9IG9mX2dldF9jaGlsZF9i
eV9uYW1lKHBhcmVudF9kbiwgInBhcnRpdGlvbnMiKTsKIAlpZiAoIXBhcnRpdGlvbnMpCiAJCWdv
dG8gZXhpdF9wYXJlbnQ7CiAKQEAgLTU4OCwxOSArNTkwLDExIEBAIHN0YXRpYyB2b2lkIG10ZF9j
aGVja19vZl9ub2RlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQlwbGVuID0gc3RybGVuKHBuYW1l
KSAtIG9mZnNldDsKIAkJaWYgKHBsZW4gPT0gbXRkX25hbWVfbGVuICYmCiAJCSAgICAhc3RybmNt
cChtdGQtPm5hbWUsIHBuYW1lICsgb2Zmc2V0LCBwbGVuKSkgewotCQkJZm91bmQgPSB0cnVlOwor
CQkJbXRkX3NldF9vZl9ub2RlKG10ZCwgbXRkX2RuKTsKIAkJCWJyZWFrOwogCQl9CiAJfQogCi0J
aWYgKCFmb3VuZCkKLQkJZ290byBleGl0X3BhcnRpdGlvbnM7Ci0KLQkvKiBTZXQgb2Zfbm9kZSBv
bmx5IGZvciBudm1lbSAqLwotCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShtdGRfZG4sICJu
dm1lbS1jZWxscyIpKQotCQltdGRfc2V0X29mX25vZGUobXRkLCBtdGRfZG4pOwotCi1leGl0X3Bh
cnRpdGlvbnM6CiAJb2Zfbm9kZV9wdXQocGFydGl0aW9ucyk7CiBleGl0X3BhcmVudDoKIAlvZl9u
b2RlX3B1dChwYXJlbnRfZG4pOwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
