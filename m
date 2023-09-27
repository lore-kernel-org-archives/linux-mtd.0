Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E45E82CA5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t87l3We6g3YzEfJAsAteYqMV1bfbo6/2hGGWas4hFwY=; b=gA9lmTtFdhFN2w
	CRYERe+hQzBxM9+YPTQByGbStccfmRyhA17reXndYKMNke1SuoWmr1n3LAKtrNUfOfVBBqhaBU2fM
	M4/qXqv8CcT5GMheEW8tEdtp0AGlZitaErQqu8WXYhd4YzxOKE/pbUu8cLAq1ChvLRrLq5Kb67UL+
	25cdbi4pz+6/YFZ4SM7N35gHLxb1lHmp23/nlscBd39XvZzQF5TdJwdtSSO0NbeKjlb7foFtNuOZO
	sFqx0wwOCLB8qyhgroPW01b7k8Oh97DLZa91anM76sTqFKDkeudLhaxvuYO/BKG1VqgI5haWnG89/
	Nmbpk01MYAirlo8ZKacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWUH-001Ffa-0k;
	Wed, 27 Sep 2023 15:30:05 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWUD-001FeR-0i
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 15:30:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41B03FF809;
	Wed, 27 Sep 2023 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695828595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYzHJ3e6WJyAtZxmrr4126joB+o93g0JOzJdO55X0do=;
	b=pygfUECqVNDPsy+CSPTm3cLY/cdZS+cYhqFCZaUhqXfEVnJkkttvgOP7MWvVyG4FVdSnSa
	E63g7hMHxSqg0pVGmbECqPDYmtsZxnYKo4+6jlqUTyOMKkY1LFKNNl2E6kG4IucdhUIXw8
	PGazdn8trK1EUxPx3WQLILqPhnLcqolccGcW4h0OXGfZAdtNfeLFh6nVYQ2Z95uN5wNjT+
	yzeYwURoh88SqR3igmC1F0xqhCc0ynaEyBsnD1nhPvjN/pRH3UhD8iCwVaMeCm68OUHReD
	TnkF4+Tp/L6TUaiwSxO0oBTwmenjSz1OzFO5CeiZnfmLZw7+/sUwSos1rpozwA==
Date: Wed, 27 Sep 2023 17:29:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij
 <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.de>, Neil Armstrong
 <neil.armstrong@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH] mtd: nand: add support for ts72xx
Message-ID: <20230927172947.33106fe2@xps-13>
In-Reply-To: <20230927141532.25525-1-nikita.shubin@maquefel.me>
References: <20230927141532.25525-1-nikita.shubin@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083001_435249_556650D9 
X-CRM114-Status: GOOD (  19.09  )
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

SGkgTmlraXRhLAoKbmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZSB3cm90ZSBvbiBXZWQsIDI3IFNl
cCAyMDIzIDE3OjE1OjI1ICswMzAwOgoKPiBUZWNobm9sb2dpYyBTeXN0ZW1zIGhhcyBpdCdzIG93
biBuYW5kIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24gaW4gQ1BMRC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPgo+IC0tLQo+IEhl
bGxvIE1pcXXDqGwuCj4gCj4gQ2FuIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgb24gaXQgYXMgUkZD
LCBzbyBubyBuZWVkIGZvciB0aGUgd2hvbGUgc2VyaWVzIHNwaW5uaW5nID8KPiAKPiBJJ3ZlIGdv
dCByaWQgb2YgYWxsIGxlZ2FjeSBzdHVmZiBpIHRoaW5rLCBob3dldmVyOgoKSSBhbSBnbGFkIHlv
dSBkaWQsIHRoYW5rcyBhIGxvdCEKCj4gLSBsb29rJ3MgbGlrZSBpIG1lIHRzNzI1MCBpcyBtaXNz
aW5nIFJFQURDQUNIRSBhbmQgaSBjb3VsZG4ndCBmaW5kIGFueSBkb2NzIAo+ICAgZm9yIHRoaXMg
Y29udHJvbGxlciwgc28gYXMgbGVnYWN5IGhhZCBubyBSRUFEQ0FDSEUsIGkgbWFyayBpdCBhcyBu
b24tc3VwcG9ydGVkCgpXaGF0IE5BTkQgZGV2aWNlIGRvIHlvdSB1c2U/CgpUaGUgY29udHJvbGxl
ciBjbGVhcmx5IHN1cHBvcnRzIGl0LCBhcyBpdCBqdXN0IGZvcndhcmRzIHdoYXRldmVyCmFkZHJz
L2NtZC9kYXRhIGN5Y2xlIHlvdSBpbnB1dC4gSG93ZXZlciB3ZSBhcmUgdHJ5aW5nIHRvIGZpeCB0
aGUgY2FjaGUKcmVhZHMgc3VwcG9ydCB3aGljaCBpcyB1bnN0YWJsZS4gSWYgeW91IHVzZSBhIE5B
TkQgdGhhdCBpcyBub24tSkVERUMKYW5kIG5vbi1PTkZJIHRoZW4gcGxlYXNlIGFwcGx5IHRoaXMg
YW5kIHlvdSB3aWxsIG5vIGxvbmdlciBiZSBib3RoZXJlZApieSBpdDoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkLzIwMjMwOTI2MTMyNzI1LjVkNTcwZTFiQHhwcy0xMy9ULyNtZDdl
NWU5NDRhNmEwOGUyNGY0ZjFlMjAwNjhhNDlmOTQ3OTRhYjk0NQoKSWYgeW91IGFyZSB1c2luZyBh
IE1pY3JvbiBjaGlwIHRoYXQgc3BlY2lmaWVzIG5vdCBzdXBwb3J0aW5nIEVDQwpjb3JyZWN0aW9u
IHRvZ2V0aGVyIHdpdGggc2VxdWVudGlhbCBjYWNoZSByZWFkcywgdGhlbiBpdCdzIGEgcHJvYmxl
bQp0aGF0IHdlIHdpbGwgc29sdmUgc29vbiAoeW91IGNhbiBoYXJkY29kZQpjaGlwLT5jb250cm9s
bGVyLT5zdXBwb3J0ZWRfb3AuY29udF9yZWFkIHRvIDApOwoKT3RoZXJ3aXNlIHdlIGNhbiBkaXNj
dXNzIGl0LgoKPiAtIGxlZ2FjeSB3YWl0IGltcGxlbWVudGF0aW9uIGhhZCBubyBkZWxheXMgLSBv
bmx5IHRpbWVvdXQgYW5kIGlmIGkgc2V0IAo+ICAgcmVhZGJfcG9sbF90aW1lb3V0KCkgdG8gc29t
ZXRoaW5nIHJlYXNvbmFibGUgaSBleHBlcmllbmNlIHNwZWVkIGRlZ3JhZGF0aW9uIAo+ICAgb24g
bXRkX3NwZWVkdGVzdCwgY2FuIGl0IGJlIGxlZnQgYXMgMCA/CgpMb29rcyBsaWtlIHRoZSBsZWdh
Y3kgaW1wbGVtZW50YXRpb24gdXNlZCBjb25kX3Jlc2NoZWQoKS4gVGhlIGRlbGF5Cm5lZWRzIHRv
IGJlIG9ic2VydmVkIGJlZm9yZSBmaXJzdCBjaGVja2luZyBmb3IgdGhlIHN0YXR1cywgaXQncyBh
IGRlbGF5CnRoYXQgaXMgZGVzY3JpYmVkIGluIHRoZSBzcGVjLCBpZiB5b3UgZ2V0IHRoZSBzdGF0
dXMgYmVmb3JlIHlvdSBtaWdodApqdXN0IG5vdCBzZWUgYSBjb25zaXN0ZW50IHZhbHVlLiBJIGJl
bGlldmUgdGhhdCBpcyB3b3J0aCB0YWtpbmcgaW50bwphY2NvdW50IGluIHlvdXIgaW1wbGVtZW50
YXRpb24gYmVsb3cgKGRvbid0IHdhaXQgdGhlbiBkZWxheSwgaXQncwpub3QgcmVsZXZhbnQpLiBD
YW4geW91IHNoYXJlIHRoZSB2YWx1ZXMgeW91J3ZlIHRyaWVkIGFuZCB0aGUKcGVyZm9ybWFuY2Vz
IHlvdSd2ZSBnb3Q/CgpUaGFua3MsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
