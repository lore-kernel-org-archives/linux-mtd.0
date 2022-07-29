Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0006CC00144
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CQNe5OjXvATpd9XgpFMJezzMMR1UUBh/M+0gU8WHvbk=; b=NDEcSN8n09D0Wz
	rGJCj5PcbkJY77mbkV3r8VOvRhWzSNjOPCHEuDXruVQHWfqAbQ7Z9h+FPN7/ainxyW6+7fPK9p16s
	HTTD6FFgsFh2nqlpjdjF7vOYuB+wNJtygyC0z+KtIJv/TPo5Dp0ajQdh3meNs8X6dPDsI5yNOmz8B
	a4vmOxIPC6b/fgqi+9iSo3KmVJAkJqDsjAYEahZRLd2SGjJxXqLLH168CIMkdlG10W407Pt5UFBWw
	u80oe9U1W+fTCK1pv7OH8vgqrABGYXXaLg2TDslO8xyRomBFHeEQhMoslGtWryMrZP6nfTklzjk7d
	k2CRHKlFUuqeOB2dU8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM8t-003jXc-2T; Fri, 29 Jul 2022 09:18:47 +0000
Received: from vps.slashdirt.org ([144.91.108.218])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM7v-003ixJ-BY
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 09:17:50 +0000
Received: from supercopter.milliways.lan (unknown [IPv6:2a01:e0a:4ca:1080:42a8:f0ff:fe28:2844])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vps.slashdirt.org (Postfix) with ESMTPSA id 26CC560020;
	Fri, 29 Jul 2022 11:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 vps.slashdirt.org 26CC560020
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=slashdirt.org; s=mail;
	t=1659086257; bh=6LkMXTP7jkDykP1YakGzntZ8zk864lDuA628WTJ3UDI=;
	h=From:To:Cc:Subject:Date:From;
	b=vNU30evBYnUwt3UHSNVaS0X4e0kCrT3wXId4dXr0L39FlwvkpmbhbVxjRSwBy+M2O
	 XkVtkOlN6KyxYyxLauUviHozHLyZLPxdELAPcAaCFLlobq/SfGtaeBwsm/rsAzibz2
	 0S9rq2nL+L25hJqrRrAEoBWf+lEj4AMOuYY/HJDM=
From: =?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	git@johnthomson.fastmail.com.au,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
Subject: [PATCH v3 0/3] mtd: write support for minor-aligned partitions
Date: Fri, 29 Jul 2022 11:16:33 +0200
Message-Id: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_021747_945654_13D70976 
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

VGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlIHdyaXRlIHN1cHBvcnQgZm9yIG1pbm9yLWFsaWduZWQg
bXRkIHBhcnRpdGlvbnMKb24gZGV2aWNlcyB0aGF0IHN1cHBvcnQgbXVsdGlwbGUgZXJhc2VzaXpl
cy4KCk9uIHN1cHBvcnRpbmcgaGFyZHdhcmUsIHRoZXkgZW5hYmxlIFJXIG9wZXJhdGlvbnMgb24g
bXRkIHBhcnRpdGlvbnMgdGhhdApicmVhayAibWFqb3IiIChsYXJnZXN0KSBlcmFzZXNpemUgYm91
bmRhcnkgKGUuZy4gdG9vIHNtYWxsIG9yIG5vdApjb3JyZWN0bHkgYWxpZ25lZCkgd2l0aG91dCBz
YWNyaWZpY2luZyBwZXJmb3JtYW5jZSAoaS5lLiBmb3JjaW5nCmV2ZXJ5dGhpbmcgdG8gdXNlIDRL
IHNlY3RvcnMpLiBGaW5hbGx5LCB0aGV5IGFkZHJlc3MgYW4gaGlzdG9yaWNhbCBGSVhNRQppbiBt
dGRwYXJ0LmMuCgpUaGUgZm9sbG93aW5nIHBlcmZvcm1hbmNlIG51bWJlcnMgd2VyZSBtZWFzdXJl
ZCB3aXRoIHY1LjEwIGtlcm5lbCBvbiBPcGVuV3J0OgooQ09ORklHX01URF9TUElfTk9SX1VTRV9W
QVJJQUJMRV9FUkFTRT15IGZvcmNlcyB0aGUgdXNlIG9mIHRoZSBuZXcgY29kZSBwYXRoKQoKT3Bl
bldydCA1LjEwIHJhbWlwcyBNVDc2MjEgdzI1cTEyOGp2IDB4ZmMwMDAwIGZpcm13YXJlIHBhcnRp
dGlvbiBsZW5ndGgKdGltZSBtdGQgZXJhc2UgZmlybXdhcmUKCldpdGhvdXQgdGhpcyBwYXRjaDoK
TVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlM9bgl8eQpyZWFsICAgIDBtIDUwLjg2cwkJfDJtIDEx
LjY2cwp1c2VyICAgIDBtIDAuMDBzCQl8MG0gMC4wMHMKc3lzICAgICAwbSA1MC44MHMJCXwxbSA1
Ni4yMHMKY2FuIHdyaXRlIG1pbm9yLWFsaWduZWQgcGFydHM/IE58WQoKV2l0aCB0aGlzIHBhdGNo
OgpNVERfU1BJX05PUl9VU0VfVkFSSUFCTEVfRVJBU0U9bnx5CQl8NEtfU0VDVE9SUz15CnJlYWwg
ICAgMG0gNTEuNjhzCQl8MG0gNTAuODVzCXwybSAxMi44OXMKdXNlciAgICAwbSAwLjAwcwkJfDBt
IDAuMDBzCXwwbSAwLjAxcwpzeXMgICAgIDBtIDQ2Ljk0cwkJfDBtIDUwLjM4cwl8Mm0gMTIuNDZz
CmNhbiB3cml0ZSBtaW5vci1hbGlnbmVkIHBhcnRzPyBOfFkJCXxZCgoKTkI6IFRoaXMgcGF0Y2hz
ZXQgd2FzIHByZXZpb3VzbHkgc3VibWl0dGVkIGFzIGEgbW9ub2xpdGhpYyBwYXRjaCAoUkZDWzBd
LAp2MVsxXSkuIFdoaWxlIG5vdCBzdWJtaXR0ZWQgdXBzdHJlYW0gdjIgd2FzIGhvd2V2ZXIgcmV2
aWV3ZWQsIHRlc3RlZCBhbmQKYWNjZXB0ZWQgaW4gT3BlbldydCwgYW5kIGJhY2twb3J0ZWQgaW50
byB0aGUgdXBjb21pbmcgMjIuMDMgc3RhYmxlIGJyYW5jaDoKaHR0cHM6Ly9naXRodWIuY29tL29w
ZW53cnQvb3BlbndydC9wdWxsLzMyNzEKClswXSAyMDIxMDEwNDEyMjg1My4xODQyOC0xLWdpdEBq
b2hudGhvbXNvbi5mYXN0bWFpbC5jb20uYXUKWzFdIDIwMjEwNjA4MDQwNzE5LjE0NDMxLTEtZ2l0
QGpvaG50aG9tc29uLmZhc3RtYWlsLmNvbS5hdQoKQ2hhbmdlcyB2MiAtPiB2MzoKICAtIFNwbGl0
IHBhdGNoIGludG8gaW5jcmVtZW50YWwsIGZ1bmN0aW9uYWxseS1zZXBhcmF0ZSBjaGFuZ2VzLgog
IC0gQWRqdXN0ZWQgZXJhc2VzaXplX21pbm9yIGFzc2lnbm1lbnQgY2hlY2sgaW4gc3BpLW5vci9j
b3JlLmMKICAtIEFkZHJlc3NlZCBjaGVja3BhdGNoIHdhcm5pbmcgb24gInByaW50ayhLRVJOX1dB
Uk5JTkcuLi4iCiAgLSBEb2N1bWVudGVkIG5ldyBzeXNmcyBhdHRyaWJ1dGUKCkNoYW5nZXMgdjEg
LT4gdjI6CiAgLSBBZGRlZCBtdGRjb3JlIHN5c2ZzIGF0dHJpYnV0ZSBmb3IgZXJhc2VzaXplX21p
bm9yCiAgLSBSZW1vdmVkIGZpbmRpbmcgbWlub3IgZXJhc2VzaXplIGZvciB2YXJpYWJsZSBlcmFz
ZSByZWdpb25zIGRldmljZSwKICAgICh1bnRlc3RlZCBhbmQgbm8gcmVzcG9uc2UgdG8gUkZDKS4K
ICAtIE1vdmVkIElGX0VOQUJMRUQoKSB0byBndWFyZCBzZXR0aW5nIGVyYXNlc2l6ZV9taW5vciBp
biBzcGktbm9yL2NvcmUuYwogIC0gUmVtb3ZlZCBzZXR0aW5nIG1ham9yIGVyYXNlc2l6ZSB0byBt
aW5vciB3aGVyZSBwYXJ0aXRpb24gYm91bmRhcmllcwogICAgcmVxdWlyZSBtaW5vciBlcmFzZSB0
byBiZSB3cml0YWJsZQogIC0gU2ltcGxpZmllZCBtaW5vciBib3VuZGFyeSBjaGVjayBieSByZWx5
aW5nIG9uIG1pbm9yIGJlaW5nIGEgZmFjdG9yCiAgICBvZiBtYWpvcgoKQ2hhbmdlcyBSRkMgLT4g
djE6CiAgLSBGaXhlZCB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHNtYXRjaCB3YXJuaW5nCgpUaGli
YXV0IFZBUsOITkUgKDMpOgogIG10ZDogbXRkcGFydDogd3JpdGUgc3VwcG9ydCBmb3IgbWlub3It
YWxpZ25lZCBwYXJ0aXRpb25zCiAgbXRkOiBzcGktbm9yOiBzZXQgZXJhc2VzaXplX21pbm9yIGlu
IHNwaV9ub3Jfc2VsZWN0X2VyYXNlKCkKICBtdGQ6IHNwaS1ub3I6IGFsbG93IG92ZXJyaWRpbmcg
dW5pZm9ybSBlcmFzZQoKIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtY2xhc3MtbXRk
IHwgIDggKysrKysrCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAgICAgICAgICAgICAgICB8
IDEwICsrKysrKysKIGRyaXZlcnMvbXRkL210ZHBhcnQuYyAgICAgICAgICAgICAgICAgICAgIHwg
MzUgKysrKysrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvS2NvbmZpZyAg
ICAgICAgICAgICAgIHwgMTAgKysrKysrKwogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAg
ICAgICAgICAgICAgfCAxMyArKysrKysrLS0KIGluY2x1ZGUvbGludXgvbXRkL210ZC5oICAgICAg
ICAgICAgICAgICAgIHwgIDIgKysKIDYgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IGUwZGNjYzNiNzZmYjM1YmIyNTdiNDExODM2
N2E4ODMwNzNkNzM5MGUKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
