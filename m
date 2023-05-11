Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D40FC7EE23
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK0k6yX0nguHrRxQhf4kVVB/hRacS4OF16hxhM5AMLE=; b=JcJU31+EgZA9ki
	9wWIu3XfM+ZY2xNZqCE18E7ULetPrg9NtV39izdpOqKQDpQqpQsT4ChyctBjmQUeEUZaYHs6HVzvW
	mBSjbboCjrvsKFrqDhX2u77nFse7gS0PlA7iFURpX2gQCI5U0be3/lLj6NflN9fO3eINGsWxxo5E0
	59NMBX8uFZ4NthtRchUBJheo6s6BDP7XiFHS5wnbEqXXjh5Qavx3GE6cyZVUfrH4VUDIQvBMJy35l
	igLWG4Zm9b2kBowSuKm5XNN8Sw/11nCPcmMkPBBL5j3X+9k8szCM9gVNg0JE2VFdktQZFMXRuphxK
	E+dMCcC4lTW7ncnzWz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px7GN-0092wb-0j;
	Thu, 11 May 2023 14:27:23 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7GF-0092rg-1X;
	Thu, 11 May 2023 14:27:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E60AD5FD5F;
	Thu, 11 May 2023 17:27:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683815227;
	bh=OOGyq9QUQNcw+0a29UyuN8CJKRkiCc3k+duQU4ZS88w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=qxiU6mkUjaVtYXJJcGegmKUHRiop7ns9kifYw8FlqkklvKDBz54qw+xFsy298pYt7
	 KgWcFPFsd7zuRB5tAvKVqyYVpd5ps8GBYMLq+Uk7uRVtSnfRYcuLNhNmvHR3is51cu
	 E4CSBgcbw37jBgYct8qCfiZ4rgQNxwEBgNG7ih/XH1QkZ6N590vA4U72C6iPOyu6zw
	 xWIrjzT4LQ0EMWUBzPLmz8FWjjZViiSkymlTFk7z6+wL2VIn37ixOEnXi30K3L6DaI
	 BuVr8RQdr89vR4rvrQY5NnNvZQ/xZzmmBhxEKnQ2ObNA75eDQuLK8XiZeNacTeO8wl
	 VqfaDTgnH96zA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 17:27:05 +0300 (MSK)
Message-ID: <0b0bb315-8e5c-fb30-7786-34824b8d385d@sberdevices.ru>
Date: Thu, 11 May 2023 17:22:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
 <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
 <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
 <20230510225359.061c2df6@xps-13>
 <6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
 <20230511111204.0b0b3d70@xps-13>
 <dd25efa3-e46a-e857-d355-53330a8a4181@sberdevices.ru>
 <4561f558-1d34-a7a9-2a05-f6453b0ed9a9@sberdevices.ru>
 <20230511141114.04cbd9f1@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230511141114.04cbd9f1@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_072716_238496_FB81BFC3 
X-CRM114-Status: GOOD (  26.62  )
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

CgpPbiAxMS4wNS4yMDIzIDE1OjExLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgMTEgTWF5IDIwMjMg
MTM6MTY6NTkgKzAzMDA6Cj4gCj4+IE9uIDExLjA1LjIwMjMgMTI6MTcsIEFyc2VuaXkgS3Jhc25v
diB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMTEuMDUuMjAyMyAxMjoxMiwgTWlxdWVsIFJheW5hbCB3
cm90ZTogIAo+Pj4+IEhpIEFyc2VuaXksCj4+Pj4KPj4+PiBhdmtyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gVGh1LCAxMSBNYXkgMjAyMyAxMTo1OTowNyArMDMwMDoKPj4+PiAgCj4+Pj4+
IE9uIDEwLjA1LjIwMjMgMjM6NTMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+Cj4+Pj4+IEhl
bGxvIE1hcnRpbiwgTWlxdWVsCj4+Pj4+ICAKPj4+Pj4+IEhpIE1hcnRpbiAmIEFyc2VuaXksCj4+
Pj4+Pgo+Pj4+Pj4gbWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbSB3cm90ZSBvbiBX
ZWQsIDEwIE1heSAyMDIzIDIyOjQwOjM3Cj4+Pj4+PiArMDIwMDoKPj4+Pj4+ICAgICAKPj4+Pj4+
PiBIZWxsbyBBcnNlbml5LAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gV2VkLCBNYXkgMTAsIDIwMjMgYXQg
MToxM+KAr1BNIEFyc2VuaXkgS3Jhc25vdgo+Pj4+Pj4+IDxBVktyYXNub3ZAc2JlcmRldmljZXMu
cnU+IHdyb3RlOiAgICAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhpcyByZW5hbWVzIG5vZGUgd2l0aCB2
YWx1ZXMgZm9yIGNoaXAgc2VsZWN0IGZyb20gInJlZyIgdG8gImNzIi4gSXQgaXMKPj4+Pj4+Pj4g
bmVlZGVkIGJlY2F1c2Ugd2hlbiBPVFAgYWNjZXNzIGlzIGVuYWJsZWQgb24gdGhlIGF0dGFjaGVk
IHN0b3JhZ2UsIE1URAo+Pj4+Pj4+PiBzdWJzeXN0ZW0gcmVnaXN0ZXJzIHRoaXMgc3RvcmFnZSBp
biB0aGUgTlZNRU0gc3Vic3lzdGVtLiBOVk1FTSBpbiB0dXJuCj4+Pj4+Pj4+IHRyaWVzIHRvIHVz
ZSAicmVnIiBub2RlIGluIGl0cyBvd24gbWFubmVyLCBzdXBwb3NlcyB0aGF0IGl0IGhhcyBhbm90
aGVyCj4+Pj4+Pj4+IGxheW91dC4gQWxsIG9mIHRoaXMgbGVhZHMgdG8gZGV2aWNlIGluaXRpYWxp
emF0aW9uIGZhaWx1cmUuICAgICAgCj4+Pj4+Pj4gSW4gZ2VuZXJhbDogaWYgd2UgY2hhbmdlIHRo
ZSBkZXZpY2UtdHJlZSBpbnRlcmZhY2UgKGluIHRoaXMgY2FzZToKPj4+Pj4+PiByZXBsYWNpbmcg
YSAicmVnIiB3aXRoIGEgImNzIiBwcm9wZXJ0eSkgdGhlIGR0LWJpbmRpbmdzIGhhdmUgdG8gYmUK
Pj4+Pj4+PiB1cGRhdGVkIGFzIHdlbGwuICAgIAo+Pj4+Pj4KPj4+Pj4+IFRydWUsIGFuZCBJIHdv
dWxkIGFkZCwgYmluZGluZ3Mgc2hvdWxkIG5vdCBiZSBicm9rZW4uICAgIAo+Pj4+Pgo+Pj4+PiBJ
IHNlZSwgdGhhdCdzIHRydWUuIFRoYXQgaXMgYmFkIHdheSB0byBjaGFuZ2UgYmluZGluZ3MuCj4+
Pj4+ICAKPj4+Pj4+ICAgICAKPj4+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGFuZAo+Pj4+Pj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgc2hvdwo+Pj4+Pj4+
IHRoYXQgdGhlIGNoaXAgc2VsZWN0IG9mIGEgTkFORCBjaGlwIGlzIHNwZWNpZmllZCB3aXRoIGEg
InJlZyIKPj4+Pj4+PiBwcm9wZXJ0eS4gICAgCj4+Pj4+Pgo+Pj4+Pj4gQWxsIE5BTkQgY29udHJv
bGxlciBiaW5kaW5nIGV4cGVjdCB0aGUgY2hpcC1zZWxlY3QgdG8gYmUgaW4gdGhlCj4+Pj4+PiAn
cmVnJyBwcm9wZXJ0eSwgdmVyeSBtdWNoIGxpa2UgYSBzcGkgZGV2aWNlIHdvdWxkIHVzZSByZWcg
dG8gc3RvcmUgdGhlCj4+Pj4+PiBjcyBhcyB3ZWxsOiB0aGUgcmVnIHByb3BlcnR5IHRlbGxzIHlv
dSBob3cgeW91IGFkZHJlc3MgdGhlIGRldmljZS4KPj4+Pj4+Cj4+Pj4+PiBJIGFsc28gZnVsbHkg
YWdyZWUgd2l0aCBNYXJ0aW4ncyBjb21tZW50cyBiZWxvdy4gQ2hhbmdpbmcgcmVnIGlzIGxpa2Vs
eQo+Pj4+Pj4gYSB3cm9uZyBhcHByb2FjaCA6KQo+Pj4+Pj4gICAgIAo+Pj4+Pj4+IEFsc28gdGhl
IGNvZGUgaGFzIHRvIGJlIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdpdGggb2xkIC5kdGJzLgo+Pj4+
Pj4+ICAgIAo+Pj4+Pj4+PiBFeGFtcGxlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBbLi4uXSBudm1lbSBt
dGQwLXVzZXItb3RwOiBudm1lbTogaW52YWxpZCByZWcgb24gL3NvYy9idXNAZmZlMDAwMDAvLi4u
Cj4+Pj4+Pj4+IFsuLi5dIG10ZCBtdGQwOiBGYWlsZWQgdG8gcmVnaXN0ZXIgT1RQIE5WTUVNIGRl
dmljZQo+Pj4+Pj4+PiBbLi4uXSBtZXNvbi1uYW5kIGZmZTA3ODAwLm5mYzogZmFpbGVkIHRvIHJl
Z2lzdGVyIE1URCBkZXZpY2U6IC0yMgo+Pj4+Pj4+PiBbLi4uXSBtZXNvbi1uYW5kIGZmZTA3ODAw
Lm5mYzogZmFpbGVkIHRvIGluaXQgTkFORCBjaGlwcwo+Pj4+Pj4+PiBbLi4uXSBtZXNvbi1uYW5k
OiBwcm9iZSBvZiBmZmUwNzgwMC5uZmMgZmFpbGVkIHdpdGggZXJyb3IgLTIyICAgICAgCj4+Pj4+
Pj4gVGhpcyBpcyBvZGQgLSBjYW4geW91IHBsZWFzZSBzaGFyZSB5b3VyIGRlZmluaXRpb24gb2Yg
dGhlICZuZmMgbm9kZT8gICAgCj4+Pj4+Cj4+Pj4+IFN1cmUsIGhlcmUgaXQgaXM6Cj4+Pj4+Cj4+
Pj4+IG10ZF9uYW5kOiBuZmNANzgwMCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+Pj4+
PiAJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWF4Zy1uZmMiOwo+Pj4+PiAJLi4uCj4+Pj4+
IAluYW5kQDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+Pj4+ICAgICAgICAg
CXJlZyA9IDwwPjsKPj4+Pj4gICAgICAgICB9Owo+Pj4+PiB9Cj4+Pj4+Cj4+Pj4+IEkgY2hlY2tl
ZCwgdGhhdCAnbmFuZF9zZXRfZmxhc2hfbm9kZSgpJyBpcyBjYWxsZWQgd2l0aCAnbmFuZEAwJyBh
bmQgaSBzdXBwb3NlCj4+Pj4+IHRoYXQgaXQgaXMgY29ycmVjdCAoYXMgWW91IG1lbnRpb25lZCBi
ZWxvdykuIEJ1dCwgJ252bWVtX2FkZF9jZWxsc19mcm9tX29mKCknIGlzIGNhbGxlZAo+Pj4+PiB3
aXRoIHBhcmVudDogJ25mY0A3ODAwJywgdGhlbiBpdCBpdGVyYXRlcyBvdmVyIGl0cyBjaGlsZHMs
IGUuZy4gJ25hbmRAMCcgYW5kIHRodXMgaSBnZXQgc3VjaAo+Pj4+PiBzaXR1YXRpb24uIEkgZ3Vl
c3MsIHRoYXQgJ252bWVtX2FkZF9jZWxsc19mcm9tX29mKCknIG11c3QgYmUgY2FsbGVkIHdpdGgg
J25hbmRAMCcgPyAgCj4+Pj4KPj4+PiBXZSByZWNlbnRseSBoYWQgaXNzdWVzIHdpdGggbnZtZW0g
cGFyc2luZywgYnV0IEkgYmVsaWV2ZSBhIG1haW5saW5lCj4+Pj4ga2VybmVsIHNob3VsZCBub3cg
YmUgcGVyZmVjdGx5IHdvcmtpbmcgb24gdGhpcyByZWdhcmQuIFdoYXQgdmVyc2lvbiBvZgo+Pj4+
IHRoZSBMaW51eCBrZXJuZWwgYXJlIHlvdSB1c2luZz8gIAo+Pj4KPj4+IE15IGN1cnJlbnQgdmVy
c2lvbiBpczoKPj4+Cj4+PiBWRVJTSU9OID0gNiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPj4+IFBBVENITEVWRUwgPSAyICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+Pj4g
U1VCTEVWRUwgPSAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCj4+PiBFWFRSQVZFUlNJT04gPSAtcmM4IAo+Pj4KPj4+IEZpeCB3YXMg
aW4gZHJpdmVycy9udm1lbS8qID8KPj4+Cj4+PiBUaGFua3MsIEFyc2VuaXkgIAo+Pgo+PiBVcGQ6
IEkgcmVzb2x2ZWQgcHJvYmxlbSBpbiB0aGUgZm9sbG93aW5nIHdheToKPj4KPj4gbmFuZEAwIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiAJcmVnID0gPDA+Oy8vY2hpcCBzZWxl
Y3QKPj4KPiAJcGFydGl0aW9ucyB7Cj4gCQljb21wYXRpYmxlID0gLi4uCj4gCj4+IAlvdHBAMCB7
ICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiAJCSNhZGRyZXNzLWNlbGxzID0gPDI+OyAgIAo+
PiAJCSNzaXplLWNlbGxzID0gPDA+OyAgICAgIAo+IAo+ICNhZGRyZXNzL3NpemUtY2VsbHMgaXMg
bm90IG5lZWRlZCBoZXJlCj4gCj4+IAkJY29tcGF0aWJsZSA9ICJ1c2VyLW90cCI7Cj4+IAkJcmVn
ID0gPEEgQj47ICAgICAgICAgICAgCj4+IAl9OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAo+PiAJb3RwQDEgeyAgICAgICAgICAgICAgICAgICAgICAgICAKPj4gCQkjYWRkcmVzcy1jZWxs
cyA9IDwyPjsgICAKPj4gCQkjc2l6ZS1jZWxscyA9IDwwPjsgICAgICAKPiAKPiBEaXR0bwo+IAo+
PiAJCWNvbXBhdGlibGUgPSAiZmFjdG9yeS1vdHAiOwo+PiAJCXJlZyA9IDxDIEQ+OyAgICAgICAg
ICAgIAo+PiAJfTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAKPiAJfTsKPiAKPj4g
fTsKPj4KPj4gTm93IG52bWVtIHN1YnN5c3RlbSBwYXJzZXMgJ290cEAwJyBhbmQgJ290cEAxJyBh
bmQgZXJyb3IgaXMgZ29uZS4gJ2NvbXBhdGlibGUnIHZhbHVlcyBhcmUKPj4gdGhlIHNhbWUgYXMg
aW4gZHJpdmVycy9tdGQvbXRkY29yZS5jOm10ZF9vdHBfbnZtZW1fYWRkKCkuICdyZWcnIGluICdu
YW5kQDAnIGlzIHVzZWQgYXMKPj4gY2hpcCBzZWxlY3QgYXMgc3VwcG9zZWQuCj4gCj4gSSBkb24n
dCBmdWxseSBnZXQgaXQuIFRoZSBwYXJzaW5nIG9uIHRoZSBudm1lbSBzaWRlIHNob3VsZCBub3Qg
ZmFpbCBpZgo+IHRoZXJlIGlzIG5vIHN1YnBhcnRpdGlvbi9vdHAtcmVnaW9uIGRlZmluZWQuIENh
biB5b3UgY29uZmlybSBhbiBlbXB0eQo+IE5BTkQgZGV2aWNlIG5vZGUgd29ya3M/IEJlY2F1c2Ug
eW91ciBsYXN0IGUtbWFpbCBzdWdnZXN0ZWQgdGhlIG9wcG9zaXRlLgoKT2ssIHNvIGknbGwgZGVz
Y3JpYmUgd2hhdCBoYXBwZW5zIGluIG15IGNhc2UuIExldCdzIE5BTkQgbm9kZSBiZSBsaWtlIHRo
aXMgKElJVUMgdGhpcyBpcwpjb25zaWRlcmVkIGFzIGVtcHR5IE5BTkQgZGV2aWNlKToKCm10ZF9u
YW5kOiBuZmNANzgwMCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoJY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLG1lc29uLWF4Zy1uZmMiOwoJLi4uCgluYW5kQDAgeyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCgkgICAgICAgCXJlZyA9IDwwPjsKCX07Cn0KCkkgc2VlLCB0aGF0Cgox
KSAnbXRkX290cF9udm1lbV9hZGQoKScgY2FsbHMgJ210ZF9vdHBfbnZtZW1fcmVnaXN0ZXIoKScg
dHdpY2UgZm9yIHR3byB0eXBlcyBvZgogICBPVFAgbWVtb3J5ICJ1c2VyLW90cCIgYW5kICJmYWN0
b3J5LW90cCIuIExldCdzIHRha2UgYSBsb29rIG9ubHkgb24gInVzZXItb3RwIi4KMikgJ210ZF9v
dHBfbnZtZW1fcmVnaXN0ZXIoKScgdHJpZXMgdG8gbG9va3VwIGZvciBub2RlIGluICduYW5kQDAn
IHdoaWNoIGlzIGNvbXBhdGlibGUgd2l0aAogICAidXNlci1vdHAiIGFuZCB0aGVuIHBhc3NlcyBm
b3VuZCAob3Igbm90IGZvdW5kLCBlLmcuIE5VTEwpIG5vZGUgdG8gICdudm1lbV9yZWdpc3Rlcigp
Jy4KMykgJ252bWVtX3JlZ2lzdGVyKCknIHVzZXMgdGhpcyBub2RlIGl0ZXJhdGluZyBvdmVyIGl0
cyBjaGlsZHMgYW5kIHNlYXJjaGluZyB2YWx1ZSAicmVnIiBpbgogICBlYWNoIGNoaWxkLiBJZiAi
dXNlci1vdHAiIG5vZGUgaXMgbm90IGZvdW5kIGluIDIpLCAnbnZtZW1fcmVnaXN0ZXIoKScgdXNl
cyBub2RlICduZmNANzgwMCcKICAgYWxzbyBsb29raW5nIGZvciAicmVnIiB2YWx1ZSBpbiBlYWNo
IG9mIGl0cyBjaGlsZC4gSW4gdGhpcyBjYXNlIGl0IGZvdW5kICJyZWciIGluICduYW5kQDAnCiAg
IGFuZCBmYWlscy4KCk5vdywgaWYgaSBhZGQgImNvbXBhdGlibGUgPSAidXNlci1vdHAiOyIgdG8g
J25hbmRAMCcsIGluIHN0ZXAgMikgc2VhcmNoIHdpbGwgYmUgc3VjY2Vzc2Z1bCwKYW5kICJyZWci
IHZhbHVlIHdpbGwgYmUgdXNlZCBmcm9tIHRoaXMgbmV3IG5vZGUgKG9yIHdlIHJlbW92ZSAicmVn
IiBmcm9tIGl0IC0gbm90aGluZyBoYXBwZW5zCmFzIFlvdSB3cm90ZSkuIFNvLCBwcm9ibGVtIGlz
IHRoYXQgbnZtZW0gdHJpZXMgdG8gcGFyc2Ugbm9kZSB3aXRoIGludmFsaWQgInJlZyIgdmFsdWUu
CgpBbHNvIEkgc2VlLCB0aGF0ICdudm1lbV9yZWdpc3RlcigpJyBpcyBjYWxsZWQgZWFybGllciBp
biAnbXRkX252bWVtX2FkZCgpJywgYnV0IHdpdGggbm8gZWZmZWN0LgpJIHRoaW5rLCB0aGF0IGl0
IGlzIG5vdCByZWxhdGVkIHdpdGggZW5hYmxlZCBPVFAgZmVhdHVyZS4KClRoYW5rcywgQXJzZW5p
eQoKPiAKPj4KPj4gSSB0aGluaywgdGhpcyBwYXRjaCBzaG91bGQgYmUgYWJhbmRvbmVkIGluIHRo
ZSBuZXh0IHZlcnNpb24uCj4+Cj4+IFRoYW5rcywgQXJzZW5peQo+Pgo+Pj4gICAKPj4+Pgo+Pj4+
IFRoYW5rcywKPj4+PiBNaXF1w6hsICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
