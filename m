Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63B9C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D41B206D9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2jrS3lh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJU8W1fM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D41B206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZ1Ot5NdAfsPliBKbl/LL0Voc61CL3QlP5Sa9OpZLE4=; b=i2jrS3lhT4s3FT
	xEYHBb0k/mWHuy6ud+Up8xBawFl9BJ6Kq+PnrBGgBlP9s1YXTskQUZqB+dMlg/z8d1p8yyL223R9A
	fMtOarP7S4+HEpRp24KuHw+SYuVK6bExpYsOcZZSux3HHmFIC2lsHTO5m+gBihaeDakcXuHXZ4g2R
	N+9DmSRQYxADaRcRdopQtimqdHwXoBTUeaJ/fEbK7Xiu7y6vBjZp6yQouU6yK69sQY6KJCbwxHyQ8
	nWx/+mulx9sB0mDnlIW3ijqzXhrayp/1q8TUD3NX0cZgbb9eSZWx5/E4/ShBFKJju6zbcWmpcDKU7
	KJOyZgJDAYAKMn2dbf+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVXRy-0006ST-GT; Mon, 04 May 2020 09:31:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVXQw-0005QY-0h
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 09:30:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id f13so20032516wrm.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILoe7y0shto7bU0P2H+2klHY8P228w9POxLvuitoG7I=;
 b=bJU8W1fM3zw2r4Ba5Dl1PuJBnxl0FmJIjrjpwbeYBXO4OlYdW7lQCPRbjaFrAZYsTT
 91aVNepFk6EylE+Ux5jwIBE+2zDHUDWgjwZhJwOTo0/F7O1H3+NTgCO+rPRZvQ8fmqoe
 FVgqDvpt3wT59lVSABdupwMmw4+nmai4HG6lzXT4BxEETAFXbCp/sSTwowDU/UaJvdd9
 UJL+6Wnt0HFxDCDw2PTSavg9pYv5fB/EC8bY8BcjZyNke0e6lDRXAf5vj20V8offQ84l
 EmMpo1B4aDnynA71nShdaLEnEtxCGBnLX6IRhCbmU0dn8pW7nxcC8acevT5mtmhoZa5J
 JVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILoe7y0shto7bU0P2H+2klHY8P228w9POxLvuitoG7I=;
 b=BdEoNtpnoT3dQReA8eM1eGUhMM5meS7zMksOoiqAJscBNBmh/Bty2OdAyMr9cfpJFO
 BFrzw2kBB0YokFYp5lgEDKsOrANYgkvvcKuUEmOCw+KX1eN8iHzfR51ERYMkOFezHxlp
 bGKsU9tOqYnAYBxLqliSyvAv5F0If82WvF441w2mKQuMCqHsRpFiVXRB9Qxoif7ZvwG6
 wTu7be8coawwEEAKtn13yteMiK40zwXs7wdyI+txDgb5YO1e0KcceF98pfHVTzuguU+x
 tKpU9xp4DXRPDPcIUx1nf7bvhh/sOiJF3PacyZB2dNl10k7nzHbIwLENqBmhUYNtFBqQ
 8puQ==
X-Gm-Message-State: AGi0PuZRDU7Wx+FP7Ksr9OSzifem+aBpTjmmCTAaFO+31z5DTDLIfgnD
 3/HLXUHZj4cebzl2ItgMeDg=
X-Google-Smtp-Source: APiQypLvAvPIqV4mmOd08kzXGbxUOuVUQXP/BU97hOB+1KAm8BHZmwLzY/vOTCYPLk1/KgNU/leseA==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr19509274wru.326.1588584640260; 
 Mon, 04 May 2020 02:30:40 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id u12sm13075570wmu.25.2020.05.04.02.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:30:39 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] nand: brcmnand: improve hamming oob layout
Date: Mon,  4 May 2020 11:30:33 +0200
Message-Id: <20200504093034.2739968-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_023042_207670_4904EACD 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIGN1cnJlbnQgY29kZSBnZW5lcmF0ZXMgOCBvb2Igc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04
ClMyCTktMTUKUzMJMTYtMjEKRUNDCTIyLTI0ClM0CTI1LTMxClM1CTMyLTM3CkVDQwkzOC00MApT
Ngk0MS00NwpTNwk0OC01MwpFQ0MJNTQtNTYKUzgJNTctNjMKCkNoYW5nZSBpdCBieSBtZXJnaW5n
IGNvbnRpbnVvdXMgc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04ClMyCTktMjEKRUNDCTIyLTI0ClMz
CTI1LTM3CkVDQwkzOC00MApTNAk0MS01MwpFQ0MJNTQtNTYKUzUJNTctNjMKClNpZ25lZC1vZmYt
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDI4ICsrKysrKysrKy0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IGU0ZTNj
ZWVhYzM4Zi4uMWJiYTMwOWM3Njg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKQEAgLTExMDAsMjkgKzExMDAsMjEgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1t
aW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAlz
dHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7CiAJaW50IHNhcyA9IGNmZy0+
c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVfMWs7CiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7CisJdTMyIG5leHQ7
CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICogMikKKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMp
CiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIp
ICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNhcyk7CisJaWYgKHNlY3Rpb24gPCBzZWN0b3Jz
KQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlvbiAmIDEpIHsKLQkJb29icmVnaW9uLT5vZmZz
ZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGggPSA3OwotCX0gZWxzZSB7Ci0JCW9vYnJlZ2lv
bi0+bGVuZ3RoID0gNjsKKwlpZiAoc2VjdGlvbikKKwkJb29icmVnaW9uLT5vZmZzZXQgPSAoKHNl
Y3Rpb24gLSAxKSAqIHNhcykgKyA5OworCWVsc2UKKwkJb29icmVnaW9uLT5vZmZzZXQgPSAxOyAv
KiBCQkkgKi8KIAotCQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAq
LwotCQlpZiAoIXNlY3Rpb24pIHsKLQkJCS8qCi0JCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5
dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKLQkJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KLQkJ
CSAqLwotCQkJaWYgKGNmZy0+cGFnZV9zaXplID4gNTEyKQotCQkJCW9vYnJlZ2lvbi0+b2Zmc2V0
Kys7Ci0JCQlvb2JyZWdpb24tPmxlbmd0aC0tOwotCQl9Ci0JfQorCW9vYnJlZ2lvbi0+bGVuZ3Ro
ID0gbmV4dCAtIG9vYnJlZ2lvbi0+b2Zmc2V0OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjI2LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
