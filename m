Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A026C38A02
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/w7Xu2xdiLqxn68UTKNazpwUflKi082udcOb96WorK0=; b=BacZ2lKiU0S+hr
	ARuvtWmx2M+/qgPEurumaGxlIbY46LZw/2ATDkZPjJeXGm5hkHBlZCzXGxmBCPcVLmusZb4AhKaEb
	6HM2i1L9RdaJbcTaD3zyGyzbIWuj2gCvyFgBduxFVIfcp5z8aCybfZ74gyHnLLTT28sEPL45MCd5+
	ba4uKqFWgj1OOWIvSPtBXdwJlCzW2bCB5uKoDreehGCl14pU40Vw2Ijfu3uowwkjxldHNP93DNveo
	+epbVGzDt6lktmvhKKzIskDkUcbB+XSIceW1uTBopcx6jsU8X/CCGdUQ0dlpEPUdUze3pcFA7vie9
	W6XdR6ikYGnpj7g/kd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooWyx-002P2q-7v; Fri, 28 Oct 2022 21:33:39 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooWyu-002P2F-PG
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2022 21:33:38 +0000
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.93)
	(envelope-from <tharvey@gateworks.com>)
	id 1ooWyd-000G6E-2L; Fri, 28 Oct 2022 21:33:19 +0000
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
Subject: [PATCH RESEND stable 5.10] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
Date: Fri, 28 Oct 2022 14:33:15 -0700
Message-Id: <20221028213315.4171685-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_143336_840792_CC61991E 
X-CRM114-Status: GOOD (  13.57  )
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

RnJvbTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgoKMDY3ODFhNTAyNjM1
MCBGaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZX1RJTUVPVVQgcmVnaXN0
ZXIKdmFsdWUgZnJvbSBidXN5X3RpbWVvdXRfY3ljbGVzLiBidXN5X3RpbWVvdXRfY3ljbGVzIGlz
IGNhbGN1bGF0ZWQgd3JvbmcKdGhvdWdoOiBJdCBpcyBjYWxjdWxhdGVkIGJhc2VkIG9uIHRoZSBt
YXhpbXVtIHBhZ2UgcmVhZCB0aW1lLCBidXQgdGhlCnRpbWVvdXQgaXMgYWxzbyB1c2VkIGZvciBw
YWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBvcGVyYXRpb25zIHdoaWNoCnJlcXVpcmUgb3JkZXJz
IG9mIG1hZ25pdHVkZSBiaWdnZXIgdGltZW91dHMuCgpGaXggdGhpcyBieSBjYWxjdWxhdGluZyBi
dXN5X3RpbWVvdXRfY3ljbGVzIGZyb20gdGhlIG1heGltdW0gb2YKdEJFUlNfbWF4IGFuZCB0UFJP
R19tYXguCgpUaGlzIGlzIGZvciBub3cgdGhlIGVhc2llc3QgYW5kIG1vc3Qgb2J2aW91cyB3YXkg
dG8gZml4IHRoZSBkcml2ZXIuClRoZXJlJ3Mgcm9vbSBmb3IgaW1wcm92ZW1lbnRzIHRob3VnaDog
VGhlIE5BTkRfT1BfV0FJVFJEWV9JTlNUUiB0ZWxscyB1cwp0aGUgZGVzaXJlZCB0aW1lb3V0IGZv
ciB0aGUgY3VycmVudCBvcGVyYXRpb24sIHNvIHdlIGNvdWxkIHByb2dyYW0gdGhlCnRpbWVvdXQg
ZHluYW1pY2FsbHkgZm9yIGVhY2ggb3BlcmF0aW9uIGluc3RlYWQgb2Ygc2V0dGluZyBhIGZpeGVk
CnRpbWVvdXQuIEFsc28gd2UgY291bGQgd2lyZSB1cCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgdG8g
YWN0dWFsbHkgZGV0ZWN0CmFuZCBmb3J3YXJkIHRpbWVvdXRzIG9jY3VycmVkIHdoZW4gd2FpdGlu
ZyBmb3IgdGhlIGNoaXAgYmVpbmcgcmVhZHkuCgpBcyBhIHNpZGVub3RlIEkgdmVyaWZpZWQgdGhh
dCB0aGUgY2hhbmdlIGluIDA2NzgxYTUwMjYzNTAgaXMgcmVhbGx5CmNvcnJlY3QuIEkgd2lyZWQg
dXAgdGhlIGludGVycnVwdCBoYW5kbGVyIGluIG15IHRyZWUgYW5kIG1lYXN1cmVkIHRoZQp0aW1l
IGJldHdlZW4gc3RhcnRpbmcgdGhlIG9wZXJhdGlvbiBhbmQgdGhlIHRpbWVvdXQgaW50ZXJydXB0
IGhhbmRsZXIKY29taW5nIGluLiBUaGUgdGltZSBpbmNyZWFzZXMgNDF1cyB3aXRoIGVhY2ggc3Rl
cCBpbiB0aGUgdGltZW91dApyZWdpc3RlciB3aGljaCBjb3JyZXNwb25kcyB0byA0MDk2IGNsb2Nr
IGN5Y2xlcyB3aXRoIHRoZSA5OU1IeiBjbG9jawp0aGF0IEkgaGF2ZS4KCkZpeGVzOiAwNjc4MWE1
MDI2MzUwICgibXRkOiByYXduYW5kOiBncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0
dGluZyIpCkZpeGVzOiBiMTIwNjEyMjA2OWFhICgibXRkOiByYXduaWFuZDogZ3BtaTogdXNlIGNv
cmUgdGltaW5ncyBpbnN0ZWFkIG9mIGFuIGVtcGlyaWNhbCBkZXJpdmF0aW9uIikKQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBl
bmd1dHJvbml4LmRlPgpBY2tlZC1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KVGVzdGVkLWJ5
OiBUb21hc3ogTW/FhCA8dG9tYXN6Lm1vbkBjYW1saW5ncm91cC5jb20+ClNpZ25lZC1vZmYtYnk6
IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Ci0tLQpzdGFibGUtNS4xMAoKIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDYgKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwppbmRleCA5MmU4Y2E1NmY1NjYuLjIwMGQz
YWIzNDNiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWkt
bmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwpA
QCAtNjUzLDggKzY1Myw5IEBAIHN0YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVfdGltaW5ncyhz
dHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMsCiAJdW5zaWduZWQgaW50IHRSUF9wczsKIAlib29s
IHVzZV9oYWxmX3BlcmlvZDsKIAlpbnQgc2FtcGxlX2RlbGF5X3BzLCBzYW1wbGVfZGVsYXlfZmFj
dG9yOwotCXUxNiBidXN5X3RpbWVvdXRfY3ljbGVzOworCXVuc2lnbmVkIGludCBidXN5X3RpbWVv
dXRfY3ljbGVzOwogCXU4IHdybl9kbHlfc2VsOworCXU2NCBidXN5X3RpbWVvdXRfcHM7CiAKIAlp
ZiAoc2RyLT50UkNfbWluID49IDMwMDAwKSB7CiAJCS8qIE9ORkkgbm9uLUVETyBtb2RlcyBbMC0z
XSAqLwpAQCAtNjc4LDcgKzY3OSw4IEBAIHN0YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVfdGlt
aW5ncyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMsCiAJYWRkcl9zZXR1cF9jeWNsZXMgPSBU
T19DWUNMRVMoc2RyLT50QUxTX21pbiwgcGVyaW9kX3BzKTsKIAlkYXRhX3NldHVwX2N5Y2xlcyA9
IFRPX0NZQ0xFUyhzZHItPnREU19taW4sIHBlcmlvZF9wcyk7CiAJZGF0YV9ob2xkX2N5Y2xlcyA9
IFRPX0NZQ0xFUyhzZHItPnRESF9taW4sIHBlcmlvZF9wcyk7Ci0JYnVzeV90aW1lb3V0X2N5Y2xl
cyA9IFRPX0NZQ0xFUyhzZHItPnRXQl9tYXggKyBzZHItPnRSX21heCwgcGVyaW9kX3BzKTsKKwli
dXN5X3RpbWVvdXRfcHMgPSBtYXgoc2RyLT50QkVSU19tYXgsIHNkci0+dFBST0dfbWF4KTsKKwli
dXN5X3RpbWVvdXRfY3ljbGVzID0gVE9fQ1lDTEVTKGJ1c3lfdGltZW91dF9wcywgcGVyaW9kX3Bz
KTsKIAogCWh3LT50aW1pbmcwID0gQkZfR1BNSV9USU1JTkcwX0FERFJFU1NfU0VUVVAoYWRkcl9z
ZXR1cF9jeWNsZXMpIHwKIAkJICAgICAgQkZfR1BNSV9USU1JTkcwX0RBVEFfSE9MRChkYXRhX2hv
bGRfY3ljbGVzKSB8Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
