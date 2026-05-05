Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F0FF8855
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nrOoI3FTWvJyHb88KlAxA5t3wfVb8GgdOktEiU9s4oo=; b=AaPQoNldq1QbYd
	STUIHGRIZDp/G45kWHXRmwkSRPGOPSMJ3AssPHmHFSal+wSLO/8+XEWwyDnZzyPBXNcswJUW9vPn2
	am94d+yjOTSfH09SgCLCwG+dZZzci060MaofG3KXFcNcFgkmtB5GrWLI8zCnHgrVm7YWsOegSoPbK
	OQPTqds547WbiqHR0WZ3kY2zGoLNCTKm1v3rGwI+gDjHGa/YsBQd1qEDFZYl4YuhAEqzlqXWU+Xlu
	VLgMJm2iMSw13WIRFwsE5wwipSekq8o4FF9xDKLgD8TM+/JvYOqi2pBH3B/X3YeDzIq7kxWF/3WD8
	fHOOXHxOAAvJDD0z+hZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHWx-0000000GdOS-3b7x;
	Tue, 05 May 2026 15:17:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHWu-0000000GdNa-45UX
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 15:17:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 008641A3522;
	Tue,  5 May 2026 15:17:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0FDC6053C;
	Tue,  5 May 2026 15:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CFF311AD0294;
	Tue,  5 May 2026 17:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777994265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DJOziYNK85wKAueLIhUm0OYRigtc/n2nqr8Gi1+TtLA=;
	b=TO/2sKFX6i8aL3LKxEBrb33ch+Sb9B1UCGUqpFlZocNQpIN/hzv/wvFTFANg13vaVl8tTW
	M/sReYc57TILRvBrNgJmMkScXjac9EUrlRjTz4Np1LiHrKBFjSthw8oTpyYz80yW0M1jje
	UYmFA8fXaiHzU9NeVn18GJ8NeaqmSTXZuKtD0W4mgqDqHi6nUoouuTXcpGBSg4ejn/oY1Y
	8kvXWzHVSKf5gNa3041XqcuJfSLWaOmBrftsqX02Kpq8cFI3FkRtc0c1CwFntZil26Wbxz
	vg0gmEG/v1Kse9mvEcwQDwUZeWloohye4Isj7mS51pFsehvRGUuADASA/5PH2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: [GIT PULL] spi-nand/spi-mem changes for 7.2
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 05 May 2026 17:17:42 +0200
Message-ID: <87jythopgp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_081749_146731_B16099D2 
X-CRM114-Status: UNSURE (   9.94  )
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

SGVsbG8gTWFyaywKCkhlcmUgaXMgYW4gaW1tdXRhYmxlIHRhZyBmb3IgeW91IHRvIHB1bGwgaW50
byB5b3VyIHNwaSB0cmVlIHdpdGggYWxsIHRoZQpzcGktbWVtIGNoYW5nZXMgd2UgYWdyZWVkIHVw
b24uIEkgYWxzbyBtZXJnZWQgaXQgaW50byBuYW5kL25leHQuCgpUaGFua3MsCk1pcXXDqGwKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFl
MzRiYzUwYmQ1ZjQ1ZTczMToKCiAgTGludXggNy4xLXJjMSAoMjAyNi0wNC0yNiAxNDoxOTowMCAt
MDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdz
L210ZC9zcGktbWVtLWNvbnQtcmVhZC1mb3ItNy4yCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gMzhmYmU0YjNmNjZlNWI4ZTJmMmFiOGU3Y2EzZDkxMmUxZTkzNWZlMjoKCiAgc3BpOiBz
cGktbWVtOiBBZGQgYSBub19jc19hc3NlcnRpb24gY2FwYWJpbGl0eSAoMjAyNi0wNS0wNCAxNTow
NzozNyArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQXNpZGUgZnJvbSBwcmVwYXJhdGlvbiBjaGFuZ2VzIGluIHRo
ZSBTUEkgTkFORCBjb3JlLCB0aGUgY2hhbmdlcyBjYXJyaWVkCmhlcmUgZm9jdXMgb24gdGhlIHNo
YXJlZCBzcGktbWVtIGxheWVyIHdoaWNoIGlzIGVuaGFuY2VkIGluIG9yZGVyIHRvCmJyaW5nIHR3
byBuZXcgZmVhdHVyZXM6CgotIFRoZSBwb3NzaWJpbGl0eSB0byBmaWxsIGEgcHJpbWFyeSBhbmQg
YSBzZWNvbmRhcnkgb3BlcmF0aW9uIHRlbXBsYXRlCiAgaW4gdGhlIGRpcmVjdCBtYXBwaW5nIHN0
cnVjdHVyZSBpbiBvcmRlciB0byBzdXBwb3J0IGNvbnRpbnVvdXMgcmVhZHMKICBpbiBTUEkgTkFO
RCwgd2hpY2ggbWF5IHJlcXVpcmUgdHdvIGRpZmZlcmVudCByZWFkIG9wZXJhdGlvbnMuCgotIFNQ
SSBjb250cm9sbGVycyBtYXkgaW5kaWNhdGUgcG9zc2libGUgQ1MgaW5zdGFiaWxpdGllcyBvdmVy
IGxvbmcKICB0cmFuc2ZlcnMgYnkgc2V0dGluZyBhIGJvb2xlYW4uIFRoaXMgY2FwYWJpbGl0eSBp
cyByZWxhdGVkIHRvIHRoZQogIHByZXZpb3VzIG9uZSwgdGhlIG5lZWQgZm9yIGl0IGhhcyBhcmlz
ZWQgd2hpbGUgdGVzdGluZyBTUEkgTkFORAogIGNvbnRpbnVvdXMgcmVhZHMgd2l0aCB0aGUgQ2Fk
ZW5jZSBRU1BJIGNvbnRyb2xsZXIgd2hpY2ggY2Fubm90LCB1bmRlcgogIGNlcnRhaW4gY29uZGl0
aW9ucywga2VlcCB0aGUgQ1MgYXNzZXJ0ZWQgZm9yIHRoZSBsZW5ndGggb2YKICBhbiBlcmFzZWJs
b2NrLWxhcmdlIHRyYW5zZmVyLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNaXF1ZWwgUmF5bmFsICg2KToKICAgICAgbXRk
OiBzcGluYW5kOiBEcm9wIGEgdG9vIHN0cm9uZyBsaW1pdGF0aW9uCiAgICAgIG10ZDogc3BpbmFu
ZDogRXhwb3NlIHNwaW5hbmRfb3BfaXNfb2R0cigpCiAgICAgIG10ZDogc3BpbmFuZDogRHJvcCBF
Q0MgZGlybWFwcwogICAgICBzcGk6IHNwaS1tZW06IFRyYW5zZm9ybSB0aGUgcmVhZCBvcGVyYXRp
b24gdGVtcGxhdGUKICAgICAgc3BpOiBzcGktbWVtOiBDcmVhdGUgYSBzZWNvbmRhcnkgcmVhZCBv
cGVyYXRpb24KICAgICAgc3BpOiBzcGktbWVtOiBBZGQgYSBub19jc19hc3NlcnRpb24gY2FwYWJp
bGl0eQoKIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgIHwgNzYgKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
ICAgfCAyMiArKysrKysrLS0tLS0tCiBkcml2ZXJzL3NwaS9zcGktYWlyb2hhLXNuZmkuYyB8ICA2
ICsrLS0KIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgIHwgIDQgKy0tCiBkcml2ZXJzL3Nw
aS9zcGktaW50ZWwuYyAgICAgICB8ICA2ICsrLS0KIGRyaXZlcnMvc3BpL3NwaS1tZW0uYyAgICAg
ICAgIHwgMzIgKysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL3NwaS9zcGktbXhpYy5jICAgICAg
ICB8IDE4ICsrKysrLS0tLS0KIGRyaXZlcnMvc3BpL3NwaS1ucGNtLWZpdS5jICAgIHwgMTYgKysr
Ky0tLS0tCiBkcml2ZXJzL3NwaS9zcGktcnBjLWlmLmMgICAgICB8ICA4ICsrLS0tCiBkcml2ZXJz
L3NwaS9zcGktc3RtMzItb3NwaS5jICB8ICA2ICsrLS0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi1x
c3BpLmMgIHwgIDYgKystLQogZHJpdmVycy9zcGkvc3BpLXdwY20tZml1LmMgICAgfCAgMiArLQog
aW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oICAgfCAgNCArLS0KIGluY2x1ZGUvbGludXgvc3Bp
L3NwaS1tZW0uaCAgIHwgMTIgKysrKysrLQogMTQgZmlsZXMgY2hhbmdlZCwgMTE1IGluc2VydGlv
bnMoKyksIDEwMyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
