Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14996C47DD9
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Feb 2024 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O1JNK2+GUF+m3dSo1yprVSRlGftIItfElu/QVlCykVw=; b=kBat64yYpIT3C99zOFIHv1G2M8
	rgTxj0GmTu9pt3/AL+RGyHj0slO8JImi+4Mwje5bkPB7NpS44w7S/OdVNyYAg8ZYwL1MYQvOlQs9+
	ULYJIcuWxdXLo6g93DBL19jc9RvPUpTCROu/6JPsCguqC2S15U900RlRIKe4GUDLVNIft1H1GS38h
	tdh1BGlG40NHGVZ3rWPt6u97nvSP0czIgKfeSSVT+IGwE/lWjZu9vpgaXhNAcQwd/GO2mf4rwm8O9
	9G2kRxIInTYR5RPQvrcXjvSZjrjLKBwsAAlSUDu4j+l78p88hJG954yIhxjVg4A78X5vGQB0qSBs/
	ONNPrACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reMk1-0000000FpEV-2KEx;
	Sun, 25 Feb 2024 22:13:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reMjy-0000000FpE0-2fED
	for linux-mtd@lists.infradead.org;
	Sun, 25 Feb 2024 22:13:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7FFD36342D4C;
	Sun, 25 Feb 2024 23:12:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZLfvZ-sQLlLK; Sun, 25 Feb 2024 23:12:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A73D46340E18;
	Sun, 25 Feb 2024 23:12:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DkOwGdRYt7b1; Sun, 25 Feb 2024 23:12:54 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7DB686343B4B;
	Sun, 25 Feb 2024 23:12:54 +0100 (CET)
Date: Sun, 25 Feb 2024 23:12:54 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Daniel Golle <daniel@makrotopia.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at>
In-Reply-To: <20240219120156.383a1427@xps-13>
References: <cover.1702952891.git.daniel@makrotopia.org> <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org> <20240219120156.383a1427@xps-13>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: provide NVMEM layer over UBI volumes
Thread-Index: LhVCT6G++U013VIiCZmvxnpZEu2GqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_141258_843522_AE5C1363 
X-CRM114-Status: GOOD (  10.82  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAiRGFuaWVsIEdvbGxlIiA8ZGFuaWVsQG1h
a3JvdG9waWEub3JnPgo+IENDOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25lc2gg
UmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAiUm9iIEhlcnJpbmciIDxyb2JoK2R0QGtl
cm5lbC5vcmc+LCAiS3J6eXN6dG9mCj4gS296bG93c2tpIiA8a3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnPiwgIkNvbm9yIERvb2xleSIgPGNvbm9yK2R0QGtlcm5lbC5vcmc+LCAibGlu
dXgtbXRkIgo+IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJkZXZpY2V0cmVlIiA8
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPgo+IEdlc2VuZGV0OiBNb250YWcsIDE5LiBGZWJydWFyIDIwMjQg
MTI6MDE6NTYKPiBCZXRyZWZmOiBSZTogW1BBVENIIHY3IDcvN10gbXRkOiB1Ymk6IHByb3ZpZGUg
TlZNRU0gbGF5ZXIgb3ZlciBVQkkgdm9sdW1lcwoKPiBIaSBEYW5pZWwsCj4gCj4gZGFuaWVsQG1h
a3JvdG9waWEub3JnIHdyb3RlIG9uIFR1ZSwgMTkgRGVjIDIwMjMgMDI6MzM6NDggKzAwMDA6Cj4g
Cj4+IEluIGFuIGlkZWFsIHdvcmxkIHdlIHdvdWxkIGxpa2UgVUJJIHRvIGJlIHVzZWQgd2hlcmUg
ZXZlciBwb3NzaWJsZSBvbiBhCj4+IE5BTkQgY2hpcC4gQW5kIHdpdGggVUJJIHN1cHBvcnQgaW4g
QVJNIFRydXN0ZWQgRmlybXdhcmUgYW5kIFUtQm9vdCBpdAo+PiBpcyBwb3NzaWJsZSB0byBhY2hp
ZXZlIGFuIChhbG1vc3QtKWFsbC1VQkkgZmxhc2ggbGF5b3V0LiBIZW5jZSB0aGUgbmVlZAo+PiBm
b3IgYSB3YXkgdG8gYWxzbyB1c2UgVUJJIHZvbHVtZXMgdG8gc3RvcmUgYm9hcmQtbGV2ZWwgY29u
c3RhbnRzLCBzdWNoCj4+IGFzIE1BQyBhZGRyZXNzZXMgYW5kIGNhbGlicmF0aW9uIGRhdGEgb2Yg
d2lyZWxlc3MgaW50ZXJmYWNlcy4KPj4gCj4+IEFkZCBVQkkgdm9sdW1lIE5WTUVNIGRyaXZlciBt
b2R1bGUgZXhwb3NpbmcgVUJJIHZvbHVtZXMgYXMgTlZNRU0KPj4gcHJvdmlkZXJzLiBBbGxvdyBV
QkkgZGV2aWNlcyB0byBoYXZlIGEgInZvbHVtZXMiIGZpcm13YXJlIHN1Ym5vZGUgd2l0aAo+PiB2
b2x1bWVzIHdoaWNoIG1heSBiZSBjb21wYXRpYmxlIHdpdGggIm52bWVtLWNlbGxzIi4KPj4gQWNj
ZXNzIHRvIFVCSSB2b2x1bWVzIHZpYSB0aGUgTlZNRU0gaW50ZXJmYWNlIGF0IHRoaXMgcG9pbnQg
aXMKPj4gcmVhZC1vbmx5LCBhbmQgaXQgaXMgc2xvdywgb3BlbmluZyBhbmQgY2xvc2luZyB0aGUg
VUJJIHZvbHVtZSBmb3IgZWFjaAo+PiBhY2Nlc3MgZHVlIHRvIGxpbWl0YXRpb25zIG9mIHRoZSBO
Vk1FTSBwcm92aWRlciBBUEkuCj4gCj4gSSBkb24ndCBmZWVsIHF1YWxpZmllZCBlbm91Z2ggdG8g
cmV2aWV3IHRoZSBvdGhlciBwYXRjaGVzLCBob3dldmVyIHRoaXMKPiBvbmUgbG9va3MgZ29vZCB0
byBtZS4KCkZpbmFsbHkoISksIEkgaGFkIGVub3VnaCB0aW1lIHRvIGxvb2suClRoYW5rcyBmb3Ig
YWRkcmVzc2luZyBhbGwgbXkgY29tbWVudHMgZm9ybSB0aGUgcHJldmlvdXMgc2VyaWVzLgpQYXRj
aGVzIGFwcGxpZWQuCgpJIGhhdmUgb25seSBvbmUgdGlueSByZXF1ZXN0LCBjYW4geW91IHNoYXJl
IHRoZSBsb2NrZGVwIHNwYWx0CnlvdSBlbmNvdW50ZXJlZCBpbiB1Ymlfbm90aWZ5X2FkZCgpIHJl
Z2FyZGluZyBtdGRfdGFibGVfbXV0ZXgKYW5kIHViaV9kZXZpY2VzX211dGV4PyBUaGUgc29sdXRp
b25zIGxvb2tzIG9rYXkgdG8gbWUsIGJ1dAppZiB5b3UgaGF2ZSBtb3JlIGRldGFpbHMgdGhhdCB3
b3VsZCBiZSBncmVhdC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
