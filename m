Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DC8CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccRd+sftCPmQtupwPHM4RmpsEnUuuzWDG+hL6o5l92U=; b=jthFRQlxAl805h
	XCGyknR4svjaLjE2ZbwwIK0tzNnf8QDBpybmzDYwAyvR75f6XTEsIhFbiy2SLPUQB8GLk78J1zG56
	+HN3S5QireVzsr24VExen+RSiYeHXRbOiGEB7lepyj9fm/I0Cpb1TmlcjpmKE8kcTAd7zK2OhnJU+
	dat7V57HGs/Qe6WcFLJWyEdlenMpdoShRZg1q5NynrO0c2vqg44OmNc6/Srb94LoJ/PZgplFa4MTq
	oC6KZKC7qN25kSC3p7GnqzqY0eNOzHMCyPym/deXjZUYAsW3OgOWsAiWSW3kuNFjmLL3KfBAK6vBn
	ZI+5SaeunUmt+ee2K5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG6c-0000000CtGF-2HKI;
	Wed, 10 Sep 2025 08:23:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG6Z-0000000CtEc-3WNI
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:23:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E25F4E40BDB;
	Wed, 10 Sep 2025 08:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F800606D4;
	Wed, 10 Sep 2025 08:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AC01102F27F8;
	Wed, 10 Sep 2025 10:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757492580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uPtwrxmb+q15X+Rr+SGmHDti4RfzxURNrhT61iklzME=;
	b=AnGEIp5s3yTQrYIX+AsJqyo8xFiXuGzmoM12VMjqzEmGmuuOCUJswNZ5NYMJ5/yUW0wEpv
	ZkTAM2qcwcxeB8rdSNUzMXckkzVPW1PLMGECnW9as7SnUMGMnKCdwiv6W+hFS5cR2GP8I6
	hLKyxdTy/xq+jY7w5C8H27Bpe7JrBrvgGISu9v2+YzBJjSw4KIl0HjsknGWqAPFQbtbjW9
	Yuor8MOVoSbGVEmGDMeZHErJZ+DtaqXnpdIWnpatVWaXqIpddjytr4ZSFDonaTRH6rpsRt
	WsSKyuAyPb783Im8JxYOP5cPtBkFwhVXrHxcdgI1KNYSTNnQDcp2OiiPgzvcPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: vigneshr@ti.com, Xichao Zhao <zhao.xichao@vivo.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250909020635.381570-1-zhao.xichao@vivo.com>
References: <20250909020635.381570-1-zhao.xichao@vivo.com>
Subject: Re: [PATCH] mtd: nand: ecc: fix "writen"->"written"
Message-Id: <175749257495.456366.1102196333138664773.b4-ty@bootlin.com>
Date: Wed, 10 Sep 2025 10:22:54 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_012304_017027_B18B261C 
X-CRM114-Status: UNSURE (   3.96  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAwOSBTZXAgMjAyNSAxMDowNjozNSArMDgwMCwgWGljaGFvIFpoYW8gd3JvdGU6Cj4g
VHJpdmlhbCBmaXggdG8gc3BlbGxpbmcgbWlzdGFrZSBpbiBjb21tZW50IHRleHQuCj4gCj4gCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBuYW5kOiBlY2M6IGZpeCAi
d3JpdGVuIi0+IndyaXR0ZW4iCiAgICAgIGNvbW1pdDogZGZlYThmNzE4M2M3MTFmMmJmNmFmN2Fh
ZWYyYTA3ZTMwYjM2YTM2NwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
