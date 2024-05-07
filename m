Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BAAC25B75
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 07:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rr47mS8+m3+a3wHPKidXjKPLPri/PTaARE6bAvArbn0=; b=oLw2W9YcMKz5P4
	5YBN2poxVConc6KY8faQic4uMLEIRXlFWpBHxccGJt0S5DMcKIhDJOhFikUOgXRHLV8mN2Evzi6H1
	iV5lDGg/fDPa9CJdo/O+tATOIoLoVnEav95xEMfqi3J7hje4hj1cHy9s7oDkZikRhZ+W37ET3rvfA
	b263xoyDnrU3M+FFBkJfzmvWcKt9yiklvvXKbrozhxLB6fuRmxlb+87D55iUcifh0JdU90sVul4Tg
	qbcg26K+BcZcThKlSbo1YtjY3gnq2o9zEX4F1kUtCtzZBE3XZuJXEcU/gHiua2Qtbb55D6gerl4V4
	8TE9XEuD6YfGGKQ+YZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Err-00000009v6l-43t6;
	Tue, 07 May 2024 07:04:03 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Erm-00000009v5W-0ghv;
	Tue, 07 May 2024 07:04:00 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D6E6D120003;
	Tue,  7 May 2024 10:03:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D6E6D120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715065430;
	bh=H/kIGo3J8gDU/CLl+ICpmHfUJ577I1NNpGXMj98OV+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=illmbUWLUP6z8cEOzU19cEiOVtGCj2hwDhcZGlI5Yc5uaDBZNel5WH65as/Sb8LBg
	 VRUTi/IrnSR7J71oIRujD2zE2S34MUJAYcEOgCKtvPddm2+fQMYRy5FMzZXIhCBDDa
	 0oUKtm8Rr2b5lcfITxxpEyD74goehnon3BreSRjJ3z2ZZTHRDaJq1CsS9QU54T96ej
	 sqHd53GI8LkbXLxZj129aPUcrHiPBoBobxuHCXaF7/gCfd2dzhjW1Is/1PcieG/xHl
	 +0wBNCL0dtDy3trbWSiaOSlxlKfFPmD4QcU97jsxgyj1KH3vjyVTlpBnZcaUoNoaV3
	 8lvQHeDAoV1dQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  7 May 2024 10:03:50 +0300 (MSK)
Received: from [172.28.226.125] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 7 May 2024 10:03:50 +0300
Message-ID: <d90f9d3d-7823-503f-4cc6-73783a083d0e@salutedevices.com>
Date: Tue, 7 May 2024 09:53:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
 <20240416085101.740458-2-avkrasnov@salutedevices.com>
 <20240506154858.003bab54@xps-13>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240506154858.003bab54@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185102 [May 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/07 04:23:00 #25112995
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_000358_904153_2D81FB4B 
X-CRM114-Status: GOOD (  26.24  )
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

CgpPbiAwNi4wNS4yMDI0IDE2OjQ4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFR1ZSwgMTYgQXByIDIw
MjQgMTE6NTE6MDAgKzAzMDA6Cj4gCj4+IEJvb3QgUk9NIGNvZGUgb24gTWVzb24gcmVxdWlyZXMg
dGhhdCBzb21lIHBhZ2VzIG9uIE5BTkQgbXVzdCBiZSB3cml0dGVuCj4+IGluIHNwZWNpYWwgbW9k
ZTogInNob3J0IiBFQ0MgbW9kZSB3aGVyZSBlYWNoIGJsb2NrIGlzIDM4NCBieXRlcyBhbmQKPj4g
c2NyYW1ibGluZyBtb2RlIGlzIG9uLgo+IAo+IE9rCj4gCj4+IFN1Y2ggcGFnZXMgbG9jYXRlZCB3
aXRoIHRoZSBzcGVjaWZpZWQgaW50ZXJ2YWwgd2l0aGluIHNwZWNpZmllZCBvZmZzZXQuCj4gCj4g
SSdtIHNvcnJ5IEkgZG9uJ3QgZ2V0IHRoYXQgc2VudGVuY2UuCgpTb3JyeSwgSSBtZWFuIHRoaXMg
KGxldCBtZSBkcmF3IDopICkgOgoKWyBwYWdlIDAgXVsgcGFnZSAxIF1bIHBhZ2UgMiBdWyBwYWdl
IDMgXVsgcGFnZSA0IF1bIHBhZ2UgNSBdWyBwYWdlIDYgXVsgcGFnZSA3IF1bIHBhZ2UgOCBdWyBw
YWdlIDkgXQoKRm9yIGV4YW1wbGUsIHdlIGhhdmUgMTAgcGFnZXMgc3RhcnRpbmcgZnJvbSB0aGUg
YmVnaW5uaW5nIG9mIHRoZSBjaGlwIC0gdGhpcyBpcyAid2l0aGluIHNwZWNpZmllZCBvZmZzZXQi
LAplLmcuIG9mZnNldCBpcyAxMC4gQm9vdFJPTSBvbiBheGcgbmVlZHMgdGhhdCAoZm9yIGV4YW1w
bGUpIGV2ZXJ5IHRoaXJkIHBhZ2UgbXVzdCBiZSB3cml0dGVuIGluICJzcGVjaWFsIgptb2RlOiBz
Y3JhbWJsaW5nIGlzIG9uIGFuZCBFQ0MgaXMgMzg0IGJ5dGVzLiBTdWNoIHBhZ2VzIGFyZSAwLCAy
LCA0LCA2LCA4LiBFLmcuICJzcGVjaWZpZWQgaW50ZXJ2YWwiIHdpbGwKYmUgMy4KClNvOgoKYW1s
b2dpYyxib290LXBhZ2VzOiAxMAphbWxvZ2ljLGJvb3QtcGFnZS1zdGVwOiAzCgoKPiAKPj4gQm90
aCBpbnRlcnZhbCBhbmQgb2Zmc2V0IGFyZSBsb2NhdGVkIGluIHRoZQo+PiBkZXZpY2UgdHJlZSBh
bmQgdXNlZCBieSBkcml2ZXIgaWYgJ25hbmQtaXMtYm9vdC1tZWRpdW0nIGlzIHNldCBmb3IKPj4g
TkFORCBjaGlwLgo+IAo+IFRoaXMgc2VudGVuY2UgaXMgcHJvYmFibHkgbm90IG5lZWRlZC4KCk9r
Cgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPGF2a3Jhc25vdkBzYWx1
dGVkZXZpY2VzLmNvbT4KPj4gLS0tCj4+ICAuLi4vYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24t
bmFuZC55YW1sICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPj4gaW5k
ZXggNTdiNjk1N2M4NDE1Li42N2IyZjdjMTI1OWMgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5h
bmQueWFtbAo+PiBAQCAtNjQsMTEgKzY0LDI1IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+PiAgICAg
ICAgICBpdGVtczoKPj4gICAgICAgICAgICBtYXhpbXVtOiAwCj4+ICAKPj4gKyAgICAgIGFtbG9n
aWMsYm9vdC1wYWdlczoKPj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgICAgIE51
bWJlciBvZiBwYWdlcyBzdGFydGluZyBmcm9tIDAsIHdoZXJlIHNwZWNpYWwgRUNDCj4gCj4gZnJv
bSAqb2Zmc2V0KiAwIEkgZ3Vlc3M/CgpZZXMsIG9yIG1heSBiZSBiZXR0ZXIgImZyb20gYmVnaW5u
aW5nIG9mIHRoZSBjaGlwIiA/CgpNYXkgYmUgaSBjYW4gcGxhY2UgaGVyZSBhc2NpaSBwaWN0dXJl
IGZyb20gYWJvdmUsIHdpdGggcmVkdWNlZCBudW1iZXIgb2YgcGFnZXM/CkFuZCBhbHNvIHBsYWNl
IHRoaXMgcGljdHVyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgPwoKPiAKPj4gKyAgICAgICAgICBh
bGdvcml0aG0gd2lsbCBiZSB1c2VkIGJ5IHRoZSBkcml2ZXIuCj4gCj4gIndoZXJlIGEgc3BlY2lh
bCBFQ0MgY29uZmlndXJhdGlvbiBtdXN0IGJlIHVzZWQgYmVjYXVzZSBpdCBpcyBhY2Nlc3NlZAo+
IGJ5IHRoZSBST00gY29kZSI/IE1heWJlIHlvdSBjYW4gZXZlbiBkZXRhaWwgd2hhdCBhcmUgdGhl
c2UgdmFsdWVzIGlmCj4gdGhleSBhcmUgZml4ZWQuCj4gCj4gWW91IHNob3VsZCBwcm9iYWJseSBp
bmZvcm0gdGhhdCBzY3JhbWJsaW5nIHNoYWxsIGJlIG9uIGFzIHdlbGwuCj4gIAo+PiArCj4+ICsg
ICAgICBhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwOgo+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4+
ICsgICAgICAgICAgSW50ZXJ2YWwgYmV0d2VlbiBwYWdlcywgcmVhZC93cml0dGVuIGJ5IHRoZSBk
cml2ZXIgd2l0aAo+PiArICAgICAgICAgIHNwZWNpYWwgRUNDIGFsZ29yaXRobS4KPiAKPiBJJ20g
bm90IHN1cmUgSSBmdWxseSBnZXQgdGhlIGRlc2NyaXB0aW9uLiBXaGF0IGlzIHRoZSB1bml0IGhl
cmU/IGNhbgo+IHlvdSBkcmF3IGEgc21hbGwgYXNjaWktYXJ0IGRpYWdyYW0/CgpNYXkgYmUgaSBj
YW4gcGxhY2UgaGVyZSAicGxlYXNlIHNlZSBkaWFncmFtIGFib3ZlIiA/IEFuZCBpbiAnYW1sb2dp
Yyxib290LXBhZ2VzJyB0aGVyZQp3aWxsIGJlIGRpYWdyYW0uCgoKPiAKPj4gKwo+PiAgICAgIHVu
ZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4gIAo+PiAgICAgIGRlcGVuZGVuY2llczoKPj4g
ICAgICAgIG5hbmQtZWNjLXN0cmVuZ3RoOiBbbmFuZC1lY2Mtc3RlcC1zaXplXQo+PiAgICAgICAg
bmFuZC1lY2Mtc3RlcC1zaXplOiBbbmFuZC1lY2Mtc3RyZW5ndGhdCj4+ICsgICAgICBhbWxvZ2lj
LGJvb3QtcGFnZXM6IFtuYW5kLWlzLWJvb3QtbWVkaXVtLCAiYW1sb2dpYyxib290LXBhZ2Utc3Rl
cCJdCj4+ICsgICAgICBhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwOiBbbmFuZC1pcy1ib290LW1lZGl1
bSwgImFtbG9naWMsYm9vdC1wYWdlcyJdCj4+ICAKPj4gIAo+PiAgcmVxdWlyZWQ6Cj4gCj4gCj4g
VGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywgQXJzZW5peQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
