Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9026D5CC8E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxgZOcj4se5W/ZI6Jxj+KuoXslylOLxdpWUZk9tuP2I=; b=B1s7mJx2vDSXlj
	Ah0m7bJFaWXl+2h5X4N/GONyP4OaIqg69HXF6P4vS1nNlAlU5Jg4W32D49gwZ3fS/3miW7DmdoV9H
	J+du9Folf2EcKpdRWx6TdB9a6FWlur9UFIeXcVWBW6U8px9LmE+frkbV+uDZJAyssVgVmU4+Wq4IC
	9PYu703cweeY4H2vV+8qs9JM22sq5EpfW0DfW/xhHY2P/QZGFaxXqxvDkmJ4NoZsUE93J9cNwq1hb
	fqLYc55a6t35iRP68mX+HFT9ugRiF5ha3Zh1Ul6LsBAw/f6qyiciodXCjaoY/la0yyQzVCIieDFRh
	qz8FQ+20nI4isekF1tdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Nq-000000002KF-0K1D;
	Wed, 30 Oct 2024 10:57:02 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66EW-000000000OO-2ips
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 10:47:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 6DCCCC000D;
	Wed, 30 Oct 2024 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730285240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pMchHP69c26XAzNG8iivY1LwGH4VkexERcWrseBovcE=;
	b=QQi96Fz/s2t8sT6eX/b5kiVtkfZtV8foCN5TjSoDyePJtejoJyvs5A7Cz6jJtwS8Fq0bhU
	eZrsByeS3K3ZKg/uXD1NygBBt8zPrnktXWx1pHCsPAmA2+VDEWg0GZNG1/a8YZ9UAhaXeE
	Qa9q6nIw/0RZPsF75uhDz1mykkyEzaWmGv95rc1IIt/RnFbaBBd62Z4ZEdd29iOmWM1C7a
	R90NLIY2a4rza5TAu4kT+bTzCWw1xP6qDgV0ajCUvmhnvoUF1sDLtI2QkEp03Wm/z+qtVf
	2OXmbRcnuYAeAWKBD43OLtgGNSRYPn10spxEngb7VyWosNid+CLo/2ZBrOUTKg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 0/5] Implement setup_inteface() in the DaVinci NAND controller
Date: Wed, 30 Oct 2024 11:47:12 +0100
Message-ID: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_034724_992139_C1A965DC 
X-CRM114-Status: GOOD (  12.24  )
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

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBpbXBsZW1lbnQgdGhlIHNldHVwX2lu
dGVyZmFjZSgpIG9wZXJhdGlvbiBpbgp0aGUgRGFWaW5jaSBOQU5EIGNvbnRyb2xsZXIgdG8gZW5h
YmxlIHRoZSB1c2Ugb2YgYWxsIE9ORkkgbW9kZXMgYW5kCmltcHJvdmUgdGhlIE5BTkQgYWNjZXNz
IHNwZWVkLgoKVGhpcyBOQU5EIGNvbnRyb2xsZXIgaXMgcHJlc2VudCBpbiB0aGUgRGFWaW5jaSAo
T01BUCBMMTM4KSBhbmQgS2V5c3RvbmUyClNvQ3MgYW5kIGZ1bmN0aW9ucyBhcyBhICdjaGlsZCcg
b2YgdGhlIEFFTUlGIGNvbnRyb2xsZXIuIFNvIGl0cyB0aW1pbmdzCmFyZSBzZXQgYnkgdGhlIEFF
TUlGIGNvbnRyb2xsZXIgaXRzZWxmIGZyb20gZGV2aWNlLXRyZWUgcHJvcGVydGllcy4KSW1wbGVt
ZW50aW5nIHRoZSBzZXR1cF9pbnRlcmZhY2UoKSBjYWxsYmFjayBpbXBsaWVzIGJlaW5nIGFibGUg
dG8gdXBkYXRlCmR5bmFtaWNhbGx5IHRoZXNlIHRpbWluZ3MsIHNvIHRoZSBmaXJzdCB0d28gcGF0
Y2hlcyBvZiB0aGUgc2VyaWVzIG1vZGlmeQp0aGUgQUVNSUYgZHJpdmVyIHRvIHByb3ZpZGUgaXRz
ICdjaGlsZHJlbicgYSB3YXkgdG8gbW9kaWZ5IHRoZWlyIGNoaXAKc2VsZWN0IHRpbWluZyBjb25m
aWd1cmF0aW9uLiBUbyBkbyBzbywgSSBhZGQgYSB0aS1hZW1pZi5oIGhlYWRlciwgSSdtIG5vdApz
dXJlIHdoZXRoZXIgdGhpcyBoZWFkZXIgc2hvdWxkIGJlIGxvY2F0ZWQgaW4gaW5jbHVkZS9tZW1v
cnkgb3IgaW4KaW5jbHVkZS9saW51eC9tZW1vcnkuIEkgcHV0IGl0IGluIGluY2x1ZGUvbWVtb3J5
IGJlY2F1c2UgdGhlIGZvbGRlcgphbHJlYWR5IGV4aXN0cyB3aGlsZSBpbmNsdWRlL2xpbnV4L21l
bW9yeSBkb2Vzbid0LgoKVGhlIHJlbWFpbmluZyBwYXRjaGVzIGltcGxlbWVudCB0aGUgc2V0dXBf
aW50ZXJmYWNlKCkgb3BlcmF0aW9uLgpUaGUgY29tcHV0YXRpb24gb2YgdGhlIHJlZ2lzdGVyJ3Mg
Y29udGVudHMgaXMgZGlyZWN0bHkgYmFzZWQgb24KwqcyMC4zLjIuMyBvZiB0aGUgT01BUC1MMTM4
IFRSTSBbMV0KClRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIHR3byBwbGF0Zm9ybXMgYmFzZWQgdXBv
biB0aGUgRGFWaW5jaSBTb0MuIE9uZSBpcwppbnRlcmZhY2VkIHdpdGggYSBNYWNyb25peCBNWDMw
VUY0RzE4QUMgTkFORCwgdGhlIG90aGVyIHdpdGggYSBUb3NoaWJhCk5BTkQuCgpbMV0gOiBodHRw
czovL3d3dy50aS5jb20vbGl0L3VnL3NwcnVoNzdjL3NwcnVoNzdjLnBkZgoKQmFzdGllbiBDdXJ1
dGNoZXQgKDUpOgogIG1lbW9yeTogdGktYWVtaWY6IENyZWF0ZSBhZW1pZl9zZXRfY3NfdGltaW5n
cygpCiAgbWVtb3J5OiB0aS1hZW1pZjogZXhwb3J0IGFlbWlmX3NldF9jc190aW1pbmcoKQogIG10
ZDogcmF3bmFuZDogZGF2aW5jaTogT3JkZXIgaGVhZGVycyBhbHBoYWJldGljYWxseQogIG10ZDog
cmF3bmFuZDogZGF2aW5jaTogQWRkIGNsb2NrIHJlc291cmNlCiAgbXRkOiByYXduYW5kOiBkYXZp
bmNpOiBJbXBsZW1lbnQgc2V0dXBfaW50ZXJmYWNlKCkgb3BlcmF0aW9uCgogZHJpdmVycy9tZW1v
cnkvdGktYWVtaWYuYyAgICAgICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMgfCAgOTUgKysrKysrKysrKysr
KysrKysrKysrKysrLS0KIGluY2x1ZGUvbWVtb3J5L3RpLWFlbWlmLmggICAgICAgICAgIHwgIDMx
ICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9tZW1vcnkvdGktYWVtaWYuaAoKLS0g
CjIuNDcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
