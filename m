Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA774C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 16:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BAEF64E8B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 16:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BAEF64E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5triL3WMvhd22685u0xjc5pAOqu5TAdmEJwBVoAVENY=; b=imn1J/42+bZiZWqoYUat1xjfB
	0jGI2324BOuXfqhxYuQi+m5OMWJvN1XuD2qCamChroPzD/q+zDuMq+Hzhw7HG5kCna80AEoB0lKgH
	BS7+zxK/+w7gimxGptK2szJtX/sFCGZHDG/BZXiGpIKZduWDLXLq2qNKlJf+MJZ+yGZybb4fbUt8J
	CSXs9z9z0VcLMcrAU+/psaqdhdEIHI4RyJrTVZgVCcvX/YqQQpHWs72axo3/7QaTKpyWxiP8AEeEX
	u7W9+RAXhPD4lvOaCZFgqYReTcD9rXoHWqexd5Wyx+DBLGz1yATZpo2psac/KNCkevOjbLy6A4Nps
	0htYzl5pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAEhk-0006bq-RA; Thu, 11 Feb 2021 16:20:32 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAEhh-0006ae-Hf
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 16:20:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id d24so8897467lfs.8
 for <linux-mtd@lists.infradead.org>; Thu, 11 Feb 2021 08:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3WpoZRJbhDf8nOoFeDPqKJ512Il9p1PZRrO8Rys09/E=;
 b=eByUleltSsDabJSARAXb5WFg5+LXtrKg7AY6TIk0O9ksaNguT5kRzw6PmUzTAosxis
 iNShdt9aBkOXFdRyoaDfxL5nBj5AyVaDaLCfi4GIRXdNbQCvj3FNHy4xyQk4XsiRZz3n
 WimIRpS8aRhTESVPYaI7d3fcs5MrWy0iYjIVbU849oSNuGy0kI4QsmPVMH0N8+7FbCr6
 VMHYqmHNH6Avq4XMeHQZrPxgDeWjWaTCKOD5koVK42fjkij0RN/Lp7nIMKNNsrZPWQ20
 QBUV/l3peoDFe/mbmqRF9muDf+EFFPXOTlcnO7HRwksZJmK6nV6PVXwDWamiaor/e+Xw
 En9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WpoZRJbhDf8nOoFeDPqKJ512Il9p1PZRrO8Rys09/E=;
 b=fpLyGhgpcp0I0UnwCUrmNp+O+8+NICaEilXe/sAwRB2d5Kv6q0Vm2ZdF57pJxfEqxC
 65xeEWqa9F7aSXo3o973kSw5JXlqp3++GL1ubwt8Fqs6x2eScZUmSC87A9FOQ7/kvceB
 r2h/Ni3mWumTzttA7+vmpb/rgf/cb6kU26cKb+zY5FQ3BsiBJBDxR/Yf/35mmSxlk9jq
 vamZFt7fvBNY3pqB0BaMsW3hGDidPxsgwz6+MiGPGpI7SuXaZWyquqzzA2P/DDMMVTFv
 zFd89MRy/BtAxf/8IPFgdV43N2ebGtRCoybn0uzDyuVoDwIgJ0Jtkn2DF3YYnHp6I7X5
 6Mqw==
X-Gm-Message-State: AOAM532oShhS8d+TDZQXhOT+Dynq/Ualk05ht5zn+RWXjo3PT+5hMod6
 3/KLOrFaVWT6NGtDE7Uu6fM=
X-Google-Smtp-Source: ABdhPJzja81XJ6PEVGOSRsOZMSj5zqLEbPhy1Lu7xHQa/hCANZF3lbGArnTjoNKjzSxwFJoZt/TpXg==
X-Received: by 2002:ac2:4ade:: with SMTP id m30mr5152152lfp.231.1613060426406; 
 Thu, 11 Feb 2021 08:20:26 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id b5sm685941lfi.3.2021.02.11.08.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 08:20:25 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V2 mtd/next 2/3] dt-bindings: mtd: add binding for BCM4908
 partitions
Date: Thu, 11 Feb 2021 17:20:11 +0100
Message-Id: <20210211162012.27417-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210211162012.27417-1-zajec5@gmail.com>
References: <20210211162012.27417-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_112029_690889_BD1627C1 
X-CRM114-Status: GOOD (  15.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQkNNNDkwOCB1c2VzIGZp
eGVkIHBhcnRpdGlvbnMgbGF5b3V0IGJ1dCBmdW5jdGlvbiBvZiBzb21lIHBhcnRpdGlvbnMgbWF5
CnZhcnkuIFNvbWUgZGV2aWNlcyB1c2UgbXVsdGlwbGUgZmlybXdhcmUgcGFydGl0aW9ucyBhbmQg
dGhvc2UgcGFydGl0aW9ucwpzaG91bGQgYmUgbWFya2VkIHRvIGxldCBzeXN0ZW0gZGlzY292ZXIg
dGhlaXIgcHVycG9zZS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KLS0tClYyOiBVc2UgZW51bTogWyAxLCAyIF0gZm9yIGFkZHJlc3MgJiBzaXplCiAg
ICBVc2UgXnBhcnRpdGlvbkBbMC05YS1mXSskIHBhdHRlcm4gKCJwYXJ0aXRpb24iIHdhcyBhZGRl
ZCkKICAgIERyb3AgdW5uZWVkZWQgYWxsT2YKICAgIEFkZCB1bmV2YWx1YXRlZFByb3BlcnRpZXMK
LS0tCiAuLi4vcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sICAgfCA3MCAr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkwOC1w
YXJ0aXRpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLjdiMTEzZTVlMzQyMQotLS0gL2Rldi9udWxsCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5
MDgtcGFydGl0aW9ucy55YW1sCkBAIC0wLDAgKzEsNzAgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyVZQU1MIDEuMgorLS0tCiskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkw
OC1wYXJ0aXRpb25zLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEJyb2FkY29tIEJDTTQ5MDggcGFydGl0aW9uaW5n
CisKK2Rlc2NyaXB0aW9uOiB8CisgIEJyb2FkY29tIEJDTTQ5MDggQ0ZFIGJvb3Rsb2FkZXIgc3Vw
cG9ydHMgdHdvIGZpcm13YXJlIHBhcnRpdGlvbnMuIE9uZSBpcyB1c2VkCisgIGZvciByZWd1bGFy
IGJvb3RpbmcsIHRoZSBvdGhlciBpcyB0cmVhdGVkIGFzIGZhbGxiYWNrLgorCisgIFRoaXMgYmlu
ZGluZyBhbGxvd3MgZGVmaW5pbmcgYWxsIGZpeGVkIHBhcnRpdGlvbnMgYW5kIG1hcmtpbmcgdGhv
c2UgY29udGFpbmluZworICBmaXJtd2FyZS4gU3lzdGVtIGNhbiB1c2UgdGhhdCBpbmZvcm1hdGlv
biBlLmcuIGZvciBib290aW5nIG9yIGZsYXNoaW5nCisgIHB1cnBvc2VzLgorCittYWludGFpbmVy
czoKKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGJyY20sYmNtNDkwOC1wYXJ0aXRpb25zCisKKyAg
IiNhZGRyZXNzLWNlbGxzIjoKKyAgICBlbnVtOiBbIDEsIDIgXQorCisgICIjc2l6ZS1jZWxscyI6
CisgICAgZW51bTogWyAxLCAyIF0KKworcGF0dGVyblByb3BlcnRpZXM6CisgICJecGFydGl0aW9u
QFswLTlhLWZdKyQiOgorICAgICRyZWY6ICJwYXJ0aXRpb24ueWFtbCMiCisgICAgcHJvcGVydGll
czoKKyAgICAgIGNvbXBhdGlibGU6CisgICAgICAgIGNvbnN0OiBicmNtLGJjbTQ5MDgtZmlybXdh
cmUKKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK3JlcXVpcmVkOgorICAtICIj
YWRkcmVzcy1jZWxscyIKKyAgLSAiI3NpemUtY2VsbHMiCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgcGFydGl0aW9ucyB7CisgICAgICAgIGNv
bXBhdGlibGUgPSAiYnJjbSxiY200OTA4LXBhcnRpdGlvbnMiOworICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAgICAgcGFydGl0
aW9uQDAgeworICAgICAgICAgICAgbGFiZWwgPSAiY2Zlcm9tIjsKKyAgICAgICAgICAgIHJlZyA9
IDwweDAgMHgxMDAwMDA+OworICAgICAgICB9OworCisgICAgICAgIHBhcnRpdGlvbkAxMDAwMDAg
eworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLGJjbTQ5MDgtZmlybXdhcmUiOworICAg
ICAgICAgICAgcmVnID0gPDB4MTAwMDAwIDB4ZjAwMDAwPjsKKyAgICAgICAgfTsKKworICAgICAg
ICBwYXJ0aXRpb25AMTAwMDAwMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gImJyY20sYmNt
NDkwOC1maXJtd2FyZSI7CisgICAgICAgICAgICByZWcgPSA8MHgxMDAwMDAwIDB4ZjAwMDAwPjsK
KyAgICAgICAgfTsKKworICAgICAgICBwYXJ0aXRpb25AMWYwMDAwMCB7CisgICAgICAgICAgICBs
YWJlbCA9ICJjYWxpYnJhdGlvbiI7CisgICAgICAgICAgICByZWcgPSA8MHgxZjAwMDAwIDB4MTAw
MDAwPjsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
