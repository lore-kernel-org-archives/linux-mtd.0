Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4002CC3ABC9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 May 2025 06:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OBoUxQLtk7/jAYjmO0DpWudLaP9LJQgoQBjcZveQr9U=; b=Sq8qGm+roV7X7S
	otKkax7A9XpIDB07Cxs/dRucGDAsf2pYlYLKl5HU1aQNWQmmFYcESYrm0vxx4sjYuVc+Rd18h/2Us
	+l7jTRufLgCliYbGqR4BloZ7MRaqq3xQsTKYAYfOT6Oxpn4lbAUc5FpBKr1LhvlT0iFX+jWZjAJun
	VESGvyJt61ebF5nqIXTU1iHCjgDPBoUOpCkgxsMicIUt9Dag/3iDRWHpe45q8JFxkekb8A/AO94Vz
	qBu1naq+huvBz5ufxkEk/QeHWZoxp7omO/xXY1sHky5jzwoiAytDEO+LzdfZ94aF6JDjJCTTFtCpV
	I0L9/8allok+xrfckuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEirU-0000000BTXX-1gsr;
	Tue, 13 May 2025 06:11:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEir8-0000000BTTm-2dLU
	for linux-mtd@lists.infradead.org;
	Tue, 13 May 2025 06:11:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso3035593f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 May 2025 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747116669; x=1747721469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ1ztaXbZmCcupyFU8aDO4tFwSr0/lqFrQA95vlhVAk=;
        b=hBqTkkhwvOTpldohZd2u05pHZFY9TMmcvsxtjKjS7ayCXj8J1q2vqoyhmMHjvriWpk
         F1FlvKi18Vy36kVRsIAXwewBZkpmWsSKqWg870K1Smy6VE9fQNs4HH6Fjv1boh64CnsW
         nVuq6isbjmevKuoW2LFRZIOsCWyE12dUl5hqo0hcqwEmvwfF+yLa5gakywB842gEcPm+
         1hMqicvgZsnEw1dj4mNivX9zyGvKwg18Wrl6W72MuHO1QjJNAnOdRimXFKr6pWgQEmZA
         QMas15ceU6Akpm9lOa5gsM4LZgGO5dmZ2WuoCtNUb3VnGOd0eBCcZ3FKlMPb+5Y84e6A
         X+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747116669; x=1747721469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZ1ztaXbZmCcupyFU8aDO4tFwSr0/lqFrQA95vlhVAk=;
        b=kq6vCcYf9tLZGo0KMjXywTaqK5dtGIOiUNTfxauwLnEz9905+efqGxedFBlGGZGJ+e
         2XuDh8DK4XdwR90naUvdYCJ5a8F+SXhYDgw0As5m8vGq2R7A+Tk6lfjnz+a1lgG0j7/r
         OCOs5DlWsq0fToMxgePz2e1f4QRqmk1DM01F1VSHA/Hlz9maPH/AKv//L1Kckr224/RN
         GNR/wOeH2J4vTpuXTP+IHV+N5Y9HgPg50lvHzTiIYhUI3l+z4tg9U1Q5SoB6vQiga98o
         4wsaVMFtZLOgQ6ahhQu/Jm+H9snTZgJGXh8EqBq9565eN1ktDZ+zpolNF759rcWN95KE
         gGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWlu7aLMvCfoMAW2T/BoDlrhTV0mIkpt8aXXfPU6SZCM7wl9LNCEGC+CsQOIlb2nmZE8MFmxwkfb4o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5cVu1yYXiGbiQ0gryk51/5sL6n9t/Ts2MhAYIH9x9JAd73t3B
	Pl2lQaNw4QTeZ1cA1ZIgN0zBVw9u3bmHCCTZvQtEc9a9iEfOhq57
X-Gm-Gg: ASbGncsz1bzd0aOUQehknFOzznDg8kMPq5DWzuoEdQGjAQ+FvawVH4YHjdsAI0/Ks/s
	kxfB8grHnKcvObgxUtuTnN4Sfuk84J02x+Q7AZtURVhLqENfMj+KAcf4nlD8VyatfyDFdgjuEer
	/aEq/SNaVnBMF0/CASVrpO1aYDDI67ioHAkenKxI9u+ueHzPXksx2bAS1O8bKJinr3B4+B3FerS
	77dP5j70XRjdqgpVBsoL25JbFE0Vj7oUcJHhviAdYyu4yUuQPZWDOlR7CPvVAtvsg7omdskIZ09
	+G9htydyMN6X7YVwGv1ILmvQpk1BvDrMg2TjLYPc5Jk28VNnP5oIXxYW+ofFoobU0TNx82o+udH
	ADLzu1r7tL+7H71RmJx3XNaFegZ+2CqiBqfGQ41KynYsR7UdPnFk=
X-Google-Smtp-Source: AGHT+IHtLmNxRhJzVtEfa0YzN0wa/v4767LFxr1jVbK0LU6e1aqWmtNaLjdRNUu1pTd0oic5PbWAOQ==
X-Received: by 2002:a05:6000:2ce:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a1f6437880mr12578857f8f.16.1747116668665;
        Mon, 12 May 2025 23:11:08 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm15156220f8f.15.2025.05.12.23.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:11:08 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: dregan@broadcom.com,
	florian.fainelli@broadcom.com,
	computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
Date: Tue, 13 May 2025 08:10:52 +0200
Message-Id: <20250513061052.547392-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_231110_664729_65026667 
X-CRM114-Status: GOOD (  10.25  )
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

bGFzdF9jbWQgYW5kIGxhc3RfYnl0ZSBhcmUgbm93IHVudXNlZCBicmNtbmFuZF9ob3N0IG1lbWJl
cnMuCmxhc3RfYWRkciBpcyBvbmx5IHdyaXR0ZW4gYW5kIG5ldmVyIHJlYWQgc28gd2UgY2FuIHJl
bW92ZSBpdCB0b28uCgpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5v
bHRhcmlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgfCAyMiArKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYwppbmRleCAxN2Y2ZDk3MjNkZjkuLjVlZjVkMDc1YTMwYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0zMTAsOSArMzEwLDYgQEAgc3RydWN0
IGJyY21uYW5kX2hvc3QgewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UJKnBkZXY7CiAJaW50CQkJ
Y3M7CiAKLQl1bnNpZ25lZCBpbnQJCWxhc3RfY21kOwotCXVuc2lnbmVkIGludAkJbGFzdF9ieXRl
OwotCXU2NAkJCWxhc3RfYWRkcjsKIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnCWh3Y2ZnOwogCXN0cnVj
dCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsOwogfTsKQEAgLTIyMzcsMTAgKzIyMzQsOCBAQCBz
dGF0aWMgaW50IGJyY21uYW5kX3JlYWRfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50
OF90ICpidWYsCiAJdTggKm9vYiA9IG9vYl9yZXF1aXJlZCA/ICh1OCAqKWNoaXAtPm9vYl9wb2kg
OiBOVUxMOwogCXU2NCBhZGRyID0gKHU2NClwYWdlIDw8IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAKLQlo
b3N0LT5sYXN0X2FkZHIgPSBhZGRyOwotCi0JcmV0dXJuIGJyY21uYW5kX3JlYWQobXRkLCBjaGlw
LCBob3N0LT5sYXN0X2FkZHIsCi0JCQltdGQtPndyaXRlc2l6ZSA+PiBGQ19TSElGVCwgKHUzMiAq
KWJ1Ziwgb29iKTsKKwlyZXR1cm4gYnJjbW5hbmRfcmVhZChtdGQsIGNoaXAsIGFkZHIsIG10ZC0+
d3JpdGVzaXplID4+IEZDX1NISUZULAorCQkJICAgICAodTMyICopYnVmLCBvb2IpOwogfQogCiBz
dGF0aWMgaW50IGJyY21uYW5kX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
dWludDhfdCAqYnVmLApAQCAtMjI1MiwxMSArMjI0Nyw5IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRf
cmVhZF9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCiAJaW50
IHJldDsKIAl1NjQgYWRkciA9ICh1NjQpcGFnZSA8PCBjaGlwLT5wYWdlX3NoaWZ0OwogCi0JaG9z
dC0+bGFzdF9hZGRyID0gYWRkcjsKLQogCWJyY21uYW5kX3NldF9lY2NfZW5hYmxlZChob3N0LCAw
KTsKLQlyZXQgPSBicmNtbmFuZF9yZWFkKG10ZCwgY2hpcCwgaG9zdC0+bGFzdF9hZGRyLAotCQkJ
bXRkLT53cml0ZXNpemUgPj4gRkNfU0hJRlQsICh1MzIgKilidWYsIG9vYik7CisJcmV0ID0gYnJj
bW5hbmRfcmVhZChtdGQsIGNoaXAsIGFkZHIsIG10ZC0+d3JpdGVzaXplID4+IEZDX1NISUZULAor
CQkJICAgICh1MzIgKilidWYsIG9vYik7CiAJYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3Qs
IDEpOwogCXJldHVybiByZXQ7CiB9CkBAIC0yMzY3LDkgKzIzNjAsNyBAQCBzdGF0aWMgaW50IGJy
Y21uYW5kX3dyaXRlX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdWludDhfdCAq
YnVmLAogCXZvaWQgKm9vYiA9IG9vYl9yZXF1aXJlZCA/IGNoaXAtPm9vYl9wb2kgOiBOVUxMOwog
CXU2NCBhZGRyID0gKHU2NClwYWdlIDw8IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAKLQlob3N0LT5sYXN0
X2FkZHIgPSBhZGRyOwotCi0JcmV0dXJuIGJyY21uYW5kX3dyaXRlKG10ZCwgY2hpcCwgaG9zdC0+
bGFzdF9hZGRyLCAoY29uc3QgdTMyICopYnVmLCBvb2IpOworCXJldHVybiBicmNtbmFuZF93cml0
ZShtdGQsIGNoaXAsIGFkZHIsIChjb25zdCB1MzIgKilidWYsIG9vYik7CiB9CiAKIHN0YXRpYyBp
bnQgYnJjbW5hbmRfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qg
dWludDhfdCAqYnVmLApAQCAtMjM4MSw5ICsyMzcyLDggQEAgc3RhdGljIGludCBicmNtbmFuZF93
cml0ZV9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1aW50OF90ICpidWYs
CiAJdTY0IGFkZHIgPSAodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdDsKIAlpbnQgcmV0ID0g
MDsKIAotCWhvc3QtPmxhc3RfYWRkciA9IGFkZHI7CiAJYnJjbW5hbmRfc2V0X2VjY19lbmFibGVk
KGhvc3QsIDApOwotCXJldCA9IGJyY21uYW5kX3dyaXRlKG10ZCwgY2hpcCwgaG9zdC0+bGFzdF9h
ZGRyLCAoY29uc3QgdTMyICopYnVmLCBvb2IpOworCXJldCA9IGJyY21uYW5kX3dyaXRlKG10ZCwg
Y2hpcCwgYWRkciwgKGNvbnN0IHUzMiAqKWJ1Ziwgb29iKTsKIAlicmNtbmFuZF9zZXRfZWNjX2Vu
YWJsZWQoaG9zdCwgMSk7CiAKIAlyZXR1cm4gcmV0OwotLSAKMi4zOS41CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
