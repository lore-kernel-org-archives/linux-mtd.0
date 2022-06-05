Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7A8C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jun 2022 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZch80IqG9VGWhSV+4n0wyW+3k7X5/IcaxRB1nMSIXs=; b=1EGql9ujsDvrXG
	HM5k7owPJk4E1upo02ImlSQP+CCquQt2AaIQhYY/dQf1manG3otgAIE38OGr4S95h4My8z6/0pih0
	Pf8ZbWNLNYhRaNo8UtJ6fccteslKCOmMvsea9kg4mbyjni6KlQZrpZ6fNScCgwhFOIDNJ5CySnFlU
	Ov01RpaL8KQy7S3j+EouoKde7gEnoAWvgS5/I0EOjVpxo9Ix9d9RWI4HeN1u6NzFgI4Bk7zluA4Gn
	KVJ1whexl7l5NmXhiF4Y+91nSyFPr7LvWfhEK84E0V7CrI5qP/prQ/Pb/hfRqoyJSjxvN9hKnLeGF
	RVb+ysxuMaPMUScFv/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxsER-00El50-Ss; Sun, 05 Jun 2022 15:31:59 +0000
Received: from mxex1.tik.uni-stuttgart.de ([129.69.192.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxsEN-00El2P-Hj
	for linux-mtd@lists.infradead.org; Sun, 05 Jun 2022 15:31:58 +0000
Received: from localhost (localhost [127.0.0.1])
	by mxex1.tik.uni-stuttgart.de (Postfix) with ESMTP id 77B7561280;
	Sun,  5 Jun 2022 17:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uni-stuttgart.de;
	 h=content-transfer-encoding:content-type:content-type
	:in-reply-to:organization:from:from:references:content-language
	:subject:subject:user-agent:mime-version:date:date:message-id
	:received:received; s=dkim; i=@isd.uni-stuttgart.de; t=
	1654443094; x=1656181895; bh=tJi0Yjfs4slmIzLfWSbR8b+8Fthj5JuZQNy
	+Wv9sr4E=; b=AbKFvjAiaT2rMWKkvxRrDOeMX3bbuL8/dshD/DWdjekpPFqrVMb
	emgbCdQe2U7EZuTdT+TzDgBDxzeArZyt1osjYJWdGgRjt6FTB6ogP8jdT+uOhyht
	DahNVhmgE/dfPYxujovXdZpY51SXe3IK0mGm1TYa3gZitHCIrDwCJdjjYEM7/7fW
	KpW4afj5ol2SrHDh/3XaPEZpcy1Wezrzth0Ew1AnhsNB0hIz4On1nXp8zwKOSRaK
	tHmC1+0hLYfmc0MfO1AucM063CLVAr2+H+0hyUUqWhoEvzERfUxv42Niq46LkMH0
	dCxTyiXZPFg6XstBI81iT2PYlA4L1FRdyBw==
X-Virus-Scanned: USTUTT mailrelay AV services at mxex1.tik.uni-stuttgart.de
Received: from mxex1.tik.uni-stuttgart.de ([127.0.0.1])
	by localhost (mxex1.tik.uni-stuttgart.de [127.0.0.1]) (amavisd-new, port 10031)
	with ESMTP id ucSJQ6EXYuQc; Sun,  5 Jun 2022 17:31:34 +0200 (CEST)
Received: from [192.168.254.18] (isd-wormhole.isd.uni-stuttgart.de [129.69.110.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mxex1.tik.uni-stuttgart.de (Postfix) with ESMTPSA;
	Sun,  5 Jun 2022 17:31:33 +0200 (CEST)
Message-ID: <bdd78c78-be40-1c31-f46e-41ed2a0cbd04@isd.uni-stuttgart.de>
Date: Sun, 5 Jun 2022 17:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00
 NAND flash
Content-Language: en-US
To: linux-mtd@lists.infradead.org
References: <20220420104034.6333-1-dev@aboehler.at>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>, miquel.raynal@bootlin.com
From: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>
Organization: Universitaet Stuttgart - ISD
In-Reply-To: <20220420104034.6333-1-dev@aboehler.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_083156_399978_DA145B6A 
X-CRM114-Status: GOOD (  19.64  )
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

SGksCgpPbiAyMC8wNC8yMDIyIDEyOjQwLCBBbmRyZWFzIELDtmhsZXIgd3JvdGU6Cj4gVGhlIFRv
c2hpYmEgVEM1OE5WRzBTM0hUQTAwIGlzIGRldGVjdGVkIHdpdGggNjQgYnl0ZSBPT0Igd2hpbGUg
dGhlIGZsYXNoCj4gaGFzIDEyOCBieXRlcyBPT0IuIFRoaXMgYWRkcyBhIHN0YXRpYyBOQU5EIElE
IGVudHJ5IHRvIGNvcnJlY3QgdGhpcy4KPgo+IFRlc3RlZCBvbiBGUklUWiFCb3ggNzUzMCBmbGFz
aGVkIHdpdGggT3BlbldydC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgQsO2aGxlciA8ZGV2
QGFib2VobGVyLmF0Pgo+IC0tLQo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRz
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jCj4gQEAgLTI5LDYgKzI5
LDkgQEAgc3RydWN0IG5hbmRfZmxhc2hfZGV2IG5hbmRfZmxhc2hfaWRzW10gPSB7Cj4gWy4uLl0K
PiArCXsiVEM1OE5WRzBTM0hUQTAwIDFHIDMuM1YgOC1iaXQiLAo+ICsJCXsgLmlkID0gezB4OTgs
IDB4ZjEsIDB4ODAsIDB4MTV9IH0sCj4gKwkJICBTWl8ySywgU1pfMTI4LCBTWl8xMjhLLCAwLCA0
LCAxMjgsIE5BTkRfRUNDX0lORk8oOCwgU1pfNTEyKSwgfSwKCkBNaW5xdWVsLCB0aGVyZSBpcyBt
b3JlIHRvIHRoaXMgcGF0Y2ggdGhhbiBpdCBtZWV0cyB0aGUgZXllLgoKSXQgdHVybmVkIG91dCB0
aGlzICI0LWJ5dGUiIElEIG1pZ2h0IGhhdmUgYmVlbiBhbiBob25lc3QgbWlzdGFrZS4KV2UgaGF2
ZSB0aGlzIGRvY3VtZW50ZWQgaW4gdGhlIE9wZW5XcnQgR2l0aHViIGlzc3VlICM5OTYyIFswXSB0
aXRsZWQ6CiJGcml0emJveCBtZW1vcnkgY2hpcCBtaXNkZXRlY3Rpb24gc2luY2UgMGJjNzk0YTYg
KG1hc3RlciBhbmQgMjIuMDMpIgooc29tZSBwYXJ0cyBvZiB0aGlzIGFyZSBhbHNvIGluIHRoZSBv
cGVud3J0IGZvcnVtLiBCdXQgdGhlcmUncyBhIGxpbmsgdG8KdGhlIHRocmVhZCBpbiB0aGUgZ2l0
aHViIGlzc3VlKS4KClJlZ3JldHRhYmx5LCBJIGRvIHRoaW5rIHRoYXQgQW5kcmVhcyBjaGlwIG1p
Z2h0IGhhdmUgYmVlbiBhCmNvdW50ZXJmZWl0IG9yIGRhbWFnZWQgKHRoYXQgc2hvdWxkIGhhdmUg
ZW5kZWQgdXAgaW4gdGhlCmdhcmJhZ2UgYmluIGluc3RlYWQgb2YgaGlzIHJvdXRlcikuCgpIaXMg
Y2hpcHMgcmVwb3J0cyBqdXN0IHRoZSBmaXJzdCBmb3VyIGJ5dGVzIG9mIHRoZSBjaGlwIElEOgoi
OTggZjEgODAgMTUgMDAgMDAgMDAgMDAiLiBCdXQgYWNjb3JkaW5nIHRvIEtveGlhcy9Ub3NoaWJh
J3MgZGF0YXNoZWV0IFsxXSwKdGhlcmUgc2hvdWxkIGhhdmUgYmVlbiBhdCBsZWFzdCBhbm90aGVy
IDV0aCBub24temVybyBieXRlIGluIHRoZSBJRC4KKEkgZm91bmQgYSBsaW51eC1tdGQgcG9zdCBb
Ml0gd2l0aCB0aGUgc2FtZSBjaGlwIGFuZCB0aGUgT1AgcmVwb3J0czoKIjB4OTggMHhmMSAweDgw
IDB4MTUgMHg3MiAweDE2IDB4MDggMHgwMCIgZm9yIHRoZSBmdWxsIElEKS4KCldoYXQgdG8gZG8g
aW4gdGhpcyBzaXR1YXRpb24/IEJlY2F1c2UgdGhlIHBhdGNoIGFzIGlzIGlzIGNhdXNpbmcgYm9v
dCBmYWlsdXJlcwpmb3IgZGV2aWNlcyB3aXRoIG90aGVyIEtpb3hpYS9Ub3NoaWJhIGNoaXBzLiBU
aGlzIGlzIGJlY2F1c2UgdGhleSBhbHNvCm1hdGNoIHRoZSBmaXJzdCBmb3VyIGJ5dGVzIGJ1dCBo
YXZlIGRpZmZlcmVudCBPT0Igc2l6ZXMgKDY0LCBpbnN0ZWFkIG9mIDEyOCkuCgpBbmRyZWFzIGhh
cyBwcm9wb3NlZCB0aGUgZm9sbG93aW5nOiB1cGRhdGUgdGhlIGlkX2xlbiB0byA4LCB0aGlzIHdp
bGwgaGVscApmaXggdGhlIGJvb3QgZmFpbHVyZXMgd2l0aCBvdGhlciBjaGlwcyBsaWtlIHRoZSBU
QzU4QlZHMFMzSFRBMDAsIHNpbmNlIGl0CmhhcyBkaWZmZXJlbnQgdmFsdWVzIGZvciB0aGUgY2hp
cC1pZCBhZnRlciB0aGUgNHRoIGJ5dGUufAp8Cgp8eyJUQzU4TlZHMFMzSFRBMDAgMUcgMy4zViA4
LWJpdCIsIHsgLmlkID0gezB4OTgsIDB4ZjEsIDB4ODAsIDB4MTV9IH0sIFNaXzJLLCBTWl8xMjgs
IFNaXzEyOEssIDAsIDgsIDEyOCwgTkFORF9FQ0NfSU5GTyg4LCBTWl81MTIpLCB9LHwKCnx8UmV2
ZXJ0aW5nIHdvdWxkIGJlIGFuIG9wdGlvbiwgYnV0IGlmIHRoaXMgaXMgYSBjb3VudGVyZmVpdCBz
aXR1YXRpb24gdGhlbgpzaW1pbGFyICJjaGlwcyIgY291bGQgZW5kIHVwIGluIG90aGVyIGRldmlj
ZXMgYW5kIHdlIGFyZSBqdXN0IHVubHVja3kKb25lcyB0aGF0IGFyZSB0aGUgZmlyc3QgdG8gcmVw
b3J0IGl0IDotKCAuCnx8Cgp8UmVnYXJkcywgQ2hyaXN0aWFufAoKClswXSA8aHR0cHM6Ly9naXRo
dWIuY29tL29wZW53cnQvb3BlbndydC9pc3N1ZXMvOTk2Mj4KWzFdIDxodHRwczovL21lZGlhLmRp
Z2lrZXkuY29tL3BkZi9EYXRhJTIwU2hlZXRzL1Rvc2hpYmElMjBQREZzL0tJT1hJQV9UQzU4TlZH
MFMzSFRBMDBfUmV2Mi4wMF9FMTkxMDAxQy5wZGY+IHBhZ2UgMzUKWzJdIDxodHRwczovL2xpbnV4
LW10ZC5pbmZyYWRlYWQubmFya2l2ZS5jb20vOERSeGFzMk0vcGF0Y2gtbXRkLW5hbmQtZGV0ZWN0
LW9vYi1zaXplLWZvci10b3NoaWJhLTI0bm0tcmF3LXNsYz4KCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
