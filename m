Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC919C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE2B6101B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DE2B6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dt8HYwraFSb8/ZBwaelNh9w6C1ntCfASTBi/A2vxB60=; b=RCUkUj1hmHRd9a
	NwMpbgBWbQJ8mp6Tvtd5ouRFKGKEsvaref9aYaHlrxd7Wrxkw5txIvYrpkH20yxeSXvfgNmPcoify
	f4ArLQtNMwGnjaaMt0FGt3mrPSD1tZ14hlRGcBC5CGdQDea8fe6Pq2fT4DuNtFcQkEcvnqVxzFYdr
	e45PLcEuMtE81YDUiJW/P4Do3kVVvF9gJW8KnOGhevwRuZxobOhmf8SH/4c3CgKBq3j71uJYN0UP8
	kvhjVY2MHQEeww6ap8NijSHplQhYg51RM2JWOv97cSJWtGMm9kcDWkH/uOXdHx3/QHiecFP7MM5T7
	FaJdMNROplyeNp6QKQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNNG-00GKcg-JW; Thu, 07 Oct 2021 06:59:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNN4-00GKYJ-J9
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 06:59:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id x8so3247138plv.8
 for <linux-mtd@lists.infradead.org>; Wed, 06 Oct 2021 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FlRfcfXKzBTDDvuEg1gx8rMtAHAImiEFRdqtQU3h+3U=;
 b=qq9rI5WKUzce+vzYo2vr0+Or8AaUJiQdNHLjZv1N8xGqqWO1hH9VUdfm5lf9LiMdRa
 TdAaieu2YQWZ1vk/eEtuHKQ5GYtgTGssIX6QhM+0rRlIgKwVR98adpffbxfqhSlI+nHp
 kGeCnq8WS0tANHX1z/jA6u+peLNbjHhOhzu/JsJuEYiK2NWTX8qZS+sVV60YNFOEPzxL
 7Ypm/zq+e4DFYP4Kf6wfgyoEzqn8nylADUhCpU/BpFkZfCxEXSncQd1XY7FHoOxUDDRt
 YjRPrCx00M1awteEIdHSfuZuy+RF97XXWptdHmF/7txyVUrVDu/gAlRkDRqa5qjkCGZq
 kVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FlRfcfXKzBTDDvuEg1gx8rMtAHAImiEFRdqtQU3h+3U=;
 b=vrOBaGy69TY8ZNmKmiJllfE2aVKhVMGGE16sxd2UP/WA8f+VUILsP98AZS+/HUfHAH
 g+Lv3HeNnBbkOMZugIPyIYha5OEM5yC5JYss8hrKj83BXlND5r49PkYjWDhzo6oKEpLv
 htWAoKBlVzaKT4KmUAYsfx1ClDeKtGbJjiFNsri3I+iVd9OJA3St5mZmUtK7CpP2yV1U
 J6e9z3Ef2O9/E8mVJQdiJ0LXVxY5Qd5ZIXrMzhIbqL/5vNSlxpRyFUj2FCOA4TdBuhxb
 lvAt2bh+fZcO6yPWrf1A86Vn5uKDwzzYG25DaduV9ZHetR22y3uDv96a7cDfr8ByF+Hu
 F7qg==
X-Gm-Message-State: AOAM533aBZXVTR3tbydGiIo+icOYPqj8vW86gEAy6Kv0QZnBdivNgw/z
 arlANX4NRnh2O/ox4T+YnbTWq0iWBaUUAfy3
X-Google-Smtp-Source: ABdhPJxnmRS5ilyYjUz/K4jpLxY2B4ZpiNXfUieqdflT7B/KF6sCgyYRXUKly4iABasoFHOrulh9VQ==
X-Received: by 2002:a17:902:be0c:b0:13e:2b53:d3 with SMTP id
 r12-20020a170902be0c00b0013e2b5300d3mr2330972pls.86.1633589949926; 
 Wed, 06 Oct 2021 23:59:09 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id u12sm7137844pjr.2.2021.10.06.23.59.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 23:59:09 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH 0/4] mtd: spinand: Add continuous read mode support
Date: Fri,  8 Oct 2021 14:57:55 +0800
Message-Id: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235914_674436_C9A98A12 
X-CRM114-Status: GOOD (  14.75  )
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

VGhpcyBzZXJpZXMgYWRkIHN1cHBvcnQgY29udGludW91cyByZWFkIG1vZGUgZm9yIFNQSSBOQU5E
LgoKVGhlIE1hY3Jvbml4IFNQSSBOQU5EIHN1cHBvcnRzIGNvbnZlbnRpb25hbCByZWFkIG1vZGUg
YW5kIGNvbnRpbnVvdXMKcmVhZCBtb2Rlcy4gSWYgdGhlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIg
Yml0IOKAnENPTlTigJ0gPSAwLCB0aGUgZGV2aWNlCmlzIGluIGNvbnZlbnRpb25hbCByZWFkIG1v
ZGUuIFRoZSBwYWdlIHJlYWQgb3BlcmF0aW9uIGFuZCBwYWdlIHJlYWQKY2FjaGUgUmFuZG9tLyBz
ZXF1ZW50aWFsIG9wZXJhdGlvbiBpcyBzdXBwb3J0ZWQgaW4gdGhlIGNvbnZlbnRpb25hbApyZWFk
IG1vZGUuIElmIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIGJpdCDigJxDT05U4oCdID0gMSwg
dGhlIGRldmljZQppcyBpbiBjb250aW51b3VzIHJlYWQgbW9kZSBhbmQgb25seSBjb250aW51b3Vz
IHJlYWQgb3BlcmF0aW9uIGlzCnN1cHBvcnRlZC4gRHVyaW5nIHRoZSBjb250aW51b3VzIHJlYWQg
bW9kZSwgdGhlIHBhZ2UgcmVhZCBjYWNoZQpyZWxhdGVkIGNvbW1hbmRzIGFyZSBub3Qgc3VwcG9y
dGVkLiAoUGFnZSBDYWNoZSBTZXF1ZW50aWFsICgzMWgpLApQYWdlIFJlYWQgQ2FjaGUgUmFuZG9t
ICgzMGgpIGFuZCBQYWdlIFJlYWQgQ2FjaGUgRW5kICgzRmgpKS4KClRoZSBjb250aW51b3VzIHJl
YWQgb3BlcmF0aW9uIGluY2x1ZGluZzogZmlyc3RseSwgc3RhcnRpbmcgd2l0aCB0aGUgCnBhZ2Ug
cmVhZCBjb21tYW5kIGFuZCB0aGUgMSBzdCBwYWdlIGRhdGEgd2lsbCBiZSByZWFkIGludG8gdGhl
IGNhY2hlCmFmdGVyIHRoZSByZWFkIGxhdGVuY3kgdFJEX0NPTlQxLiBTZWNvbmRseSwgSXNzdWlu
ZyB0aGUgUmVhZCBGcm9tCkNhY2hlIGNvbW1hbmRzICgwM2gvMEJoLzNCaC82QmgvQkJoL0VCaCkg
dG8gcmVhZCBvdXQgdGhlIGRhdGEgZnJvbQpjYWNoZSBjb250aW51b3VzbHkuIFRoZSBjYWNoZSBp
cyBkaXZpZGVkIGludG8gdHdvIGhhbHZlcywgd2hpbGUgb25lIApoYWxmIG9mIHRoZSBjYWNoZSBp
cyBvdXRwdXR0aW5nIHRoZSBkYXRhLCB0aGUgb3RoZXIgaGFsZiB3aWxsIGJlCmxvYWRlZCBmb3Ig
dGhlIG5ldyBkYXRhOyB0aGVyZWZvcmUsIHRoZSBob3N0IGNhbiByZWFkIG91dCB0aGUgZGF0YQpj
b250aW51b3VzbHkgZnJvbSBwYWdlIHRvIHBhZ2UuIE11bHRpcGxlIG9mIFJlYWQgRnJvbSBDYWNo
ZSBjb21tYW5kcwpjYW4gYmUgaXNzdWVkIGluIG9uZSBjb250aW51b3VzIHJlYWQgb3BlcmF0aW9u
LCBlYWNoIFJlYWQgRnJvbSBDYWNoZQpjb21tYW5kIGlzIHJlcXVpcmVkIHRvIHJlYWQgbXVsdGlw
bGUgNC1ieXRlIGRhdGEgZXhhY3RseTsgb3RoZXJ3aXNlLAp0aGUgZGF0YSBvdXRwdXQgd2lsbCBi
ZSBvdXQgb2Ygc2VxdWVuY2UgZnJvbSBvbmUgUmVhZCBGcm9tIENhY2hlCmNvbW1hbmQgdG8gYW5v
dGhlciBSZWFkIEZyb20gQ2FjaGUgY29tbWFuZC4gQWZ0ZXIgYWxsIHRoZSBkYXRhIGlzCnJlYWQg
b3V0LCB0aGUgaG9zdCBzaG91bGQgaXNzdWUgRXhpdCBDb250aW51b3VzIFJlYWQgQ29tbWFuZCAo
NjNoKQp0byB0ZXJtaW5hdGUgdGhpcyBjb250aW51b3VzIHJlYWQgb3BlcmF0aW9uLgoKVGhlIGRh
dGEgb3V0cHV0IGZvciBlYWNoIHBhZ2Ugd2lsbCBhbHdheXMgc3RhcnQgZnJvbSBieXRlIDAgYW5k
IGEKZnVsbCBwYWdlIGRhdGEgKDJLQikgc2hvdWxkIGJlIHJlYWQgb3V0IGZvciBlYWNoIHBhZ2Uu
IElmIHRoZSBob3N0Cmp1c3Qgd2FudHMgdG8gcmVhZCBvdXQgcGFydGlhbCBwYWdlIGRhdGEsIEV4
aXQgQ29udGludW91cyBSZWFkCkNvbW1hbmQgKDYzaCkgc2hvdWxkIGJlIGlzc3VlZCB0byB0ZXJt
aW5hdGUgdGhlIGN1cnJlbnQgY29udGludW91cwpyZWFkIG9wZXJhdGlvbi4KClpoZW5neHVuICg0
KToKICBtdGQ6IHNwaW5hbmQ6IEFkZCBzdXBwb3J0IGNvbnRpbnVvdXMgcmVhZCBtb2RlCiAgbXRk
OiBzcGluYW5kOiBBZGQgY29udGludW91cyByZWFkIGV4aXQgY29tbWFuZAogIG10ZDogc3BpbmFu
ZDogQWRkIHN1cHBvcnQgY29udGludW91cyByZWFkIG9wZXJhdGlvbgogIG10ZDogc3BpbmFuZDog
bWFjcm9uaXg6IEFkZCBzdXBwb3J0IGZvciBNYWNyb25peCBNWDMxTEYyR0U0QkMgU1BJIE5BTkQK
ICAgIGZsYXNoCgogZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgICB8IDY1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9t
YWNyb25peC5jIHwgMTEgKysrKysrKwogaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oICAgICB8
IDEwICsrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
