Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF3AC7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0MgRhls04PTPMrCD7m/GBsdicUdYWQqyvCjkYR+jsQ=; b=hpfS4nYrlLnfEY
	uV+80APn0TIX3WcGj8zeOEaw/3mDRSyvkMmLzAD9XWhhgQYSaDgy9qIjhZoROZnuTcyRVkFF5C7l8
	rfr4SNRaUGlGJ3NFf9fv0fusLNhVfuIH91cHVP1AkmCBN/Ory5Q86IseZuR2wzFLsQZZck5w1gvSR
	VNYCK+nwUx+IptoOhQAPfFJp+rMtR3+DKdpjrYBWlLgFm8Bi1rGjIYwsq93GivzlJgpdN8faA4pt6
	HH2/Hcs6OK+II0oGeup4eFzZLcsD4nJg9xqWj0VqPh74zOlA4ON27MB/JA3FlB2wR2qsvhOez8PmH
	+Xf7p9JQgIywfb0ZIoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dAK-002Rdj-2v;
	Thu, 01 Jun 2023 07:56:12 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dAF-002RaA-04;
	Thu, 01 Jun 2023 07:56:10 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5F8345FD78;
	Thu,  1 Jun 2023 10:56:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685606162;
	bh=bynRxu2YS2NLYpOmBv2P/K8koFPB1hWG1xtDiAfV4T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=cL7PeMXRt3ihVTWPNXGzKvOMMMOiY7WEQihZFjoSYMlglG1bLGikbytyTWa3c3Rqh
	 0rfq5pWthpQgdmVKG49RrtT/RaOk1zr3Fx96wgr//DrwwmGE+QFCfidyjaSlPFdyGj
	 ydbNeoiO+ysojESbIMh6FDx1xAjkZG6bJxPqVo3/cX4JEzWLVO1ovaLa8x4cw5qkAp
	 gtyLynlDmJ8rR2yhXGGXk8pUrmBbJpyC/lnNjJmjE4i7sZHRacJnstd0dai/f7RviL
	 lEUZccZtCygh3ATOXWIqFa8KHjfAZ5IlR+AknuCDnPHM9pXYNUgaboVFz9UFH+1jl2
	 LS3dBqUsYExJA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  1 Jun 2023 10:56:01 +0300 (MSK)
Message-ID: <c1380e3b-e439-3240-d193-572205f5a860@sberdevices.ru>
Date: Thu, 1 Jun 2023 10:51:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v5 0/6] refactoring, fixes and updates for Meson NAND
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
 <20230601095041.30d646d2@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230601095041.30d646d2@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/01 03:13:00 #21393813
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_005607_760666_8129F918 
X-CRM114-Status: GOOD (  23.45  )
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

CgpPbiAwMS4wNi4yMDIzIDEwOjUwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgMSBKdW4gMjAyMyAw
OToxODo0MyArMDMwMDoKPiAKPj4gSGVsbG8sCj4+Cj4+IHRoaXMgcGF0Y2hzZXQgZG9lcyBzZXZl
cmFsIHRoaW5nczoKPiAKPiBBbGwgdGhlIGZpeGVzIHNob3VsZCBjb250YWluOgo+IAo+IEZpeGVz
OiA8aGFzaD4gKCJsb2ciKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCgpIZWxsbyBNaXF1
ZWwsCgpTb3JyeS4gbXkgZmF1bHQsIEknbGwgYWRkIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbiBm
b3IgMDAwMSAoYW55d2F5IGkgdGhpbmsgY3VycmVudCBpcyBub3QgZmluYWwpLgoKVGhhbmtzLCBB
cnNlbml5Cgo+IAo+Pgo+PiAxKSBGaXhlcyB2YWx1ZSBvZiByZWFkeS9idXN5IGNvbW1hbmQuIFRo
aXMgbmV3IHZhbHVlIHdhcyBzdWdnZXN0ZWQgYnkKPj4gICAgTGlhbmcgWWFuZyA8bGlhbmcueWFu
Z0BhbWxvZ2ljLmNvbT4uCj4+Cj4+IDIpIEFkZHMgd2FpdGluZyBmb3IgY29tbWFuZCBjb21wbGV0
aW9uIGJ5IGNhbGxpbmcgJ25hbmRfc29mdF93YWl0cmR5KCknCj4+ICAgIGluc3RlYWQgb2YgdXNp
bmcgcmVhZHkvYnVzeSBwaW4gYW5kIGNvbW1hbmQgZnJvbSAxKS4gVGhpcyBpcyByZWFsbHkKPj4g
ICAgbmVlZGVkIGJlY2F1c2UgSSBkb24ndCBoYXZlIGRldmljZSB3aXRoIHN1Y2ggcGluIGltcGxl
bWVudGVkLgo+Pgo+PiAzKSBJdCBtb3ZlcyBPT0IgZnJlZSBieXRlcyB0byBub24tcHJvdGVjdGVk
IGJ5IEVDQyBhcmVhLiBIZXJlIGFyZSBzb21lCj4+ICAgIGRldGFpbHM6Cj4+Cj4+ICAgIEN1cnJl
bnQgT09CIGZyZWUgYnl0ZXMgYXJlIDQgYnl0ZXMgKDIgeCAyIHVzZXIgYnl0ZXMpIHVuZGVyIEVD
QyBlbmdpbmUuCj4+ICAgIEhlcmUgaXMgaG93IGl0IGxvb2tzIGxpa2UgaW4gdGhlIGN1cnJlbnQg
aW1wbGVtZW50YXRpb246Cj4+Cj4+ICAgIFsgMkIgdXNlciBieXRlcyBdWyAgICAgMTRCIEVDQyBj
b2RlcyAgICBdCj4+ICAgIFsgMkIgdXNlciBieXRlcyBdWyAgICAgMTRCIEVDQyBjb2RlcyAgICBd
Cj4+ICAgIFsgMTZCIHVudXNlZCBhcmVhLCBub3QgcHJvdGVjdGVkIGJ5IEVDQyBdCj4+ICAgIFsg
MTZCIHVudXNlZCBhcmVhLCBub3QgcHJvdGVjdGVkIGJ5IEVDQyBdCj4+Cj4+ICAgIEFsbCA0IHVz
ZXIgYnl0ZXMgYXJlIHByb3RlY3RlZCBieSBFQ0MuIFRoaXMgcGF0Y2ggY2hhbmdlcyBPT0IgZnJl
ZQo+PiAgICBieXRlcyBpbiB0aGlzIHdheToKPj4KPj4gICAgWyAyQiB1bnVzZWQgYXJlYSBdWyAg
ICAgMTRCIEVDQyBjb2RlcyAgICAgXQo+PiAgICBbIDJCIHVudXNlZCBhcmVhIF1bICAgICAxNEIg
RUNDIGNvZGVzICAgICBdCj4+ICAgIFsgIDE2QiB1c2VyIGJ5dGVzLCBub3QgcHJvdGVjdGVkIGJ5
IEVDQyAgIF0KPj4gICAgWyAgMTZCIHVzZXIgYnl0ZXMsIG5vdCBwcm90ZWN0ZWQgYnkgRUNDICAg
XQo+Pgo+PiAgICBOb3cgT09CIHVzZXIgYnl0ZXMgYXJlIDMyIGJ5dGVzIGluc3RlYWQgb2YgNCBi
eXRlcyBhbmQgbm90IHByb3RlY3RlZAo+PiAgICBieSBFQ0MuCj4+Cj4+ICAgIE1vdGl2YXRpb24g
b2YgdGhpcyBsYXlvdXQgY29tZXMgZnJvbSBwcm9ibGVtIHdpdGggSkZGUzIuIEl0IHVzZXMgT09C
Cj4+ICAgIGZyZWUgYnl0ZXMgZm9yIGNsZWFubWFya2Vycy4gRWFjaCBjbGVhbm1hcmtlciBpcyA0
IGJ5dGVzIGFuZCB3cml0dGVuCj4+ICAgIGJ5IEpGRlMyIGRyaXZlciAoc21hbGwgcmVtYXJrIC0g
Y2xlYW5tYXJrZXJzIGFyZSBhbHdheXMgd3JpdHRlbiBpbgo+PiAgICBjYXNlIG9mIE5BTkQgc3Rv
cmFnZSBmb3IgSkZGUzIpLgo+PiAgICBXZSBoYXZlIHR3byB3YXlzIHRvIHdyaXRlIHRoaXMgZGF0
YSB0byBPT0IgKGUuZy4gdXNlciBieXRlcyk6Cj4+Cj4+ICAgIDEpIEVDQyBtb2RlLiBJbiB0aGlz
IGNhc2UgaXQgd2lsbCBiZSBFQ0MgY292ZXJlZCB1c2VyIGJ5dGVzLCBlLmcuCj4+ICAgICAgIHdy
aXRpbmcgdGhpcyBieXRlcyB3aWxsIHVwZGF0ZSBFQ0MgY29kZXMuIFByb2JsZW0gZmlyZXMsIHdo
ZW4KPj4gICAgICAgSkZGUzIgdHJpZXMgdG8gd3JpdGUgdGhpcyBwYWdlIGxhdGVyIC0gdGhpcyB3
cml0ZSBtYWtlcyBjb250cm9sbGVyCj4+ICAgICAgIHRvIHVwZGF0ZSBFQ0MgY29kZXMgYWdhaW4s
IGJ1dCBpdCBpcyBpbXBvc3NpYmxlIHRvIGRvIGl0IGNvcnJlY3RseSwKPj4gICAgICAgYmVjYXVz
ZSB3ZSBjYW4ndCB1cGRhdGUgYml0cyBmcm9tIDAgdG8gMSAob25seSBmcm9tIDEgdG8gMCkuCj4+
Cj4+ICAgIDIpIFJhdyBtb2RlLiBJbiB0aGlzIGNhc2UgRUNDIGNvZGVzIHdvbid0IGJlIHVwZGF0
ZWQuIEJ1dCBsYXRlciwgaXQKPj4gICAgICAgd2lsbCBiZSBpbXBvc3NpYmxlIHRvIHJlYWQgdGhp
cyBwYWdlIGluIEVDQyBtb2RlLCBiZWNhdXNlIHdlIGhhdmUKPj4gICAgICAgc29tZSB1c2VyIGJ5
dGVzLCBidXQgRUNDIGNvZGVzIGFyZSBtaXNzZWQuCj4+Cj4+ICAgIFNvIGxldCdzIG1vdmUgT09C
IGZyZWUgYnl0ZXMgb3V0IG9mIEVDQyBhcmVhLiBJbiB0aGlzIGNhc2Ugd2UgY2FuCj4+ICAgIHJl
YWQvd3JpdGUgT09CIHNlcGFyYXRlbHkgaW4gcmF3IG1vZGUgYW5kIGF0IHRoZSBzYW1lIHRpbWUg
d29yayB3aXRoCj4+ICAgIGRhdGEgaW4gRUNDIG1vZGUuIEpGRlMyIGlzIGhhcHB5IG5vdy4gVXNl
ciBieXRlcyBhcmUgdW50b3VjaGVkIC0gYWxsCj4+ICAgIG9mIHRoZW0gYXJlIGlnbm9yZWQgZHVy
aW5nIG5vbi1PT0IgYWNjZXNzLgo+Pgo+PiAgICBJJ3ZlIHRlc3RlZCB0aGlzIHdpdGggbW91bnQv
dW5tb3VudC9yZWFkL3dyaXRlIGNhc2VzIGZvciBKRkZTMiBhbmQKPj4gICAgbmFuZGR1bXAvbmFu
ZHdyaXRlIHV0bGl0aWVzIG9uIEFYRyBmYW1pbHkgKEExMTNYIFNvQykuCj4+Cj4+ICAgIEhlcmUg
aXMgbGluayB0byBkaXNjdXNzaW9uOgo+PiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tdGQvYTlmODMwN2EtNzdkNy1hNjlmLWNlMTEtMjYyOTkwOTE3MmQyQHNiZXJkZXZpY2VzLnJ1
L1QvI20zMDg3YmQwNjM4NmE3ZjQzMGNkNWUzNDNlMjJiMjVkNzI0ZDNlMmQ3Cj4+Cj4+IDQpIFJl
cGxhY2VzIGNhbGN1bGF0aW9uIG9mIE9PQiByZWxhdGVkIHRoaW5nIHdpdGggbWFjcm9zLiBUaGlz
IGlzIGp1c3QKPj4gICAgY29zbWV0aWMgY2hhbmdlLgo+Pgo+PiA1KSBDaGVja3MgYnVmZmVyIGxl
bmd0aCBvbiBhY2Nlc3NlcyB0byBOQU5EIGNvbnRyb2xsZXIuCj4+Cj4+IDYpIFJlbW92ZXMgdXNl
bGVzcyBiaXR3aXNlIE9SIHdpdGggemVyb2VzLgo+Pgo+PiBMaW5rIHRvIHYxOgo+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMzA0MTIwNjE3MDAuMTQ5MjQ3NC0xLUFWS3Jh
c25vdkBzYmVyZGV2aWNlcy5ydS8KPj4gTGluayB0byB2MjoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkLzIwMjMwNDI2MDczNjMyLjM5MDU2ODItMS1BVktyYXNub3ZAc2JlcmRl
dmljZXMucnUvCj4+IExpbmsgdG8gdjM6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW10ZC8yMDIzMDUxMDExMDgzNS4yNjExNS0xLUFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydS8KPj4g
TGluayB0byB2NDoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMwNTE1
MDk0NDQwLjM1NTIwOTQtMS1BVktyYXNub3ZAc2JlcmRldmljZXMucnUvCj4+Cj4+IENoYW5nZWxv
ZzoKPj4KPj4gdjEgLT4gdjI6Cj4+ICAqIEFkZCBwYXRjaCB3aGljaCByZW5hbWVzIGR0cyB2YWx1
ZSBmb3IgY2hpcCBzZWxlY3QuCj4+ICAqIEFkZCBwYXRjaCB3aGljaCBtb3ZlcyBPT0IgdG8gbm9u
LXByb3RlY3RlZCBFQ0MgYXJlYS4KPj4gdjIgLT4gdjM6Cj4+ICAqIENoYW5nZSBwYXRjaCB3aGlj
aCBmaXhlcyByZWFkL3dyaXRlIGFjY2VzcyBhY2NvcmRpbmcgZGlzY3Vzc2lvbiBsaW5rCj4+ICAg
IGluIDEpIGFib3ZlLgo+PiB2MyAtPiB2NDoKPj4gICogUmVtb3ZlIHBhdGNoIHdoaWNoIHJlbmFt
ZXMgZHRzIHZhbHVlIGZvciBjaGlwIHNlbGVjdC4KPj4gICAgSGVyZSBpcyBsaW5rIHRvIGRpc2N1
c3Npb246Cj4+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDUxMDEx
MDgzNS4yNjExNS03LUFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydS8KPj4gICogUGFzcyAxIHRvICdt
ZXNvbl9uZmNfcXVldWVfcmIoKScgaW4gY2FzZSBvZiBOQU5EX09QX1dBSVRSRFlfSU5TVFIuCj4+
ICAgIFRoaXMgZml4ZXMgT05GSSBwYWdlIHByb2Nlc3NpbmcgZHVyaW5nIE5BTkQgZHJpdmVyIGlu
aXRpYWxpemF0aW9uLgo+PiB2NCAtPiB2NToKPj4gICogTW92ZSB1cGRhdGUgb2YgJ05GQ19DTURf
UkJfSU5UJyB0byB0aGUgc2VwYXJhdGUgcGF0Y2guCj4+ICAqIFJlcGxhY2UgY29kZSB3aGljaCB1
c2VzIGV4dHJhIHN0YXR1cyBhbmQgUkVBRDAgY29tbWFuZHMgZm9yIHdhaXRpbmcKPj4gICAgY29t
bWFuZCB3aXRoICduYW5kX3NvZnRfd2FpdHJkeSgpJy4gSW4gZmFjdCB0aGlzIHBhdGNoIGFkZHMg
c2Vjb25kCj4+ICAgIG1vZGUgZm9yIGNvbW1hbmQgd2FpdGluZyBieSB1c2luZyAnbmFuZF9zb2Z0
X3dhaXRyZHkoKScuCj4+ICAqIEZvciBPT0IgbGF5b3V0IHBhdGNoIHNlZSBjaGFuZ2Vsb2cgaW4g
YSBwYXRjaCBmaWxlLgo+PiAgKiBGb3IgY2hlY2sgbGVuZ3RoIHBhdGNoIHNlZSBjaGFuZ2Vsb2cg
aW4gYSBwYXRjaCBmaWxlLgo+Pgo+PiBBcnNlbml5IEtyYXNub3YgKDYpOgo+PiAgIG10ZDogcmF3
bmFuZDogbWVzb246IGZpeCByZWFkeS9idXN5IGNvbW1hbmQKPj4gICBtdGQ6IHJhd25hbmQ6IG1l
c29uOiB3YWl0IGZvciBjb21tYW5kIGluIHBvbGxpbmcgbW9kZQo+PiAgIG10ZDogcmF3bmFuZDog
bWVzb246IG9ubHkgZXhwb3NlIHVucHJvdGVjdGVkIHVzZXIgT09CIGJ5dGVzCj4+ICAgbXRkOiBy
YXduYW5kOiBtZXNvbjogdXNlIG1hY3JvIGZvciBPT0IgYXJlYQo+PiAgIG10ZDogcmF3bmFuZDog
bWVzb246IGNoZWNrIGJ1ZmZlciBsZW5ndGgKPj4gICBtdGQ6IHJhd25hbmQ6IG1lc29uOiByZW1v
dmUgdW5uZWVkZWQgYml0d2lzZSBPUiB3aXRoIHplcm9lcwo+Pgo+PiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWVzb25fbmFuZC5jIHwgMjM0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkKPj4K
PiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
