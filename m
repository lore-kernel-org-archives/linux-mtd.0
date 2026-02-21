Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1099EC61DC6
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4CiQHUSZcNgcR4S3TS4ksmHHpcrHCdRGQmSijDpclM=; b=PG733Iz1/uBoMD
	nedkyDxZBMJGVP2MDCmn2SS0QRu+G0eGxrxDH0Kp1QPuesszib9sQ7PiD6A1sYRbO+bWbUOmbuUx6
	dZc/qcC2Oe68aeemFnQGsBXgOmw+URlSQmQxsG4xx2sb9Fg1TFInIyyAXOHJ5D7zMFog4sJ+LsZib
	OZZvxuBgPXcWLyujATsSUxhOGA28w1nbgsLNnhZfyy6e9LZ05u9UV6QDLt/CfkrBPM2HKTAfyCMWf
	lWnhSPy9uwDl9cnjQrtCbIBvfyOTikwKsDwfyK+wk8dD85rjgfC26Cqz4GnY5eOcQ9mxpHoQv54Tu
	2RP3J6kIW/3o8EkUF9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vti6B-0000000FuYf-0ODH;
	Sat, 21 Feb 2026 08:12:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vti68-0000000FuYL-2OTK
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 08:12:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4359249bbacso2265517f8f.0
        for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2026 00:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771661538; x=1772266338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s16pmqG8vfxbiZO2fdoKjDkNmIQY6vv6261sXrZPjBU=;
        b=iBSOAsLMZdNO2iN6SfKgxNJlC3bomx5Q3IVzByqXs7rofzjncTolhp4PY/IM9LMzv8
         kU7laW16o0EjEwe7j+h1cSBawlkWYqJhDQTh2fTTAR2T3j1KIdQqc7GS4F8NvYfoiSyX
         EYeRrzpEvAwrT+YJOEgoqKWy5i9TZo2qiQIbKA5AIUyi+nfADfUM+x/YQZRWejrixRep
         u7uZRrYptM//mMbdjdDessDNgMzRVGVSBw7QAuAjDLYtIIXsBitcQdEROAL+33tNuV57
         pEhPgcmr0tW1bN26wXED+w0Sf5tbxrM0iZmsEhhehZrWWKiZrmhJ1VPiS8lOyzvGxkHR
         FRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771661538; x=1772266338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s16pmqG8vfxbiZO2fdoKjDkNmIQY6vv6261sXrZPjBU=;
        b=vo51tZsUSemapePHPPdUZ/ZSQSCGnXVHcsTlDno8G9B19z5aehSZNZf3jq5bvvmqTn
         aN+nsM2HEurDTJD0noGt+OZbG4y92OijrDcfP0zvjxFVn+hdWiG5C2hS5qZxqCcOodyu
         diEeR3qwo4GB6+1ISr9GHOYqIG5osSyqkH5j83uY31+1Ko0M+76Vr7r+5t3sye7oEJWx
         foX5cR63oQknWvX5kg+sVYDqgsv00KE+tTx/PQ6jX2RtJns/ylb6aVkO2Bo5ruQXn+Ju
         7lS73jL2+76EhiYoCg7aYnf05u5M50fpcdLIvduI7I+FiL2MJtheCvGerFVWulW0VVOv
         aiGw==
X-Forwarded-Encrypted: i=1; AJvYcCW1519ytclpkLTHXxPfljZRhI8Xf7qWW/J11U+V7QbNDoUoCxGk2W2kE7KbBLqMpgcSSgWwIzUzXH0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCg4oIbMlv2SwDx3K6h11KTe+PuF9T+aoIEP8LYgk/Q4IRf4Ib
	9qgjpU4h7EHO0Auf8WbP91Q2qUlSTEwksI1eLC4K7mnUrOU4/STIiQZm
X-Gm-Gg: AZuq6aLf++5Kkz23hk845pGTA2l7jpA4vWiTvyJrMKBryE9sk6O7uPJGhO0FfHwKRqp
	5zbrdqVT5G4qsVeAaU6101UCPm6IizE31cuC3kysRRMBgLmWMZPz7Hl/Kw6agpVOQz7JsPIBLrv
	8gh5tH2orz/LD3vYC5DiccorYQ8eDSgwJw1rCrOoVetGCn4xKtLAGxvUljMcEtOAnCbUTs8WCif
	Uzjgf79sINWTn+4Tmskz0okE+JLCVtwnJXZqOolmop5c5ubdMDC2dtXyqXSmm+RWLpOhqnNyKY1
	fRUTfFTExM5/GB/SY+vEf9y2AH/dxI5owGxjfMgVGNPcZJggutVJntbl7qgFZNNEBfs6eZZfQhO
	McvVolVQLrFTd8ZDIYIwFtBnKKNS5HVL+ZqVxihALJXv6JyriaUuPW9u9/qsZwiYbN/vTBMP3cu
	zTqUVza1zdWP3gLMSbl64TRJ8Mw7EdBM9Dc7W7IQKrcvO3txs=
X-Received: by 2002:a05:6000:2405:b0:436:34e6:7d8c with SMTP id ffacd0b85a97d-4396270cbadmr14540239f8f.19.1771661538399;
        Sat, 21 Feb 2026 00:12:18 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00c18sm3680059f8f.14.2026.02.21.00.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:12:17 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: cafe: Use generic power management
Date: Sat, 21 Feb 2026 08:11:57 +0000
Message-ID: <20260221081207.711359-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216090415.675368-1-vaibhavgupta40@gmail.com>
References: <20260216090415.675368-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_001220_831480_41A95B9D 
X-CRM114-Status: GOOD (  12.33  )
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

U3dpdGNoIGZyb20gUENJIHBvd2VyIG1hbmFnZW1lbnQgdG8gdGhlIGdlbmVyaWMgcG93ZXIgbWFu
YWdlbWVudApmcmFtZXdvcmsgc28gdGhlIHBjaV9kcml2ZXIgaG9va3MgY2FuIGV2ZW50dWFsbHkg
YmUgcmV0aXJlZC4KClNpZ25lZC1vZmYtYnk6IFZhaWJoYXYgR3VwdGEgPHZhaWJoYXZndXB0YTQw
QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5j
b20+Ci0tLQoKdjI6IFJlZm9ybWF0IHRoZSBjb21taXQgbWVzc2FnZSBhcyBwZXIgdGhlIHN1Z2dl
c3Rpb24gb2YgQmpvcm4uCgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIHwg
NyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKaW5kZXggNjYzODVjNGZiOTk0Li5hZjc3MWMzNzll
YzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCisrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCkBAIC04MzcsOSArODM3LDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBjYWZlX25hbmRfdGJsW10gPSB7CiAKIE1PRFVM
RV9ERVZJQ0VfVEFCTEUocGNpLCBjYWZlX25hbmRfdGJsKTsKIAotc3RhdGljIGludCBjYWZlX25h
bmRfcmVzdW1lKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQorc3RhdGljIGludCBjYWZlX25hbmRfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAl1aW50MzJfdCBjdHJsOworCXN0cnVjdCBwY2lf
ZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwogCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gcGNp
X2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGRfdG9fbmFu
ZChtdGQpOwogCXN0cnVjdCBjYWZlX3ByaXYgKmNhZmUgPSBuYW5kX2dldF9jb250cm9sbGVyX2Rh
dGEoY2hpcCk7CkBAIC04NzcsMTIgKzg3OCwxNCBAQCBzdGF0aWMgaW50IGNhZmVfbmFuZF9yZXN1
bWUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBERUZJTkVf
U0lNUExFX0RFVl9QTV9PUFMoY2FmZV9uYW5kX29wcywgTlVMTCwgY2FmZV9uYW5kX3Jlc3VtZSk7
CisKIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBjYWZlX25hbmRfcGNpX2RyaXZlciA9IHsKIAku
bmFtZSA9ICJDQUbDiSBOQU5EIiwKIAkuaWRfdGFibGUgPSBjYWZlX25hbmRfdGJsLAogCS5wcm9i
ZSA9IGNhZmVfbmFuZF9wcm9iZSwKIAkucmVtb3ZlID0gY2FmZV9uYW5kX3JlbW92ZSwKLQkucmVz
dW1lID0gY2FmZV9uYW5kX3Jlc3VtZSwKKwkuZHJpdmVyLnBtID0gJmNhZmVfbmFuZF9vcHMsCiB9
OwogCiBtb2R1bGVfcGNpX2RyaXZlcihjYWZlX25hbmRfcGNpX2RyaXZlcik7Ci0tIAoyLjUzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
