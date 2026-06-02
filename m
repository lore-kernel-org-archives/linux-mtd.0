Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F384ACD6E4A
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1nwhazQqnsCZEhdHTjZoHbSY6aGCJtpuVKHIGSAlWs=; b=dVeKWAiQqJhBwf
	ADVX+rIE8+CO7nc6pekRk1k3/8mjDLY60bT+rlihgduTPHHJJIwTMAlxjn8DmifDycdWxciGDzKqI
	qQJ5bG/dPXOJdYSzeWGD6XirBTMwPetiI8PFNk/Nz/qLJsSRO3Efk8VvIZo5biyb3+Ocq5EMwxntB
	+MgmzVfUYbnWOKeUdI6z21qB0qcCKyg80yG+UddieMms9qeiTvfUbzxxGbwVgxBUoQFNzVqam1dgJ
	n3IY83wwcH0Frp09qid+DkvsNXwF6PupgW4SpXhPzgtYDSeiMeplDK26Zw5md6b5LawK4nVJBCoiP
	uWyGH+F4WjY+GXosIU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOyt-0000000D505-25H6;
	Tue, 02 Jun 2026 13:16:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOyn-0000000D4ya-2rTg
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 13:16:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A8BC11A37CF;
	Tue,  2 Jun 2026 13:16:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76B44603BC;
	Tue,  2 Jun 2026 13:16:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 287C2108883E7;
	Tue,  2 Jun 2026 15:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780406181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gOu76nQ6CvdMEqaQnd/0VfAcRkoqA1ft5/obBk5yhrk=;
	b=hF4XqpBaDrK/k1W2VVAHcBEVqMHnsIco62xdNly4l8WLlajAmWh4of6feDjOgW4a5iGB5e
	CPuRLA78OAuM/2AzwEfctczOEaiEqxc9QuDDPI+V66kuct+heV1KCUtJsDPBd2NVsYoEgO
	BNoERg4AowEF0RtMr7OXtJ74ky7/1yCUIeG2O7X4dN1dc40V3S2zRkIuMXioDes/ePYW1r
	rWuXY+gQIWHtefIP0LJfQZkB10Wz640DtTzShRmS0XIO49wGtx2j9MOYzs9jeXSm5qaKX9
	a45Rm872TIFu9dO1eakMyYJhuYT8tQc6C6u2F9+nanOdAckNIwUY6XNaTMjf8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [spi-nor] Macronix MX25L requires CR read opcode 0x15 (not 0x35)
In-Reply-To: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
	(Maarten Zanders's message of "Fri, 22 Aug 2025 14:03:02 +0200")
References: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 15:16:19 +0200
Message-ID: <87bjdt13rw.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_061625_875001_0B747CB3 
X-CRM114-Status: UNSURE (   9.80  )
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

SGVsbG8sCgpPbiAyMi8wOC8yMDI1IGF0IDE0OjAzOjAyICswMiwgTWFhcnRlbiBaYW5kZXJzIDxt
YWFydGVuQHphbmRlcnMuYmU+IHdyb3RlOgoKPiBIaSBhbGwsCj4KPiBPbiB0aGUgTWFjcm9uaXgg
TVgyNUwxMjgzM0YgKElEIDB4QzIyMDE4KSAmIG90aGVycyBvZiB0aGlzIGZhbWlseS9tZmcsCj4g
dGhlIENSIChjb25kaXRpb24gcmVnaXN0ZXIpIG11c3QgYmUgcmVhZCB3aXRoIG9wY29kZSAweDE1
LiBUaGUgZHJpdmVyCj4gY3VycmVudGx5IHVzZXMgMHgzNSwgd2hpY2ggdGhlIGNoaXAgZG9lcyBu
b3QgcmVjb2duaXplLgo+Cj4gRGF0YXNoZWV0OiBodHRwczovL3d3dy5tYWNyb25peC5jb20vTGlz
dHMvRGF0YXNoZWV0L0F0dGFjaG1lbnRzLzg5MzQvTVgyNUwxMjgzM0YsJTIwM1YsJTIwMTI4TWIs
JTIwdjEuMC5wZGYKPiAocC4yNywgUkRDUikuCj4KPiBXaXRoIDB4MzUgdGhlIGRhdGEgbGluZSBm
bG9hdHMgYW5kIHRoZSBkcml2ZXIgcmVhZHMgQ1IgYXMgMHhGRgo+IChkZXBlbmRpbmcgb24gcHJl
dmlvdXMgc3RhdGUgb2YgdGhlIGxpbmUgb3IgcHVsbCB1cC9kb3duKS4gVGhpcyB2YWx1ZQo+IGlz
IHRoZW4gd3JpdHRlbiBiYWNrIGluIHNwaV9ub3Jfd3JpdGVfMTZiaXRfc3JfYW5kX2NoZWNrKCks
IHNldHRpbmcgQ1IKPiB0byAweEZGLiBPbmUgY29uc2VxdWVuY2UgaXMgZmxpcHBpbmcgdGhlIE9U
UCBUb3AvQm90dG9tIHByb3RlY3Rpb24KPiBiaXQsIHNvIGZyb20gdGhlbiBvbiwgbG9ja2luZyB0
aGUgdG9wIGJsb2NrIGFjdHVhbGx5IGxvY2tzIHRoZSBib3R0b20KPiBzZWN0b3IuIFRoaXMgYnJl
YWtzIGJvb3Rsb2FkZXIgdXBkYXRlcyAoaW4gbXkgY2FzZSkgYW5kIHNpbWlsYXIgZmxvd3MuCj4K
PiBQb3NzaWJsZSBmaXhlczoKPiAtIE1ha2UgQ1IgcmVhZCBvcGNvZGUgY29uZmlndXJhYmxlIHBl
ciBkZXZpY2UuCgpGWUkgSSBqdXN0IHByb3Bvc2VkIGEgc2VyaWVzIHdoaWNoIGdvZXMgaW50byB0
aGF0IGRpcmVjdGlvbiwgd2l0aCBxdWl0ZQphIGRlZXAgcmV3b3JrIG9mIHRoZSBRRVIgU0ZEUCBm
aWVsZCBoYW5kbGluZy4gVGhpcyByZXdvcmsgYWxsb3dzIG9uIGEKcGVyIGNoaXAgYmFzaXMgdG8g
aW5kaWNhdGU6Ci0gd2hhdCBhcmUgdGhlIHN0YXR1cyBvcGVyYXRpb25zIHN1cHBvcnRlZAotIHdo
YXQgYXJlIHRoZSBvcGNvZGVzIGZvciB0aGVzZSBvcGVyYXRpb25zCgpMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNjA1Mjktd2luYm9uZC12Ny0xLXNwaS1ub3ItcnYt
YWRkaXRpb24tdjEtMC1mM2FlMTg1MDJkNWFAYm9vdGxpbi5jb20vVC8jbTAwNThkMDc5NjViYThj
OTFhMjQzOGM1NTEyZTJiN2IyNjkzYTY5MDkKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
