Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E2FCD13DA
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2026 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iLfSsmPBpr/odmnGKkTD6vK/krY6LeIl4hEmQGbDsDQ=; b=avestAlLYIZjMp
	uCWunghhu2p1lo1FqWkzwXsFJupiog+ab1+rqEm7ck5D/VZPTBVfz4ZeIB9ImNYaymgsCRMfa1TKK
	4wm1Kw4Kb0cG/IRa/bR6drhbs/s3XhnpBoFxu5oFoBRDwQkego+z+t6+3sHBaqKW5O0CQzYxDWOqY
	k81+8nHYttTbJYndGa9lTJzpO7/XlfOFvdrVLBfZ01JF9vK2g6DaQXIkR5tZ8IJ7LrI0+uLpXbktN
	DbLX5o1EJBBWorvY7ai+kVv8yXlY6ji6anM+FBJ1UgkJ210IGDEB7M5QpeqTzZFXTXKq7SGDdYE9w
	0be9P2ZdnKyG4vW7jSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXxJ-00000005us7-1n1S;
	Thu, 30 Apr 2026 20:25:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXxF-00000005urh-1UnS
	for linux-mtd@lists.infradead.org;
	Thu, 30 Apr 2026 20:25:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E15A81A348D;
	Thu, 30 Apr 2026 20:25:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ADC7F601DF;
	Thu, 30 Apr 2026 20:25:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1006E11AC9CEF;
	Thu, 30 Apr 2026 22:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777580742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TwgDcGMvMaf7/H1uJ5BNVsHeW9a4UKPekUo7iYHK2Tc=;
	b=yn8Ge8GKtmK7WYpmHMiVjhjBSzm4CVA96uwvSP7Txe4HI5wKEq4wd6ALkD1VFVgbIgRKG/
	CLRNRtnYezahS8W4tcbxeXZ9Ir7MA5bf9+gqJTVTXCS8Zivw7NMVSxzOoU43g4RARtA59P
	GY+34xjaEdV3NacuC14XckNsZYLL1wd7wf1QGbER1/2voR55B4xgSU2vt+tDD5C5+kt+sA
	A+ln18BjfGAzqbkLV/a7Rrc3SoeNVAr8/doakByfPVALtMhoowhe9MndEY0bAL4Fv+oDky
	BvUx03PUzLpLVQ/HZRMh/z07B4cAhn9FQvaGcKBX/XspsWXvULyKK00F7hYCwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 7.1-rc2
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 30 Apr 2026 22:25:37 +0200
Message-ID: <87jytob3ge.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_132549_837907_602B8F81 
X-CRM114-Status: UNSURE (   7.66  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciA3LjEtcmMyLgoKVGhhbmtzLApNaXF1
w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDI1NGY0OTYzNGVlMTZhNzMx
MTc0ZDJhZTM0YmM1MGJkNWY0NWU3MzE6CgogIExpbnV4IDcuMS1yYzEgKDIwMjYtMDQtMjYgMTQ6
MTk6MDAgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgdGFncy9tdGQvZml4ZXMtZm9yLTcuMS1yYzIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byAxMzVhYzNiODRiY2VkYWUxODYwZTdhOTUxMmQ2MzE2NmY0MmI3MzZlOgoKICBtdGQ6IHNw
aW5hbmQ6IHdpbmJvbmQ6IEZpeCBPRFRSIHdyaXRlIFZDUiBvbiBXMzVOeHhKVyAoMjAyNi0wNC0y
NyAxNTowODowNCArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQmVzaWRlcyBhbiBvdXQtb2YtYm91bmQgYnVnLCB0
aGlzIGlzIGFib3V0IHByb3Blcmx5IHN1cHBvcnRpbmcgV2luYm9uZApvY3RhbCBTUEkgTkFORCBj
aGlwcyB3aGljaCB1c2UgYSBzcGVjaWZpYyBwYXR0ZXJuIGZvciBzdHVmZmluZyBtb3JlCmFkZHJl
c3MgYml0cyBpbiBzb21lIG9wZXJhdGlvbnMuIFRoaXMgUFIgb25seSBjYXJyaWVzIHRoZSB1c2Ug
b2YgdGhlIGEKc3BpLW1lbSBmbGFnIGluIFNQSSBOQU5ELiBUaGlzIGZsYWcgaGFzIGJlZW4gYWRk
ZWQgaW4gdGhlIHNwaS1tZW0gbGF5ZXIKanVzdCBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdyB0aHJv
dWdoIHRoZSBzcGkgdHJlZS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWlxdWVsIFJheW5hbCAoMyk6CiAgICAgIG10ZDog
c3BpbmFuZDogQWRkIHN1cHBvcnQgZm9yIHBhY2tlZCByZWFkIGRhdGEgT0RUUiBjb21tYW5kcwog
ICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IFNldCB0aGUgcGFja2VkIHBhZ2UgcmVhZCBmbGFn
IHRvIFczNU4wMi8wNEpXCiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDogRml4IE9EVFIgd3Jp
dGUgVkNSIG9uIFczNU54eEpXCgpUdWRvciBBbWJhcnVzICgxKToKICAgICAgbXRkOiBzcGktbm9y
OiBkZWJ1Z2ZzOiBmaXggb3V0LW9mLWJvdW5kcyByZWFkIGluIHNwaV9ub3JfcGFyYW1zX3Nob3co
KQoKIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysrKy0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwgIDYgKysrLS0tCiBkcml2
ZXJzL210ZC9zcGktbm9yL2RlYnVnZnMuYyAgfCAgNCArKystCiBpbmNsdWRlL2xpbnV4L210ZC9z
cGluYW5kLmggICAgfCAgNyArKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
