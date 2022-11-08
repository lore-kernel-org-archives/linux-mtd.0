Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F895C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+HCCA4k1+Ldd2SHkCTPTMWJc9PpV7SbgNlAFF9xw9Vo=; b=kK4mffN+030vkU
	RNbdkyNsmu9qwRE3hbRU+AafEzzfXKg2a9XHftvoz/YqH/CsEV+9ywvAwcLiIlUxhQf2W3feKf5fr
	oPBwWCzQAz6kPf0UWQevARZqWOnTpZXRGKL9JVki7RR/pP/cQxO4t6TnV7mR66maxKW1tO8rElBZf
	EK5YVsUhK+Hi37wa3/ec9R63uv0AQUGByJItzUUAm+GZx8VVJkYMT8YLFzniRiiedi1Kzrt+V6+bk
	jos0b9idEySFvSmJQWW8DXIkHd/XyZVWzMxOT38xFd9bjMb9R+qYfRzbkX5o6pDMBeoyqE0t14By6
	YAyPGCZqa9JzYaXs81sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKwr-0045JL-W7; Tue, 08 Nov 2022 09:31:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKwp-0045HL-Oq
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 09:31:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id d20so20172102ljc.12
        for <linux-mtd@lists.infradead.org>; Tue, 08 Nov 2022 01:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftbevrgtih63VaCsliryG3KSGXdgekb5SUTzoftgRy8=;
        b=K0ReUNEtSMEujlwjW/cq6kOWPxMWv88ZPD/lememy7+WkqQ5PYSv37AtqLYtiI32Pe
         j6MNxHKLdLz3YK1n6Dwl4xXgNs4KMPzJNbZkvIu0r7r9wmeTPky+VPXJEqxyYQcWkPbH
         61s79UMBCtgxuMb2DjRKr3eUI6CDBJIMB6w+ELcNjUJliJaxtxfsY9xcLftsTff4d9Bg
         OvcphL9UTobvRIynSq0zyQ/b3folaM2kF/Vyo2Lh/ywu/HiXcrgGde2Y/J7yB4ViL4UM
         UMcCSEglkn//0tIN35NUFrbP89xPHuuXJKjmQtiSQaxnqav3Hzv0YrOoDZNFpjGft82u
         hUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ftbevrgtih63VaCsliryG3KSGXdgekb5SUTzoftgRy8=;
        b=lv7e0IhJClVMezeFO7ABLmNaOvSRnlxG7dxA2sLCBlaySiiQHXUJKOxC3tdTAhoFi9
         gyDdgAMRg+dHpD6Kd/fuaZEGjvF6ngS03kFmSFbmSIBngkoy9hnSbQ10daJtXXRw93hu
         jasvfkKzV1uEbshDKy0nZ1DXR70TLNOwStsGhKffUHfkF/5OUULeKa3z1XaFCYXH86vX
         okxXsn9M03QX7OpuX1dvoMkm/v5yz+Ig7MeIMKl+GRcLvd2ada1w6w63ka5GXAVaIU+k
         YtAduf3sBQuNbXU/b6kzMXfdvu2Vefmv0qZ+WtNHQjnRKmemWcAUU79RXIHKXBjsPI3Q
         JnZw==
X-Gm-Message-State: ACrzQf3bqkv2RM0KMaW2suilNwJn+G1jU13zEjYVeTJrwYuu925kKtZz
	xRHTzLKANafIAnU4LHywIcc=
X-Google-Smtp-Source: AMsMyM5GSzFDSGW+7ZDlfd7Q4hqT/SORFzaWiOMga5/UO3X85bIb4VgHLJAQ0UWp18TW7yMRzpt5sQ==
X-Received: by 2002:a2e:8884:0:b0:277:693c:83b with SMTP id k4-20020a2e8884000000b00277693c083bmr12074951lji.68.1667899867880;
        Tue, 08 Nov 2022 01:31:07 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bf20-20020a2eaa14000000b0027708921b43sm1617772ljb.68.2022.11.08.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 01:31:07 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH mtd/next] dt-bindings: mtd: partitions: allow SafeLoader dynamic subpartitions
Date: Tue,  8 Nov 2022 10:31:02 +0100
Message-Id: <20221108093102.8360-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_013111_825204_E11AED5B 
X-CRM114-Status: GOOD (  11.02  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVFAtTGluayBTYWZlTG9h
ZGVyIHBhcnRpdGlvbmluZyBtZWFucyBmbGFzaCBjb250YWlucyBtdWx0aXBsZSBwYXJ0aXRpb25z
CmRlZmluZWQgaW4gdGhlIG9uLWZsYXNoIHRhYmxlLiBTb21lIG9mIHRob3NlIHBhcnRpdGlvbnMg
bWF5IGhhdmUgYQpzcGVjaWFsIG1lYW5pbmcgYW5kIG1heSByZXF1aXJlIGRlc2NyaWJpbmcgYWRk
aXRpb25hbGx5LiBBbGxvdyB0aGF0LgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxy
YWZhbEBtaWxlY2tpLnBsPgotLS0KIC4uLi9tdGQvcGFydGl0aW9ucy90cGxpbmssc2FmZWxvYWRl
ci1wYXJ0aXRpb25zLnlhbWwgICAgICB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3RwbGluayxzYWZl
bG9hZGVyLXBhcnRpdGlvbnMueWFtbAppbmRleCA2M2U1OTZhYTBjYTMuLmEyNGJiYWFjM2E5MCAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL3RwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFy
dGl0aW9ucy55YW1sCkBAIC0zNiw2ICszNiwxMCBAQCBwcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0
aW9uOiBGbGFzaCBvZmZzZXQgb2YgcGFydGl0aW9ucyB0YWJsZQogICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgogCitwYXR0ZXJuUHJvcGVydGllczoKKyAg
Il5wYXJ0aXRpb24tLiokIjoKKyAgICAkcmVmOiBwYXJ0aXRpb24ueWFtbCMKKwogcmVxdWlyZWQ6
CiAgIC0gcGFydGl0aW9ucy10YWJsZS1vZmZzZXQKIApAQCAtNDYsNCArNTAsOCBAQCBleGFtcGxl
czoKICAgICBwYXJ0aXRpb25zIHsKICAgICAgICAgY29tcGF0aWJsZSA9ICJ0cGxpbmssc2FmZWxv
YWRlci1wYXJ0aXRpb25zIjsKICAgICAgICAgcGFydGl0aW9ucy10YWJsZS1vZmZzZXQgPSA8MHgx
MDAwMDA+OworCisgICAgICAgIHBhcnRpdGlvbi1maWxlLXN5c3RlbSB7CisgICAgICAgICAgICAg
ICAgbGludXgscm9vdGZzOworICAgICAgICB9OwogICAgIH07Ci0tIAoyLjM0LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
