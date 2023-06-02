Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31563C7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 21:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=84OqfYg/pq3jBh3imqMB3kRVblMwhkxcfFf/o/d5vlo=; b=rpkDkGfLpv5QR3
	6JEuCEpSywVnjgR1EGHMx3vhEi+rM/z0JGXrxk6PEUJ/EJvpMAsOVeSvQ4xLlmBE1zJh1w+yE+4nN
	ZQqxz54T/Jx0GimkDZNg0Yz2+x50rSOQPWejRXfmktpamz3Jr9K+Etr/T99s2TV0iGZvlf3Nj0FlF
	7GDah3vor60koan2R0snZusWbbv2hK22hM3mVqGX1JOWEJRP3RxizYCBFvVnQfcKLQ2VDkn7myNhT
	JsHikf6s/3hX4xvrcKePPZTGAp4UBpFdwEDaEOTBp34frHeI0t7s0NQmQyTuPAT64s0iCIyTbgvEg
	JhhjbPS/N5O+agWlWcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ClH-0080Kv-0P;
	Fri, 02 Jun 2023 21:56:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ClD-0080K0-2u
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 21:56:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so3424529e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2023 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685742996; x=1688334996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejtbb0LGgE+Vt7kV/qkAvfTr4gmEE3GQyu2v91vh9Jw=;
        b=g73ysZ3NwhLTyBa6ARvagTpAFESwD0w4H5aijMfRQRf6r4PFZ6RQ6M8wYk89ZSRU6q
         svzUVp/JJ0M1WRxz+43UlsdD+g2/0Zir1M/HjxfjIFktuyLYnCLRe4pvcgvw7dt+9dPD
         ibIovkDzh3RILP0r5UAaJSLxPaP/zO1rYSv005XtYZThoLfY5tPrlHe7QxjQbkApA04j
         FGo7/NYX3m3Uvn+mpWWV6U+g1Slx+NpQ43tGhbvVrnJ9/2UV5/n9rqx0AKkQnbz26WyB
         J7HpdomvvpMN9l1shPXvPeknqCqMs62FP2SnQjW5LaCpqBzt7EiPOWkDdX5sMgp3+4dl
         iv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685742996; x=1688334996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ejtbb0LGgE+Vt7kV/qkAvfTr4gmEE3GQyu2v91vh9Jw=;
        b=YDSpDNhaEVKX63d+sXoiDuTiIghB+sXwBW4SttjVJbrrCFERti44imxrIvU2zzNQAa
         KZir2GPHhkbbPw6pzHrgaGFiKsbpE8PLxjhwFLB5ejC8cVBbtmBKt1pigqUJnTsUzqea
         KJ06hvZS4jxj4wV7Ppwz47F+gUpKLVuadOhxu00V7crpHbBmXKg525K+4n+ynXTaRoFa
         G+GE2hX0BgO/foFqGV1nFUse11hbMrm6zzHyZ0UiHohvf/wPMLDDWPRWJe6hSW8wOGy7
         HgqAtjfKvlNsArUXYEvepPDPdGY8y1GaSmk2m6BZMQ/VNpOowE4yEiDzzlMmsDk1TVUS
         NT6w==
X-Gm-Message-State: AC+VfDwUW9NOEOY2+zlGdbGpXSAVHaayB2xae6HGfduiB+Tg21nktfuM
	icl79GvDe2pFop387wx5KdA=
X-Google-Smtp-Source: ACHHUZ6a8dLaEeZm6ew3mIFWAaHoG+Qjki4Rx6Auqkfx1tF5ePx+mNasdRCWgGM15Pa0gWvO9bNpcg==
X-Received: by 2002:ac2:51b9:0:b0:4f6:1190:abab with SMTP id f25-20020ac251b9000000b004f61190ababmr1626915lfk.22.1685742995388;
        Fri, 02 Jun 2023 14:56:35 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u20-20020ac243d4000000b004eb0c51780bsm287118lfl.29.2023.06.02.14.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:56:34 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] dt-bindings: mtd: partitions: Include TP-Link SafeLoader in allowed list
Date: Fri,  2 Jun 2023 23:56:29 +0200
Message-Id: <20230602215629.2568-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_145639_982133_81ED1E9D 
X-CRM114-Status: GOOD (  11.00  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKSXQncyBzdXBwb3NlZCB0
byBiZSB0aGVyZSBhbmQgaXQncyBuZWVkZWQgZm9yIHByb3BlciB2YWxpZGF0aW9uIG9mIERUUwpm
aWxlcy4KClRoaXMgZml4ZXMgZm9sbG93aW5nIGVycm9ycyBmb3IgTm9ydGhzdGFyIGJhc2VkIFRQ
LUxpbmsgcm91dGVyczoKCmFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDgxLXRwbGluay1hcmNoZXIt
YzUtdjIuZHRiOiBmbGFzaEAwOiBwYXJ0aXRpb25zOiAnb25lT2YnIGNvbmRpdGlvbmFsIGZhaWxl
ZCwgb25lIG11c3QgYmUgZml4ZWQ6CiAgICAgICAgJ3BhcnRpdGlvbi1maWxlLXN5c3RlbScsICdw
YXJ0aXRpb24tb3MtaW1hZ2UnLCAncGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIGRvIG5vdCBtYXRj
aCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTldKycKICAgICAgICAnI2FkZHJlc3Mt
Y2VsbHMnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKICAgICAgICAnI3NpemUtY2VsbHMnIGlzIGEg
cmVxdWlyZWQgcHJvcGVydHkKICAgICAgICAncGFydGl0aW9uLWZpbGUtc3lzdGVtJywgJ3BhcnRp
dGlvbi1vcy1pbWFnZScsICdwYXJ0aXRpb25zLXRhYmxlLW9mZnNldCcgZG8gbm90IG1hdGNoIGFu
eSBvZiB0aGUgcmVnZXhlczogJ15wYXJ0aXRpb25AWzAtOWEtZl0rJCcsICdwaW5jdHJsLVswLTld
KycKICAgICAgICAncGFydGl0aW9uLWZpbGUtc3lzdGVtJywgJ3BhcnRpdGlvbi1vcy1pbWFnZScs
ICdwYXJ0aXRpb25zLXRhYmxlLW9mZnNldCcgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhl
czogJ15wYXJ0aXRpb24tWzAtOWEtel0rJCcsICdwaW5jdHJsLVswLTldKycKICAgICAgICAnZmlz
LWluZGV4LWJsb2NrJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5CiAgICAgICAgYXJjaC9hcm0vYm9v
dC9kdHMvYmNtNDcwODEtdHBsaW5rLWFyY2hlci1jNS12Mi5kdGI6IGZsYXNoQDA6IHBhcnRpdGlv
bnM6Y29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZp
eGVkOgogICAgICAgICAgICAgICAgWyd0cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zJ10gaXMg
dG9vIHNob3J0CiAgICAgICAgICAgICAgICAnZml4ZWQtcGFydGl0aW9ucycgd2FzIGV4cGVjdGVk
CiAgICAgICAgICAgICAgICAnc2VyY29tbSxzYy1wYXJ0aXRpb25zJyB3YXMgZXhwZWN0ZWQKICAg
ICAgICAnYXJtLGFybS1maXJtd2FyZS1zdWl0ZScgd2FzIGV4cGVjdGVkCiAgICAgICAgJ2JyY20s
YmNtNDkwOC1wYXJ0aXRpb25zJyB3YXMgZXhwZWN0ZWQKICAgICAgICAnYnJjbSxiY205NDd4eC1j
ZmUtcGFydGl0aW9ucycgd2FzIGV4cGVjdGVkCiAgICAgICAgJ2xpbmtzeXMsbnMtcGFydGl0aW9u
cycgd2FzIGV4cGVjdGVkCiAgICAgICAgJ3Fjb20sc21lbS1wYXJ0JyB3YXMgZXhwZWN0ZWQKICAg
ICAgICAncmVkYm9vdC1maXMnIHdhcyBleHBlY3RlZAogICAgICAgIEZyb20gc2NoZW1hOiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC55YW1sCmFyY2gvYXJtL2Jvb3Qv
ZHRzL2JjbTQ3MDgxLXRwbGluay1hcmNoZXItYzUtdjIuZHRiOiBmbGFzaEAwOiBwYXJ0aXRpb25z
OiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ3BhcnRpdGlvbnMtdGFi
bGUtb2Zmc2V0JyB3YXMgdW5leHBlY3RlZCkKICAgICAgICBGcm9tIHNjaGVtYTogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQueWFtbAphcmNoL2FybS9ib290L2R0cy9i
Y200NzA4MS10cGxpbmstYXJjaGVyLWM1LXYyLmR0YjogZmxhc2hAMDogcGFydGl0aW9uczogJ29u
ZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgogICAgICAgICdwYXJ0
aXRpb24tZmlsZS1zeXN0ZW0nLCAncGFydGl0aW9uLW9zLWltYWdlJywgJ3BhcnRpdGlvbnMtdGFi
bGUtb2Zmc2V0JyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGluY3RybC1bMC05
XSsnCiAgICAgICAgJyNhZGRyZXNzLWNlbGxzJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5CiAgICAg
ICAgJyNzaXplLWNlbGxzJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5CiAgICAgICAgJ3BhcnRpdGlv
bi1maWxlLXN5c3RlbScsICdwYXJ0aXRpb24tb3MtaW1hZ2UnLCAncGFydGl0aW9ucy10YWJsZS1v
ZmZzZXQnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdecGFydGl0aW9uQFswLTlh
LWZdKyQnLCAncGluY3RybC1bMC05XSsnCiAgICAgICAgJ3BhcnRpdGlvbi1maWxlLXN5c3RlbScs
ICdwYXJ0aXRpb24tb3MtaW1hZ2UnLCAncGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIGRvIG5vdCBt
YXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdecGFydGl0aW9uLVswLTlhLXpdKyQnLCAncGluY3Ry
bC1bMC05XSsnCiAgICAgICAgJ2Zpcy1pbmRleC1ibG9jaycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0
eQogICAgICAgIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDgxLXRwbGluay1hcmNoZXItYzUtdjIu
ZHRiOiBmbGFzaEAwOiBwYXJ0aXRpb25zOmNvbXBhdGlibGU6ICdvbmVPZicgY29uZGl0aW9uYWwg
ZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoKICAgICAgICAgICAgICAgIFsndHBsaW5rLHNhZmVs
b2FkZXItcGFydGl0aW9ucyddIGlzIHRvbyBzaG9ydAogICAgICAgICAgICAgICAgJ2ZpeGVkLXBh
cnRpdGlvbnMnIHdhcyBleHBlY3RlZAogICAgICAgICAgICAgICAgJ3NlcmNvbW0sc2MtcGFydGl0
aW9ucycgd2FzIGV4cGVjdGVkCiAgICAgICAgJ2FybSxhcm0tZmlybXdhcmUtc3VpdGUnIHdhcyBl
eHBlY3RlZAogICAgICAgICdicmNtLGJjbTQ5MDgtcGFydGl0aW9ucycgd2FzIGV4cGVjdGVkCiAg
ICAgICAgJ2JyY20sYmNtOTQ3eHgtY2ZlLXBhcnRpdGlvbnMnIHdhcyBleHBlY3RlZAogICAgICAg
ICdsaW5rc3lzLG5zLXBhcnRpdGlvbnMnIHdhcyBleHBlY3RlZAogICAgICAgICdxY29tLHNtZW0t
cGFydCcgd2FzIGV4cGVjdGVkCiAgICAgICAgJ3JlZGJvb3QtZmlzJyB3YXMgZXhwZWN0ZWQKICAg
ICAgICBGcm9tIHNjaGVtYTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9q
ZWRlYyxzcGktbm9yLnlhbWwKYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwODEtdHBsaW5rLWFyY2hl
ci1jNS12Mi5kdGI6IGZsYXNoQDA6IHBhcnRpdGlvbnM6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMg
YXJlIG5vdCBhbGxvd2VkICgncGFydGl0aW9ucy10YWJsZS1vZmZzZXQnIHdhcyB1bmV4cGVjdGVk
KQogICAgICAgIEZyb20gc2NoZW1hOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2plZGVjLHNwaS1ub3IueWFtbAphcmNoL2FybS9ib290L2R0cy9iY200NzA4MS10cGxpbmst
YXJjaGVyLWM1LXYyLmR0YjogZmxhc2hAMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90
IGFsbG93ZWQgKCdwYXJ0aXRpb25zJyB3YXMgdW5leHBlY3RlZCkKICAgICAgICBGcm9tIHNjaGVt
YTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlh
bWwKClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0t
ClYyOiBJbmNsdWRlIGV4YW1wbGUgb2YgZXJyb3JzIHRoaXMgZml4ZXMKLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRp
dGlvbnMueWFtbAppbmRleCAyZWRjNjVlMGUzNjEuLjFkZGEyYzgwNzQ3YiAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlv
bnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvcGFydGl0aW9ucy55YW1sCkBAIC0yMSw2ICsyMSw3IEBAIG9uZU9mOgogICAtICRyZWY6
IGxpbmtzeXMsbnMtcGFydGl0aW9ucy55YW1sCiAgIC0gJHJlZjogcWNvbSxzbWVtLXBhcnQueWFt
bAogICAtICRyZWY6IHJlZGJvb3QtZmlzLnlhbWwKKyAgLSAkcmVmOiB0cGxpbmssc2FmZWxvYWRl
ci1wYXJ0aXRpb25zLnlhbWwKIAogcHJvcGVydGllczoKICAgY29tcGF0aWJsZTogdHJ1ZQotLSAK
Mi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
