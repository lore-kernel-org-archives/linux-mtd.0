Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2AFC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 15:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F3BE61073
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 15:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F3BE61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBjmnKskBVaaDF/yZUJou4qzyx85PseKHcyjBS9bAXU=; b=U/HheJBSvC9OZV
	Dxia2BMqCzQrye+Lrib4d09paDlLXSxULZrbhm9pJd2l8UrAsAfApbEqGfQHKVmUYW0ApX7SxPZ/I
	PASUX4U2DR3fhKpZzf5K85OOL5gdInhSAqxlry0RUywXUrbA3RJ9waPVG/+sGSWFh4u6Ch0rOCP/n
	yjf49dNVrU0roO4hoC+dnj3Arl85sasalVSFbcyd1Tg+Lx8ynMO4mSPZeZRAV0CVlnCu1wDf2fwz+
	/azQR9bZIJWXeQzX8nGyWDL96Cc84nhpq4J0TiEL4oGdvFotuCt5KJ1M88+4XclZ8DS7CzV/0TUOo
	0LGhVJ0nM6wap+8aOxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miHvT-005Y6c-OI; Wed, 03 Nov 2021 15:11:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miHvJ-005Y4A-Mq
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 15:11:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 17so4454362ljq.0
 for <linux-mtd@lists.infradead.org>; Wed, 03 Nov 2021 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nw4lw3QdWRjlNxPGRbwuhTvxj/pxfOmMSn4h4+Uf8y4=;
 b=ca8FIdWOsgZurU2wKXFP/wrDipadzFVOuQO1FksS8gQ/3KwUoo2tAL3sBBDHH31vxd
 AtcEVGDkkEmzc7VrGykHVoDcIz2+dzRKvxQGnzIrCrKBJypTGzvYet7tYVnx4Ffb1Nec
 7OtdEeOofKVwjvfqcvMSFxKIXTdeTR1cPrGctSt5E9LlWgFr5d/VZ0XdA0SZfmKjbo7c
 Le1S7vFeerX9EwUeFHJFWhnJF6G8G/j0ED60SA/aVrLdHMPRDlRjfkAfKjRTJZTIjWkK
 qUEL2jq8FQ8C2OKY83cxaBjMIE1LKdjZ+c9sQq9tPLOF7ZB0Ze0NB+j5Ahl7wEpVEANw
 fDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nw4lw3QdWRjlNxPGRbwuhTvxj/pxfOmMSn4h4+Uf8y4=;
 b=2db1s9GSra5wgROfeNO4SS+3aDl3GzlySHogDi2Q59C/3GuQR2NrYuB/r13q+wNffe
 CxJ0SYXV+4SqDkzvRcLTbDgIh0PTPWHpjF4au4tWQlM7GR1XLGMS6JfdREQKnqGapRW/
 5LhdKYVNiO/92XeHE6X8nZVmBI4XAdxOqkvkfJbj1mRy4C0uq1E4RyGtPYw69lylbOz/
 gZyItfYUCAQRwhMvw1qNwaEFL47B95pR4a4+s8NIUSYRBONnRPQFT6tba/cABbIly8JF
 PR78ezXVTCjYxBOfbKavnuTvtfr41Dvzb8A5m+gB7No8ik4SIbtxjiHz5D2W39puGTl9
 4pFg==
X-Gm-Message-State: AOAM532ZWX4Dnj8N/U4s75l8DnEFtgabCa1Sxtj18Se83z0dLwUhAJ00
 ezPKtxhXqj6SfSVNw2ZtRJM=
X-Google-Smtp-Source: ABdhPJwTpJkWvurpf4sUrvT5F7IoRvgQdE67o5LHmudIX3zYW0DieyPYt3EUzvqRNnmD+WHgo7j/ZQ==
X-Received: by 2002:a05:651c:160e:: with SMTP id
 f14mr42824957ljq.379.1635952291983; 
 Wed, 03 Nov 2021 08:11:31 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id p3sm224107ljc.25.2021.11.03.08.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:11:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: rawnand: brcmnand: support "no-wp" DT property
Date: Wed,  3 Nov 2021 16:11:17 +0100
Message-Id: <20211103151117.18690-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103151117.18690-1-zajec5@gmail.com>
References: <20211103151117.18690-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_081133_791780_25607787 
X-CRM114-Status: GOOD (  13.11  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU29tZSBib2FyZHMgbWF5
IHVzZSBXUC1jYXBhYmxlIGNvbnRyb2xsZXIgYnV0IHN0aWxsIGhhdmUgV1Agbm90CmNvbm5lY3Rl
ZC4gVGhpcyBjaGFuZ2UgZml4ZXM6ClsgICAgMS4xNzU1NTBdIGJjbTYzMTM4X25hbmQgZmY4MDE4
MDAubmFuZDogdGltZW91dCBvbiBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgYzAwMDAwNDAgZ290IGMw
MDAwMGMwKQpbICAgIDEuMTg0NTI0XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5hbmQ6IG5hbmQg
I1dQIGV4cGVjdGVkIG9uClsgICAgMS4yODU1NDddIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFu
ZDogdGltZW91dCBvbiBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgYzAwMDAwNDAgZ290IGMwMDAwMGMw
KQpbICAgIDEuMjk0NTE2XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5hbmQ6IG5hbmQgI1dQIGV4
cGVjdGVkIG9uClsgICAgMS4zOTU1NDhdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFuZDogdGlt
ZW91dCBvbiBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgYzAwMDAwNDAgZ290IGMwMDAwMGMwKQpbICAg
IDEuNDA0NTE3XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5hbmQ6IG5hbmQgI1dQIGV4cGVjdGVk
IG9uCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0t
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXggZjc1OTI5NzgzYjk0Li44YjYxNjc0NTdm
MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMK
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtNzE0LDcg
KzcxNCw4IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5h
bmRfY29udHJvbGxlciAqY3RybCkKIAlpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDUwMCkK
IAkJY3RybC0+ZmVhdHVyZXMgfD0gQlJDTU5BTkRfSEFTXzFLX1NFQ1RPUlM7CiAKLQlpZiAoY3Ry
bC0+bmFuZF92ZXJzaW9uID49IDB4MDcwMCkKKwlpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4
MDcwMCAmJgorCSAgICAhb2ZfcHJvcGVydHlfcmVhZF9ib29sKGN0cmwtPmRldi0+b2Zfbm9kZSwg
Im5vLXdwIikpCiAJCWN0cmwtPmZlYXR1cmVzIHw9IEJSQ01OQU5EX0hBU19XUDsKIAllbHNlIGlm
IChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woY3RybC0+ZGV2LT5vZl9ub2RlLCAiYnJjbSxuYW5kLWhh
cy13cCIpKQogCQljdHJsLT5mZWF0dXJlcyB8PSBCUkNNTkFORF9IQVNfV1A7Ci0tIAoyLjMxLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
