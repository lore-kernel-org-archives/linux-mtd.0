Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9398E7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=59a+z9bH91iCXE42aKCscFXPuXT9UrKZ58qdA/rPXt8=; b=MNysJRVm9wjQXM
	muNkLFSXNyFrEVHEYE7yh+ELSv0O+8BXcJVMCGq5xYTUsweliGJWUpldtbkefTi2mW4liMbCI1liJ
	vlm7dnFhjIcE6KStodRBZQC1Kvn5jQjzAJ4x7YAgGeXrmyaMSbNDidKKYgm1oOocJQ83HTVnTJFdo
	mO6ZRj13+d8w02OYpE+8KqRU8KKayAcI8+ZusOBcq4UmyPbxGoiDTw0BvYu3XZfOEYHrwp2UsLgma
	nzOoYFZz9EM/FayZli41X0bfj9ahQXUAStDijIM5g3EpIg0BFuEHUrtFVuBTSqm7VTCcYbd0xCAxP
	MbQnYiCblGdok9/i5uzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKl0O-00000009FUV-2pAZ;
	Mon, 09 Dec 2024 21:09:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKl0M-00000009FU1-0n3R
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 21:09:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so1801020e87.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2024 13:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733778559; x=1734383359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/0WTJFmx30o9gQF+pM6xrDy+wizMbs67uq40FZ9DWg=;
        b=fytfdFQRxlNlcysu93enQui4sjzhby0BdG3WQS/wygzCTmYxfy/pNOosaWf+mvoY1t
         szIuOxS3WbbA8ThDzV3DAsErHeApFQkaTVNN6UjNHI0ZGvLCMaSCwpEpgbScF3e+49vh
         5g1UVgTKG3N5EJLjfdToe5tYaTUtz0RV1XHfOs59LMXsPEopG92tXsyaWrAyxYQLCzO4
         fS/lbUipb6EtZgIHEgeEdTOYVWpZzgthHOmTPJgVZB3obX/ZD0wZsqZSit0DS6B2McWq
         BJ21nnN4qowHdnA4WehxorOEIsE2R0qAHkZQl+rnRhildlDsQbZxrSdR3mTNEQL5Z1hs
         AvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733778559; x=1734383359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/0WTJFmx30o9gQF+pM6xrDy+wizMbs67uq40FZ9DWg=;
        b=MuwlGU+mS6XMGqnSH9rZUYY13QiHYqeVMtzjLKOu/0px4wAECsdiRjXOgv3dLMyY/n
         0MYFf/YXfw5hKZPKRPDkbvNwLT68Dg8ZY9fYKp4hY8edta73lFtsUym50UVwFIev3/Mx
         xX8llMy1XDgHnqpq2y4d4OGnOGg/Re53wE7Gh8jnP3U+XtOWEggq6WlSiPrkLfE/6KEc
         +eK+8q1+8lheLL/xwzTHOP/J1dtxJhu69v07AU7/uW1DmrNEtMOFc6FaSjgWd+eSRjha
         99qtQDb/Kfrq9Pfk0hdcfkggwmQViTgfYvPTyT2MRGuoh7c/7NJZ7vSo9kZPW7pfnscF
         KuKQ==
X-Gm-Message-State: AOJu0Yw3E8hA9wDQ18HyL4LncYNUnq19EDwQ5n64FQ4WtEnald677nq1
	XLg4vCAQIM+fMzAsNlNocsZH6Ccwetkos0aT+u/kLZeZxE8qrrygELHRdwK5m88=
X-Gm-Gg: ASbGncuC+eoAUl/VLvuGOgTDc032ZRvN96Uu0mZaILaq7+D56hiJVdOYrJW6y7KNoOL
	4TMkFpewQgaouMC1QvbkMprHZ7cHz2lihw/DH3NfEfpSx83/Cgp/PK4UkS4uyducfOvQtRJEbcR
	l6Ji4msyUvgSPsrgTuqOtigXxMiBbWmRNmho9UBj3lXnJRBZjvi/c0V/ziK5+Sd+DTaL742GlxZ
	k0wNrbWU4GSSzDfS1ckdBiBIk19DhQHC6kA8s1sIbkxe+7sweAMFs+gFdWl2m35vm5tj61Juj3h
	U26U9WSyxNzhqiYzTmdGE0D1sGvrmaPZ
X-Google-Smtp-Source: AGHT+IHLFq92jCROpu9desQ1NlHpKgvz4dcy94neKo7EwdNCGWX9IMEVkaTfeeogAAvWW2uum1R1Gg==
X-Received: by 2002:a05:6512:3e29:b0:540:1f75:1b05 with SMTP id 2adb3069b0e04-5401fd72bd9mr1766914e87.19.1733778559390;
        Mon, 09 Dec 2024 13:09:19 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3a9ca138sm905939e87.132.2024.12.09.13.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 13:09:18 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org,
	chengzhihao1@huawei.com
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] FIX: NO_CAST.INTEGER_OVERFLOW in ubirsvol.c
Date: Tue, 10 Dec 2024 00:09:23 +0300
Message-Id: <20241209210923.764540-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_130922_224874_F38358C1 
X-CRM114-Status: GOOD (  10.64  )
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
YWluZWQ6ClRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11
bHRpcGxpY2F0aW9uLgpBZGRlZCBjYXN0aW5nIHZvbF9pbmZvLmxlYl9zaXplIHRvIGxvbmcgbG9u
ZwoKVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgoKU2lnbmVkLW9mZi1i
eTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4KCi0tLQogdWJpLXV0
aWxzL3ViaXJzdm9sLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS91YmktdXRpbHMvdWJpcnN2b2wuYyBiL3ViaS11dGls
cy91Ymlyc3ZvbC5jCmluZGV4IDA4NTRhYmMuLjczZDJmNjggMTAwNjQ0Ci0tLSBhL3ViaS11dGls
cy91Ymlyc3ZvbC5jCisrKyBiL3ViaS11dGlscy91Ymlyc3ZvbC5jCkBAIC0yMzEsNyArMjMxLDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJfQogCiAJaWYgKGFy
Z3MubGVicyAhPSAtMSkKLQkJYXJncy5ieXRlcyA9IHZvbF9pbmZvLmxlYl9zaXplICogYXJncy5s
ZWJzOworCQlhcmdzLmJ5dGVzID0gKGxvbmcgbG9uZyl2b2xfaW5mby5sZWJfc2l6ZSAqIGFyZ3Mu
bGViczsKIAogCWVyciA9IHViaV9yc3ZvbChsaWJ1YmksIGFyZ3Mubm9kZSwgYXJncy52b2xfaWQs
IGFyZ3MuYnl0ZXMpOwogCWlmIChlcnIpIHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
