Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41199C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4kYoUxAzTUNa9RcRlOZszda1oZq9KUekB75IhyxNJpI=; b=HUpY9+G+bZcA/E
	QxDGCg0LaJbANjt4q0oEfUkVVIYPYtrTd7JT+Tdl6O6wCNQdPKXaIb3ZjJa8e7I5X1RKlBZKLDQ4B
	xeA/5lq8otGZ6lYemslEq05S023S5OlTmDIN3DAoVpMFLwIE94HDQYaJDD1ZuJUY3f9TVotT1aVz4
	+U1jsHsUNIw85kRfS1GU23YCku07c8o75wEEorsU6UD4p9onl93fvr+Tx0eN22vW7j9SKXqbku2+o
	dT1XKMqJqcuv+MbsIfVGxrc252eIeOxzNqFtANvopFnIWa03rVfNhyBqg6hAuqzzvSv9KjzpuFfyv
	LQBaoNsr4WwYTixLSwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os60r-00GimK-4M; Mon, 07 Nov 2022 17:34:21 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os60j-00GijK-1K
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 17:34:17 +0000
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.93)
	(envelope-from <tharvey@gateworks.com>)
	id 1os60Q-000VeY-E6; Mon, 07 Nov 2022 17:33:54 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Tomasz=20Mo=C5=84?= <tomasz.mon@camlingroup.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sasha Levin <sashal@kernel.org>,
	Han Xu <han.xu@nxp.com>,
	kernel <kernel@pengutronix.de>,
	stable <stable@vger.kernel.org>
Cc: Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH stable 5.4] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
Date: Mon,  7 Nov 2022 09:33:51 -0800
Message-Id: <20221107173351.209558-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_093413_128770_C9415CC4 
X-CRM114-Status: GOOD (  13.85  )
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

RnJvbTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgoKY29tbWl0IDBmZGRm
OWFkMDZmZDlmNDM5ZjEzNzEzOTg2MTU1NjY3MTY3M2UzMWMgdXBzdHJlYW0uCgowNjc4MWE1MDI2
MzUwIEZpeGVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgREVWSUNFX0JVU1lfVElNRU9VVCByZWdp
c3Rlcgp2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lfdGltZW91dF9jeWNsZXMg
aXMgY2FsY3VsYXRlZCB3cm9uZwp0aG91Z2g6IEl0IGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gdGhl
IG1heGltdW0gcGFnZSByZWFkIHRpbWUsIGJ1dCB0aGUKdGltZW91dCBpcyBhbHNvIHVzZWQgZm9y
IHBhZ2Ugd3JpdGUgYW5kIGJsb2NrIGVyYXNlIG9wZXJhdGlvbnMgd2hpY2gKcmVxdWlyZSBvcmRl
cnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KCkZpeCB0aGlzIGJ5IGNhbGN1bGF0aW5n
IGJ1c3lfdGltZW91dF9jeWNsZXMgZnJvbSB0aGUgbWF4aW11bSBvZgp0QkVSU19tYXggYW5kIHRQ
Uk9HX21heC4KClRoaXMgaXMgZm9yIG5vdyB0aGUgZWFzaWVzdCBhbmQgbW9zdCBvYnZpb3VzIHdh
eSB0byBmaXggdGhlIGRyaXZlci4KVGhlcmUncyByb29tIGZvciBpbXByb3ZlbWVudHMgdGhvdWdo
OiBUaGUgTkFORF9PUF9XQUlUUkRZX0lOU1RSIHRlbGxzIHVzCnRoZSBkZXNpcmVkIHRpbWVvdXQg
Zm9yIHRoZSBjdXJyZW50IG9wZXJhdGlvbiwgc28gd2UgY291bGQgcHJvZ3JhbSB0aGUKdGltZW91
dCBkeW5hbWljYWxseSBmb3IgZWFjaCBvcGVyYXRpb24gaW5zdGVhZCBvZiBzZXR0aW5nIGEgZml4
ZWQKdGltZW91dC4gQWxzbyB3ZSBjb3VsZCB3aXJlIHVwIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0
byBhY3R1YWxseSBkZXRlY3QKYW5kIGZvcndhcmQgdGltZW91dHMgb2NjdXJyZWQgd2hlbiB3YWl0
aW5nIGZvciB0aGUgY2hpcCBiZWluZyByZWFkeS4KCkFzIGEgc2lkZW5vdGUgSSB2ZXJpZmllZCB0
aGF0IHRoZSBjaGFuZ2UgaW4gMDY3ODFhNTAyNjM1MCBpcyByZWFsbHkKY29ycmVjdC4gSSB3aXJl
ZCB1cCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgaW4gbXkgdHJlZSBhbmQgbWVhc3VyZWQgdGhlCnRp
bWUgYmV0d2VlbiBzdGFydGluZyB0aGUgb3BlcmF0aW9uIGFuZCB0aGUgdGltZW91dCBpbnRlcnJ1
cHQgaGFuZGxlcgpjb21pbmcgaW4uIFRoZSB0aW1lIGluY3JlYXNlcyA0MXVzIHdpdGggZWFjaCBz
dGVwIGluIHRoZSB0aW1lb3V0CnJlZ2lzdGVyIHdoaWNoIGNvcnJlc3BvbmRzIHRvIDQwOTYgY2xv
Y2sgY3ljbGVzIHdpdGggdGhlIDk5TUh6IGNsb2NrCnRoYXQgSSBoYXZlLgoKRml4ZXM6IDA2Nzgx
YTUwMjYzNTAgKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeCBzZXR0aW5nIGJ1c3kgdGltZW91dCBz
ZXR0aW5nIikKRml4ZXM6IGIxMjA2MTIyMDY5YWEgKCJtdGQ6IHJhd25pYW5kOiBncG1pOiB1c2Ug
Y29yZSB0aW1pbmdzIGluc3RlYWQgb2YgYW4gZW1waXJpY2FsIGRlcml2YXRpb24iKQpDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU+CkFja2VkLWJ5OiBIYW4gWHUgPGhhbi54dUBueHAuY29tPgpUZXN0ZWQt
Ynk6IFRvbWFzeiBNb8WEIDx0b21hc3oubW9uQGNhbWxpbmdyb3VwLmNvbT4KU2lnbmVkLW9mZi1i
eTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KU2lnbmVkLW9mZi1ieTogVGlt
IEhhcnZleSA8dGhhcnZleUBnYXRld29ya3MuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFu
ZC9ncG1pLW5hbmQuYwppbmRleCAwMjIxOGMzYjU0OGYuLmI4MDZhNzYyZDA3OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCisrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwpAQCAtNjUyLDggKzY1Miw5IEBA
IHN0YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVfdGltaW5ncyhzdHJ1Y3QgZ3BtaV9uYW5kX2Rh
dGEgKnRoaXMsCiAJdW5zaWduZWQgaW50IHRSUF9wczsKIAlib29sIHVzZV9oYWxmX3BlcmlvZDsK
IAlpbnQgc2FtcGxlX2RlbGF5X3BzLCBzYW1wbGVfZGVsYXlfZmFjdG9yOwotCXUxNiBidXN5X3Rp
bWVvdXRfY3ljbGVzOworCXVuc2lnbmVkIGludCBidXN5X3RpbWVvdXRfY3ljbGVzOwogCXU4IHdy
bl9kbHlfc2VsOworCXU2NCBidXN5X3RpbWVvdXRfcHM7CiAKIAlpZiAoc2RyLT50UkNfbWluID49
IDMwMDAwKSB7CiAJCS8qIE9ORkkgbm9uLUVETyBtb2RlcyBbMC0zXSAqLwpAQCAtNjc3LDcgKzY3
OCw4IEBAIHN0YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVfdGltaW5ncyhzdHJ1Y3QgZ3BtaV9u
YW5kX2RhdGEgKnRoaXMsCiAJYWRkcl9zZXR1cF9jeWNsZXMgPSBUT19DWUNMRVMoc2RyLT50QUxT
X21pbiwgcGVyaW9kX3BzKTsKIAlkYXRhX3NldHVwX2N5Y2xlcyA9IFRPX0NZQ0xFUyhzZHItPnRE
U19taW4sIHBlcmlvZF9wcyk7CiAJZGF0YV9ob2xkX2N5Y2xlcyA9IFRPX0NZQ0xFUyhzZHItPnRE
SF9taW4sIHBlcmlvZF9wcyk7Ci0JYnVzeV90aW1lb3V0X2N5Y2xlcyA9IFRPX0NZQ0xFUyhzZHIt
PnRXQl9tYXggKyBzZHItPnRSX21heCwgcGVyaW9kX3BzKTsKKwlidXN5X3RpbWVvdXRfcHMgPSBt
YXgoc2RyLT50QkVSU19tYXgsIHNkci0+dFBST0dfbWF4KTsKKwlidXN5X3RpbWVvdXRfY3ljbGVz
ID0gVE9fQ1lDTEVTKGJ1c3lfdGltZW91dF9wcywgcGVyaW9kX3BzKTsKIAogCWh3LT50aW1pbmcw
ID0gQkZfR1BNSV9USU1JTkcwX0FERFJFU1NfU0VUVVAoYWRkcl9zZXR1cF9jeWNsZXMpIHwKIAkJ
ICAgICAgQkZfR1BNSV9USU1JTkcwX0RBVEFfSE9MRChkYXRhX2hvbGRfY3ljbGVzKSB8Ci0tIAoy
LjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
