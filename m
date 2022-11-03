Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C93C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Nov 2022 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qssiH8sVO0eWrBD86D2P0/2pMzG5NGq52nk/Da5hvP8=; b=BCR+s7/keK8t17
	r2Ztv8xi3Iyyj+8sPdGOOyyMKGNSWnVcHSCqCJ5WKxxK6EexioxRjsi19Z7QnKAa161e/ojhEU8wh
	rXrckPaWcfMVCV4rF6kqfOFg/1VEnGpg8+3bM2A/Fhna9RZeROITRZjvA1mgKazaSy0UCIiQFC8+E
	ku9cAUXlErMOTLxFY/UuV/EaWHwiTMCEIS+VL50Twp48KQmHUAtqWrqu7+9N6NDmJZZEJ6hcPx/Om
	W22k9UnRohL42kyUROguafJGE36Le707A+8nB2LZAAjVgI/ocuKkDToZusP+oBWSjbB9JAFe0lFdo
	pDgCR5hF3KJdfhHOTAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcPy-000Ufp-SZ; Thu, 03 Nov 2022 15:46:11 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcEG-000PTJ-91
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2022 15:34:05 +0000
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.93)
	(envelope-from <tharvey@gateworks.com>)
	id 1oqcDw-000Nj3-8T; Thu, 03 Nov 2022 15:33:44 +0000
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
Subject: [PATCH v2 stable 5.10] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
Date: Thu,  3 Nov 2022 08:33:41 -0700
Message-Id: <20221103153341.2600899-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_083404_362380_D30BDE1F 
X-CRM114-Status: GOOD (  14.75  )
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
IEhhcnZleSA8dGhhcnZleUBnYXRld29ya3MuY29tPgotLS0KdjI6IGFkZCBzYiB0YWcgYW5kIGFk
ZCB1cHN0cmVhbSBjb21taXQgaWQKLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQv
Z3BtaS1uYW5kLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5h
bmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5k
LmMKaW5kZXggOTJlOGNhNTZmNTY2Li4yMDBkM2FiMzQzYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKQEAgLTY1Myw4ICs2NTMsOSBAQCBzdGF0aWMgdm9p
ZCBncG1pX25mY19jb21wdXRlX3RpbWluZ3Moc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzLAog
CXVuc2lnbmVkIGludCB0UlBfcHM7CiAJYm9vbCB1c2VfaGFsZl9wZXJpb2Q7CiAJaW50IHNhbXBs
ZV9kZWxheV9wcywgc2FtcGxlX2RlbGF5X2ZhY3RvcjsKLQl1MTYgYnVzeV90aW1lb3V0X2N5Y2xl
czsKKwl1bnNpZ25lZCBpbnQgYnVzeV90aW1lb3V0X2N5Y2xlczsKIAl1OCB3cm5fZGx5X3NlbDsK
Kwl1NjQgYnVzeV90aW1lb3V0X3BzOwogCiAJaWYgKHNkci0+dFJDX21pbiA+PSAzMDAwMCkgewog
CQkvKiBPTkZJIG5vbi1FRE8gbW9kZXMgWzAtM10gKi8KQEAgLTY3OCw3ICs2NzksOCBAQCBzdGF0
aWMgdm9pZCBncG1pX25mY19jb21wdXRlX3RpbWluZ3Moc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0
aGlzLAogCWFkZHJfc2V0dXBfY3ljbGVzID0gVE9fQ1lDTEVTKHNkci0+dEFMU19taW4sIHBlcmlv
ZF9wcyk7CiAJZGF0YV9zZXR1cF9jeWNsZXMgPSBUT19DWUNMRVMoc2RyLT50RFNfbWluLCBwZXJp
b2RfcHMpOwogCWRhdGFfaG9sZF9jeWNsZXMgPSBUT19DWUNMRVMoc2RyLT50REhfbWluLCBwZXJp
b2RfcHMpOwotCWJ1c3lfdGltZW91dF9jeWNsZXMgPSBUT19DWUNMRVMoc2RyLT50V0JfbWF4ICsg
c2RyLT50Ul9tYXgsIHBlcmlvZF9wcyk7CisJYnVzeV90aW1lb3V0X3BzID0gbWF4KHNkci0+dEJF
UlNfbWF4LCBzZHItPnRQUk9HX21heCk7CisJYnVzeV90aW1lb3V0X2N5Y2xlcyA9IFRPX0NZQ0xF
UyhidXN5X3RpbWVvdXRfcHMsIHBlcmlvZF9wcyk7CiAKIAlody0+dGltaW5nMCA9IEJGX0dQTUlf
VElNSU5HMF9BRERSRVNTX1NFVFVQKGFkZHJfc2V0dXBfY3ljbGVzKSB8CiAJCSAgICAgIEJGX0dQ
TUlfVElNSU5HMF9EQVRBX0hPTEQoZGF0YV9ob2xkX2N5Y2xlcykgfAotLSAKMi4yNS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
