Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BCBC46CCD
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKef9+6lPTD82HLCh9ajEyMCPqBx7f7NNeBhu8GwGRk=; b=IHNXRKJoi4LqyE
	h/3e/XwCXF97xGkQkKnmfM2A/RUeF7OeWN08JrIOLzBJR6P4yQc+WTNiAdZx0zT9C37cI4oL+xj9h
	pc8gxyc9NuhCf4EcMUBkQ1J4CkZjvp6JuzM+bQZ2lM61OhuXG5Pik67MW9EaJPT3TSk5tXgqU/cTm
	aZSRMdu2n7Iv+gOXEfObm1QiuSst5xdgfUYYFVjiQ5oOV/dawsyRUvefq2K4tqp/hEmtmMFOlnJmZ
	xyffb0fdwLCbln0dnJU8yvbnvLJEiR46AEJmBbGuQJn72xvpjUkCiNTYg7nNtEcl6k0d7VWsvqCEW
	ahb5T1rFnZiPFJJvXZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDoc-00AtBq-1r;
	Mon, 18 Dec 2023 13:37:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDoZ-00AtAE-1O;
	Mon, 18 Dec 2023 13:37:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so381867866b.1;
        Mon, 18 Dec 2023 05:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702906663; x=1703511463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNpHTEQT4LZHegIzvZ+kMOyv6eP7HeX0Sd04kR5jmCY=;
        b=jS+kNQn7NoqdE3GjXHPXf8bK2TlI6c/nXZn27d9GKWLfXMMhdaI5fg/0F3GGLndSxa
         NKcadWyBaOmu41zwwTPvotdUAYcVXg23eoRAEbP6q5EUshMiAiODiuZffU8YjVga51MA
         tRli10GvaoLYqdLKFrmpU1iIzA4q89MDPfSXoOLzEm8V6J4bnBa19LDTGYyJlTS4vCpl
         jDCpC8MZfZYm+VKEt1qM5+dWLY1P0FwMHKwyNXLSBWWf+RM9zFIgWwXz7drp1uFyyBO3
         4Jjic/V+VhSG94xU0nnSSYrdQAlJ3b0uM7MZ6mky3x+aIaqPG/g8a0BW+npIUcP4ncj2
         hx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702906663; x=1703511463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNpHTEQT4LZHegIzvZ+kMOyv6eP7HeX0Sd04kR5jmCY=;
        b=nek1kDAFkP5tjHhAKyLYxw9XMQ2BaCZ5mGHVXzsZ0E4H+GYFsBlYk8Irfsht/qCWMh
         dS+PviP++lqI3RhzJlbeRzlcQSQGwxntlA6Q9jE/a1CaoEmc2bI0p/8/nZSiv2uyYEGO
         TPOw1fv6M1STbTd0i4gNTt73aZwhciaK9+m4nzRxPH3/hDcZkYSVJRYFPcyKFM2m8Br+
         Zm/9ox172mTvb3c7PYzDyq0PtrUokVvgcgtM1Nn8vWrmjvi60lSHwy2W8YPDbYcsLiyM
         f3Vk6nVl/LGH7oVpdMEAReYVmwEM15quS8aeeRuE/xPlQQ8j+t1+rb9KOZI2orjRGiXV
         qS6A==
X-Gm-Message-State: AOJu0Yx3vEuBl3Hz/j9wvYNXkMlSewxM1zd7rfI/U7YIUT/yTjiJger2
	GS1oioNmuP592ypgpLZbOayY8gg37Po=
X-Google-Smtp-Source: AGHT+IGtGbsdUUc3O88BnV6j6UsM+dxyCX5fJtxHEDFGyKvcLjEb50ze3OtdtgF9HqxDX13eg9axjw==
X-Received: by 2002:a17:906:3f46:b0:a19:a1ba:bad8 with SMTP id f6-20020a1709063f4600b00a19a1babad8mr3339416ejj.126.1702906662688;
        Mon, 18 Dec 2023 05:37:42 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id f20-20020a1709067f9400b00a234907311asm1891537ejr.55.2023.12.18.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 05:37:42 -0800 (PST)
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
Subject: [PATCH 2/4] nvmem: core: add nvmem_dev_size() helper
Date: Mon, 18 Dec 2023 14:37:20 +0100
Message-Id: <20231218133722.16150-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231218133722.16150-1-zajec5@gmail.com>
References: <20231218133722.16150-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_053747_471586_7ACEE34D 
X-CRM114-Status: GOOD (  11.06  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBpcyByZXF1aXJl
ZCBieSBsYXlvdXRzIHRoYXQgbmVlZCB0byByZWFkIHdob2xlIE5WTUVNIGNvbnRlbnQuIEl0J3MK
ZXNwZWNpYWxseSB1c2VmdWwgZm9yIE5WTUVNIGRldmljZXMgd2l0aG91dCBoYXJkY29kZWQgbGF5
b3V0IChsaWtlClUtQm9vdCBlbnZpcm9ubWVudCBkYXRhIGJsb2NrKS4KClNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL252bWVtL2Nv
cmUuYyAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L252bWVtLWNv
bnN1bWVyLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCmluZGV4
IGJhNTU5ZTgxZjc3Zi4uMWIwOGJiMDcyZjg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVtL2Nv
cmUuYworKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwpAQCAtMjE3Niw2ICsyMTc2LDE5IEBAIGNv
bnN0IGNoYXIgKm52bWVtX2Rldl9uYW1lKHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtKQogfQog
RVhQT1JUX1NZTUJPTF9HUEwobnZtZW1fZGV2X25hbWUpOwogCisvKioKKyAqIG52bWVtX2Rldl9z
aXplKCkgLSBHZXQgdGhlIHNpemUgb2YgYSBnaXZlbiBudm1lbSBkZXZpY2UuCisgKgorICogQG52
bWVtOiBudm1lbSBkZXZpY2UuCisgKgorICogUmV0dXJuOiBzaXplIG9mIHRoZSBudm1lbSBkZXZp
Y2UuCisgKi8KK3NpemVfdCBudm1lbV9kZXZfc2l6ZShzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1l
bSkKK3sKKwlyZXR1cm4gbnZtZW0tPnNpemU7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChudm1lbV9k
ZXZfc2l6ZSk7CisKIHN0YXRpYyBpbnQgX19pbml0IG52bWVtX2luaXQodm9pZCkKIHsKIAlpbnQg
cmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1jb25zdW1lci5oIGIvaW5jbHVk
ZS9saW51eC9udm1lbS1jb25zdW1lci5oCmluZGV4IDJkMzA2ZmExM2IxYS4uMzRjMGU1OGRmYTI2
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L252bWVtLWNvbnN1bWVyLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9udm1lbS1jb25zdW1lci5oCkBAIC04MSw2ICs4MSw3IEBAIGludCBudm1lbV9kZXZp
Y2VfY2VsbF93cml0ZShzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbSwKIAkJCSAgICBzdHJ1Y3Qg
bnZtZW1fY2VsbF9pbmZvICppbmZvLCB2b2lkICpidWYpOwogCiBjb25zdCBjaGFyICpudm1lbV9k
ZXZfbmFtZShzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbSk7CitzaXplX3QgbnZtZW1fZGV2X3Np
emUoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0pOwogCiB2b2lkIG52bWVtX2FkZF9jZWxsX2xv
b2t1cHMoc3RydWN0IG52bWVtX2NlbGxfbG9va3VwICplbnRyaWVzLAogCQkJICAgIHNpemVfdCBu
ZW50cmllcyk7Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
