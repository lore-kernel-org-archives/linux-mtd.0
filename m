Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C9CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEfOMsWmInuqfMjah5mXPTuRZRpDhLi7g+sM8QzLr2Y=; b=XEgRdfLD6nE8mx
	ERHityL25tKzPMqusoYTxhoUZuLynSmk+k32dl9RVekFFO6LRhP+99dQchaGLGJeB/dTsOk+5+GPV
	YLxYKjfrhjZ1eTqBpHv4dPHW1Jd4fOUXjK62zoFEYOb0T7KsfVsHsRbXrPdkcWuCBJen2ecwRzssh
	4u883ek51azOh3jrQtqwOZLWLI+qSnqchrkTo5eihCCN92Bwg24okjrln25zvMTLO0DqBxsw+nug/
	sI0nNsSvhnfbds13hYcVcTiSDTIroR20ernQvNXI4UkZtvfJMz8g8b2rDKylOebpGNpvjSXTeYB5g
	ZpcQDUcr3b9hcctOxznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8H0S-0084nr-Vz; Fri, 14 Jan 2022 07:28:17 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8H0Q-0084nO-Fp
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 07:28:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8DE02240010;
 Fri, 14 Jan 2022 07:27:18 +0000 (UTC)
Date: Fri, 14 Jan 2022 08:27:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Manivannan Sadhasivam <mani@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mdalam@codeaurora.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Message-ID: <20220114082718.32a2fc83@xps13>
In-Reply-To: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_232814_718662_F4EBD91B 
X-CRM114-Status: GOOD (  17.21  )
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

SGkgS29ucmFkLAoKa29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZyB3cm90ZSBvbiBUaHUsIDEz
IEphbiAyMDIyIDE5OjQ0OjI2ICswMTAwOgoKPiBXaGlsZSBJIGhhdmUgYWJzb2x1dGVseSAwIGlk
ZWEgd2h5IGFuZCBob3csIHJ1bm5pbmcgY2xlYXJfYmFtX3RyYW5zYWN0aW9uCj4gd2hlbiBSRUFE
SUQgaXMgaXNzdWVkIG1ha2VzIHRoZSBETUEgdG90YWxseSBjbG9nIHVwIGFuZCByZWZ1c2UgdG8g
ZnVuY3Rpb24KPiBhdCBhbGwgb24gbWRtOTYwNy4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQg
YWxsIHRoZSBkYXRhIGdldHMgZ2FyYmxlZAo+IGFuZCBhZnRlciBhIHNob3J0IHdoaWxlIGluIHRo
ZSBuYW5kIHByb2JlIGZsb3csIHRoZSBDUFUgZGVjaWRlcyB0aGF0Cj4gc2VwdWt1IGlzIHRoZSBv
bmx5IG9wdGlvbi4KPiAKPiBSZW1vdmluZyBfUkVBRElEIGZyb20gdGhlIGlmIGNvbmRpdGlvbiBt
YWtlcyBpdCB3b3JrIGxpa2UgYSBjaGFybSwgSSBjYW4KPiByZWFkIGRhdGEgYW5kIG1vdW50IHBh
cnRpdGlvbnMgd2l0aG91dCBhIHByb2JsZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5
YmNpbyA8a29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZz4KPiAtLS0KPiBUaGlzIGlzIHRvdGFs
bHkganVzdCBhbiBvYnNlcnZhdGlvbiB3aGljaCB0b29rIG1lIGFuIGluaHVtYW5lIGFtb3VudCBv
Zgo+IGRlYnVnIHByaW50cyB0byBmaW5kLi4gcGVyaGFwcyB0aGVyZSdzIGEgYmV0dGVyIHJlYXNv
biBiZWhpbmQgdGhpcywgYnV0Cj4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55IGFuc3dlcnMuLiBU
aGVyZWZvcmUsIHRoaXMgaXMgYSBCSUcgUkZDIQoKSSdtIGFkZGluZyB0d28gcGVvcGxlIGZyb20g
Y29kZWF1cm9yYSB3aG8gd29ya2VkIGEgbG90IG9uIHRoaXMgZHJpdmVyLgpIb3BlZnVsbHkgdGhl
eSB3aWxsIGhhdmUgYW4gaWRlYSA6KQoKVGhhbmtzLE1pcXXDqGwKCj4gCj4gCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gaW5kZXggMDRlNmY3YjI2NzA2Li41MDYwMDZjY2RmMWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gQEAgLTE0NTksOCArMTQ1OSw3IEBAIHN0YXRpYyB2b2lkIHByZV9jb21t
YW5kKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IGNvbW1hbmQpCj4gIAo+ICAJY2xl
YXJfcmVhZF9yZWdzKG5hbmRjKTsKPiAgCj4gLQlpZiAoY29tbWFuZCA9PSBOQU5EX0NNRF9SRVNF
VCB8fCBjb21tYW5kID09IE5BTkRfQ01EX1JFQURJRCB8fAo+IC0JICAgIGNvbW1hbmQgPT0gTkFO
RF9DTURfUEFSQU0gfHwgY29tbWFuZCA9PSBOQU5EX0NNRF9FUkFTRTEpCj4gKwlpZiAoY29tbWFu
ZCA9PSBOQU5EX0NNRF9SRVNFVCB8fCBjb21tYW5kID09IE5BTkRfQ01EX1BBUkFNIHx8IGNvbW1h
bmQgPT0gTkFORF9DTURfRVJBU0UxKQo+ICAJCWNsZWFyX2JhbV90cmFuc2FjdGlvbihuYW5kYyk7
Cj4gIH0KPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
