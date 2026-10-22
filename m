Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0E606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BqKRjc5/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vjf2fb0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=im7rw5lOnWf19FYOvASNtXN5UDFyxsgzgnapQ8anigY=; b=BqKRjc5/90TO1vHlwMD/TFiSRD
	DbMBWpchfr7zNzfLnfOS5wU+Z78GeS3xSmUAtR02lnUgqklFrc65EgPkxyegd5TsnN61EP3d2sDvs
	RKehEb/Kr8pU9JwxHYJwezql7GpoLu18Ntowrz2lEiW+M93yiNt+Vc2D0YdHjUEGAcwW4SpsAEXa9
	6FKEev6Hwm6+pONJYGtqr5gazX0OQ5yETZlxS/ggk4pT2HvoMEN7YqjtEc1Ag5fGXggo4SrPL/Xsu
	AcbWHWXgaj5PLSPiQTWVsuoY34QHy90+oUCy/eGEa8rNaBqWR9lvto/j8ti90Wfhog4KxMeLd+bHD
	NflUmADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpT8-0000000Dsjs-15jr;
	Thu, 22 Oct 2026 09:52:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpT3-0000000DsjT-2ZmK
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 09:52:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F124F1A12C9;
	Thu, 22 Oct 2026 09:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD0E460360;
	Thu, 22 Oct 2026 09:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CD6210328E44;
	Thu, 22 Oct 2026 11:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792662726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F/chYiasiSXcn83g5A2gWdD74tn+mRgtMiCgnkCqNTg=;
	b=Vjf2fb0zvrDj5uRNZZFDtFblI9dLdnBb40EzR5mWLG/MCNPR6BmUTqmn4GrMPr07GjeTA7
	V1fB31mFXvXtTiQI9LWq9KpDu0YU9FUSxZO2Giu/ccm0obQRsR2vJVr5uu7PEF1NE6Kx1m
	cPGdSwVjhQTgKoIRUR9kTbdx+qteyFmz21VI/VmUK+/ct5/MpetPF877piSWq0YAU2fPaO
	eX9qo4dMqOg1wmpvqFozKp+1kcqAewdW6A/ika83i/Qg+W2EgptAa2KfCuR1FyDTf525+x
	ZW+X7aGUmgt33mNaOW8T1QA7MP2dWwQyx2thwQMv2aABzYtcOCrHgVtaYfY52w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "imx@lists.linux.dev" <imx@lists.linux.dev>,  "michael@walle.cc"
 <michael@walle.cc>,  Bough Chen <haibo.chen@nxp.com>,
  "Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
In-Reply-To: <AS8PR04MB8820F1AAF591DCF5C9D0136090652@AS8PR04MB8820.eurprd04.prod.outlook.com>
	(Bough Chen's message of "Thu, 22 Oct 2026 08:56:03 +0000")
References: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
	<sashiko-outbox-181158@kernel.org>
	<AS8PR04MB8820F1AAF591DCF5C9D0136090652@AS8PR04MB8820.eurprd04.prod.outlook.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 11:52:01 +0200
Message-ID: <87y0bqqczi.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_025213_962655_25DAC30B 
X-CRM114-Status: GOOD (  25.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgpPbiAyMi8xMC8yMDI2IGF0IDA4OjU2OjAzIEdNVCwgIkJvdWdoIENoZW4gKE9TUyki
IDxoYWliby5jaGVuQG9zcy5ueHAuY29tPiB3cm90ZToKCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4+IEZyb206IHNhc2hpa28tYm90QGtlcm5lbC5vcmcgPHNhc2hpa28tYm90QGtlcm5l
bC5vcmc+Cj4+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDIyLCAyMDI2IDQ6MjEgUE0KPj4gVG86
IEJvdWdoIENoZW4gKE9TUykgPGhhaWJvLmNoZW5Ab3NzLm54cC5jb20+OyBQcmF0eXVzaCBZYWRh
dgo+PiA8cHJhdHl1c2hAa2VybmVsLm9yZz47IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwu
b3JnPjsgVGFrYWhpcm8KPj4gS3V3YW5vIDx0YWthaGlyby5rdXdhbm9AaW5maW5lb24uY29tPjsg
TWlxdWVsIFJheW5hbAo+PiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47IFJpY2hhcmQgV2Vp
bmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Owo+PiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNo
ckB0aS5jb20+Cj4+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgaW14QGxpc3Rz
LmxpbnV4LmRldjsgbWljaGFlbEB3YWxsZS5jYzsKPj4gQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBu
eHAuY29tPjsgRnJhbmsuTGlAa2VybmVsLm9yZwo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBt
dGQ6IHNwaS1ub3I6IGNsZWFyIHRoZSBkZWZhdWx0IHJlYWRfc3IyIG9wY29kZSBmb3IKPj4geFNQ
SSBQcm9maWxlIDEuMCBmbGFzaGVzCj4+IAo+PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0
aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKQo+PiB0byBj
b25zaWRlcjoKPj4gLSBbTWVkaXVtXSBtdGQ6IHNwaS1ub3I6IHJlYWRfc3IyIGxlZnQgc2V0IGZv
ciA4RC04RC04RCBmbGFzaGVzIHdpdGhvdXQKPj4gUHJvZmlsZSAxLjAKPj4gLS0KPj4gCj4+IGNv
bW1pdCBlZjQwNzllM2FlYTIwMTQ4OTBlMDhkZjMxZWE0ZDg3NzVhMzkyZjgxCj4+IEF1dGhvcjog
SGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPgo+PiAKPj4gbXRkOiBzcGktbm9yOiBjbGVh
ciB0aGUgZGVmYXVsdCByZWFkX3NyMiBvcGNvZGUgZm9yIHhTUEkgUHJvZmlsZSAxLjAgZmxhc2hl
cwo+PiAKPj4gVGhpcyBjb21taXQgY2xlYXJzIHBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMiBpbiBz
cGlfbm9yX3BhcnNlX3Byb2ZpbGUxKCkgc28KPj4gdGhhdCBmbGFzaGVzIHdpdGggYW4geHNwaSBw
cm9maWxlIDEuMCB0YWJsZSBkbyBub3QgaXNzdWUgYW4gdW5zdXBwb3J0ZWQKPj4gMHgzNSByZWdp
c3RlciByZWFkIHdoZW4gcnVubmluZyBpbiBvY3RhbCBkdHIgbW9kZS4KPj4gCj4+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
ZmRwLmMKPj4gPiBpbmRleCA0YTNmODJlOTdjZWY4Li43MjJlZWZmNzFkMGRmIDEwMDY0NAo+PiA+
IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+ID4gKysrIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9zZmRwLmMKPj4gPiBAQCAtMTM0NCw2ICsxMzQ0LDE3IEBAIHN0YXRpYyBpbnQgc3Bp
X25vcl9wYXJzZV9wcm9maWxlMShzdHJ1Y3Qgc3BpX25vcgo+PiAqbm9yLAo+PiA+ICAJICovCj4+
ID4gIAlub3ItPnBhcmFtcy0+aHdjYXBzLm1hc2sgfD0gU05PUl9IV0NBUFNfUFBfOF84XzhfRFRS
Owo+PiA+Cj4+ID4gKwkvKgo+PiA+ICsJICogVGhlIHhTUEkgUHJvZmlsZSAxLjAgdGFibGUgZG9l
cyBub3QgZGVzY3JpYmUgYSBSZWFkIENvbmZpZ3VyYXRpb24KPj4gPiArCSAqIFJlZ2lzdGVyIChS
RENSLCAzNWgpIGluc3RydWN0aW9uLCBhbmQgdGhlIHNpbmdsZS1ieXRlIFJEQ1IgZGVmYXVsdAo+
PiA+ICsJICogaXMgbm90IHVzYWJsZSBpbiA4RC04RC04RCBtb2RlLiBEcm9wIHRoZSBTUjIgcmVh
ZCBvcGNvZGUgZm9yCj4+IHRoZXNlCj4+ID4gKwkgKiBvY3RhbC1jYXBhYmxlIGZsYXNoZXMgc28g
c3BpX25vcl9yZWFkX3NyMV9hbmRfc3IyKCkgZGVncmFkZXMgdG8KPj4gYW4KPj4gPiArCSAqIFNS
MS1vbmx5IHJlYWQgYW5kIHNwaV9ub3JfaW5pdCgpIGRvZXMgbm90IGlzc3VlIGFuIHVuc3VwcG9y
dGVkCj4+ID4gKwkgKiBjb21tYW5kIHRoYXQgdGhlIGZsYXNoIG5ldmVyIGFuc3dlcnMuIEEgbWFu
dWZhY3R1cmVyIGRyaXZlciB0aGF0Cj4+ID4gKwkgKiBhY3R1YWxseSBuZWVkcyBTUjIgY2FuIGlu
c3RhbGwgaXRzIG93biBvcGNvZGUgaW4gYSBsYXRlciBmaXh1cC4KPj4gPiArCSAqLwo+PiA+ICsJ
bm9yLT5wYXJhbXMtPm9wY29kZXMucmVhZF9zcjIgPSAwOwo+PiAKPj4gW1NldmVyaXR5OiBNZWRp
dW1dCj4+IFdoYXQgaGFwcGVucyBvbiBvY3RhbCBkdHIgZmxhc2hlcyB0aGF0IGRvIG5vdCBwdWJs
aXNoIGFuIHhzcGkgcHJvZmlsZSAxLjAKPj4gdGFibGUsIHNvIHNwaV9ub3JfcGFyc2VfcHJvZmls
ZTEoKSBpcyBuZXZlciBjYWxsZWQ/Cj4+IAo+PiBTcGVjaWZpY2FsbHksIHNvbWUgYmF0Y2hlcyBv
ZiB0aGUgTWljcm9uIG10MzV4dTUxMmFiYSBsYWNrIHRoZSBwcm9maWxlIDEuMAo+PiB0YWJsZSBh
bmQgaW5zdGVhZCBjb25maWd1cmUgU05PUl9QUk9UT184XzhfOF9EVFIgaW4KPj4gZHJpdmVycy9t
dGQvc3BpLW5vci9taWNyb24tc3QuYzptdDM1eHU1MTJhYmFfcG9zdF9zZmRwX2ZpeHVwKCk6Cj4+
IAo+PiAJbm9yLT5wYXJhbXMtPmh3Y2Fwcy5tYXNrIHw9IFNOT1JfSFdDQVBTX1JFQURfOF84Xzhf
RFRSOwo+PiAJc3BpX25vcl9zZXRfcmVhZF9zZXR0aW5ncygmbm9yLT5wYXJhbXMtCj4+ID5yZWFk
c1tTTk9SX0NNRF9SRUFEXzhfOF84X0RUUl0sCj4+IAkJCQkgIDAsIDIwLCBTUElOT1JfT1BfTVRf
RFRSX1JELAo+PiAJCQkJICBTTk9SX1BST1RPXzhfOF84X0RUUik7Cj4+IAkuLi4KPj4gCW5vci0+
cGFyYW1zLT5od2NhcHMubWFzayB8PSBTTk9SX0hXQ0FQU19QUF84XzhfOF9EVFI7Cj4+IAlzcGlf
bm9yX3NldF9wcF9zZXR0aW5ncygmbm9yLT5wYXJhbXMtCj4+ID5wYWdlX3Byb2dyYW1zW1NOT1Jf
Q01EX1BQXzhfOF84X0RUUl0sCj4+IAkJCQlTUElOT1JfT1BfUFBfNEIsCj4+IFNOT1JfUFJPVE9f
OF84XzhfRFRSKTsKPj4gCj4+IEluIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jOnNwaV9ub3Jf
cGFyc2VfYmZwdCgpLCBwYXJhbXMtCj4+ID5vcGNvZGVzLnJlYWRfc3IyIGlzIGluaXRpYWxpemVk
IHRvIFNQSU5PUl9PUF9SRENSICgweDM1KSBhbmQgcmVtYWlucyBzZXQKPj4gd2hlbiB0aGUgcXVh
ZCBlbmFibGUgcmVxdWlyZW1lbnRzIGZpZWxkIGNvbnRhaW5zIGEgcmVzZXJ2ZWQgdmFsdWUgKHdo
aWNoCj4+IG10MzV4dTUxMmFiYV9wb3N0X3NmZHBfZml4dXAoKSBub3RlcyBpcyB0aGUgY2FzZSBv
biB0aGlzIHBhcnQpIG9yCj4+IEJGUFRfRFdPUkQxNV9RRVJfTk9ORToKPj4gCj4+IAlwYXJhbXMt
Pm9wY29kZXMucmVhZF9zcjEgPSBTUElOT1JfT1BfUkRTUjsKPj4gCXBhcmFtcy0+b3Bjb2Rlcy5y
ZWFkX3NyMiA9IFNQSU5PUl9PUF9SRENSOwo+PiAJLi4uCj4+IAlkZWZhdWx0Ogo+PiAJCWRldl9k
Ymcobm9yLT5kZXYsICJCRlBUIFFFUiByZXNlcnZlZCB2YWx1ZSB1c2VkXG4iKTsKPj4gCQlicmVh
azsKPj4gCj4+IFNpbWlsYXJseSwgbm9uLXNmZHAgZmxhc2hlcyBpbml0aWFsaXplZCB3aXRoIFNQ
SV9OT1JfT0NUQUxfRFRSX1JFQUQgaW4KPj4gZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM6c3Bp
X25vcl9ub19zZmRwX2luaXRfcGFyYW1zKCkgZW5hYmxlCj4+IFNOT1JfSFdDQVBTX1JFQURfOF84
XzhfRFRSIHdoaWxlIGxlYXZpbmcgcGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyCj4+IHNldCB0byBT
UElOT1JfT1BfUkRDUiBmcm9tIHNwaV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcygpLgo+PiAKPj4g
V2hlbiBzcGlfbm9yX2luaXQoKSBzd2l0Y2hlcyB0aGVzZSBmbGFzaGVzIHRvIFNOT1JfUFJPVE9f
OF84XzhfRFRSIHZpYQo+PiBzcGlfbm9yX3NldF9vY3RhbF9kdHIoKSBhbmQgdGhlbiBydW5zOgo+
PiAKPj4gICBzcGlfbm9yX2luaXQoKQo+PiAgICAgLT4gc3BpX25vcl9jYWNoZV9zcl9sb2NrX2Jp
dHMoKQo+PiAgICAgICAtPiBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjJfY2FyZWZ1bCgpCj4+ICAg
ICAgICAgLT4gc3BpX25vcl9yZWFkX3NyMl9jYXJlZnVsKCkKPj4gICAgICAgICAgIC0+IHNwaV9u
b3JfcmVhZF9zcl9sbCgpCj4+IAo+PiB3b3VsZG4ndCB0aGlzIHN0aWxsIGlzc3VlIHRoZSB1bnN1
cHBvcnRlZCAweDM1MzUgcmVnaXN0ZXIgcmVhZCBpbgo+PiBTTk9SX1BST1RPXzhfOF84X0RUUiBt
b2RlIGFuZCBmYWlsIHByb2JlIG9yIHJlc3VtZSB3aXRoIGEgY29udHJvbGxlcgo+PiB0aW1lb3V0
Pwo+Cj4gSGkgTWlxdWVsLAo+Cj4gVGhlIFNhc2hpa28gQUkgcmV2aWV3IHJhaXNlZCBhIHZhbGlk
IHBvaW50IG9uIHYzLgoKSXMgaXQgYSB2YWxpZCBwb2ludD8gT25seSBXaW5ib25kIGZsYXNoZXMg
aGF2ZSBzb21ldGhpbmcgaW4gU1IyLiBJdCBpcwptZW50aW9uaW5nIG5vbiBTRkRQIGNvbXBsaWFu
dCBNaWNyb24gZGV2aWNlcy4gU28gdGhpcyBjYXNlIG5ldmVyCmFjdHVhbGx5IGhhcHBlbnMuCgo+
IEkgc2VlIHRocmVlIHdheXMgdG8gZ28sIHdoaWNoIGRvIHlvdSBwcmVmZXI/Cj4KPiAxLCBLZWVw
IHRoZSB2MyBhcHByb2FjaCAoY2xlYXIgaW4gc3BpX25vcl9wYXJzZV9wcm9maWxlMSgpKSBhbmQg
Zml4IHRoZSByZW1haW5pbmcKPiAgICAgY2FzZXMgb25lIGJ5IG9uZSwgY2xlYXJpbmcgcmVhZF9z
cjIgaW4gZWFjaCByZWxldmFudCBmaXh1cCAKPiAgICAgKGUuZy4gbXQzNXh1NTEyYWJhX3Bvc3Rf
c2ZkcF9maXh1cCkgLyBuby1TRkRQIHBhdGguCgpUaGlzIGlzIG15IGZhdm9yaXRlIG9wdGlvbiwg
YXMgeW91IGNhbiBndWVzcy4KCj4gMiwgTW92ZSB0aGUgY2xlYXIgaW50byBzcGlfbm9yX2xhdGVf
aW5pdF9wYXJhbXMoKSwgZ2F0ZWQgb24gdGhlIDhEIHJlYWQgY2FwYWJpbGl0eQo+ICAgICAoaHdj
YXBzICYgU05PUl9IV0NBUFNfUkVBRF84XzhfOF9EVFIpIGFuZCByZWFkX3NyMiA9PSBSRENSLCBz
byBhbGwgOEQgCj4gICAgIHBhdGhzIGFyZSBjb3ZlcmVkIGluIG9uZSBwbGFjZS4gCj4gICAgIFRo
ZSBkb3duc2lkZTogbGF0ZV9pbml0IHJ1bnMgYWZ0ZXIgdGhlIG1hbnVmYWN0dXJlciBmaXh1cHMs
IHNvIGlmIGEgdmVuZG9yIGxhdGVyCj4gICAgIHdhbnRzIHRvIHNldCBpdHMgb3duIFNSMiBvcGNv
ZGUgZm9yIDhEIGl0IHdvdWxkIGJlIGNsb2JiZXJlZCBoZXJlIGFuZCBvdmVycmlkaW5nCj4gICAg
ICBpdCBjbGVhbmx5IGJlY29tZXMgYXdrd2FyZC4KPgo+IDMsIEdvIGJhY2sgdG8gdGhlIHYyIGFw
cHJvYWNoIChjbGVhciBpbiBzcGlfbm9yX3NldF9vY3RhbF9kdHIoKSB3aGVuIHRoZSBzd2l0Y2gg
dG8gOEQKPiAgICAgYWN0dWFsbHkgc3VjY2VlZHMpLiBUaGlzIGNvdmVycyBldmVyeSBwYXRoIHRo
YXQgZW5kcyB1cCBpbiA4RCByZWdhcmRsZXNzIG9mIGhvdyB0aGUgCj4gICAgIGNhcGFiaWxpdHkg
d2FzIGRpc2NvdmVyZWQsIGJ1dCBpdCBpcyBydW50aW1lLXByb3RvY29sIGJhc2VkIHJhdGhlciB0
aGFuIGNhcGFiaWxpdHkgCj4gICAgIGJhc2VkLCB3aGljaCB5b3UgZGlkbid0IHByZWZlciBlYXJs
aWVyLiBBbmQgdGhpcyBtZXRob2QgaGFzIHRoZSBzYW1lIGRvd25zaWRlIGFzCj4gICAgIG1ldGhv
ZCAyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
