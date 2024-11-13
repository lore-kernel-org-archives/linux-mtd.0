Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77474D41C27
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TcYFP4SQSK7460Nu+LuZubFF7B3RYrIN2MAmhQFR9hQ=; b=XJAJdDSnhoIE+1
	jebdNn1+71xA1xz5XcIwERwWJmE0DhnxmHjuqyQjfREVXXeZYEjLLSN5VCZklwbiLhQEZvv+rW0Ef
	vYRDwxsdSMUfO2aBqtB8nHQUXf6Ya43/k/NtkeVX9e6t5zRkKupLtlHn5Z8iHcvXzD9dehr03WmWG
	3JQNdbVc5i5ejLOqtA5Nzh93oikv7feeTduAJC1+A0z7JBapM5g48VnUO8w8gyZnTC1rssCC4c1Mc
	efbWN7TwSfR98uyec7cTZg2x+LbI5rpACYDZelX+b13/gh+6Eq9S8ol/gmMt69ah69g3v++Z8cF+L
	rninf18ymaMG62Yzklaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA8y-00000006LHI-1cBj;
	Wed, 13 Nov 2024 09:58:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0Q-00000006IWH-2SqY
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:49:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 0667DC0004;
	Wed, 13 Nov 2024 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TF98DUnwKLixz1e8gODb+/hKwGspDaRBxYKzd0vc82c=;
	b=PQbX4+O6HGpxHs+9bzABSaOg4JGYfWtS2bmYTELjsHgVy20NbpEAkFmfYnBihDpHHcidPg
	hIp5r9Wxrlx0+HqgfWWP7E9IF/Uq8tDRxslkIOscJGuLdedYuZ33xmiZUu0Lqw19UC02gF
	n9NPDEJV8e5rx5iXwKsFyvV/6OzawmEWaKSiku8AlCnkg1YskcBd47l62ykctlAjSHEfTE
	sSRcY4sTqpAcrxT6sQQmR1prKKFRoZpKuyv15t5evZdPqFvV2L4PmNqao2YKnOVn1t22JX
	qa2QKUOv+7dwxrRBFOPtLOKGf2ooMqe151cGhmyRsOsjMdmRHZDUR30sgSSD9A==
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
Subject: [PATCH v3 0/7] Implement setup_interface() in the DaVinci NAND controller
Date: Wed, 13 Nov 2024 10:49:31 +0100
Message-ID: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014946_955926_7A3E19F2 
X-CRM114-Status: GOOD (  14.53  )
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
IHNwZWVkLgoKUEFUQ0ggMyBkZXBlbmRzIG9uIFBBVENIIDEtMgpQQVRDSCA3IGRlcGVuZHMgb24g
UEFUQ0ggMy01LTYKClRoaXMgTkFORCBjb250cm9sbGVyIGlzIHByZXNlbnQgaW4gdGhlIERhVmlu
Y2kgKE9NQVAgTDEzOCkgYW5kIEtleXN0b25lMgpTb0NzIGFuZCBmdW5jdGlvbnMgYXMgYSAnY2hp
bGQnIG9mIHRoZSBBRU1JRiBjb250cm9sbGVyLiBTbyBpdHMgdGltaW5ncwphcmUgc2V0IGJ5IHRo
ZSBBRU1JRiBjb250cm9sbGVyIGl0c2VsZiBmcm9tIGRldmljZS10cmVlIHByb3BlcnRpZXMuCklt
cGxlbWVudGluZyB0aGUgc2V0dXBfaW50ZXJmYWNlKCkgY2FsbGJhY2sgaW1wbGllcyBiZWluZyBh
YmxlIHRvIHVwZGF0ZQpkeW5hbWljYWxseSB0aGVzZSB0aW1pbmdzLCBzbyB0aGUgZmlyc3QgdGhy
ZWUgcGF0Y2hlcyBvZiB0aGUgc2VyaWVzIG1vZGlmeQp0aGUgQUVNSUYgZHJpdmVyIHRvIHByb3Zp
ZGUgaXRzICdjaGlsZHJlbicgYSB3YXkgdG8gbW9kaWZ5IHRoZWlyIGNoaXAKc2VsZWN0IHRpbWlu
ZyBjb25maWd1cmF0aW9uLgoKVGhlIHJlbWFpbmluZyBwYXRjaGVzIGltcGxlbWVudCB0aGUgc2V0
dXBfaW50ZXJmYWNlKCkgb3BlcmF0aW9uLgpUaGUgY29tcHV0YXRpb24gb2YgdGhlIHJlZ2lzdGVy
J3MgY29udGVudHMgaXMgZGlyZWN0bHkgYmFzZWQgb24KwqcyMC4zLjIuMyBvZiB0aGUgT01BUC1M
MTM4IFRSTSBbMV0KClRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIHR3byBwbGF0Zm9ybXMgYmFzZWQg
dXBvbiB0aGUgRGFWaW5jaSBTb0MuIE9uZSBpcwppbnRlcmZhY2VkIHdpdGggYSBNYWNyb25peCBN
WDMwVUY0RzE4QUMgTkFORCwgdGhlIG90aGVyIHdpdGggYSBUb3NoaWJhCk5BTkQuCgpbMV0gOiBo
dHRwczovL3d3dy50aS5jb20vbGl0L3VnL3NwcnVoNzdjL3NwcnVoNzdjLnBkZgoKQ2hhbmdlIGxv
ZzoKICogdjMKICAgUEFUQ0ggMSBbbmV3XToKICAgICAtIFdyYXAgdGhlIHZlcmlmaWNhdGlvbiBv
ZiBDUyB0aW1pbmcgY29uZmlndXJhdGlvbiBpbnRvIGEgZnVuY3Rpb24KICAgUEFUQ0ggMjoKICAg
ICAtIEZpeCBjb21tZW50cwogICBQQVRDSCAzOgogICAgIC0gUmVwbGFjZSB0aGUgc3Bpbi1sb2Nr
IHdpdGggYSBtdXRleAogICBQQVRDSCA3OgogICAgIC0gQWRkIGhhbmRsaW5nIG9mIHRoZSBOQU5E
X0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSBjYXNlCiAgICAgLSBzZXR1cF9pbnRlcmZhY2UoKSByZXR1
cm5zIGVycm5vIG9uIGZhaWx1cmVzCgogKiB2MgogICBDb3ZlciBsZXR0ZXIgOgogICAgIC0gQWRk
IGRlcGVuZGVuY3kgZGV0YWlscwogICAgIC0gUmVtb3ZlIHRoZSBxdWVzdGlvbiBhYm91dCB0aS1h
ZW1pZi5oIGxvY2F0aW9uCiAgIFBBVENIIDEgOgogICAgIC0gRml4IGFlbWlmX2NzX3RpbWluZ3Mn
cyBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWVudHMKICAgUEFUQ0ggMiA6CiAgICAgLSBGaXggdHlw
byBpbiB0aGUgY29uZmlnX2NzX2xvY2sncyBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWVudHMKICAg
ICAtIE1vdmUgaW5jbHVkZS9tZW1vcnkvdGktYWVtaWYuaCB0byBpbmNsdWRlL2xpbnV4L21lbW9y
eS90aS1hZW1pZi5oCiAgIFBBVENIIDMgW05FV10gOgogICAgIC0gRml4IGRlcGVuZGVuY3kgaXNz
dWUgd2l0aCBhZW1pZiBjb250cm9sbGVyIGluIEtjb25maWcKICAgUEFUQ0ggNSA6CiAgICAgLSBB
ZGQgZGV0YWlscyBhYm91dCB0aGUgY2xvY2sgYmluZGluZ3MgaW4gdGhlIGNvbW1pdCBsb2cKICAg
ICAtIFJlcGxhY2UgZGV2bV9jbGtfZ2V0KCkgd2l0aCBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpCiAg
ICAgLSBVc2UgZGV2X2Vycl9wcm9iZSgpIHRvIHJldHVybiB0aGUgZGV2bV9jbGtfZ2V0X2VuYWJs
ZWQoKSBlcnJvcgoKW3YxXSA6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAzMDEw
NDcxNy44ODY4OC0xLWJhc3RpZW4uY3VydXRjaGV0QGJvb3RsaW4uY29tLwpbdjJdIDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMTA2MDg1NTA3Ljc2NDI1LTEtYmFzdGllbi5jdXJ1
dGNoZXRAYm9vdGxpbi5jb20vCgpCYXN0aWVuIEN1cnV0Y2hldCAoNyk6CiAgbWVtb3J5OiB0aS1h
ZW1pZjogQ3JlYXRlIGFlbWlmX2NoZWNrX2NzX3RpbWluZ3MoKQogIG1lbW9yeTogdGktYWVtaWY6
IENyZWF0ZSBhZW1pZl9zZXRfY3NfdGltaW5ncygpCiAgbWVtb3J5OiB0aS1hZW1pZjogRXhwb3J0
IGFlbWlmXypfY3NfdGltaW5ncygpCiAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBBbHdheXMgZGVw
ZW5kcyBvbiBUSV9BRU1JRgogIG10ZDogcmF3bmFuZDogZGF2aW5jaTogT3JkZXIgaGVhZGVycyBh
bHBoYWJldGljYWxseQogIG10ZDogcmF3bmFuZDogZGF2aW5jaTogQWRkIGNsb2NrIHJlc291cmNl
CiAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBJbXBsZW1lbnQgc2V0dXBfaW50ZXJmYWNlKCkgb3Bl
cmF0aW9uCgogZHJpdmVycy9tZW1vcnkvdGktYWVtaWYuYyAgICAgICAgICAgfCAxMzcgKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAg
ICAgfCAgIDQgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RhdmluY2lfbmFuZC5jIHwgIDk0ICsr
KysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvbGludXgvbWVtb3J5L3RpLWFlbWlmLmggICAgIHwg
IDMyICsrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjI5IGluc2VydGlvbnMoKyksIDM4IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWVtb3J5L3RpLWFlbWlm
LmgKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
