Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292D4EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=puV3luEn05v/olrI5LK4uhFnYZSPaCeVBH6RgKPoQ1E=; b=uJCana+g0pcl/1
	Sy0ILOHqSnYs1+ssvUiUrYLrcfY8Z3Cueo2Hoq3kdBFsjogLbx2/u20rwNSu4liSB8btaUR2Du8Tj
	RDxqe6y449tcri/yo1hOyVfEpeCQYRpPbMVMvJMSVjJL1kdZrgS+9YNmcA2DDRk/Nh9dKKuFKNprQ
	81oHciakAtdkpLt5VTOmWYJ8yCvd29CmUP7AlwLj6BUNZnC3CIWSU+czRlK/h96tNs9k9H/iltjdp
	61iPmTP0BMYtCOG9OQcfNJIZCE7mRnfPfqBIDDMGZwdJMEr/so5zw3iK11bpEG+H9jun4lWzuaiRP
	5rpgR1G5EdN6QXbI1HJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14N-005xGn-0Z;
	Wed, 19 Jul 2023 06:53:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14K-005xE9-1U
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YeCwq3NAvGKoLBdtM+ZqWilWIkfGP+nzxQkw03W43jw=; b=Bokgb0bLMcEz0IqRg0AJS8bJ1E
	kAkj6A3v1Xtl5sCsNEG0D6cHEGYte49w6ugzyduJV/x8V/Y3BGdVzlX8IGjaF5RmDVJT2smZngcqM
	FsvaRM/Aze9Z7CPqz3/sORES8AUdF3j7SFezUmn0JLxxchHTvkdlIeVNmaHYIhT5dxqc4Ye6ADMfQ
	PpGf70TA18gEYWGqPjFfAqyllR+LWUVGAQ7ahP6vQVUq++QM0SFXVcB9igwLqdLncAgxBKKoo6eSK
	XydR7+EtqtfVeiVC/AmSgM9xaZoI+FLLG0K4Vr2ygeTX83phDuFNkXehuxHWHTxuaSJFi0LSBbtyJ
	ttTOb03g==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnFa-00BkOu-2v
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 16:08:37 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so309297e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689696419; x=1692288419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeCwq3NAvGKoLBdtM+ZqWilWIkfGP+nzxQkw03W43jw=;
        b=py923FTwOMCDnC8JmqUXd3moipT/chxFwEuQOS01u03mcDZH+qM63VBPcE6kTHeR+e
         Zbw6ldttWJTYJnoRJWtbN76grxXk9zv8FoV3CTN498ENNbKkdzg1485yC300ux/X0m0h
         m3ChdyXUdR4UJeV7O/ZwT2sTeyNjvi02FIFhp8ipq2hyJPaKU9Ryx9OoBkXJ6trsCGwP
         57kOg+608pEaaCZ6o4E1yBJYaLmUvuscPCnkwQs+SEPWZAfhr6UxUa1qVGKm4IblM9ol
         ttJyO6vUDGl8ZPoveKyRKqEhf2+LGMohTbBrECAiHfwLqrzyzzQeiaB73PzlyXeIrhrN
         OGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696419; x=1692288419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeCwq3NAvGKoLBdtM+ZqWilWIkfGP+nzxQkw03W43jw=;
        b=VNrP+qgOyT5agQ+mm2P5TGxarGbuYLksDLA0UjEo/yLDjv0u5CLH/te6W6/0KOaNXu
         A4I9cgJ9aRQSTw367vU3eSyz6tSc3Dfto5lREpPaDLUqXcMxOflRMKEdtb4khyLsD79K
         hHLUu+J21R+U2/+IIsoLq/IXHIC9alUjZTEY7oAqR21A78rKsT2BBoBlKbXJ28moM6LH
         GfTkfgqD6qf8SLOuhSn+GL8Qg1/5VNtHwpozgwmg+LMs3kdJIskaNAOUB9MdidN6tPBZ
         jO2NOQnE8hjY/mMQnwPCwbGJBscIDHkFAhMIuGKeLNMeGhTby7Z3Bu/zuBOq74XPJNtY
         QY4Q==
X-Gm-Message-State: ABy/qLaRt8XyXTzJlYwOOKp+242w7smxtr+AM0iJ6wf70TOE38Cl6CkL
	x8PX9ufT/fkOURmsTkWJchE=
X-Google-Smtp-Source: APBJJlGwZIxXAsQCBhJaH60JYKMhPq73Lnu4wRDlLMiwDgHkggowOkoPweRz7w2RTlM4XaD52WJJbw==
X-Received: by 2002:a05:6512:1ca:b0:4f8:70f8:d424 with SMTP id f10-20020a05651201ca00b004f870f8d424mr10354189lfp.65.1689696418378;
        Tue, 18 Jul 2023 09:06:58 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id t14-20020ac24c0e000000b004f86aef886asm502295lfq.54.2023.07.18.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:06:58 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] dt-bindings: nvmem: convert U-Boot env to NVMEM layout
Date: Tue, 18 Jul 2023 18:06:50 +0200
Message-Id: <20230718160652.26756-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_170835_866269_F4D927CE 
X-CRM114-Status: GOOD (  10.95  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVXNlICJudm1lbS1sYXlv
dXQiIGFuZCBkcm9wIHVudXNlZCAibWFjIiBsYWJlbCB3aGlsZSBhdCBpdC4KClNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiAuLi4vYmluZGluZ3Mv
bnZtZW0vbGF5b3V0cy9udm1lbS1sYXlvdXQueWFtbCAgICB8ICAxICsKIC4uLi9udm1lbS97ID0+
IGxheW91dHN9L3UtYm9vdCxlbnYueWFtbCAgICAgICAgIHwgMTcgKysrKysrKysrKystLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0veyA9PiBsYXlvdXRzfS91
LWJvb3QsZW52LnlhbWwgKDg3JSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9udm1lbS1sYXlvdXQueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL252bWVtLWxheW91dC55YW1sCmlu
ZGV4IDNiNDBmNzg4MDc3NC4uMzgyNTA3MDYwNjUxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9udm1lbS1sYXlvdXQueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9udm1lbS1s
YXlvdXQueWFtbApAQCAtMjEsNiArMjEsNyBAQCBvbmVPZjoKICAgLSAkcmVmOiBmaXhlZC1sYXlv
dXQueWFtbAogICAtICRyZWY6IGtvbnRyb24sc2wyOC12cGQueWFtbAogICAtICRyZWY6IG9uaWUs
dGx2LWxheW91dC55YW1sCisgIC0gJHJlZjogdS1ib290LGVudi55YW1sCiAKIHByb3BlcnRpZXM6
CiAgIGNvbXBhdGlibGU6IHRydWUKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LnlhbWwKc2ltaWxhcml0eSBpbmRl
eCA4NyUKcmVuYW1lIGZyb20gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVt
L3UtYm9vdCxlbnYueWFtbApyZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL2xheW91dHMvdS1ib290LGVudi55YW1sCmluZGV4IDM2ZDk3ZmI4Nzg2NS4uZWJl
M2I3MWJhMTU1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bnZtZW0vdS1ib290LGVudi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFtbApAQCAtMSw3ICsxLDcgQEAKICMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKICVZQU1M
IDEuMgogLS0tCi0kaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVtL3UtYm9v
dCxlbnYueWFtbCMKKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5
b3V0cy91LWJvb3QsZW52LnlhbWwjCiAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKIAogdGl0bGU6IFUtQm9vdCBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMKQEAgLTcyLDExICs3MiwxNCBAQCBleGFtcGxlczoKICAgICAgICAgfTsKIAogICAgICAgICBl
bnY6IHBhcnRpdGlvbkA0MDAwMCB7Ci0gICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxl
bnYiOwogICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAwMD47CiAKLSAgICAgICAgICAg
IG1hYzogZXRoYWRkciB7Ci0gICAgICAgICAgICAgICAgI252bWVtLWNlbGwtY2VsbHMgPSA8MT47
CisgICAgICAgICAgICBudm1lbS1sYXlvdXQgeworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAidS1ib290LGVudiI7CisKKyAgICAgICAgICAgICAgICBldGhhZGRyIHsKKyAgICAgICAgICAg
ICAgICAgICAgI252bWVtLWNlbGwtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgfTsKICAg
ICAgICAgICAgIH07CiAgICAgICAgIH07CiAgICAgfTsKQEAgLTkyLDkgKzk1LDExIEBAIGV4YW1w
bGVzOgogICAgICAgICAgICAgbGFiZWwgPSAidS1ib290IjsKIAogICAgICAgICAgICAgcGFydGl0
aW9uLXUtYm9vdC1lbnYgewotICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYnJjbSxlbnYi
OworICAgICAgICAgICAgICAgIG52bWVtLWxheW91dCB7CisgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYnJjbSxlbnYiOwogCi0gICAgICAgICAgICAgICAgZXRoYWRkciB7CisgICAg
ICAgICAgICAgICAgICAgIGV0aGFkZHIgeworICAgICAgICAgICAgICAgICAgICB9OwogICAgICAg
ICAgICAgICAgIH07CiAgICAgICAgICAgICB9OwogICAgICAgICB9OwotLSAKMi4zNS4zCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
