Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7FBCDB47F
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vF1F/CNZS1M7DIcu5Zxc349FLuWb6C/eneA0phGSPxU=; b=SK1pLZEiRAZlaW
	XqsnkvDhX0bfqFuftAoiF7Ay6dGQdZytraEEei6FNdJ4oqGG6Qepse9UKETCT9QLliSBBbFOUdLBC
	DAOGYa4Zew2NjbTDM8swnPoTO1IbhRZr6vCoanHTQhY3g5xs856X5XicEFdugKD4fqVrP/cIIRZ8+
	gtReryYhtLRr0G7qBabooeUs5Rb/ENLRjk0+fJVUM1Sn1Imx+2VQ6rHAyO742B05z0711jfHMb1GW
	6h0ZQyJtqx18Jsh+EU/oxgDUC/iP8ZImMoh2y7POOzq5tvXJNp4iFuhEZmfoO4Zr09IKLhwEsFVav
	tTZ7N66IkmXv3dTZ61Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIFf-00000007Kus-0jvJ;
	Wed, 24 Jun 2026 07:42:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIFb-00000007KuJ-22eV
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jun 2026 07:42:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 86D454E407B2;
	Wed, 24 Jun 2026 07:42:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53B00601C5;
	Wed, 24 Jun 2026 07:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F500106C8415;
	Wed, 24 Jun 2026 09:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782286939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=24cTj+KtZMyHJGIsJ/3/F/CrjoKCJ/MW8PPJt4xmGbA=;
	b=wiJd/OW8crAzJGcBVyVbGTmZwuKGVNg/tNuSfM4PdQLlwy+miJ78GF8G4HxGs3J0c3lcu/
	hjBLeZz+kFuAE9n60x470ZKr6SksFCMxFejjECY+9DlOS5LJv/fXV6jxBUWRWEC89OEl8T
	J9EO/y3v4ba+RWemn1FmuAnSQRbtuIueHuKNK11FtY7L0kVH5yhPzrfVCaxNZeeRScUEUy
	Mh0T/PNqAlbAfOsMM+/yiYyCMlrFwS+TUxvDjhCDsVCu2j/rxQZlQ7uGX5cGxQfBXf7HZW
	QIcvFG7NJDC84Wb+sr3XSc3nS1tbo7U2+SscQCrA/EO7b8lp0BcYa6BYp0Lh8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Sashiko to track linux-mtd 
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 24 Jun 2026 09:42:16 +0200
Message-ID: <875x38mlk7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_004223_694549_C3F84C19 
X-CRM114-Status: UNSURE (   7.50  )
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

SGVsbG8gTVREIGZvbGtzLAoKSSBtZW50aW9uZWQgaXQgcmFwaWRseSBvbiBJUkMgYnV0IEkgYmVs
aWV2ZSBhIGZvcm1hbCBlLW1haWwgaXMgbW9yZQphcHByb3ByaWF0ZS4gSSBjb25zaWRlciBhc2tp
bmcgdGhlIFNhc2hpa28gdGVhbSB0byB0cmFjayBsaW51eC1tdGQgdG8KaGVscCB1cyB3aXRoIHJl
dmlld3M6CgoqIHNhc2hpa29AbGlzdHMubGludXguZGV2CiogUm9tYW4gR3VzaGNoaW4gPHJvbWFu
Lmd1c2hjaGluQGxpbnV4LmRldj4KCkkgYmVsaWV2ZSBTYXNoaWtvIHdpbGwgYmUgYSB1c2VmdWwg
dG9vbCBnaXZlbiB0aGF0IG91ciB0aW1lIGlzCmxpbWl0ZWQuIFdlIHdlcmUgYWxyZWFkeSBtb25p
dG9yaW5nIHRoZSBvdXRwdXQgb2YgU2FzaGlrbyB3aGVuIG90aGVyCihTYXNoaWtvIGVuYWJsZWQp
IG1haWxpbmcgbGlzdHMgd2VyZSBjb3BpZWQsIHNvIEkgcHJvcG9zZSB0byBvZmZpY2lhbGx5CmFk
ZCBsaW51eC1tdGQgdG8gdGhlIGxpc3QuCgpSaWNoYXJkIHNhaWQgaGUgd2FzIGZpbmUgd2l0aCB0
aGUgaWRlYSBhcyBsb25nIGFzIGl0IHJlbWFpbmVkIGEgdG9vbC4gSQphZ3JlZSB3aXRoIHRoaXMg
YXBwcm9hY2gsIFNhc2hpa28gaXMgbm90IHRoZSBBbHBoYSAmIE9tZWdhLCBidXQgSQpiZWxpZXZl
IGl0IHByb3ZlZCBpdHNlbGYgdXNlZnVsIGp1c3QgYnkgdGhlIGFtb3VudCBvZiBjb3JuZXIgY2Fz
ZXMgaXQKbWFuYWdlZCB0byBjYXRjaCBhbHJlYWR5LiBOb3QgYWxsIHJlY29tbWVuZGF0aW9ucyBz
aG91bGQgYmUgZm9sbG93ZWQgYW5kCndlIGFyZSBub3QgbG9va2luZyBmb3IgYW4gZW1wdHkgU2Fz
aGlrbyByZXNwb25zZSBmb3IgbWVyZ2luZy4KClRoZXJlIGlzIGFwcGFyZW50bHkgdGhlIHBvc3Np
YmlsaXR5IHRvIHR1bmUgdGhlIHByb21wdCBwZXIgc3Vic3lzdGVtLiBBdAp0aGlzIHN0YWdlIEkg
aGF2ZW4ndCB0aG91Z2h0IHZlcnkgZGVlcGx5IGFib3V0IGl0IGFuZCBjb25zaWRlcmVkIG5vdAph
ZGRpbmcgYW55IHN1YnN5c3RlbSBzcGVjaWZpYyBydWxlcy4gTWF5YmUgdGhlIFNQSSBOT1IgdGVh
bSB3YW50cyB0bwpjb21lIHVwIHdpdGggc29tZSBndWlkZWxpbmVzLCBzdWNoIGFzIHRoZSBuZWVk
IGZvciBhIHJlY29yZCAodXNpbmcgdGhlCnNjcmlwdCBpbiB0aGUgZG9jdW1lbnRhdGlvbikgZm9y
IG5ldyBjaGlwcyBhZGRpdGlvbnMuIEkgd291bGQgcHJvcG9zZSB0bwpub3QgZGVsYXkgdGhlIGFk
ZGl0aW9uIG9mIG91ciBtYWlsaW5nIGxpc3QgZm9yIHRoYXQuIFRoaXMgZG9lcyBub3QgbmVlZAp0
byBiZSBkb25lIGZyb20gZGF5IDEsIGFzIHdlIGNhbiBtYWtlIFBScyB0byB0aGVpciBHSCByZXBv
c2l0b3J5IHdpdGgKdGhlc2UgZXh0cmEgcmVxdWlyZW1lbnRzIHdoZW5ldmVyIHdlIGFyZSByZWFk
eSwgc2VlIGJlbG93LgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Nhc2hpa28tZGV2L3Nhc2hp
a28vYmxvYi9tYWluL01BSU5UQUlORVJTX0dVSURFLm1kCgpUaGFua3MgYSBsb3QsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
