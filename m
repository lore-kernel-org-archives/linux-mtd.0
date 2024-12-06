Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE39E77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rwRRKBqRD09roIO5NHQNGwfnS0wlVDEW9OAtK86otE0=; b=mm2jEz0QpuIe9c
	PIIwemq5kmbtD6NyNOaYiiE2i8Nd1AAtSuhZQgOk49mjkYO8tKKO8J2LYGPTVTy982WsrU5jR76Xg
	44Dx9tZmtraKEQ8mTnQ/xs1sLoLQwm8wWGc0h7U+UuxwRVKmEjwCVSwlP+wNJls/DYjd1pMIqIcJo
	hiXM3JOj9AAfCYgJz1ztqaNQINCp+pWEZIE6Ln0apioUngGpSUyFvWb5wB7xgQjFeZOmUkD/hWZA5
	29eBq0d3qaQ/J7PoyW1wFfXN3rrWykWzy9k4FPciSrGXSjoib36FyLnX5wCseknyj5UWjaCyXqcA5
	hlE6aqe/TX1RoL19aYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXaX-00000001arh-2dJ7;
	Fri, 06 Dec 2024 12:37:41 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXaV-00000001aqN-1JtQ
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 12:37:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53e2129be67so2332392e87.2
        for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2024 04:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733488657; x=1734093457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/sQf/FNgF36BAhWpmQDFvqu6wOEjx0gA7VM0NVrW4U=;
        b=UPtQJwqjzPkfgMK6n0soYxSTdH4aDP5EpSDUBnbNuALBxX2OEc8M0KcjRqjYaNMMct
         NLixMA35z60tNXUH1aaNlO2Ng7ksHk0syHMxNMdwuAh6dU45XFxTYMDEEHHkuvyHkyhh
         1wN3BG+JLaALfhFDWMv3NzsDEapsaCmeJQNWjRCoZFrr10abtfzyTmNzfaRoTM6z2av/
         A3NsHfEf0fPCzSPtkUGX0vgDj0APpRqq/MidR52Ldb/GgkkHh0VqDTTY5hGY4fA3O2a9
         zfE36EoUJ6vAYN8YvutTCipxAiBbfRpzTGORY+hlpjeupHM8KXy4BObDBB9rTKDHli2n
         i/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733488657; x=1734093457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/sQf/FNgF36BAhWpmQDFvqu6wOEjx0gA7VM0NVrW4U=;
        b=F7GMu4RqGSZZfNauvjR03nKZtCgNm9cErGOKwNO4KXrvbkzh3uOt/89J1fwCUMNMXq
         +f0pmIQqamV03t+k9ZMiUPRL0FRZBTe5xmARkO2826ke3xTcweIyysF+pNeG0o1TPiSa
         s4WilnnKMAgm6D7gv/LjZ9j0oQbQvKJMoWl27Hkc6Iso6WW6bfL8acgQCLDzz+C4MyBc
         CUckIZvPV7BV/jNzrF7N22F5Gdk8KzSO0BnM/N/l0ZM7FgHGBGumlrRV0K4TgmfQTEiy
         2tuuR4U7mQJlA6tzLn95SYo/UaUH4EcoEDbgWEz0ABVSrzlPrRfkvkQ5/8+hjLANCmCU
         Tz/Q==
X-Gm-Message-State: AOJu0Yyxrk7+ENBusgl4otcSM1rVuSeobUW+zhmhFCQJNGnhSwrhVDoA
	MvZF57OQgJtPbg5+yHymLes6BFWmE7bog4HO8PZVFzm7+AQhvpKI2N2vLw==
X-Gm-Gg: ASbGncvyi8We17pWHHIAhDRKr76t/NeNFpA0lO62OiIcYVQJ9EEoPzhHXJxcKls7O1m
	gXBHMJ7LV/NA8TlK3Th/oszXdEgtrNF5l68tfL8mX1r9fdnXjj3Z6oSXfn83hc7O0WyGo8BUGM4
	wUyz+T+X29fLrIYXBJMsm2EGZSZel1xb1u2NO/HEenW4jqB3rm7QokGMFknDtezPHecRwSySNct
	Ct1npqNdJ8M87MM1NpTx5wleIhJ9o0OR3v/LLPAoTR/roSVm6hm8uA/9Ekm8vtkU7Nsje77QIID
	joa3nN6YpCw92j0b92lOn+xG+qT6jSwj
X-Google-Smtp-Source: AGHT+IG+S2aqTmorpyRBPfQYbn+apiaPA/7m1l1Nhv4LfZR1uw2BFYQwuzbTjsJdXv5SHW7vsWrtWg==
X-Received: by 2002:a05:6512:33d5:b0:53d:dbc7:981 with SMTP id 2adb3069b0e04-53e2c2b55ecmr925768e87.16.1733488657224;
        Fri, 06 Dec 2024 04:37:37 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22975009sm495045e87.63.2024.12.06.04.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:37:36 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] FIX: NO_CAST.INTEGER_OVERFLOW in ubirsvol.c
Date: Fri,  6 Dec 2024 15:37:44 +0300
Message-Id: <20241206123744.60649-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_043739_365352_736974F8 
X-CRM114-Status: GOOD (  10.54  )
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

UmVwb3J0IG9mIHRoZSBzdGF0aWMgYW5hbHl6ZXI6ClRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGlj
IGV4cHJlc3Npb24gJ3ZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzJyBpcyBhIHN1YmplY3Qg
dG8gb3ZlcmZsb3cgYmVjYXVzZSBpdHMgb3BlcmFuZHMgYXJlIG5vdCBjYXN0IHRvIGEgbGFyZ2Vy
IGRhdGEgdHlwZSBiZWZvcmUgcGVyZm9ybWluZyBhcml0aG1ldGljCgpDb3JyZWN0aW9ucyBleHBs
YWluZWQ6CnRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11
bHRpcGxpY2F0aW9uLiAKYW4gZXhjZXB0aW9uIGNoZWNrIGZvciB0aGUgbmVnYXRpdml0eSBvZiB2
b2xfaW5mby5sZWJfc2l6ZSBhbmQgYXJncy5sZWJzIHdhcyBhZGRlZCwgYXMgd2VsbCBhcyBjYXN0
aW5nIHZvbF9pbmZvLmxlYl9zaXplIHRvIHVpbnQ2NF90CgpUcmlnZ2VycyBmb3VuZCBieSBzdGF0
aWMgYW5hbHl6ZXIgU3ZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYu
bW9yeWFrb3ZAZ21haWwuY29tPgoKLS0tCiB1YmktdXRpbHMvdWJpcnN2b2wuYyB8IDYgKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3ViaS11dGlscy91Ymlyc3ZvbC5jIGIvdWJpLXV0aWxzL3ViaXJzdm9sLmMKaW5kZXgg
MDg1NGFiYy4uODcyODZkNCAxMDA2NDQKLS0tIGEvdWJpLXV0aWxzL3ViaXJzdm9sLmMKKysrIGIv
dWJpLXV0aWxzL3ViaXJzdm9sLmMKQEAgLTIzMCw4ICsyMzAsMTAgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJCX0KIAl9CiAKLQlpZiAoYXJncy5sZWJzICE9IC0x
KQotCQlhcmdzLmJ5dGVzID0gdm9sX2luZm8ubGViX3NpemUgKiBhcmdzLmxlYnM7CisJaWYgKGFy
Z3MubGVicyAhPSAtMSl7CisJCWlmKHZvbF9pbmZvLmxlYl9zaXplID4gMCAmJiBhcmdzLmxlYnMg
PiAwKQorCQkJYXJncy5ieXRlcyA9KHVpbnQ2NF90KXZvbF9pbmZvLmxlYl9zaXplICogYXJncy5s
ZWJzOworCX0KIAogCWVyciA9IHViaV9yc3ZvbChsaWJ1YmksIGFyZ3Mubm9kZSwgYXJncy52b2xf
aWQsIGFyZ3MuYnl0ZXMpOwogCWlmIChlcnIpIHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
