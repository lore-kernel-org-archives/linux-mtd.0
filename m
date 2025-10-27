Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52E0CCF9E5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lmtK5w3BQ1NtiGlbrf/P3zE1yK2s9u97+6BSbtTaIs=; b=DCyrh1HUTdfxto
	7Xdl59LCWrBViID7Aw3YWidAInAfGmBiC8D3jkDnYMHcQIs3zLTMyqrgZ9+Y70HAQv6vHO9V+RAKG
	1ms0hE67HsG5IryPMlMXyfcCmyuR1Dbj+K9mrg82g6y4nrmbfZ8wL01va1TMa/dQ6LlYfFL3A3VsP
	gUKgW6tvnEUifGvxYoV1mfxAOS7jlDHI5rqnW/z+mcokln0vE3iLw900Sv/sqz+lONjfmdUWyoCs7
	LIJD9cC8CLhcuDAJe+cTSBJ115e6fHnMuslmLItDP0ddbHdXaz8UKTp24WQCKCg6jT5QVZwals4zP
	3CB+7+aw2mp1uOR+OA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVbc-0000000ErAL-1EmF;
	Mon, 27 Oct 2025 22:22:24 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVbY-0000000Er9Z-0F47
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 22:22:21 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cwSft3ykxz9snh;
	Mon, 27 Oct 2025 23:22:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761603734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/3pK6zujFDonsVj2GoPo8C7dKrLczRml5Rg3Cpg2kA=;
	b=twIrxGf5oAkz3VN2NbRBjR8Aifdehe6jVQaT6D0gc1Enkqi4s0H7CtYlTwmCuOrruc/gCS
	41yY7qfOypm+mgNu2FeYHfAeovMWn2rT4a0MG/MfsZP0Ou4xn97LNCJXTGUUTuy0YR87Z0
	ZavyRORIdMDPV/0GqSTY5ghET2OyPD6/hj6CluL73BFP6lG7OLWbaKHe6uS07KsoOZeuf8
	NCVnT906Zu5BJFR66Sd+1r9hIqirdu+5ndd1YUltTWuRRfIWjkSUwP9lC9nzdEecvjMGHk
	BhtG6Cv6Wxv+OHRIcyYHMxr29M3UfCEx+WKKk30FRa/B14zMbgkfxFXCMdDj5A==
Message-ID: <b4af0559-fde5-4321-a42d-8ec82377b61e@mailbox.org>
Date: Mon, 27 Oct 2025 23:22:11 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
 <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
X-MBO-RS-META: suwfgezzturkzkgm4o4bqr68wgcwcsgy
X-MBO-RS-ID: 85a3a3e40a0411e25df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_152220_237934_B7E4D4C0 
X-CRM114-Status: GOOD (  18.56  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAvMjAvMjUgMTozNSBQTSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKCkhlbGxvIFR1ZG9yLAoK
SSBhcG9sb2dpemUgZm9yIG15IHNsb3cgcmVzcG9uc2UuCgo+Pj4+PiBUaGUgIkluZGV4IFZhbHVl
IiBzaGFsbCBiZSB0aGUgbWFwX2lkIHRoYXQgeW91IHBhc3NlZCBpbiB0aGUgY29kZToKPj4+Pj4g
c3BpX25vcl9wb3N0X3NtcHRfZml4dXBzKG5vciwgJm1hcF9pZCk7Cj4+Pj4+Cj4+Pj4+IENhbiB5
b3UgcGxlYXNlIHByaW50IHRoZSBtYXBfaWQgdmFsdWUgdGhhdCB5b3Ugb2J0YWluIHdpdGhvdXQg
dXBkYXRpbmcgaXQ/Cj4+Pj4KPj4+PiAweDQKPj4+Cj4+PiBUaGlzIHRyYW5zbGF0ZXMgdG8gQ1Iz
TlZbM10gPSAxLCBDUjFOVlsyXSA9IDAswqAgQ1IzTlZbMV0gPSAwLgo+Pj4+Cj4+Pj4+IExldCdz
IGFsc28gcHJpbnQgdGhlIHZhbHVlcyBvZiBDUjNOViBhbmQgQ1IxTlYuCj4+Pj4KPj4+PiBCb3Ro
IDB4MCBhbmQgMHgwIC4KPj4+Cj4+PiBCdXQgaGVyZSBDUjNOViBpcyAwLCBpdCBjb250cmFkaWN0
cyB0aGUgcmVzdWx0IGZyb20gYWJvdmUuCj4+Cj4+IE1heWJlIEkgbWVzc2VkIHVwIGFuZCB3YXMg
cmVhZGluZyBpdCB0aGUgd3Jvbmcgd2F5ID8KCkkgcmVhbGx5IHdvbmRlciBpZiBJIG1pZ2h0IGJl
IHJlYWRpbmcgdGhlIENSM05WIHRoZSB3cm9uZyB3YXkgPwoKPj4+IE1heWJlIGl0J3MgdGhlIHNh
bWUgcHJvYmxlbSB0aGF0IFRha2FoaXJvIGlkZW50aWZpZWQ6IHRoZSBmbGFzaCBuZWVkcwo+Pj4g
OCBkdW1teSBjeWNsZXMsIGJ1dCB0aGUgY29kZSB1c2VzIHplcm8gZHVtbXkgY3ljbGVzLCByZXN1
bHRpbmcgaW4KPj4+IHJlYWRpbmcgZ2FyYmFnZSBkYXRhLCBkZXBlbmRpbmcgb24gd2hldGhlciB5
b3VyIElPIGxpbmVzIGFyZSBwdWxsZWQgdXAvZG93bgo+Pj4gb3IgZmxvYXRpbmcuCj4+Pgo+Pj4g
Q2FuIHlvdSByZWRvIHRoZSB0ZXN0IHdpdGggdGhlIGZvbGxvd2luZyBwbGVhc2U/Cj4+Cj4+IFN1
cmUsIGFsdGhvdWdoIEkgc2F3IHNvbWUgZnVydGhlciBkaXNjdXNzaW9uIGJldHdlZW4geW91IGFu
ZCBLdXdhbm8tc2FuICwgaXMgdGhpcyBzdGlsbCBhcHBsaWNhYmxlID8KPiAKPiBJdCdzIHN0aWxs
IGFwcGxpY2FibGUsIGl0IHdpbGwgY29uZmlybSB3aGF0IEt1d2Fuby1zYW4gZGlzY292ZXJlZDoK
PiB0aGUgZmxhc2ggbmVlZHMgOCBkdW1teSBjeWNsZXMgZm9yIHVzaW5nIHRoYXQgcmVhZCByZWcg
Y29tbWFuZC4KPiAKPiBXZSdsbCBhbHNvIG5lZWQgYSBob29rIHRvIGFtZW5kIHRoZSBDUjNOVlsx
XSB2YWx1ZSAod2hpY2ggaXMgcmVzZXJ2ZWQsCj4gemVybyBvbiBzb21lIGZsYXZvcnMgb2YgZmxh
c2gpIGFuZCByZXBsYWNlIGl0IHdpdGggMSwgc2ltaWxhciB0byB3aGF0Cj4geW91IGRpZCBpbiB0
aGlzIHBhdGNoLgo+IAo+IFlvdSBjYW4gZWl0aGVyIHRlc3Qgb3IgbGV0IEt1d2Fuby1zYW4gY29t
ZSB1cCB3aXRoIGEgcGF0Y2ggYWRkcmVzc2luZwo+IGJvdGggaXNzdWVzIGFuZCB0ZXN0IGhpcyBw
YXRjaCBhZnRlcndhcmRzLCBzeW5jIHVwIHdpdGggaGltIHBsZWFzZS4KPiAKPj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c2ZkcC5jCj4+PiBpbmRleCAyMTcyN2Y5YTRhYzYuLjg1NDQzYzkwM2U1OSAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL3NmZHAuYwo+Pj4gQEAgLTc1Miw3ICs3NTIsNyBAQCBzdGF0aWMgY29uc3QgdTMyICpzcGlf
bm9yX2dldF9tYXBfaW5fdXNlKHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IHUzMiAqc21wdCwK
Pj4+ICDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFkX2RhdGFfbWFzayA9
IFNNUFRfQ01EX1JFQURfREFUQShzbXB0W2ldKTsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBub3ItPmFkZHJfbmJ5dGVzID0gc3BpX25vcl9zbXB0X2FkZHJfbmJ5dGVzKG5v
ciwgc21wdFtpXSk7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPnJlYWRf
ZHVtbXkgPSBzcGlfbm9yX3NtcHRfcmVhZF9kdW1teShub3IsIHNtcHRbaV0pOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5yZWFkX2R1bW15ID0gODsKPj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPnJlYWRfb3Bjb2RlID0gU01QVF9DTURfT1BD
T0RFKHNtcHRbaV0pOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIg
PSBzbXB0W2kgKyAxXTsKPj4+ICDCoCBAQCAtNzY3LDYgKzc2Nyw4IEBAIHN0YXRpYyBjb25zdCB1
MzIgKnNwaV9ub3JfZ2V0X21hcF9pbl91c2Uoc3RydWN0IHNwaV9ub3IgKm5vciwgY29uc3QgdTMy
ICpzbXB0LAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBDb25maWd1
cmF0aW9uIHRoYXQgaXMgY3VycmVudGx5IGluIHVzZS4KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICovCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bWFwX2lkID0gbWFwX2lkIDw8IDEgfCAhISgqYnVmICYgcmVhZF9kYXRhX21hc2spOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihub3ItPmRldiwgImkgPSAlZCwgYnVm
ID0gJTAyeCwgbWFwX2lkID0gJTAyeFxuIiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpLCBidWZbMF0sIG1hcF9pZCk7Cj4+PiAgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KPiB5ZWFoLCBubyB3b3JyaWVzLCBp
dCdzIHN0aWxsIGZyZXNoLgoKV2l0aCBjdXJyZW50IG1haW5saW5lLCB3aXRob3V0IHRoZSBhZm9y
ZW1lbnRpb25lZCBwYXRjaCwgd2l0aCBteSAKQ1IxTlYvQ1IzTlYgcHJpbnRpbmcgKG1heWJlIGJy
b2tlbik6CgpDUjFOVj0wMApDUjNOVj0wMAptYXBfaWQ9MDAwMDAwMDQKCldpdGggdGhlIHJlYWRf
ZHVtbXk9OCBhZGRpdGlvbiBhYm92ZSBhbmQgdGhlIGRldl9lcnIsIEkgZ2V0OgoKc3BpLW5vciBz
cGkwLjA6IGkgPSAwLCBidWYgPSAwMCwgbWFwX2lkID0gMDAKc3BpLW5vciBzcGkwLjA6IGkgPSAy
LCBidWYgPSAwMiwgbWFwX2lkID0gMDAKc3BpLW5vciBzcGkwLjA6IGkgPSA0LCBidWYgPSAwMCwg
bWFwX2lkID0gMDAKbWFwX2lkPTAwMDAwMDAwCgpUaGUgcmVwb3J0ZWQgZmFpbHVyZSBwZXJzaXN0
czoKCnNwaS1ub3Igc3BpMC4wOiBGYWlsZWQgdG8gcGFyc2Ugb3B0aW9uYWwgcGFyYW1ldGVyIHRh
YmxlOiBmZjgxCgpMZXQgbWUgdGVzdCB0aGUgcGF0Y2hzZXQgZnJvbSBLdXdhbm8tc2FuIG5leHQg
LgoKVGhhbmsgeW91IGZvciB5b3VyIGhlbHAhCgotLSAKQmVzdCByZWdhcmRzLApNYXJlayBWYXN1
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
