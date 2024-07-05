Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A0BC38150
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20FeCDdVfe5ZLRfjN5wdxkuQZndghHkQEA76dCVJM+c=; b=jUYefmq5bffBX4
	7/bqc8DlLhwQyCq+MzhTvwXmEneCO6wNKYcij7gmk/l4jVTD2nlDmYdJ8BlTOwBlo/g0FyQFihnTF
	23sb4m3kKJf7cAxW35M7cwABNf1DxSd/3JFtjzI4z5WBt7kAL5OoIm4dnbia14qjrnUDQlQD896BN
	sG6jjXVmFIf8GD7iPbWLO+wh1L+oNsoiJO0ww8TUh5LCFJfAVZ/V1C6SOv5YmBgSmcktDY+EbbEzV
	FLCxwGHKWsUlv5IquwwMDHFFrAh+mvAG9ssD63Vn6d2yCkHURiIlhCAK48pXKJwx8lq5aVze5nEpz
	Nhb24TFO/Pfdi1WKrs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPrt6-0000000GyHQ-2ZRp;
	Fri, 05 Jul 2024 22:58:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPrt3-0000000GyGN-16Xy;
	Fri, 05 Jul 2024 22:58:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-58bac81f419so2952926a12.0;
        Fri, 05 Jul 2024 15:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720220319; x=1720825119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiMeeVhiLcAlXej3uBvwyk/ojiuyjSIG1S2ztz0XYNs=;
        b=W+lvLdIj/MZv5WBeMh84VFJBkspFn4MsDa47euK0AcDhULY9LnQkOS0Z9FGeJ3kwrX
         7Hvc3SyVKnzGQxmRYOI1w/Ab+LGRxZMFW83pkliVubWRGz2niakqsVDIEUE0frc2vbWf
         txwEMZcLSnePc2/AC7Ea1qFf3WneixOV5wZ/5J21HdYguzT5/YjWKfebC3DP57roiUDz
         Rkgk+D1KjL/4Tg2KDAot6nr5BPFDgNkfoOihaVayOkyVR8vo5C5677DnE+EjeJhMONpU
         apba86dmVRGbpvIlZwSXHgOAdul0DFNXGvs6B/BzDinxUGQ8NvqzKBIzmAiILzZpyJEo
         0xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720220319; x=1720825119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiMeeVhiLcAlXej3uBvwyk/ojiuyjSIG1S2ztz0XYNs=;
        b=NymDRqyXqi188a1SQ7ft6NZu2ZRTIkieZbno3DpK+ufeLkUx/XE2o4sBpsnpfOU9f7
         kriCw6Jbo5C+Zcf/lcYF3QqvYmMdPz7fy+DkTRH+3aeLRHY/JbYf1wCyY4un67N6hVhu
         zdC09cboftARi+Kjmj53kc3a2ls2PJAPB+lLdAqw/gQaprTRrR4sTvdmkGUHTAfS+6G+
         fnUBf91xDzU/YgPZtx0UkShnqSCfbpGSsXmQcvuLbYhjb1v2Cw5bLoH+reUZHXqN5WuP
         kcj5pxudgxk5706k0Es2Vmdd2XWk7c4AtkXN4TK884cqa6PGzueEMoxHMlTjL+wxAj1q
         q6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6qcnd0lnLbb9BzFbxVTu26ux4do4H+XehYiwafN+ceslLrvnKWw5bVlgXeRVG95AvqGDoKw5MrOUZwlGyPw4aZv6xDpJOFyQWjTaM0bgvyuFbTaRKaCi4Q4t1AcxhUlR070qJYZSIOsZoefEbu2YJlv8S
X-Gm-Message-State: AOJu0YzuVrNhGz5kKtlyjIO645b3esvykS7Si0wLG0LDLnIjgrc2zoAc
	pWFNtzJBM2z6WzCAB7UkAMaZuv1mztJKFB3hz0zBPxZ9pxEl4Ew3
X-Google-Smtp-Source: AGHT+IF/EnTZ+25wxqkBsWXqxU8jobntZQ97ZpwWquicNED9QnU285ETFWo0voXR6AyZFnJzN7nEIA==
X-Received: by 2002:a05:6402:254a:b0:586:6365:b3cf with SMTP id 4fb4d7f45d1cf-58e596592cbmr4608643a12.10.1720220318886;
        Fri, 05 Jul 2024 15:58:38 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861381868csm10052128a12.55.2024.07.05.15.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 15:58:38 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: nvmem: convert U-Boot env to a layout
Date: Sat,  6 Jul 2024 00:58:21 +0200
Message-Id: <20240705225821.13196-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_155841_337398_B01D852C 
X-CRM114-Status: GOOD (  18.26  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVS1Cb290IGVudmlyb25t
ZW50IHZhcmlhYmxlcyBjYW4gYmUgc3RvcmVkIGluIHZhcmlvdXMgZGF0YSBzb3VyY2VzLiBNVEQK
aXMganVzdCBvbmUgb2YgYXZhaWxhYmxlIG9wdGlvbnMuIFJlZmFjdG9yIERUIGJpbmRpbmcgaW50
byBhIGxheW91dCBzbwppdCBjYW4gYmUgdXNlZCB3aXRoIFVCSSB2b2x1bWVzIGFuZCBvdGhlciBO
Vk1FTSBkZXZpY2VzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMjIx
MTczNDIxLjEzNzM3LTEtemFqZWM1QGdtYWlsLmNvbS8KU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KSSdtIHNlbmRpbmcgdGhpcyBQQVRDSCB3aXRo
b3V0IExpbnV4IGNoYW5nZXMgdG8gc2VlIGlmIHRoaXMgaXMgdGhlCnJpZ2h0IGFwcHJvYWNoIC0g
Zm9yIGRldmVsb3BlcnMgYW5kIChEVCkgbWFpbnRhaW5lcnMgdG8gcmV2aWV3IGl0IGZpcnN0LgoK
TXkgcHJldmlvdXMgYXR0ZW1wdCAoc2VlIGFib3ZlIExpbmspIHR1cm5lZCBvdXQgaW4gcmVmdXNh
bCBzbyBJJ20ganVzdAp0cnlpbmcgdG8gc2F2ZSBzb21lIHRpbWUgaW4gY2FzZSB0aGlzIG9uZSBn
b2VzIHdyb25nIGFzIHdlbGwuCgpIb3BlZnVsbHkgdGhlIGluY2x1ZGVkIGV4YW1wbGUgKHdoaWNo
IEkgcmVhbGx5IHRoaW5rIHdlIHNob3VsZCBhZGQpCmV4cGxhaW5zIHdlbGwgaG93IEkgdGhpbmsg
dGhpcyBiaW5kaW5nIHNob3VsZCBiZSB1c2VkIHdpdGggbGF5b3V0cy4KCklmIEkgZ2V0IHNvbWUg
cG9zaXRpdmUgZmVlZGJhY2sgSSdsbCB3b3JrIG9uIFYyIHdpdGggYWN0dWFsIExpbnV4CmNoYW5n
ZXMuCgogLi4uL2JpbmRpbmdzL252bWVtL2xheW91dHMvbnZtZW0tbGF5b3V0LnlhbWwgIHwgIDEg
KwogLi4uL252bWVtL3sgPT4gbGF5b3V0c30vdS1ib290LGVudi55YW1sICAgICAgIHwgMzkgKysr
KysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQogcmVuYW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS97ID0+IGxheW91dHN9L3UtYm9vdCxlbnYueWFtbCAoNzUlKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL252bWVtLWxheW91dC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvbnZt
ZW0tbGF5b3V0LnlhbWwKaW5kZXggM2I0MGY3ODgwNzc0Li4zODI1MDcwNjA2NTEgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL252bWVt
LWxheW91dC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS9sYXlvdXRzL252bWVtLWxheW91dC55YW1sCkBAIC0yMSw2ICsyMSw3IEBAIG9uZU9mOgogICAt
ICRyZWY6IGZpeGVkLWxheW91dC55YW1sCiAgIC0gJHJlZjoga29udHJvbixzbDI4LXZwZC55YW1s
CiAgIC0gJHJlZjogb25pZSx0bHYtbGF5b3V0LnlhbWwKKyAgLSAkcmVmOiB1LWJvb3QsZW52Lnlh
bWwKIAogcHJvcGVydGllczoKICAgY29tcGF0aWJsZTogdHJ1ZQpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFt
bApzaW1pbGFyaXR5IGluZGV4IDc1JQpyZW5hbWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCnJlbmFtZSB0byBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LnlhbWwKaW5kZXgg
OWMzNmFmYzcwODRiLi41NmE4ZjU1ZDRhMDkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvdS1ib290LGVudi55YW1sCkBAIC0x
LDEwICsxLDEwIEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlCiAlWUFNTCAxLjIKIC0tLQotJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9udm1lbS91LWJvb3QsZW52LnlhbWwjCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL252bWVtL2xheW91dHMvdS1ib290LGVudi55YW1sIwogJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCiAKLXRpdGxlOiBVLUJvb3Qg
ZW52aXJvbm1lbnQgdmFyaWFibGVzCit0aXRsZTogVS1Cb290IGVudmlyb25tZW50IHZhcmlhYmxl
cyBsYXlvdXQKIAogZGVzY3JpcHRpb246IHwKICAgVS1Cb290IHVzZXMgZW52aXJvbm1lbnQgdmFy
aWFibGVzIHRvIHN0b3JlIGRldmljZSBwYXJhbWV0ZXJzIGFuZApAQCAtMjEsOSArMjEsNiBAQCBk
ZXNjcmlwdGlvbjogfAogICBUaGlzIGJpbmRpbmcgYWxsb3dzIG1hcmtpbmcgc3RvcmFnZSBkZXZp
Y2UgKGFzIGNvbnRhaW5pbmcgZW52IGRhdGEpIGFuZAogICBzcGVjaWZ5aW5nIHVzZWQgZm9ybWF0
LgogCi0gIFJpZ2h0IG5vdyBvbmx5IGZsYXNoIHBhcnRpdGlvbiBjYXNlIGlzIGNvdmVyZWQgYnV0
IGl0IG1heSBiZSBleHRlbmRlZCB0byBlLmcuCi0gIFVCSSB2b2x1bWVzIGluIHRoZSBmdXR1cmUu
Ci0KICAgVmFyaWFibGVzIGNhbiBiZSBkZWZpbmVkIGFzIE5WTUVNIGRldmljZSBzdWJub2Rlcy4K
IAogbWFpbnRhaW5lcnM6CkBAIC00Miw2ICszOSw3IEBAIHByb3BlcnRpZXM6CiAgICAgICAgIGNv
bnN0OiBicmNtLGVudgogCiAgIHJlZzoKKyAgICBkZXNjcmlwdGlvbjogUGFydGl0aW9uIG9mZnNl
dCBhbmQgc2l6ZSBmb3IgZW52IG9uIHRvcCBvZiBNVEQKICAgICBtYXhJdGVtczogMQogCiAgIGJv
b3RjbWQ6CkBAIC01OCw2ICs1NiwxNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICBkZXNjcmlwdGlv
bjogVGhlIGZpcnN0IGFyZ3VtZW50IGlzIGEgTUFDIGFkZHJlc3Mgb2Zmc2V0LgogICAgICAgICBj
b25zdDogMQogCithbGxPZjoKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICRu
b2RlbmFtZToKKyAgICAgICAgICBub3Q6CisgICAgICAgICAgICBjb250YWluczoKKyAgICAgICAg
ICAgICAgcGF0dGVybjogIl5wYXJ0aXRpb25AWzAtOWEtZl0rJCIKKyAgICB0aGVuOgorICAgICAg
cHJvcGVydGllczoKKyAgICAgICAgcmVnOiBmYWxzZQorCiBhZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKIAogZXhhbXBsZXM6CkBAIC0xMDEsMyArMTEwLDIzIEBAIGV4YW1wbGVzOgogICAgICAg
ICAgICAgfTsKICAgICAgICAgfTsKICAgICB9OworICAtIHwKKyAgICBwYXJ0aXRpb25AMCB7Cisg
ICAgICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+OworICAgICAgICBsYWJlbCA9ICJ1YmkiOworICAg
ICAgICBjb21wYXRpYmxlID0gImxpbnV4LHViaSI7CisKKyAgICAgICAgdm9sdW1lcyB7CisgICAg
ICAgICAgICB1Ymktdm9sdW1lLXUtYm9vdC1lbnYgeworICAgICAgICAgICAgICAgIHZvbG5hbWUg
PSAiZW52IjsKKworICAgICAgICAgICAgICAgIG52bWVtLWxheW91dCB7CisgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiI7CisKKyAgICAgICAgICAgICAgICAgICAg
ZXRoYWRkciB7CisgICAgICAgICAgICAgICAgICAgICAgICAjbnZtZW0tY2VsbC1jZWxscyA9IDwx
PjsKKyAgICAgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAg
ICAgfTsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
