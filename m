Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265D7F436B7
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tcvi4FIXGmBULXUrL/8R9FTvBvWt3LPxrHomnM2qfeY=; b=SErrRh9gcPHENp
	zW60wtqW8/etVFbgmbeEsHSHPwRZjasCLjx2ChQycig2gZFxXnxgYSn42prw8DpB9oyIgg1SeO4Rh
	GnS3hK16XXLPyDhE8o31S5SmH4V7c7NgUf2jTP82dMHyVqt+o0NFll30d0GTEMuPvR6Oi6zc9YT+a
	31BqzcIrqSM3ADAT+vooK5/GeO/CWZwOjhy5GkPr5ZOgSHBtOUEL9roGxC9k06wdz+sdK9rvgsO7W
	USAIL+vhyE5gl+3B/ef0SJWJKOnl+91z79OOBeF5Q53oZR7eA2mlL1qLq2MvvWQPKME0aHdYRd9gp
	LRdRvQOSMKE6FYmQ9whA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl7m-00000004DCz-2uc7;
	Fri, 17 Apr 2026 15:28:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl7i-00000004DCa-35kM
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 15:28:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75A18C5C3E5;
	Fri, 17 Apr 2026 15:29:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5758A60497;
	Fri, 17 Apr 2026 15:28:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2DB410460A83;
	Fri, 17 Apr 2026 17:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776439718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=THCwC3HWPrl8gw+26e6HMtBe90ZIhUtyqn9+0DnkO5k=;
	b=bJuu16nog5yaI+lqTybZL6ZUd7WZXFe9zawRslYpsVx53noNyBP8oKfo6Hubwz16Fudy+P
	C9qcu5xdbaj38JGGDzCEuABAQsseAvevvgD5P2qCW8bmEt/5NrhyZOebjnWHM5da+IceFS
	/4WSoZmADMu0qyPeiibQaWfHeSxprnSXrSzVASk8AH8kyiZnkl6fHxaX775tRBFTeQUwrI
	qMuoFXV3blLLAMYehe6aGx2CeG+5+VZcrlOARjTk1pXv1rGgONfm0Pj3Y2W+47G3qnDM9y
	TpNXVcGRIXJ5reTwrqGckh5+eanT2k5e8GVhWwZXbmi4XS3c5ygr8A4NFoiDBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: nand: Changes for 7.1
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Apr 2026 17:28:34 +0200
Message-ID: <87y0il8v31.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_082851_224958_F937D0D8 
X-CRM114-Status: UNSURE (   8.65  )
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

SGVsbG8sCgpUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciA3LjEuCgpUaGFua3MsCk1pcXXDqGwKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmRlMjNmODFhNWUwOGJlOGZiZjVlOGQ3
ZTlmZWJjNzJhNWI1ZjI3ZjoKCiAgTGludXggNy4wLXJjMSAoMjAyNi0wMi0yMiAxMzoxODo1OSAt
MDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdz
L25hbmQvZm9yLTcuMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDc4NjZjZTk5MmNm
MGQzYzNiNTBmZThiZjRhY2IxZGJiMTczYTIzMDQ6CgogIG10ZDogc3BpbmFuZDogd2luYm9uZDog
RGVjbGFyZSB0aGUgUUUgYml0IG9uIFcyNU54eEpXICgyMDI2LTA0LTEwIDE5OjEwOjQ0ICswMjAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpUaGUgbWFpbiBjaGFuZ2VzIGhhcHBlbmVkIGluIHRoZSBTdW5YaSBkcml2ZXIg
aW4gb3JkZXIgdG8Kc3VwcG9ydCBuZXcgdmVyc2lvbnMgb2YgdGhlIEFsbHdpbm5lciBOQU5EIGNv
bnRyb2xsZXIuCgpUaGVyZSBhcmUgYWxzbyBzb21lIERULWJpbmRpbmcgaW1wcm92ZW1lbnRzIGFu
ZCBjbGVhbnVwcy4KCkZpbmFsbHkgYSBjb3VwbGUgb2YgYWN0dWFsIGZpeGVzIChSZWFsdGVrIEVD
QyBhbmQgV2luYm9uZCBTUEkgTkFORCksCmFzaWRlIHdpdGggdGhlIHVzdWFsIGxvYWQgb2YgbWlz
YyBjaGFuZ2VzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpBaG1lZCBOYXNlZWYgKDEpOgogICAgICBtdGQ6IG5hbmQ6IHJl
YWx0ZWstZWNjOiByZWxheCBPT0Igc2l6ZSBjaGVjayB0byBtaW5pbXVtCgpGcmFuayBMaSAoNyk6
CiAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IG14Yy1uYW5kOiBhZGQgaS5NWDI1IGFuZCBpLk1YMjcg
bmFuZCBzdXBwb3J0CiAgICAgIG10ZDogcmF3bmFuZDogZ3BtaTogc2V0IGNoaXAtPm9mX25vZGUg
dG8gbmFuZEAwIGNoaWxkIG5vZGUgaWYgcHJlc2VudAogICAgICBtdGQ6IHJhd25hbmQ6IG14Yzog
c2V0IGNoaXAtPm9mX25vZGUgdG8gbmFuZEAwIGNoaWxkIG5vZGUgaWYgcHJlc2VudAogICAgICBt
dGQ6IHJhd25hbmQ6IGlmYzogc2V0IGNoaXAtPm9mX25vZGUgdG8gbmFuZEAwIGNoaWxkIG5vZGUg
aWYgcHJlc2VudAogICAgICBkdC1iaW5kaW5nczogbXRkOiByZWZhY3RvciBOQU5EIGJpbmRpbmdz
IGFuZCBhZGQgbmFuZC1jb250cm9sbGVyLWxlZ2FjeS55YW1sCiAgICAgIGR0LWJpbmRpbmdzOiBt
dGQ6IGdwbWktbmFuZDogcmVmIHRvIG5hbmQtY29udHJvbGxlci1sZWdhY3kueWFtbAogICAgICBk
dC1iaW5kaW5nczogbXRkOiBteGMtbmFuZDogYWRkIG1pc3NpbmcgY29tcGF0aWJsZSBzdHJpbmcg
YW5kIHJlZiB0byBuYW5kLWNvbnRyb2xsZXItbGVnYWN5LnlhbWwKCk1pcXVlbCBSYXluYWwgKDMp
OgogICAgICBtdGQ6IHNwaW5hbmQ6IENsZWFuIHRoZSBmbGFncyBzZWN0aW9uCiAgICAgIG10ZDog
c3BpbmFuZDogd2luYm9uZDogQ2xhcmlmeSB3aGVuIHRvIGVuYWJsZSB0aGUgSFMgYml0CiAgICAg
IG10ZDogc3BpbmFuZDogd2luYm9uZDogRGVjbGFyZSB0aGUgUUUgYml0IG9uIFcyNU54eEpXCgpS
aWNoYXJkIEdlbm91ZCAoOSk6CiAgICAgIG10ZDogcmF3bmFuZDogc3VueGk6IHN1bnhpX25hbmRf
b29ibGF5b3V0X2ZyZWUgY29kZSBjbGFyaWZpY2F0aW9uCiAgICAgIG10ZDogcmF3bmFuZDogc3Vu
eGk6IGZpeCBzdW54aV9uZmNfaHdfZWNjX3JlYWRfZXh0cmFfb29iCiAgICAgIG10ZDogcmF3bmFu
ZDogc3VueGk6IGRvIG5vdCBjb3VudCBCQk0gYnl0ZXMgdHdpY2UKICAgICAgbXRkOiByYXduYW5k
OiBzdW54aTogcmVwbGFjZSBoYXJkIGNvZGVkIHZhbHVlIGJ5IGEgZGVmaW5lIC0gdGFrZTIKICAg
ICAgbXRkOiByYXduYW5kOiBzdW54aTogbWFrZSB0aGUgY29kZSBtb3JlIHNlbGYtZXhwbGFuYXRv
cnkKICAgICAgbXRkOiByYXduYW5kOiBzdW54aTogcmVtb3ZlIGRlYWQgY29kZQogICAgICBtdGQ6
IHJhd25hbmQ6IHN1bnhpOiBjaGFuZ2UgZXJyb3IgcHJvbmUgdmFyaWFibGUgbmFtZQogICAgICBt
dGQ6IHJhd25hbmQ6IHN1bnhpOiBmaXggdHlwb3MgaW4gY29tbWVudHMKICAgICAgbXRkOiByYXdu
YW5kOiBzdW54aTogaW50cm9kdWNlIG1heGltaXplIHZhcmlhYmxlIHVzZXIgZGF0YSBsZW5ndGgK
ClJpY2hhcmQgTHl1ICgxKToKICAgICAgbXRkOiBuYW5kOiBVc2Ugc2NvcGVkX2d1YXJkIGZvciBt
dXRleCBpbiBuYW5kX3Jlc3VtZQoKVmFpYmhhdiBHdXB0YSAoMSk6CiAgICAgIG10ZDogcmF3bmFu
ZDogY2FmZTogVXNlIGdlbmVyaWMgcG93ZXIgbWFuYWdlbWVudAoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9ncG1pLW5hbmQueWFtbCAgICAgICAgIHwgICAyICstCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbXhjLW5hbmQueWFtbCAgICAgICAgICB8ICAyNyArLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY2hpcC55YW1sICAgICAgICAgfCAgNDYgKy0tCiAuLi4v
YmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci1sZWdhY3kueWFtbCAgICAgICB8ICA2NSArKysr
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgICB8ICAg
MiArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1wcm9wZXJ0eS55YW1sICAgICB8
ICA2NCArKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55YW1s
ICAgICB8ICA3NCArLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtcHJv
cGVydHkueWFtbCB8ICA5OCArKysrKysKIGRyaXZlcnMvbXRkL25hbmQvZWNjLXJlYWx0ZWsuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDE4ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25h
bmQuYyAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNs
X2lmY19uYW5kLmMgICAgICAgICAgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYyAgICAgICAgIHwgIDExICstCiBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9teGNfbmFuZC5jICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAgICAgICAgICAgfCAgMTkgKy0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyAgICAgICAgICAgICAgICAgIHwgMzgxICsrKysrKysr
KysrKysrKystLS0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jICAgICAgICAgICAg
ICAgICAgICAgfCAgMTcgKy0KIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA1ICstCiAxNyBmaWxlcyBjaGFuZ2VkLCA2MTYgaW5zZXJ0aW9ucygr
KSwgMjQwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLWxlZ2FjeS55YW1sCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLXBy
b3BlcnR5LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3Jhdy1uYW5kLXByb3BlcnR5LnlhbWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
