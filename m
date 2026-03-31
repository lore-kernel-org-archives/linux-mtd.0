Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97011109B489
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 15:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEI1OBSFxWkthQlf+8CElr4SVDRfOU/HOl+TpGK+ZFc=; b=e3zzHPhO2Q15BF
	xxQ/oZ6plXn7+JjLrxJrTLd+w2qPzftcmbT2qFhzDhF/A5oNPOyDaHWjcKQZ3PelHH/+GefYWHMwm
	8eiTtZ+mpGmMlwaf82D5BEoG//Lj6GMpymLf7stLItk8zmaqW+wGkqkE9HpnEXce/U6zpt/XUH1+K
	ToirWov5gpehfooka8Bc0s2eGDnH/lEUrFZ6v3a3iQL3mxehcAIzpTbj23vevOPEQgQ+/xztRCxDR
	doRgikBvu1hA0NRQyoTW7c7J0Dslfi3XSoOVZrzqFludc8WVlJaLdpLO6gLTIJHufhaPfpsJ48lXQ
	dTK6C/RmcYVtaRE/fxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7azI-0000000DAz6-125l;
	Tue, 31 Mar 2026 15:26:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7azF-0000000DAyS-0XmE
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 15:26:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EBC71A30C1;
	Tue, 31 Mar 2026 15:26:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1202B6029D;
	Tue, 31 Mar 2026 15:26:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44E6010450349;
	Tue, 31 Mar 2026 17:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774970777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eK5dGg65CGb94A/wEx0yo49sGIlrvKeB/Y/mHd4ngNs=;
	b=SBYnse5BpxBUFO2L4JeWzsooEAaHJTXxKl2yuUBLP75/mlaqoi7j/aCoopSs48uEcYagKS
	Dhvrt17i6qCC/IRZxtJ6/rlmBPFbVfhHE7X6Ke8hXaRa/6I+lzVRUAHYr8yNT0nwEq1dDl
	dtAjaBBBbuNdmmMXpCoFB7wiD42x2d2lYuOvzN2PRCrv8bHLphN55rFpggTsaM9V4C50pT
	XbFKuoqJZ1llUCIGeWj6Rua7mnE6XOW4d8rbPRVVrw26VyLrhhOPqHUjJ2aXL2Dxe1cRrC
	M4M5npnsvJ06jMavG1OvTNQ0WWEbPgS9P2viifNcQSAUvYqE9ygYqOJXhHTs/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,  Mark Brown <broonie@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,  Eberhard Stoll
 <eberhard.stoll@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev,  Santhosh Kumar K
 <s-k6@ti.com>
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
In-Reply-To: <633fee13-a397-410f-a595-db95e04b8110@kontron.de> (Frieder
	Schrempf's message of "Tue, 31 Mar 2026 11:58:11 +0200")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
	<87wlzlnioh.fsf@bootlin.com>
	<a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
	<87ecl09wtv.fsf@bootlin.com>
	<633fee13-a397-410f-a595-db95e04b8110@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 31 Mar 2026 17:26:12 +0200
Message-ID: <87ldf881gr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_082637_483908_D788E838 
X-CRM114-Status: GOOD (  30.75  )
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

SGVsbG8sCgo+Pj4gRm9yIGV4YW1wbGUgb24gV2luYm9uZCBXMjVOMDRLViB0aGlzIGxlYWRzIHRv
IGRldGVjdGlvbiBmYWlsdXJlcy4gU28gd2UKPj4+IHNob3VsZCBtYXliZSBpbnRyb2R1Y2Ugc29t
ZSBraW5kIG9mIHJlZHVjZWQgY2xvY2sgc2V0cG9pbnQgZm9yIHRoZQo+Pj4gaW5pdGlhbCBkZXRl
Y3Rpb24sIHRoYXQgaXMgc2FmZSB0byBiZSB1c2VkIHdpdGhvdXQgUlggc2FtcGxpbmcgZGVsYXkK
Pj4+IGNvbXBlbnNhdGlvbi4KPj4gCj4+IFRoYXQgc2hvdWxkIGJlIHRoZSBEVCBtYXggZnJlcXVl
bmN5LCBubz8KPgo+IEhtLCBJJ3ZlIHNlZW4gaXQgdGhlIG90aGVyIHdheSByb3VuZC4gSW4gbXkg
cGVyc3BlY3RpdmUgdGhlIERUIG1heAo+IGZyZXF1ZW5jeSBkZXNjcmliZXMgdGhlIG1heGltdW0g
Y2xvY2sgZnJlcXVlbmN5IHN1cHBvcnRlZCBieSB0aGUgY2hpcCBhcwo+IGdpdmVuIGluIHRoZSBk
YXRhc2hlZXQgKGFzc3VtaW5nIHRoZXJlIGFyZSBubyBvdGhlciBsaW1pdGF0aW9ucwo+IGludHJv
ZHVjZWQgYnkgYm9hcmQgZGVzaWduLCBldGMuKS4KCkkgYmVsaWV2ZSB0aGF0IHdoYXQgaXMgaW4g
dGhlIGRhdGFzaGVldCBzaG91bGQgaW5zdGVhZCBiZSBzdGF0aWNhbGx5CmRlc2NyaWJlZCBpbiB0
aGUgU1BJIE5BTkQgdmVuZG9yIGZpbGUuCgpUaGUgbWF4IFNQSSBmcmVxdWVuY3kgRFQgcHJvcGVy
dHkgaXMgaGVyZSB0byB0ZWxsIGF0IHdoaWNoIHNwZWVkIHRvIHVzZQp0aGUgZGV2aWNlLCBhbmQg
dGhpcyBkZXBlbmRzIG1vc3RseSBvbiB0aGUgcm91dGluZy4KCj4gVGhlIFJYIHNhbXBsaW5nIGRl
bGF5IGlzIGEgdGltaW5nIHBhcmFtZXRlciBzcGVjaWZpZWQgaW4gdGhlIGRhdGFzaGVldAo+IGFu
ZCBpdCBpcyByZWxldmFudCBpbiBvcmRlciB0byBpbnRlcmZhY2UgdGhlIGNoaXAgYXQgbWF4aW11
bSBmcmVxdWVuY3kKPiB3aXRoaW4gc3BlYy4KCklmIGl0J3Mgbm90IGRlc2lnbiBkZXBlbmRlbnQs
IHRoZW4gd2Ugc2hvdWxkIGhhbmRsZSBpdCAic3RhdGljYWxseSIuCgo+IFlvdXIgYXBwcm9hY2gg
d291bGQgbWVhbiwgdGhhdCB3ZSBuZWVkIHRvIG1hbnVhbGx5IGNhbGN1bGF0ZSB0aGUgbWF4aW11
bQo+IHN1cHBvcnRlZCBjbG9jayBmcmVxdWVuY3kgd2l0aG91dCBSWCBzYW1wbGluZyBkZWxheSBj
b21wZW5zYXRpb24gYW5kIHVzZQo+IHRoaXMgdmFsdWUgaW4gdGhlIERULiBUaGVuIGxldCB0aGUg
ZHJpdmVyIGluY3JlYXNlIHRoZSBjbG9jayBpZiBSWAo+IHNhbXBsaW5nIGRlbGF5IGNvbXBlbnNh
dGlvbiBpcyBhdmFpbGFibGUuCj4KPiBUaGlzIHdvdWxkIGhhdmUgdGhlIGFkdmFudGFnZSwgdGhh
dCBldmVuIGJlZm9yZSBpbml0aWFsIGRldGVjdGlvbiB3ZQo+IHdvdWxkIHVzZSB0aGUgY29ycmVj
dCBjbG9jayBieSBkZWZhdWx0LiBCdXQgaXQgaGFzIHRoZSBkb3duc2lkZSB0aGF0IHRoZQo+IGNs
b2NrIHZhbHVlIGluIERUIHdvbid0IG1hdGNoIHRoZSBkYXRhc2hlZXQgdmFsdWUuCgpJdCBuZXZl
ciBkb2VzLiBXaW5ib25kIGNoaXBzIGNhbiBydW4gYXQgMTY2TUh6LiBJIGtub3cgbm8gZGVzaWdu
IGNhcGFibGUKb2YgdGhhdCBuYXRpdmVseSAoaWUuIHdpdGhvdXQgZmluZXIgdHVuaW5nLCBsaWtl
IHdoYXQgU2FudGhvc2gKcHJvcG9zZXMpLgoKPiBJbiBteSBhcHByb2FjaCB3ZSBhc3N1bWUgdGhl
IGRyaXZlciBpcyBhYmxlIHRvIHVzZSB0aGUgbWF4aW11bSBjbG9jawo+IGZyb20gdGhlIERUIChz
YW1lIGFzIGluIGRhdGFzaGVldCkgYnkgdXNpbmcgUlggc2FtcGxpbmcgZGVsYXkKPiBjb21wZW5z
YXRpb24gYW5kIG9ubHkgaWYgaXQgdHVybnMgb3V0IHRoZSBjb21wZW5zYXRpb24gaXMgbm90IHBv
c3NpYmxlCj4gd2Ugd2lsbCBsb3dlciB0aGUgY2xvY2sgZHluYW1pY2FsbHkuCj4KPiBXaGF0IGlm
IHdlIGRvIHRoZSBmb2xsb3dpbmc/Cj4KPiAxLiBBZGQgYSBwYXJhbWV0ZXIgaW4gdGhlIFNQSSBO
QU5EIGNoaXAgZHJpdmVyIHRoYXQgY29udGFpbnMgdGhlIG1heGltdW0KPiBzdXBwb3J0ZWQgY2xv
Y2sgZnJlcXVlbmN5IGFzIGdpdmVuIGluIHRoZSBkYXRhc2hlZXQgYXMgdGhpcyBpcyBjbGVhcmx5
Cj4gdGhlIGJlc3QgcGxhY2UgdG8ga2VlcCB0aGlzIGRldmljZS1zcGVjaWZpYyBwYXJhbWV0ZXIu
CgpJJ3ZlIHNvIGZhciBhdm9pZGVkIGRvaW5nIGl0LCBidXQgeWVzLCB0aGlzIGlzIHNvbWV0aGlu
ZyB3ZSBjYW4gZG8uIEl0CmlzIGdvaW5nIHRvIGJlIHNpbXBsZSBlbm91Z2ggdG8gaW1wbGVtZW50
IGFzIGFsbCB0aGUgaW5mcmFzdHJ1Y3R1cmUgaXMKYWxyZWFkeSB0aGVyZS4gWW91IGNhbiBwcm92
aWRlIHZhcmlhbnRzIHdpdGggc3BlZWQgbGltaXRhdGlvbnMgKGxvb2sKaW50byB3aW5ib25kLmMp
LiBJIHdhcyB3cml0aW5nICIwIiBpbiB0aGUgZmllbGRzIHdoaWNoIGRpZG4ndCBuZWVkIGEKbGlt
aXRhdGlvbiB0aGF0IGlzIHNvbWV0aGluZyBlbHNlIHRoYW4gdGhlIG1heGltdW0gc3BlZWQgdGhl
IGNoaXAgY2FuCnN1c3RhaW4sIGFzIGFueXdheSB0aGUgRFQgcHJvcGVydHkgKndpbGwqIHRlbGwg
dXMgd2hhdCBpcyB0aGlzIHNwZWVkLCBpZgp3ZSBhcmUgZXZlciBhYmxlIHRvIHJlYWNoIGl0LgoK
PiAyLiBBbGxvdyB0byBsZWF2ZSBzcGktbWF4LWZyZXF1ZW5jeSBpbiBEVCB1bnNldCBmb3IgU1BJ
IE5BTkRzIGluIGNhc2UKPiB0aGVyZSBhcmUgbm8gYm9hcmQtc3BlY2lmaWMgbGltaXRhdGlvbnMg
YW5kIHRoZXJlZm9yZSB0aGUgbWF4aW11bQo+IGZyZXF1ZW5jeSBzdXBwb3J0ZWQgYnkgdGhlIGNv
bWJpbmF0aW9uIG9mIGNoaXAgYW5kIGNvbnRyb2xsZXIgY2FuIGJlCj4gdXNlZC4KCkluIG1hbnkg
Y2FzZXMsIHRoZSBsaW1pdGF0aW9ucyBhcmUgYm9hcmQgc3BlY2lmaWMuIEFueXdheSwgdGhpcyBp
cwphbHJlYWR5IHRoZSBjYXNlLCB5b3UgbWF5IGp1c3Qgbm90IHB1dCBhbnkgdmFsdWUgaW4gdGhp
cyBwcm9wZXJ0eS4KCj4gMy4gQnkgZGVmYXVsdCBsaW1pdCB0aGUgY2xvY2sgZnJlcXVlbmN5IGZv
ciB0aGUgUkVBRF9JRCBvcCB0byBhIHNhZmUKPiB2YWx1ZSB0aGF0IHdvcmtzIGZvciBhbGwgY2hp
cHMgYW5kIGNvbnRyb2xsZXJzLCBldmVuIGlmIFJYIHNhbXBsaW5nCj4gZGVsYXkgY29tcGVuc2F0
aW9ucyBpcyBub3QgYXZhaWxhYmxlLgoKSSBhbSBzb3JyeSB0aGlzIGlzIG5vdCBnb2luZyB0byB3
b3JrIG91dC4gVGhlcmUgaXMgbm8gc3VjaCBoYXJtb25pemVkCnNwZWVkLCBkaWZmZXJlbmNlcyBj
YW4gYmUgYW4gb3JkZXIgKG9yIHR3bykgb2YgbWFnbml0dWRlIGRpZmZlcmVudCwgd2UKZG8gbm90
IHdhbnQgdG8gcGF5IHRoZSBwZW5hbHR5IG9mIGEgdmVyeSBzbG93IGlkZW50aWZpY2F0aW9uIG9u
IGFsbApkZXNpZ25zLiBXZSBjdXJyZW50bHkgZG8gdGhlIHJlYWQgc2V2ZXJhbCB0aW1lcyB3aXRo
IGRpZmZlcmVudApwYXJhbWV0ZXJzLiBXaGF0IGlmIHdlIHdlcmUgdHJ5aW5nIG9uZSBtb3JlIHRp
bWUgYnkgY3V0dGluZyB0aGUgc3BlZWQgYnkKMiAoY29tcGxldGVseSByYW5kb20gcHJvcG9zYWwp
PwoKPiA0LiBJbiBQSFkgbW9kZSwgY2hlY2sgYWdhaW5zdCB0aGUgRFQgbWF4IGZyZXF1ZW5jeSAo
Ym9hcmQgbGltaXRhdGlvbnMpCj4gYW5kIGNoaXAgbWF4IGZyZXF1ZW5jeSBiZWZvcmUgc3dpdGNo
aW5nIHRvIHRoaXMgbW9kZS4KClRoZXJlIGlzIG5vdCBzdWNoIHRoaW5nIDotKSB0aGUgbWF4IGZy
ZXF1ZW5jeSBpbiBEVCBjdXJyZW50bHkgd291bGQgYmUKc2V0IHRvIHRoZSBwbGF0Zm9ybSBsaW1p
dGF0aW9uLiBXZSBuZWVkIHNvbWVob3cgYW5vdGhlciBwYXJhbWV0ZXIKaW5kaWNhdGluZyB3aGF0
IGlzIHRoZSBtYXhpbXVtIHNwZWVkIGlmIHdlIGNhbiBmaW5lIHR1bmUgdGhlIHRpbWluZ3MuCgo+
IEkgaG9wZSB0aGlzIG1ha2VzIGF0IGxlYXN0IGEgYml0IG9mIHNlbnNlLiBJJ20gcmVhbGx5IG5v
dCB5ZXQgZmFtaWxpYXIKPiB3aXRoIGFsbCB0aGUgZGlmZmVyZW50IHVzZS1jYXNlcyBhbmQgbGlt
aXRhdGlvbnMuCgpJZiBJIGdldCBiYWNrIHRvIHlvdXIgb3duIGlzc3VlLiBJcyB0aGVyZSBhbnkg
Y2hhbmNlIHdlIGNvdWxkIGF2b2lkCnR3ZWFraW5nIHRoZSBEVCBmb3IgaGFuZGxpbmcgaXQ/IFdv
dWxkIHRoZXJlIGJlIGEgY29uZmlndXJhdGlvbiBvZiB5b3VyCmNvbnRyb2xsZXIgdGhhdCB3b3Vs
ZCBhbGxvdyByZWFkaW5nIHRoZSBJRCBvZiBhbGwgdGhlIGNoaXBzIHdpdGggZW5vdWdoCmRlbGF5
cz8gQ3VycmVudGx5LCB0aGUgc3BpIGNvcmUgZG9lc24ndCBjYXJlIG11Y2ggYWJvdXQgb3RoZXIg
cGFyYW1ldGVycwp0aGFuIHRoZSBmcmVxdWVuY3ksIGJ1dCB0aGVyZSBpcyBwZXJoYXBzIHJvb20g
Zm9yIGltcHJvdmVtZW50LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
