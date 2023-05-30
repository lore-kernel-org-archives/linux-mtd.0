Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B05C7EE2C
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6r+JJFgP+0s4EZcE8GtxErkFc+63xP5V8WrNRHgN7H8=; b=GY+9jyDE/l9MG8
	T+UccIM+LbZL4lwKJMgi5FIyVf9O9WV0qYmR2qDKlhLNDUOpfFFN+h/xdmRfSawL2JlgUq7k/747f
	WmiCRIdmlfq2Mb36fqLTCcGfJWjJrlBUl69A6ztepmVV8rt8T5xi+EHqfHhoyRPoAE6NvvldpEg6j
	2hjjmxLjSdUmLMZ7al6Sn8vWKXW7GLH+jQv2CNHB342feA+Yf241ePjrEOfCZcJAXkF9Fba3k4DN8
	6g91CIWNyExtoNXY0kiJlrhGQ8EC+17Yj3VyTy/PGj28CocIa7nf086oCi5lfSvV82+FhaWrmkU+o
	9hRNDPcOi4BEm/aXUoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xSI-00DdXZ-0K;
	Tue, 30 May 2023 11:23:58 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xSD-00DdV3-1O;
	Tue, 30 May 2023 11:23:56 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9B7155FD2C;
	Tue, 30 May 2023 14:23:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685445826;
	bh=/2VvlUBuwK951x+75yuFgWs7gQ9TMyja2/uS8g7dZvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=W3vlx6ZsnwPU8yTJla34qUgzxmWVw3GHjtFLYJeTmn1ZwWy6rqXivAOeD0YEsHzz0
	 16kcIJqfHZD0n+HscQR7PMJ3d553RfRaY0m+ZZkRPWYf7nUjbM2rgKd6XYCRAkhES+
	 c81/4FFLwFwg8P6QaWYgrXuMrh53sF/3u2FXi/QVWdxYH5t+JVQWPS+Hd68ieCZ4pa
	 xgW9XTYBTJmviIJAsHwSNxKePg3r5IGCJUX+ef3BIkdYCjapZy3O1fotL5YzEBXH7C
	 ymdNTq4Hug4Vl/Sc6CnRHw3DG9fp4NeHsZB6viaF+6riGJuzzmtbr33Q4mEaayeaJ/
	 Bv7AwCH9RK6WQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 30 May 2023 14:23:45 +0300 (MSK)
Message-ID: <6077c959-f566-d399-d2be-8460eb063415@sberdevices.ru>
Date: Tue, 30 May 2023 14:19:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/5] mtd: rawnand: meson: fix command sequence for
 read/write
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
 <20230515094440.3552094-2-AVKrasnov@sberdevices.ru>
 <20230522170526.6486755a@xps-13>
 <9013b0e2-c923-43f8-0bd6-979bf0c23ebc@sberdevices.ru>
 <abeadc03-a69c-be1c-3c6a-6ce492a5e4f6@sberdevices.ru>
 <20230526192205.4a69ca79@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230526192205.4a69ca79@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/30 07:59:00 #21376339
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_042354_156727_D22A46E1 
X-CRM114-Status: GOOD (  28.65  )
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

CgpPbiAyNi4wNS4yMDIzIDIwOjIyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjQgTWF5IDIwMjMg
MTI6MDU6NDcgKzAzMDA6Cj4gCj4+IE9uIDIzLjA1LjIwMjMgMTI6MTIsIEFyc2VuaXkgS3Jhc25v
diB3cm90ZToKPj4+IEhlbGxvIE1pcXVlbCwgTGlhbmcKPj4+Cj4+PiBPbiAyMi4wNS4yMDIzIDE4
OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4+Pj4gSGkgQXJzZW5peSwKPj4+Pgo+Pj4+IEFW
S3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDE1IE1heSAyMDIzIDEyOjQ0OjM1
ICswMzAwOgo+Pj4+ICAKPj4+Pj4gVGhpcyBmaXhlcyByZWFkL3dyaXRlIGZ1bmN0aW9uYWxpdHkg
Ynk6Cj4+Pj4+IDEpIENoYW5naW5nIE5GQ19DTURfUkJfSU5UIGJpdCB2YWx1ZS4gIAo+Pj4+Cj4+
Pj4gSSBndWVzcyB0aGlzIGlzIGEgc2VwYXJhdGUgZml4Cj4+Pj4gIAo+Pj4KPj4+IE9rLCBJJ2xs
IG1vdmUgaXQgdG8gc2VwYXJhdGUgcGF0Y2gKPj4+ICAgCj4+Pj4+IDIpIEFkZGluZyBleHRyYSBO
QU5EX0NNRF9TVEFUVVMgY29tbWFuZCBvbiBlYWNoIHIvdyByZXF1ZXN0LiAgCj4+Pj4KPj4+PiBJ
cyB0aGlzIHJlYWxseSBuZWVkZWQ/IExvb2tzIGxpa2UgeW91J3JlIGRlbGF5aW5nIHRoZSBuZXh0
IG9wIG9ubHkuIElzCj4+Pj4gdXNpbmcgYSBkZWxheSBlbm91Z2g/IElmIHllcywgdGhlbiBpdCdz
IHByb2JhYmx5IHRoZSB3cm9uZyBhcHByb2FjaC4gIAo+Pgo+PiBIaSBNaXF1ZWwsIHNtYWxsIHVw
ZGF0ZSwgSSBmb3VuZCBzb21lIGRldGFpbHMgZnJvbSBATGlhbmcncyBtZXNzYWdlIGluIHYxIHRh
bGtzIGZyb20gdGhlIGxhc3QgbW9udGg6Cj4+Cj4+ICoKPj4gQWZ0ZXIgc2VuZGluZyBOQU5EX0NN
RF9SRUFEMCwgYWRkcmVzcywgTkFORF9DTURfUkVBRFNUQVJUIGFuZCByZWFkIHN0YXR1cyhOQU5E
X0NNRF9TVEFUVVMgPSAweDcwKSBjb21tYW5kcywgaXQgc2hvdWxkIHNlbmQKPj4gTkFORF9DTURf
UkVBRDAgY29tbWFuZCBmb3IgZXhpdGluZyB0aGUgcmVhZCBzdGF0dXMgbW9kZSBmcm9tIHRoZSBk
YXRhc2hlZXQgZnJvbSBOQU5EIGRldmljZS4KPiAKPiBUaGF0IGlzIHRydWUuCj4gCj4+IGJ1dCBw
cmV2aW91cyBtZXNvbl9uZmNfcXVldWVfcmIoKQo+PiBvbmx5IGNoZWNrcyB0aGUgUmVhZHkvQnVz
eSBwaW4gYW5kIGl0IGRvZXNuJ3Qgc2VuZCByZWFkIHN0YXR1cyhOQU5EX0NNRF9TVEFUVVMgPSAw
eDcwKSBjb21tYW5kLgo+PiBpIHRoaW5rIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRo
ZSBSZWFkeS9CdXN5IHBpbihwbGVhc2UgY2hlY2sgdGhlIGhhcmR3YXJlIHdoZXRoZXIgdGhpcwo+
PiBSZWFkeS9CdXN5IHBpbiBpcyBjb25uZWN0ZWQgd2l0aCBTT0MpIG9yIHRoZSBzb3VyY2UgY29k
ZS4gaSBoYXZlIHRoZSBib2FyZCB3aXRob3V0IFJlYWR5L0J1c3kgcGluIGFuZCBwcmVmZXIgdG8g
dXNlIHRoZQo+PiBuZmMgY29tbWFuZCBjYWxsZWQgUkJfSU82LiBpdCBzZW5kcyBOQU5EX0NNRF9T
VEFUVVMgY29tbWFuZCBhbmQgY2hlY2tzIGJpdDYgb2YgdGhlIHN0YXR1cyByZWdpc3RlciBvZiBO
QU5EIGRldmljZSBmcm9tIHRoZQo+PiBkYXRhIGJ1cyBhbmQgZ2VuZXJhdGUgSVJRIGlmIHJlYWR5
Lgo+PiAqCj4+Cj4+IEkgZ3Vlc3MsIHRoYXQgc2VxdWVuY2Ugb2YgY29tbWFuZHMgZnJvbSB0aGlz
IHBhdGNoIGlzIGRlc2NyaWJlZCBpbiBkYXRhc2hlZXQgKHVuZm9ydHVuYXRlbHkgSSBkb24ndCBo
YXZlIGl0IGFuZCByZWxpZWQgb24gdGhlIG9sZCBkcml2ZXIpLgo+PiBZZXN0ZXJkYXkgSSB0cmll
ZCB0byByZW1vdmUgc2VuZGluZyBvZiBOQU5EX0NNRF9TVEFUVVMgZnJvbSB0aGlzIHBhdGNoLCBi
dXQgaXQgYnJva2UgY3VycmVudCBkcml2ZXIgLSBpIGhhZCBFQ0MgZXJyb3JzLCBzbyBpdCBsb29r
cyBsaWtlCj4+ICJzaG90IGluIHRoZSBkYXJrIiBzaXR1YXRpb24sIHRvIHVuZGVyc3RhbmQgdGhp
cyBsb2dpYy4KPiAKPiBXaGVuIGFuIG9wZXJhdGlvbiBvbiB0aGUgTkFORCBhcnJheSBoYXBwZW5z
IChlZy4gcmVhZCwgcHJvZywgZXJhc2UpLAo+IHlvdSBuZWVkIHRvIHdhaXQgInNvbWUgdGltZSIg
YmVmb3JlIGFjY2Vzc2luZyB0aGUgaW50ZXJuYWwgc3JhbSBvciBldmVuCj4gdGhlIGNoaXAgd2hp
Y2ggaXMgImJ1c3kiIHVudGlsIGl0IGdldHMgInJlYWR5IiBhZ2Fpbi4gWW91IGNhbiBwcm9iZSB0
aGUKPiByZWFkeS9idXN5IHBpbiAodGhhdCdzIHRoZSBoYXJkd2FyZSB3YXksIGZhc3QgYW5kIHJl
bGlhYmxlKSBvciB5b3UgY2FuCj4gcG9sbCBhIHN0YXR1cyB3aXRoIE5BTkRfQ01EX1NUQVRVUy4g
VGhlIGNoaXBzIGFyZSBkZXNpZ25lZCBzbyB0aGV5IGNhbgo+IGFjdHVhbGx5IHByb2Nlc3MgdGhh
dCBjb21tYW5kIHdoaWxlIHRoZXkgYXJlIGRvaW5nIHRpbWUgY29uc3VtaW5nIHRhc2tzCj4gdG8g
dXBkYXRlIHRoZSBob3N0LiBCdXQgSUlSQyBldmVyeSBieXRlIHJlYWQgd2lsbCByZXR1cm4gdGhl
IHN0YXR1cwo+IHVudGlsIHlvdSBzZW5kIFJFQUQwIGFnYWluLCB3aGljaCBtZWFucyAiSSdtIGRv
bmUgd2l0aCB0aGUgc3RhdHVzCj4gcmVhZCIgc29tZWhvdy4KPiAKPiBQbGVhc2Ugc2VlIG5hbmRf
c29mdF93YWl0cmR5KCkgaW4gb3JkZXIgdG8gdW5kZXJzdGFuZCBob3cgdGhpcyBpcwo+IHN1cHBv
c2VkIHRvIHdvcmsuIFlvdSBjYW4gZXZlbiB1c2UgdGhhdCBoZWxwZXIgKHdoaWNoIGlzIGV4cG9y
dGVkKQo+IGluc3RlYWQgb2Ygb3Blbi1jb2RpbmcgaXQgaW4geW91ciBkcml2ZXIuIFNlZSBhdG1l
bCBvciBzdW54aQo+IGltcGxlbWVudGF0aW9ucyBmb3IgaW5zdGFuY2UuCj4gCj4gQXMgdXNpbmcg
dGhlIG5hdGl2ZSBSQiBwaW4gaXMgYmV0dGVyLCB5b3Ugd291bGQgbmVlZCB0byBpZGVudGlmeQo+
IHdoZXRoZXIgeW91IGhhdmUgb25lIG9yIG5vdCBhdCBwcm9iZSB0aW1lIGFuZCB0aGVuIGVpdGhl
ciBwb2xsIHRoZQo+IHJlbGV2YW50IGJpdCBvZiB5b3VyIGNvbnRyb2xsZXIgaWYgdGhlcmUgaXMg
b25lLCBvciBmYWxsYmFjayB0byB0aGUKPiBzb2Z0IHJlYWQgKHdoaWNoIHNob3VsZCBmYWxsYmFj
ayBvbiBleGVjX29wIGluIHRoZSBlbmQpLgoKVGhhbmtzIGZvciB0aGlzIGluZm9ybWF0aW9uISBJ
J2xsIHVzZSAnbmFuZF9zb2Z0X3dhaXRyZHkoKScgYXQgbGVhc3QsIGJlY2F1c2UgaSBndWVzcyB0
aGF0CnRoZXJlIGlzIG5vIFJCIHBpbiBvbiBteSBkZXZpY2UuCgpUaGFua3MsIEFyc2VuaXkKCj4g
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
