Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76125C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kU7IAhPzmBuDLcRY5F6T/QbhDoQSF++DOpWdcxBomT8=; b=b4Zy/2Q54K0DI9U0zNN/u2PeGw
	JK0+JqvnRaD/H8qTKMvd4XokpNZpopDnniAJXM46dkbtkXOb+U7PrJs415M5jhsIGoSnpANU+2uGc
	5byD4pu2arkUHYBh+EUS9yJ88dgdK/VZQ/+tI48UBS4s/NNRoe+338DnWlf4uteQTsSBFzfkAXNCK
	ezkcEhWQSc1LPnos/1nzmVyuhtvB5yUVk55blKUQnD0FkYZ2qTKxyPK6r+lGAJQ/IgUKBgXQ3yveQ
	ODNFOLKueYDyL0kvdu4c/QGR6Jaa54Z6NkggqIH6vPGhZ2127+tPvzpGoRCohd1uku07h1Ex4Sj7L
	VthdEhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rgp-00Aia0-5s; Mon, 10 Jan 2022 10:14:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rgm-00AiY6-38
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 10:14:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A59D9614E2C4;
 Mon, 10 Jan 2022 11:14:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WaqFIDSVFe8L; Mon, 10 Jan 2022 11:14:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0F0F3614E2CB;
 Mon, 10 Jan 2022 11:14:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ow2vDdpUq3-d; Mon, 10 Jan 2022 11:14:03 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D1EFD614E2C4;
 Mon, 10 Jan 2022 11:14:03 +0100 (CET)
Date: Mon, 10 Jan 2022 11:14:03 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1422943582.246718.1641809643674.JavaMail.zimbra@nod.at>
In-Reply-To: <0477fadd-dfb5-c581-ee6a-ed6df9a966a3@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-6-chengzhihao1@huawei.com>
 <1985807262.244880.1641762859448.JavaMail.zimbra@nod.at>
 <0477fadd-dfb5-c581-ee6a-ed6df9a966a3@huawei.com>
Subject: Re: [PATCH v6 05/15] ubifs: Rename whiteout atomically
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Rename whiteout atomically
Thread-Index: Of79WMESjxJ46JfpBVi92+tw9bYfxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_021408_321262_6905C290 
X-CRM114-Status: UNSURE (   7.18  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+
IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJtY29xdWVsaW4gc3RtMzIiCj4gPG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+LCAia2lyaWxsIHNodXRlbW92IiA8a2lyaWxsLnNodXRl
bW92QGxpbnV4LmludGVsLmNvbT4sICJTYXNjaGEgSGF1ZXIiCj4gPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTW9u
dGFnLCAxMC4gSmFudWFyIDIwMjIgMTA6MzU6MDIKPiBCZXRyZWZmOiBSZTogW1BBVENIIHY2IDA1
LzE1XSB1YmlmczogUmVuYW1lIHdoaXRlb3V0IGF0b21pY2FsbHkKCj4gSGksIFJpY2hhcmQKPj4g
Cj4+IEhvdyBkbyB5b3UgbWFrZSBzdXJlIHRoZSB0aGUgd2hpdGVvdXQgaXMgbmV2ZXIgd3JpdHRl
biB0byBkaXNrIChieSB3cml0ZWJhY2spCj4+IGJlZm9yZSB1Ymlmc19qbmxfcmVuYW1lKCkgbGlu
a2VkCj4+IGl0PyBUaGF0J3MgdGhlIHJlYXNvbiB3aHkgb3RoZXIgZmlsZXN5c3RlbXMgdXNlIHRo
ZSB0bXBmaWxlIG1lY2hhbmlzbSBmb3IKPj4gd2hpdGVvdXRzIHRvby4KPj4gCj4gCj4gVGhlIHdo
aXRlb3V0IGlub2RlIGlzIGNsZWFuIGFmdGVyIGNyZWF0aW9uIGZyb20gY3JlYXRlX3doaXRlb3V0
KCksIGFuZAo+IGl0IGNhbid0IGJlIG1hcmtlZCBkaXJ0eSB1bnRpbCB1Ymlmc19qbmxfcmVuYW1l
KCkgZmluaXNoZWQuIFNvLCBJIHRoaW5rCj4gdGhlcmUgaXMgbm8gY2hhbmNlIGZvciB3aGl0ZW91
dCBiZWluZyB3cml0dGVuIG9uIGRpc2suIFRoZW4sCj4gJ3ViaWZzX2Fzc2VydChjLCAhd2hpdGVv
dXRfdWktPmRpcnR5KScgbmV2ZXIgZmFpbHMgaW4gdWJpZnNfam5sX3JlbmFtZSgpCj4gZHVyaW5n
IG15IGxvY2FsIHN0cmVzcyB0ZXN0cy4gWW91IG1heSBhZGQgc29tZSBkZWxheSBleGVjdXRpb25z
IGFmdGVyCj4gd2hpdGVvdXQgY3JlYXRpb24gdG8gbWFrZSBzdXJlIHRoYXQgd2hpdGVvdXQgd29u
J3QgYmUgd3JpdHRlbiBiYWNrCj4gYmVmb3JlIHViaWZzX2pubF9yZW5hbWUoKS4KCkZyb20gVUJJ
RlMgcG9pbnQgb2YgdmlldyBJIGZ1bGx5IGFncmVlIHdpdGggeW91LiBJJ20ganVzdCBhIGxpdHRs
ZSBwdXp6bGVkIHdoeQpvdGhlciBmaWxlc3lzdGVtcyB1c2UgdGhlIHRtcGZpbGUgYXBwcm9hY2gu
IE15IGZlYXIgaXMgdGhhdCBWRlMgY2FuIGRvIHRoaW5ncwp0byB0aGUgaW5vZGUgd2UgZG9uJ3Qg
aGF2ZSBpbiBtaW5kIHJpZ2h0IG5vdy4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
