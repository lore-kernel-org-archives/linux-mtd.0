Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57537C44508
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 01:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nBgNoeRZc0Yy76lbNkDay+WRSw7rZTwqlvCtgLCPMoM=; b=LiQG6HeEVjEAfq
	H1+xaKcwHGnk7XTNftk+yLD6RVzSKxshXURylJfISPhkww9RVb2gbInnRO7Bw6yO9cB+5+wSvmq8m
	w6npK74jGR6S3lDMemzr64y0ANKCQc5i/AuotKUIIWZHzBKLR9vjLX6sXjeyNaT7oP46ESRBg4Bhh
	PS5f11YVyi6Df07T2aCs4vc7IemQ8CN6osGcFGMNe+zIegmLKkt8olTNs5ojt+FD6KFweWsJoyLqA
	n9X4zVmk3WPvAn3e25FeE++gYfrCT62ufneZWt8LMVjUmu5mLQarHdvPBj1Y/lTPsSoC9dyj1e9as
	nXc5Mz4/7hMY3cWT9XyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijbW-00000006H3I-0CVg;
	Thu, 22 Jan 2026 01:35:22 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijbT-00000006H2x-1wsf
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 01:35:20 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8c5389c3d4cso47381085a.3
        for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2026 17:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=njit.edu; s=google; t=1769045717; x=1769650517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGbhOo8eNWt6MQwoA9ikJePzuNE3mExdUJOE9y2m2Rk=;
        b=Sf4tgYhdsH/Hgr6+0evnUh/KtkgQzbnmNlKklRSnlB7wnszUkZqp6tSqga1ug9P/AM
         /IAG9L4G/xUhk1cZAVckP7fjOAevRJd11bSFQQZLNZOEhft2/bfikaUqPi8sShcTgSnP
         5avw+vADKtEC2YN6cP2UVcJJqcxMVCFbHo2VXmDl8RwIuTeZ4WLow4y7MMvP0Awu80Ge
         9KRtIy7Hdbzfc1BbKEQ9rdr58xSar+tknaQZmwqlKxXRGfZLrUEDRuUNLr6nSBqrKx4V
         FRptXHexFACLt/pQoMlerzUDZiaKvkhbkKUpfzFM2erdloMd1/RhMp1wrGLiqmmK3Smr
         iBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769045717; x=1769650517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGbhOo8eNWt6MQwoA9ikJePzuNE3mExdUJOE9y2m2Rk=;
        b=ai50QYZ6lbVbEkf8bLsjag4PD2Sx+tvLWkk5MGFZcxy0PuH2SBREOZkho/VetAfOnm
         QdClCQ1g1dI0oo+KGTrVEAN++Qk02s4MtW9kxutQT0AMgLaPTrCe4Qnrug4KR5RR5jC8
         rh9HUZWLKwsVzkjm1BQe+YHBlz2qE34j4Yidf2QiF9Jex/dHaT4WueAprq6xRLge0ywP
         AjuVw7aoPuvViuuk7aazTWbv3SA/aHnoceejetLNG/xcVk/y/k3pJlHZd7w8Hx2lM9Ud
         11J5fflWjHs+bgUkEmaRVb9GH/RmNri+hd4ARh4K3s9rZ4uzXBRCpTWWEV/73SelVSVb
         1ADw==
X-Forwarded-Encrypted: i=1; AJvYcCWTE0J5pR+TB9lm5MRdbYakrW5oBIPNWpf88FhJ8ZchEYdtvxF5N98AaVDJGDDKuvFZgZANghEzbLc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBs7fB7DVqPT6AwwVAXWQNE85wb3FaZWzax73DBEv9t3MMWn60
	6prqqi6ZMYl/LbY9sinWHy+FowF7LrVATGt7LoWTyelEHe+UKD+36yxji2yb6eE0dQ==
X-Gm-Gg: AZuq6aLW0KF+jU7UnMqde0RHLN949kjmu8W+TGsPm0Gtoq7McpTubwmVgT4IwF38klQ
	uTq1SJ1UbZ/bWjdsGKOUi70dLV02xVsXDyTMD6erad0Ko5+q13zZcxxDMkMslL5NByS37pk/QGA
	Rg+Th+owHUd6Qu18awvckv9JFJCQFP9hCTFDS/0pIW7iqaqPsqn0O5AgGU/0OXIewlsiAXPI0az
	TlAoY+gicwM7KkuDtBtHBhbMBSfMrqghr54m0x7sl2y3LBaAyZNSkh0RuixDrJe6TT/pRgHLblG
	3Kbk9UaAmzZhIAuFVK+9JBbJ3qSm/ShN6B9LckgYw6id/sfXskvKiwAZ2mKJ/S6HxbnXfLJjvRR
	LIv2yiJvA180EnldtWTSMkMVmTMaBJ+tK6JAk3GANFcBoY+X26znsVR1i9XxUN4oFh3Pd5Ro/Hc
	J0WT4NdxIoETNlRSTJDeO594FmuoOYVlktxELfNBaMVUc=
X-Received: by 2002:a05:620a:2988:b0:8c6:b258:dfd6 with SMTP id af79cd13be357-8c6b258e5e6mr2306525385a.87.1769045717580;
        Wed, 21 Jan 2026 17:35:17 -0800 (PST)
Received: from localhost.localdomain ([2600:4041:4152:ba00:4078:c0f9:2328:fb43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ad797sm1374444685a.8.2026.01.21.17.35.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Jan 2026 17:35:17 -0800 (PST)
From: Chenxi Hou <ch395@njit.edu>
To: linux-kernel@vger.kernel.org
Cc: colin.i.king@gmail.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	rk0006818@gmail.com,
	vigneshr@ti.com,
	Chenxi Hou <ch395@njit.edu>,
	Hui Peng <benquike@gmail.com>,
	"Zhihao (Zephyr) Yao" <zhihao.yao@njit.edu>
Subject: [PATCH] mtd: jedec_probe: fix shift-out-of-bounds UB in JEDEC ID masking
Date: Wed, 21 Jan 2026 20:32:50 -0500
Message-ID: <20260122013250.19384-1-ch395@njit.edu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_173519_557904_95683477 
X-CRM114-Status: GOOD (  12.17  )
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

VUJTQU4gcmVwb3J0cyBzaGlmdC1vdXQtb2YtYm91bmRzIGluIGplZGVjX3JlYWRfbWZyKCkgYW5k
IGplZGVjX3JlYWRfaWQoKToKCsKgIFVCU0FOOiBzaGlmdC1vdXQtb2YtYm91bmRzIGluIGRyaXZl
cnMvbXRkL2NoaXBzL2plZGVjX3Byb2JlLmM6MTkyNDoxMwrCoCBzaGlmdCBleHBvbmVudCAzMiBp
cyB0b28gbGFyZ2UgZm9yIDMyLWJpdCB0eXBlICdpbnQnCsKgIFVCU0FOOiBzaGlmdC1vdXQtb2Yt
Ym91bmRzIGluIGRyaXZlcnMvbXRkL2NoaXBzL2plZGVjX3Byb2JlLmM6MTk0MDoxMgrCoCBzaGlm
dCBleHBvbmVudCAzMiBpcyB0b28gbGFyZ2UgZm9yIDMyLWJpdCB0eXBlICdpbnQnCgpUaGUgSkVE
RUMgbWFudWZhY3R1cmVyL2RldmljZSBJRCBtYXNraW5nIHVzZXM6CgrCoCAoMSA8PCAoY2ZpLT5k
ZXZpY2VfdHlwZSAqIDgpKSAtIDEKCldoZW4gY2ZpLT5kZXZpY2VfdHlwZSBpcyA0LCB0aGlzIGV2
YWx1YXRlcyB0byAxIDw8IDMyLiBTaW5jZSB0aGUKbGl0ZXJhbCAnMScgaGFzIHR5cGUgaW50LCB0
aGlzIGlzIGEgMzItYml0IHNoaWZ0IGFuZCBpcyB1bmRlZmluZWQgYmVoYXZpb3IuCgpGaXggaXQg
YnkgdXNpbmcgYSA2NC1iaXQgbGl0ZXJhbCAoMVVMTCkgc28gdGhlIHNoaWZ0IGlzIHBlcmZvcm1l
ZCBpbiBhIDY0LWJpdCB0eXBlLgoKQ28tZGV2ZWxvcGVkLWJ5OiBIdWkgUGVuZyA8YmVucXVpa2VA
Z21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBIdWkgUGVuZyA8YmVucXVpa2VAZ21haWwuY29tPgpD
by1kZXZlbG9wZWQtYnk6IFpoaWhhbyAoWmVwaHlyKSBZYW8gPHpoaWhhby55YW9AbmppdC5lZHU+
ClNpZ25lZC1vZmYtYnk6IFpoaWhhbyAoWmVwaHlyKSBZYW8gPHpoaWhhby55YW9AbmppdC5lZHU+
ClNpZ25lZC1vZmYtYnk6IENoZW54aSBIb3UgPGNoMzk1QG5qaXQuZWR1PgotLS0KIGRyaXZlcnMv
bXRkL2NoaXBzL2plZGVjX3Byb2JlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMv
amVkZWNfcHJvYmUuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2plZGVjX3Byb2JlLmMKaW5kZXggYjI4
NTk2MmVlZTJhLi4zYzYzMTYwOGY2ZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2pl
ZGVjX3Byb2JlLmMKKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvamVkZWNfcHJvYmUuYwpAQCAtMTky
MSw3ICsxOTIxLDcgQEAgc3RhdGljIGlubGluZSB1MzIgamVkZWNfcmVhZF9tZnIoc3RydWN0IG1h
cF9pbmZvICptYXAsIHVpbnQzMl90IGJhc2UsCiAJICovCiAJZG8gewogCQl1aW50MzJfdCBvZnMg
PSBjZmlfYnVpbGRfY21kX2FkZHIoMCArIChiYW5rIDw8IDgpLCBtYXAsIGNmaSk7Ci0JCW1hc2sg
PSAoMSA8PCAoY2ZpLT5kZXZpY2VfdHlwZSAqIDgpKSAtIDE7CisJCW1hc2sgPSAoMVVMTCA8PCAo
Y2ZpLT5kZXZpY2VfdHlwZSAqIDgpKSAtIDE7CiAJCWlmIChvZnMgPj0gbWFwLT5zaXplKQogCQkJ
cmV0dXJuIDA7CiAJCXJlc3VsdCA9IG1hcF9yZWFkKG1hcCwgYmFzZSArIG9mcyk7CkBAIC0xOTM3
LDcgKzE5MzcsNyBAQCBzdGF0aWMgaW5saW5lIHUzMiBqZWRlY19yZWFkX2lkKHN0cnVjdCBtYXBf
aW5mbyAqbWFwLCB1aW50MzJfdCBiYXNlLAogCW1hcF93b3JkIHJlc3VsdDsKIAl1bnNpZ25lZCBs
b25nIG1hc2s7CiAJdTMyIG9mcyA9IGNmaV9idWlsZF9jbWRfYWRkcigxLCBtYXAsIGNmaSk7Ci0J
bWFzayA9ICgxIDw8IChjZmktPmRldmljZV90eXBlICogOCkpIC0xOworCW1hc2sgPSAoMVVMTCA8
PCAoY2ZpLT5kZXZpY2VfdHlwZSAqIDgpKSAtIDE7CiAJcmVzdWx0ID0gbWFwX3JlYWQobWFwLCBi
YXNlICsgb2ZzKTsKIAlyZXR1cm4gcmVzdWx0LnhbMF0gJiBtYXNrOwogfQotLSAKMi41Mi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
