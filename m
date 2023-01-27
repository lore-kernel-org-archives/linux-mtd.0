Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B4FC38142
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 17:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atNlZHh8xlqgJrT0RNuMinlfUHrvT/kr8GYhnJrMkEo=; b=4xlsc4QknRHl4k
	ifL2UVlS8wEsihP+r+HmaaRa7CniDqhZmcFWqttDik12p6H0T8evbjtTXedbv8wYs204/rjpCPF3V
	ST5NnCNXe/wRtlVMz/Wx/WGebsCOUtDu3QyCTrLc/xJpKQiC5Z4QrMvpNh3CgdA2tpUWRJga9+hJd
	X0u/hoPG/+k8VRswST+108EAWusln0//RzIMBiblGeE7rigOwIRaY53EwAgehAHNoGUtbnrMrBGMa
	P8dJxxsgfbL/pD4GlHPghip35EvD0wxm8d83nHMmL3TxZcYAa6c3211NWR8/am3Q4otbZjSCPcseD
	H/gPIl54bSN3gkI+V01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLT06-00Fxli-A4; Fri, 27 Jan 2023 17:58:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLSzt-00FxiE-6C; Fri, 27 Jan 2023 17:58:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id u21so5441363edv.3;
        Fri, 27 Jan 2023 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17/xEWC1WmOjlte8h0eDRTmEFdiv+lS1lWx2rWU4nVc=;
        b=lXG0lVpDyWFmskbnUS03gA72O+I5FXCzECuk+XOYf33HOHpv1AvKHBp9VBTv52jA+W
         GRxq7EP4pkvXeZYbXpRaMUJGxqtrDItw0c1t0Fij7ny/38Pm8a0Ex94EEkQZwYvwyCJn
         VBnFdRJbGmNfyBH3XZ6Obni3BhSmC4Tc+QLIx97O1rUBmIPG5vRn8YkVKRIIPN+NgZ+O
         x8/MHATBonft0FENTqEz2wZcWPywNNLy7DwbFFf6ywJHVSxVsp/mbhPmfy2T4iqyCM63
         MVfnBzjA3GOMIfg7WPnzSZd/QRPqty4Vg9iOtDIlAi3hHcOUykPfjqhQDs213I+6dS+c
         Rkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17/xEWC1WmOjlte8h0eDRTmEFdiv+lS1lWx2rWU4nVc=;
        b=cW+/xQkH+zDUqhqkFbONNc6VQKEk/WI3+xqu9XDUolAg1kKUfH5LrzZg/lEPPrxu5l
         BXEg0x75+TPCF0ZCU2GkT0PSTvbV/9CmjrWA5AqfmimaxB9OZcUg+XN3kHMWIxjewUip
         IsyJKzneKGLV212y6ucAT6ADiaXvSvy86sZDnAKtcK4sXv9ipzfShfO8dozTdDphv8M0
         rwpqe795PCoAO0tzjN3tCEPRJ/D522NObhf+u40dEqM/McwGWip26z3gKS2z9fW4ZOtZ
         5sVwRPFOsnNyQc8LR5aZyeCEhPHdzqrkZlSevhGBh5eQ/DzunptNHssgOy6AQerC+rNY
         4ojg==
X-Gm-Message-State: AFqh2krPKq3aX8MHoITyo2J4fvfAgDio4ao57CmYJojv7C+tTihCEuPI
	RvjZUjvvGRklJ4E6wz37PBw=
X-Google-Smtp-Source: AMrXdXthBjfeJGbjwTfS/yY7ImMNDD+PXI0nFRdpjGlUGxb66VhdMue8cgJPy/yV/1yZEzlOg/ya0g==
X-Received: by 2002:aa7:cc81:0:b0:47e:eaae:9a5b with SMTP id p1-20020aa7cc81000000b0047eeaae9a5bmr41321458edt.42.1674842322849;
        Fri, 27 Jan 2023 09:58:42 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709067e5600b0087276f66c6asm2600508ejr.115.2023.01.27.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 09:58:42 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Walle <michael@walle.cc>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] nvmem: add generic driver for devices with I/O based access
Date: Fri, 27 Jan 2023 18:58:31 +0100
Message-Id: <20230127175831.26753-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175831.26753-1-zajec5@gmail.com>
References: <20230127175831.26753-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_095845_253760_C5B72214 
X-CRM114-Status: GOOD (  20.90  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKV2l0aCBudm1lbSBsYXlv
dXRzIGluIHBsYWNlIHdlIHNob3VsZCBub3cgd29yayBvbiBwbGFpbiBjb250ZW50IGFjY2VzcwpO
Vk1FTSBkcml2ZXJzIChlLmcuIElPIG9uZSkuIEFjdHVhbCBOVk1FTSBjb250ZW50IGhhbmRsaW5n
IHNob3VsZCBnbyB0bwpsYXlvdXQgZHJpdmVycy4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL252bWVtL0tjb25maWcgIHwgIDcg
KysrKwogZHJpdmVycy9udm1lbS9NYWtlZmlsZSB8ICAyICsrCiBkcml2ZXJzL252bWVtL2lvLmMg
ICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L252bWVtL2lvLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL0tjb25maWcgYi9kcml2ZXJz
L252bWVtL0tjb25maWcKaW5kZXggNzg5NzI5ZmY3ZTUwLi5lNzdiZmU2ZWI1MmUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbnZtZW0vS2NvbmZpZworKysgYi9kcml2ZXJzL252bWVtL0tjb25maWcKQEAg
LTkwLDYgKzkwLDEzIEBAIGNvbmZpZyBOVk1FTV9JTVhfT0NPVFBfU0NVCiAJICBUaGlzIGlzIGEg
ZHJpdmVyIGZvciB0aGUgU0NVIE9uLUNoaXAgT1RQIENvbnRyb2xsZXIgKE9DT1RQKQogCSAgYXZh
aWxhYmxlIG9uIGkuTVg4IFNvQ3MuCiAKK2NvbmZpZyBOVk1FTV9JTworCXRyaXN0YXRlICJJTyBh
Y2Nlc3MgYmFzZWQgTlZNRU0gc3VwcG9ydCIKKwlkZXBlbmRzIG9uIEhBU19JT01FTQorCWhlbHAK
KwkgIFRoaXMgZHJpdmVyIHByb3ZpZGVzIHN1cHBvcnQgZm9yIE5WTUVNIGRldmljZXMgdGhhdCBj
YW4gYmUgYWNjZXNzZWQKKwkgIHVzaW5nIEkvTyBtYXBwaW5nLgorCiBjb25maWcgTlZNRU1fSlo0
NzgwX0VGVVNFCiAJdHJpc3RhdGUgIkpaNDc4MCBFRlVTRSBNZW1vcnkgU3VwcG9ydCIKIAlkZXBl
bmRzIG9uIE1BQ0hfSU5HRU5JQyB8fCBDT01QSUxFX1RFU1QKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bnZtZW0vTWFrZWZpbGUgYi9kcml2ZXJzL252bWVtL01ha2VmaWxlCmluZGV4IDQ0MmY5YTQ4NzZh
NS4uODJkYjBhODljNGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVtL01ha2VmaWxlCisrKyBi
L2RyaXZlcnMvbnZtZW0vTWFrZWZpbGUKQEAgLTIwLDYgKzIwLDggQEAgb2JqLSQoQ09ORklHX05W
TUVNX0lNWF9PQ09UUCkJCSs9IG52bWVtLWlteC1vY290cC5vCiBudm1lbS1pbXgtb2NvdHAteQkJ
CTo9IGlteC1vY290cC5vCiBvYmotJChDT05GSUdfTlZNRU1fSU1YX09DT1RQX1NDVSkJKz0gbnZt
ZW0taW14LW9jb3RwLXNjdS5vCiBudm1lbS1pbXgtb2NvdHAtc2N1LXkJCQk6PSBpbXgtb2NvdHAt
c2N1Lm8KK29iai0kKENPTkZJR19OVk1FTV9JTykJCQkrPSBudm1lbS1pby5vCitudm1lbS1pby15
CQkJCTo9IGlvLm8KIG9iai0kKENPTkZJR19OVk1FTV9KWjQ3ODBfRUZVU0UpCSs9IG52bWVtX2p6
NDc4MF9lZnVzZS5vCiBudm1lbV9qejQ3ODBfZWZ1c2UteQkJCTo9IGp6NDc4MC1lZnVzZS5vCiBv
YmotJChDT05GSUdfTlZNRU1fTEFOOTY2Ml9PVFBDKQkrPSBudm1lbS1sYW45NjYyLW90cGMubwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9pby5jIGIvZHJpdmVycy9udm1lbS9pby5jCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMzA3NTI2ZmRhMDM2Ci0tLSAvZGV2
L251bGwKKysrIGIvZHJpdmVycy9udm1lbS9pby5jCkBAIC0wLDAgKzEsNzkgQEAKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIw
MjMgUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorICovCisKKyNpbmNsdWRlIDxs
aW51eC9pby5oPgorI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgorI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L252bWVtLXByb3ZpZGVyLmg+CisjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcHJvcGVydHku
aD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKK3N0cnVjdCBpb19udm1lbSB7CisJdm9pZCBf
X2lvbWVtICpiYXNlOworfTsKKworc3RhdGljIGludCBpb19udm1lbV9yZWFkKHZvaWQgKmNvbnRl
eHQsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQoreworCXN0
cnVjdCBpb19udm1lbSAqcHJpdiA9IGNvbnRleHQ7CisJdTggKmRzdCA9IHZhbDsKKworCXdoaWxl
IChieXRlcy0tKQorCQkqZHN0KysgPSByZWFkYihwcml2LT5iYXNlICsgb2Zmc2V0KyspOworCisJ
cmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgaW9fbnZtZW1fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKK3sKKwlzdHJ1Y3QgbnZtZW1fY29uZmlnIGNvbmZpZyA9IHsKKwkJLm5h
bWUgPSAiaW8tbnZtZW0iLAorCQkucmVnX3JlYWQgPSBpb19udm1lbV9yZWFkLAorCX07CisJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKKwlz
dHJ1Y3QgaW9fbnZtZW0gKnByaXY7CisKKwlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpwcml2KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFwcml2KQorCQlyZXR1cm4gLUVOT01FTTsKKwor
CXByaXYtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2
LCAwLCAmcmVzKTsKKwlpZiAoSVNfRVJSKHByaXYtPmJhc2UpKQorCQlyZXR1cm4gUFRSX0VSUihw
cml2LT5iYXNlKTsKKworCWNvbmZpZy5kZXYgPSBkZXY7CisJY29uZmlnLnByaXYgPSBwcml2Owor
CWNvbmZpZy5zaXplID0gcmVzb3VyY2Vfc2l6ZShyZXMpOworCisJaWYgKCFkZXZpY2VfcHJvcGVy
dHlfcHJlc2VudChkZXYsICJyZWFkLW9ubHkiKSkKKwkJZGV2X3dhcm4oZGV2LCAiV3JpdGluZyBp
cyBub3Qgc3VwcG9ydGVkIHlldCIpOworCisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhkZXZtX252
bWVtX3JlZ2lzdGVyKGRldiwgJmNvbmZpZykpOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBpb19udm1lbV9vZl9tYXRjaF90YWJsZVtdID0geworCXsgLmNvbXBhdGlibGUg
PSAiaW8tbnZtZW0iLCB9LAorCXt9LAorfTsKKworc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgaW9fbnZtZW1fZHJpdmVyID0geworCS5wcm9iZSA9IGlvX252bWVtX3Byb2JlLAorCS5kcml2
ZXIgPSB7CisJCS5uYW1lID0gImlvX252bWVtIiwKKwkJLm9mX21hdGNoX3RhYmxlID0gaW9fbnZt
ZW1fb2ZfbWF0Y2hfdGFibGUsCisJfSwKK307CisKK3N0YXRpYyBpbnQgX19pbml0IGlvX252bWVt
X2luaXQodm9pZCkKK3sKKwlyZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZpb19udm1l
bV9kcml2ZXIpOworfQorCitzdWJzeXNfaW5pdGNhbGxfc3luYyhpb19udm1lbV9pbml0KTsKKwor
TU9EVUxFX0FVVEhPUigiUmFmYcWCIE1pxYJlY2tpIik7CitNT0RVTEVfTElDRU5TRSgiR1BMIik7
CitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBpb19udm1lbV9vZl9tYXRjaF90YWJsZSk7Ci0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
