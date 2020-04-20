Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97028C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 14:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5A5206F4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 14:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/GWgZEb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B5A5206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kalrayinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNevce0TeM7L0/IVGtDjtKKDH9dsl6BI9ZXDWQV9TXI=; b=R/GWgZEbxS+FoB
	lK40X0EyZ8mY3fWRunyWCPelL4IILQqjs8V/V+bR25WhqE4sHfjmPs1U3jaD7heeQqq8GeAEgR3Vw
	E49uAml3WH3RKib0HOP0PfMfrdtBAQVyO/HtLHuu6jh5HgbqzIWula/M00xMXMSzG9zm+DeY5rMMS
	eHZPqIA9JC42FRXksuaTHBab/8LtkXJ7zjCO7KAbSGwd8gb0nWAFeP/YV8gvrcluCIfs8KpLo0z7Y
	CwIPPvnnxzCjHvMKdl4MFIoRpKcdB4bwrTT893vCvx33ffgAmmDWsF9MKwGpN3crtRoY+ux+uNhy2
	ge4nnLif4wxdQzOUUuSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQXkS-00054x-2N; Mon, 20 Apr 2020 14:50:12 +0000
Received: from zimbra2.kalray.eu ([92.103.151.219])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQXkO-00032S-Ie
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 14:50:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id D316027E0867;
 Mon, 20 Apr 2020 16:50:02 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HWyQpPAO5Tvb; Mon, 20 Apr 2020 16:50:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 6B91027E0879;
 Mon, 20 Apr 2020 16:50:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m5gn7ZtFqnkJ; Mon, 20 Apr 2020 16:50:02 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 4EB7227E0868;
 Mon, 20 Apr 2020 16:50:02 +0200 (CEST)
Date: Mon, 20 Apr 2020 16:50:02 +0200 (CEST)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Message-ID: <1734428336.16421904.1587394202163.JavaMail.zimbra@kalray.eu>
In-Reply-To: <1950407.5XCTmqoEVg@192.168.0.120>
References: <20200417160839.25880-1-cleger@kalray.eu>
 <1950407.5XCTmqoEVg@192.168.0.120>
Subject: Re: [PATCH] mtd: spi-nor: Add support for is25lp01g
MIME-Version: 1.0
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC81 (Linux)/8.8.15_GA_3895)
Thread-Topic: spi-nor: Add support for is25lp01g
Thread-Index: AQHWFw0/tWJ4ISRUwk6rGADNBybaDI6HnvBZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_075008_810560_F51F8CE1 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgotLS0tLSBPbiAyMCBBcHIsIDIwMjAsIGF0IDE0OjE0LCBUdWRvciBBbWJhcnVz
IFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToKCj4gSGksIENsZW1lbnQsCj4gCj4g
T24gRnJpZGF5LCBBcHJpbCAxNywgMjAyMCA3OjA4OjM5IFBNIEVFU1QgQ2xlbWVudCBMZWdlciB3
cm90ZToKPj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUKPj4gY29udGVudCBpcyBzYWZlCj4+IAo+PiBVcGRh
dGUgdGhlIGlzc2lfcGFydHMgdGFibGUgZm9yIGlzMjVscDAxZyAoMTI4TUIpIGRldmljZSBmcm9t
IElTU0kuCj4+IFRlc3RlZCBvbiBLYWxyYXkgSzIwMCBib2FyZC4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IENsZW1lbnQgTGVnZXIgPGNsZWdlckBrYWxyYXkuZXU+Cj4+IC0tLQo+PiAgZHJpdmVycy9t
dGQvc3BpLW5vci9pc3NpLmMgfCAyICsrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+PiBpbmRleCBmZmNiNjBlNTRhODAuLmMzYzM0MzhlM2Qw
OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKPj4gKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9pc3NpLmMKPj4gQEAgLTQ5LDYgKzQ5LDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBmbGFzaF9pbmZvIGlzc2lfcGFydHNbXSA9IHsKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVB
RAo+PiB8IFNQSV9OT1JfNEJfT1BDT0RFUykKPj4gICAgICAgICAgICAgICAgIC5maXh1cHMgPSAm
aXMyNWxwMjU2X2ZpeHVwcyB9LAo+PiArICAgICAgIHsgImlzMjVscDAxZyIsICBJTkZPKDB4OWQ2
MDFiLCAwLCA2NCAqIDEwMjQsIDIwNDgsCj4gCj4gVGhlcmUgaXMgYSAiSyIgZmxhdm9yIG9mIHRo
aXMgZmxhc2ggd2hpY2ggaGFzIDUxMiBCeXRlIFBhZ2Ugc2l6ZSB3aXRoIDI1NiBLQgo+IEJsb2Nr
IHNpemUuIFdoaWxlIHRoZSBwYWdlIHNpemUgY2FuIGJlIGRldGVybWluZWQgYnkgcGFyc2luZyBT
RkRQLCBJIHRoaW5rIHdlCj4gd2lsbCBoYXZlIHNvbWUgcHJvYmxlbXMgd2l0aCBzZWN0b3Jfc2l6
ZSBiZWNhdXNlIGFzIG9mIG5vdywgdGhlIHNlY3Rvcl9zaXplIGlzCj4gYWx3YXlzIHNldCB0byA2
NEtCLiBBbiBpbmNvcnJlY3Qgc2VjdG9yX3NpemUgd2lsbCBhZmZlY3QgZXJhc2VzIGFuZCBsb2Nr
aW5nLgoKVGhhbmtzLCBJIGRpZCBub3Qgbm90aWNlZCB0aGF0ICEgSWYgSSB1bmRlcnN0YW5kLCB0
aGlzIHdpbGwgcmVxdWlyZSB0byBtb2RpZnkKdGhlIGNvcmUgdG8gaGFuZGxlIHNlY3RvciBzaXpl
IHRoZSBzYW1lIHdheSBhcyBwYWdlX3NpemUgYW5kIHByb2JhYmx5IGFkZCBhCmZpeHVwIHRvIGRl
dGVjdCB0aGUgIksiIG9wdGlvbnMgZnJvbSBTRkRQID8KVGhpcyBpcyBwcm9iYWJseSBtb3JlIGNo
YW5nZXMgdGhhbiBJIGNhbiBoYW5kbGUsIGFuZCB5b3UgY2FuIHByb2JhYmx5IGRyb3AgdGhpcwpw
YXRjaCBzaW5jZSBub3QgcmVhbGx5IGZ1bmN0aW9uYWwgZm9yICJLIiB0eXBlIGZsYXNoLgoKQnV0
IHRoYW5rcyBmb3Igbm90aWNpbmcgaXQgIQoKQ2zDqW1lbnQKCj4gCj4gQ2hlZXJzLAo+IHRhCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
