Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69152C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 13:50:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD5964F9E
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 13:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD5964F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Rr5GpAxc7TTahPtR/33nrl+jvdE8GADkbh2B+OOemE=; b=UPxtDI4cR64BtMwCClKillCc5j
	Gknursh3EeXCt5PMLQWWXTd8yff4wFZa7fFfboZc92hAu6MRPEFAdAFi3UxZe8npBKEsKkjJjzSpv
	9Z2HtVHnQFrGuxcL0+2KMH2lOqJPNzCGmOP2ICmEZFMuFyImGMA7S6BTUkEtx7JdylOHQzzVvWJh2
	dOQKyZS2zag+gP2yL+LzoUL12xVAdG/2Y+l+Ru/JAxwE0PEmq4KLFN/5DydTKlHIRzTUpoeNHOmhv
	p9SvyHWXSn5xte9E8he5a1VJ5fwangCw0rKIyysBT0cz3x58ULouvgFqvT2VJyLNDJIWaOTquAWNf
	UoOEZvvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKiAZ-00BYiD-SM; Fri, 12 Mar 2021 13:49:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKiAS-00BYhX-QZ
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 13:49:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id f1so45874915lfu.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xn/lPVU2isli6v7RdYcVyUi+d/4OcDX94LOr9JpzH90=;
 b=KIUeIpSzsDXRca+e/i/SXvmZu7VJW9WCZ59qsQPWU/Jzv8rcC4mTVO0cDgdPEnYSes
 DPxu8MU7Wh1dEcFxsJA5/aQu2aQg83MrLmNmRlQRAPVjGOJTKEk1LYO529NG9E0EAkRd
 dIrpdLEIOQ1/luqy2qa+JDN3qkbgDUpKMcivGZ/QqW0+pAoH/AkjpOaQTxDT9nVjGrvz
 QL2YgFfpRLZ4RUZmgBPw2w5NF5N7LFI73L5mJCV+WzWAonKDaiPVAUgej6Ej9CkSzSyw
 bE4XeegFIddkjRuNcSMIysC2WkLZqaseTRo9HJhyVajeYoUqfuraUpu7h8tZBY5yEk/4
 F8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xn/lPVU2isli6v7RdYcVyUi+d/4OcDX94LOr9JpzH90=;
 b=QQnbdcwShZ+dO367n+5GUGmllj2rd8gPljuzIPAaGVBPUPfKL9Y3EdxpPNCf9jl+oQ
 BY//98Y+UdxGwMTJPMSBZd0qKGAvj+KUqJ79gpGvY2LPBmB+EVkCUFCdq7V7yhZ0sJDv
 p795cjh2LBZ8Rot9wKrm2N04SgFFrxlX/v/q2cgVx6Ix+mU3BRfZfQJIkGk044J6d0VP
 FZmHT+Oso5T9114gL/qaAii8smuCqZq/3FjfUtmWPz9yG6O+YYfsICd7WLWFBOA0DVSo
 Q4Cn4QKA4GwOnxKnF9O8dnfUXApfgfUmeUlGRggHevOMe2Mq7PJsfAm8zwEm2x2y4DqF
 XFxQ==
X-Gm-Message-State: AOAM53396LJzJpdviRKLWU+abLuKmuzJyXCzmSZTEKIQU+MQOEqg9Oel
 Jl4Kh8euUIFvcBGEe5ivkr8=
X-Google-Smtp-Source: ABdhPJyA6rRyC0m4YsnH8JibvaIT7yIUiE6FEyGjVeFtCOgSlP2V0JaYR9MBqPwzqvx4q+WPiuetlA==
X-Received: by 2002:ac2:5a0b:: with SMTP id q11mr5430177lfn.391.1615556968040; 
 Fri, 12 Mar 2021 05:49:28 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id j19sm1741071lfb.15.2021.03.12.05.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:49:27 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Vivek Unune <npcomplete13@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: mtd: add binding for Linksys Northstar
 partitions
Date: Fri, 12 Mar 2021 14:49:18 +0100
Message-Id: <20210312134919.7767-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_134928_982064_1D3C1839 
X-CRM114-Status: GOOD (  12.56  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTGlua3N5cyBvbiBCcm9h
ZGNvbSBOb3J0aHN0YXIgZGV2aWNlcyB1c2VzIGZpeGVkIGZsYXNoIGxheW91dCB3aXRoCm11bHRp
cGxlIGZpcm13YXJlIHBhcnRpdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Ci0tLQogLi4uL210ZC9wYXJ0aXRpb25zL2xpbmtzeXMsbnMtcGFy
dGl0aW9ucy55YW1sIHwgNzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc0
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvbGlua3N5cyxucy1wYXJ0aXRpb25zLnlhbWwKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvbGlua3N5cyxucy1wYXJ0aXRpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvbGlua3N5cyxucy1wYXJ0aXRpb25zLnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45OTI0OWNkZmJmYjMKLS0tIC9kZXYv
bnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvbGlua3N5cyxucy1wYXJ0aXRpb25zLnlhbWwKQEAgLTAsMCArMSw3NCBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4y
CistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMv
bGlua3N5cyxucy1wYXJ0aXRpb25zLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IExpbmtzeXMgTm9ydGhzdGFyIHBh
cnRpdGlvbmluZworCitkZXNjcmlwdGlvbjogfAorICBMaW5rc3lzIGRldmljZXMgYmFzZWQgb24g
QnJvYWRjb20gTm9ydGhzdGFyIGFyY2hpdGVjdHVyZSBvZnRlbiB1c2UgdHdvCisgIGZpcm13YXJl
IHBhcnRpdGlvbnMuIE9uZSBpcyB1c2VkIGZvciByZWd1bGFyIGJvb3RpbmcsIHRoZSBvdGhlciBp
cyB0cmVhdGVkIGFzCisgIGZhbGxiYWNrLgorCisgIFRoaXMgYmluZGluZyBhbGxvd3MgZGVmaW5p
bmcgYWxsIGZpeGVkIHBhcnRpdGlvbnMgYW5kIG1hcmtpbmcgdGhvc2UgY29udGFpbmluZworICBm
aXJtd2FyZS4gU3lzdGVtIGNhbiB1c2UgdGhhdCBpbmZvcm1hdGlvbiBlLmcuIGZvciBib290aW5n
IG9yIGZsYXNoaW5nCisgIHB1cnBvc2VzLgorCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnF
gmVja2kgPHJhZmFsQG1pbGVja2kucGw+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6Cisg
ICAgY29uc3Q6IGxpbmtzeXMsbnMtcGFydGl0aW9ucworCisgICIjYWRkcmVzcy1jZWxscyI6Cisg
ICAgZW51bTogWyAxLCAyIF0KKworICAiI3NpemUtY2VsbHMiOgorICAgIGVudW06IFsgMSwgMiBd
CisKK3BhdHRlcm5Qcm9wZXJ0aWVzOgorICAiXnBhcnRpdGlvbkBbMC05YS1mXSskIjoKKyAgICAk
cmVmOiAicGFydGl0aW9uLnlhbWwjIgorICAgIHByb3BlcnRpZXM6CisgICAgICBjb21wYXRpYmxl
OgorICAgICAgICBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiBsaW5rc3lzLG5zLWZpcm13YXJl
CisgICAgICAgICAgLSBjb25zdDogYnJjbSx0cngKKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlCisKK3JlcXVpcmVkOgorICAtICIjYWRkcmVzcy1jZWxscyIKKyAgLSAiI3NpemUtY2Vs
bHMiCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8Cisg
ICAgcGFydGl0aW9ucyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAibGlua3N5cyxucy1wYXJ0aXRp
b25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxz
ID0gPDE+OworCisgICAgICAgIHBhcnRpdGlvbkAwIHsKKyAgICAgICAgICAgIGxhYmVsID0gImJv
b3QiOworICAgICAgICAgICAgcmVnID0gPDB4MCAweDEwMDAwMD47CisgICAgICAgICAgICByZWFk
LW9ubHk7CisgICAgICAgIH07CisKKyAgICAgICAgcGFydGl0aW9uQDEwMDAwMCB7CisgICAgICAg
ICAgICBsYWJlbCA9ICJudnJhbSI7CisgICAgICAgICAgICByZWcgPSA8MHgxMDAwMDAgMHgxMDAw
MDA+OworICAgICAgICB9OworCisgICAgICAgIHBhcnRpdGlvbkAyMDAwMDAgeworICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5zLWZpcm13YXJlIiwgImJyY20sdHJ4IjsKKyAgICAg
ICAgICAgIHJlZyA9IDwweDIwMDAwMCAweGYwMDAwMD47CisgICAgICAgIH07CisKKyAgICAgICAg
cGFydGl0aW9uQDExMDAwMDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5z
LWZpcm13YXJlIiwgImJyY20sdHJ4IjsKKyAgICAgICAgICAgIHJlZyA9IDwweDExMDAwMDAgMHhm
MDAwMDA+OworICAgICAgICB9OworICAgIH07Ci0tIAoyLjI2LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
