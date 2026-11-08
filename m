Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90B606A31A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 02:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qaOG997c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYWl/o58
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+CpAmBksnAnu1spqNoO0JL9m6CrwfiSR0nKCKgzn5NI=; b=qaOG997cieD8QpWVMR0nn2g/7s
	HvlGvD5zdIZIXlJwz2kmA5lM+l/mjdz+Ixen5G0NIs7jm5Nry3D4H8Im/xLCeUMk+2yq39kAE4dX2
	RJYthxteGxb0fmMsgIBpi7IeSRaq1V1kiZ3FYDfuMBnPLk5fddh/Bhg3OPSWa2qu+y5nsIpdBD/RW
	WzTfuPu1bflyphO+OXII3dt9T1BAJDZUzZUycedkClXBmuG1KEkNlL2BacwVk8EoI/xJ4t1YJt6Vj
	smq19d03enxYLLjetntzEf3P2CUe5iXVbu5BE2hqn50TEJiW0pyu3gYfxpH2gCsrVqQBEY+klqaYA
	b9P0hs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPt59-0000000FcrV-0bib;
	Sun, 08 Nov 2026 02:56:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPt57-0000000FcrP-20Jg
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 02:56:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E92AB43E8D;
	Sun,  8 Nov 2026 02:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEF01F0089F;
	Sun,  8 Nov 2026 02:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794106592;
	bh=Ud7J2OgPq3pau0amfauWhSG4yZDtPGw9nEa5ZvrOQ3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nYWl/o58qQPfkKc7gn7O6hmb561ofByvCZyvx8sqnoAiR1T74uvfMTMt4Xiu7K2+5
	 qIimr6XJitArKbnG2agYbOInSCELDHLUh1+AjNvYQRnHau0ShEHV1WWvnRDY58UOiL
	 pBTQgpaQsKQRZDL6WXW/gavxsiIkNOpPAj20jDsrmPN76c6e2iHxEcxXZvxvHoWR1J
	 GYdogEWGj7nKI5f+OOMgOd2ehe27UPIKbfw677USxoNUBggpj6l8M+kxusd/eUQRww
	 5VrzTtluSEz+MRZ56L6wJV64YwiIBEDdlvWGedAH+qnxGH3p3KDFDg4ocIsoByZLXX
	 N8cbHISlEkY6Q==
Message-ID: <sashiko-outbox-203532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for GigaDevice
 GD25B512
To: "Matthew Parker" <mparker@arista.com>, pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, "Adam Calabrigo" <adamc@arista.com>
In-Reply-To: <20261108024317.898917-1-mparker@arista.com>
References: <20261108024317.898917-1-mparker@arista.com>
Date: Sun, 08 Nov 2026 02:56:32 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGktbm9yOiBn
aWdhZGV2aWNlOiBtaXNzaW5nIFNQSV9OT1JfNEJJVF9CUCBvbiBHRDI1QjUxMgogIGVudHJ5Ci0t
Cgpjb21taXQgODBmY2Y4YjUxMGNiNGRjOTkyZjM4ODljZjMzZTQyZDBjYzUxNDYzOQpBdXRob3I6
IE1hdHRoZXcgUGFya2VyIDxtcGFya2VyQGFyaXN0YS5jb20+CgptdGQ6IHNwaS1ub3I6IGdpZ2Fk
ZXZpY2U6IEFkZCBzdXBwb3J0IGZvciBHaWdhRGV2aWNlIEdEMjVCNTEyCgpUaGlzIGNvbW1pdCBh
ZGRzIGEgZmxhc2hfaW5mbyBlbnRyeSBmb3IgdGhlIEdpZ2FEZXZpY2UgR0QyNUI1MTIgNjQgTWlC
IFNQSQpOT1IgZmxhc2ggd2l0aCBTdGF0dXMgUmVnaXN0ZXIgbG9ja2luZyBlbmFibGVkLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYwo+IGluZGV4IDZhMmU2ZWJkYTE0ODMuLmZlMDVjMGYwMzcw
ZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYwo+IEBAIC02NCw2ICs2NCw5IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBnaWdhZGV2aWNlX25vcl9wYXJ0c1tdID0gewo+
ICAJCS5pZCA9IFNOT1JfSUQoMHhjOCwgMHg0MCwgMHgxOSksCj4gIAkJLm5hbWUgPSAiZ2QyNXEy
NTYiLAo+ICAJCS5mbGFncyA9IFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8IFNQ
SV9OT1JfVEJfU1JfQklUNiwKPiArCX0sIHsKPiArCQkuaWQgPSBTTk9SX0lEKDB4YzgsIDB4NDcs
IDB4MWEpLAo+ICsJCS5mbGFncyA9IFNQSV9OT1JfSEFTX0xPQ0ssCj4gIAl9LCB7Cj4gIAkJLmlk
ID0gU05PUl9JRCgweGM4LCAweDYwLCAweDE2KSwKPiAgCQkubmFtZSA9ICJnZDI1bHEzMiIsCgpb
U2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIHRoaXMgZW50cnkgYWxzbyBzZXQgU1BJX05PUl80QklU
X0JQIGluIC5mbGFncz8KClRoZSBHRDI1QjUxMiBpcyBhIDY0IE1pQiBmbGFzaCAoMTAyNCA2NCBL
aUIgYmxvY2tzKSB0aGF0IHVzZXMgZm91ciBCbG9jawpQcm90ZWN0IGJpdHMgKEJQMzowIGluIFN0
YXR1cyBSZWdpc3RlciAxIGJpdHMgNToyKSB0byBhZGRyZXNzIGl0cyBibG9jawpwcm90ZWN0aW9u
IHJhbmdlcy4gIFdpdGhvdXQgU1BJX05PUl80QklUX0JQLCBzcGlfbm9yX2dldF9zcl9icF9tYXNr
KCkKb21pdHMgU1JfQlAzLCBzbyBzcGlfbm9yX3NyX2xvY2soKSBhbmQgc3BpX25vcl9nZXRfbWlu
X3Byb3RfbGVuZ3RoX3NyKCkKbWlzY2FsY3VsYXRlIHByb3RlY3RlZCByYW5nZXMgYnkgYSBmYWN0
b3Igb2YgMTYgKGxvY2tpbmcgdGhlIGZ1bGwgY2hpcApvbmx5IHByb3RlY3RzIDQgTWlCKSwgYW5k
IHNwaV9ub3JfdHJ5X3VubG9ja19hbGwoKSBvciBzcGlfbm9yX3NyX3VubG9jaygpCmNhbm5vdCBk
ZXRlY3Qgb3IgY2xlYXIgU1JfQlAzIGlmIGl0IGlzIHNldC4KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgwMjQzMTcuODk4OTE3
LTEtbXBhcmtlckBhcmlzdGEuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
