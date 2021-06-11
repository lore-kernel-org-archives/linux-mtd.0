Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F00C4743D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 03:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1DB36023C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 03:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1DB36023C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xvZIagPdhaB/t7+AlYR4j346M/JBje7caLd8Bq/pb0=; b=vL6LF3CEuI583lcv99VKeEv7KD
	/XrQTc5/fBLiuSD9ZfmSDEW6gktAVhRxg6bMs/Tt4FSN0zZE4AUikcLBIN0Q+GS09qcjKVmsgELOm
	Q93cW+RzGJOpV1/XK7m9CTFLWI3lwnG63eg80t710hqXqhPqAOx7FPi5aP1h9t5m7Zfav352hafOa
	J4mnwKzrU3xKN1DCSBIVqxHHrsVhT4nWcfUuvjw20GzkiWDtRRAPDaa4xYG4M2qKwzyxjyUNfdewC
	Fg8R6BNnD86Foz33HUfgf6x/mXS+sij54uUkOPQzR8HQNv9WbYdW7tn9IuxgJD/LRxnG3Kw3rtCaG
	SRtz1c2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrYFW-003P1Y-Vf; Fri, 11 Jun 2021 03:54:27 +0000
Received: from regular1.263xmail.com ([211.150.70.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrYFI-003Ovs-Uf; Fri, 11 Jun 2021 03:54:15 +0000
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 9B7FA1DB8;
 Fri, 11 Jun 2021 11:54:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.73] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P15328T140654309000960S1623383648787942_; 
 Fri, 11 Jun 2021 11:54:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <70eca2d5e53924834f14eb9922eb0b7d>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: linux-clk@vger.kernel.org
X-RCPT-COUNT: 19
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v7 9/9] arm64: dts: rockchip: Enable SFC for Odroid Go
 Advance
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-spi@vger.kernel.org,
 broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de, jbx6244@gmail.com,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609141348.19178-1-jon.lin@rock-chips.com>
 <20210609141348.19178-5-jon.lin@rock-chips.com>
 <20210610173657.GA20228@wintermute.localdomain>
 <89283da6-b00e-4d0f-5c4a-0169bda101d3@rock-chips.com>
 <SN6PR06MB5342327048383CC3D416C93DA5349@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Jon Lin <jon.lin@rock-chips.com>
Message-ID: <19481190-2a28-8602-8f5f-6258a967833d@rock-chips.com>
Date: Fri, 11 Jun 2021 11:54:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SN6PR06MB5342327048383CC3D416C93DA5349@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_205413_348631_9217DB8E 
X-CRM114-Status: GOOD (  32.38  )
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

Ck9uIDYvMTEvMjEgMTE6MzggQU0sIENocmlzIE1vcmdhbiB3cm90ZToKPiBPbiBGcmksIEp1biAx
MSwgMjAyMSBhdCAxMDoyNjozNUFNICswODAwLCBKb24gTGluIHdyb3RlOgo+PiBIaSBDaHJpcwo+
Pgo+PiBNYXkgeW91IGF0dGFjaCB0aGUgWFQyNUYxMjhCIGRldmljZSBjb2RlIHRvIG1lLCBhbmQg
SSdsbCB0cnkgdG8gd29yayBpdCBvdXQuCj4gU3VyZSwgaGVyZSBpcyB0aGUgcGF0Y2ggSSBhbSB1
c2luZzoKPgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQv
cGF0Y2gvU042UFIwNk1CNTM0MkM4MkYzNzJGMzdGQjhFMjFCMzI3QTU3QTlAU042UFIwNk1CNTM0
Mi5uYW1wcmQwNi5wcm9kLm91dGxvb2suY29tLwoKdGhpcyBwYXRjaCB3b3JrcyB3ZWxsIGluIG15
IHJrMzMwOCB0eC0yIHJ4LTIgWFQyNUYxMjhCU1NJR1UgY2FzZS4KCiMgZGQgaWY9L3RtcC9yYW5k
LmltZyBvZj0vZGV2L210ZGJsb2NrMCBicz00MDk2IHNlZWs9MTAyNAoxMDI0KzAgcmVjb3JkcyBp
bgoxMDI0KzAgcmVjb3JkcyBvdXQKIwojIGRkIGlmPS9kZXYvbXRkMCBvZj0vdG1wL3JhbmQxLmlt
ZyBicz00MDk2IHNraXA9MTAyNCBjb3VudD0xMDI0CgoxMDI0KzAgcmVjb3JkcyBpbgoxMDI0KzAg
cmVjb3JkcyBvdXQKIwojCiMgbWQ1c3VtIC90bXAvKi5pbWcKODNlNDVhNTY3NjYxNjhiNDdlNmRi
MWQ0MWIxYjQwM2TCoCAvdG1wL3JhbmQuaW1nCjgzZTQ1YTU2NzY2MTY4YjQ3ZTZkYjFkNDFiMWI0
MDNkwqAgL3RtcC9yYW5kMS5pbWcKIwojIGRtZXNnIHwgZ3JlcCBYVDI1RjEyOEJTU0lHVQpbwqDC
oMKgIDAuMjAwNzM4XSBzcGktbm9yIHNwaTMuMDogWFQyNUYxMjhCU1NJR1UgKDE2Mzg0IEtieXRl
cykKIwoKPgo+PiBPbiA2LzExLzIxIDE6MzYgQU0sIENocmlzIE1vcmdhbiB3cm90ZToKPj4+IE9u
IFdlZCwgSnVuIDA5LCAyMDIxIGF0IDEwOjEzOjQ4UE0gKzA4MDAsIEpvbiBMaW4gd3JvdGU6Cj4+
Pj4gRnJvbTogQ2hyaXMgTW9yZ2FuIDxtYWNyb21vcmdhbkBob3RtYWlsLmNvbT4KPj4+Pgo+Pj4+
IFRoaXMgZW5hYmxlcyB0aGUgUm9ja2NoaXAgU2VyaWFsIEZsYXNoIENvbnRyb2xsZXIgZm9yIHRo
ZSBPZHJvaWQgR28KPj4+PiBBZHZhbmNlLiBOb3RlIHRoYXQgd2hpbGUgdGhlIGF0dGFjaGVkIFNQ
SSBOT1IgZmxhc2ggYW5kIHRoZSBjb250cm9sbGVyCj4+Pj4gYm90aCBzdXBwb3J0IHF1YWQgcmVh
ZCBtb2RlLCBvbmx5IDIgb2YgdGhlIHJlcXVpcmVkIDQgcGlucyBhcmUgcHJlc2VudC4KPj4+PiBU
aGUgcnggYW5kIHR4IGJ1cyB3aWR0aCBpcyBzZXQgdG8gMiBmb3IgdGhpcyByZWFzb24uCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBNb3JnYW4gPG1hY3JvbW9yZ2FuQGhvdG1haWwuY29t
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvbiBMaW4gPGpvbi5saW5Acm9jay1jaGlwcy5jb20+Cj4+
Pj4gLS0tCj4+Pj4KPj4+PiBDaGFuZ2VzIGluIHY3OiBOb25lCj4+Pj4gQ2hhbmdlcyBpbiB2Njog
Tm9uZQo+Pj4+IENoYW5nZXMgaW4gdjU6IE5vbmUKPj4+PiBDaGFuZ2VzIGluIHY0OiBOb25lCj4+
Pj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+Pj4+IENoYW5nZXMgaW4gdjI6IE5vbmUKPj4+PiBDaGFu
Z2VzIGluIHYxOiBOb25lCj4+Pj4KPj4+PiAgICAuLi4vYm9vdC9kdHMvcm9ja2NoaXAvcmszMzI2
LW9kcm9pZC1nbzIuZHRzICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzMyNi1vZHJvaWQtZ28yLmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcm9ja2NoaXAvcmszMzI2LW9kcm9pZC1nbzIuZHRzCj4+Pj4gaW5kZXggNDljOTdm
NzZkZjc3Li5mNzhlMTFkZDg0NDcgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9yb2NrY2hpcC9yazMzMjYtb2Ryb2lkLWdvMi5kdHMKPj4+PiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JvY2tjaGlwL3JrMzMyNi1vZHJvaWQtZ28yLmR0cwo+Pj4+IEBAIC00ODQsNiArNDg0
LDIyIEBACj4+Pj4gICAgCXN0YXR1cyA9ICJva2F5IjsKPj4+PiAgICB9Owo+Pj4+ICsmc2ZjIHsK
Pj4+PiArCXBpbmN0cmwtMCA9IDwmc2ZjX2NsayAmc2ZjX2NzMCAmc2ZjX2J1czI+Owo+Pj4+ICsJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4+PiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
Pj4+ICsJI3NpemUtY2VsbHMgPSA8MD47Cj4+Pj4gKwlzdGF0dXMgPSAib2theSI7Cj4+Pj4gKwo+
Pj4+ICsJZmxhc2hAMCB7Cj4+Pj4gKwkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKPj4+
PiArCQlyZWcgPSA8MD47Cj4+Pj4gKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MTA4MDAwMDAwPjsK
Pj4+PiArCQlzcGktcngtYnVzLXdpZHRoID0gPDI+Owo+Pj4+ICsJCXNwaS10eC1idXMtd2lkdGgg
PSA8Mj47Cj4+PiBOb3RlIHRoYXQgSSBhbSBzdGlsbCB3b3JraW5nIHdpdGggSm9uIExpbiB0byBy
ZXNlYXJjaCB0aGlzLCBidXQgaXQgd2FzCj4+PiBmb3VuZCBpbiB0ZXN0aW5nIHRoYXQgaWYgSSBz
ZXQgdGhlIHR4IGJ1cyB3aWR0aCB0byAxIHRoZSBwcm9ibGVtcyBJCj4+PiBlbmNvdW50ZXJlZCBp
biBlYXJsaWVyIGFyZSByZXNvbHZlZC4gQXQgdGhpcyB0aW1lIEkgZG8gbm90IGtub3cgaWYgaXQK
Pj4+IGlzIGFuIGlzc3VlIHdpdGggdGhlIGRyaXZlciBmb3IgdGhlIGZsYXNoIGNvbnRyb2xsZXIs
IG9yIGlmIHRoZSBOT1IsIG9yCj4+PiBib2FyZCBpdHNlbGYgaGFzIHNvbWUgc29ydCBvZiBlcnJh
dGEgd2hpY2ggcHJldmVudCBkdWFsIHR4IGZyb20gd29ya2luZwo+Pj4gY29ycmVjdGx5LiBOb3Rl
IHRoYXQgYXMgb2YgcmlnaHQgbm93IHRoZSBmbGFzaCBjaGlwIEkgYW0gdXNpbmcgKGFuCj4+PiBY
VFggWFQyNUYxMjhCKSBpcyBub3QgY3VycmVudGx5IHN1cHBvcnRlZCBpbiBtYWlubGluZSwgc28g
aXQncyB2ZXJ5Cj4+PiBwb3NzaWJsZSB0aGlzIGlzIHNvbWUgc29ydCBvZiBlcnJhdGEgd2l0aCB0
aGUgY2hpcC4gSXQncyBhbHNvIHBvc3NpYmxlCj4+PiB0aGF0IHRoZXJlIGlzIHNvbWV0aGluZyB3
aXRoIHRoZSBib2FyZCB0aGF0IGlzIGludGVyZmVycmluZyB3aXRoIGR1YWwKPj4+IG1vZGUgVFgu
ICBXaGVuIEpvbiBjb21lcyBiYWNrIHRoYXQgaGUgaGFzIHRlc3RlZCBkdWFsIG1vZGUgb24gdGhl
IFNGQwo+Pj4gd2l0aCBhIGRpZmZlcmVudCBib2FyZC9jaGlwIEkgd2lsbCByZWNvbW1lbmQgdGhh
dCB3ZSBjaGFuZ2UgdGhlIHR4Cj4+PiBidXMgd2lkdGggaGVyZSB0byBhIDEsIGFuZCB0aGVuIG9u
Y2UgdGhlIFhUMjVGMTI4QiBnZXRzIG1haW5saW5lZCB3ZQo+Pj4gY2FuIHNlZSBpZiBzb21lb25l
IGVsc2UgaGFzIGlzc3VlcyB3aXRoIGR1YWwgdHggbW9kZSBzbyB3ZSBjYW4gbm90ZQo+Pj4gdGhh
dCBhcyBhIHByb2JsZW0gd2l0aCB0aGUgY2hpcC4gT3IgbWF5YmUgdGhlcmUgaXMgc29tZXRoaW5n
IHdlaXJkCj4+PiB3aXRoIGR1YWwgdHggbW9kZSB5ZXQgb24gdGhlIFNGQyBkcml2ZXIvY29udHJv
bGxlciwgSSBkb24ndCBrbm93IHlldC4KPj4+IEknbSBhbGwgdG9vIGhhcHB5IHRvIHdvcmsgd2l0
aCBhIFJvY2tjaGlwIGVuZ2luZWVyIHNvIHRoaW5ncyBsaWtlCj4+PiB0aGlzIGNhbiBiZSBkZXRl
cm1pbmVkIGJlZm9yZSB3ZSBoaXQgbWFpbmxpbmUuIDotKQo+Pj4KPj4+IFRoZSBYVFgyNUYxMjhC
IGRyaXZlciBpcyBjdXJyZW50bHkgYXdhaXRpbmcgYSBkZWNpc2lvbiBvbiBob3cgdG8gaGFuZGxl
Cj4+PiBjb250aW51YXRpb24gY29kZXMsIGFzIHRoaXMgY2hpcCBJRCBzaG91bGQgYmUgdXNpbmcg
Y29udGludWF0aW9uIGNvZGVzLAo+Pj4gYnV0IGRvZXNuJ3QgYXBwZWFyIHRvIHJldHVybiB0aGVt
IHdoZW4geW91IHF1ZXJ5IGZvciBtYW51ZmFjdHVyZXIgSUQuCj4+PiBTbyBJIHNob3VsZCBhbHNv
IG5vdGUgaW4gdGhlIGNvbW1pdCBoZXJlIHRoYXQgdGhlIFNGQyB3aWxsIHN0aWxsIGJlCj4+PiB1
bnVzYWJsZSBvbiB0aGUgT2Ryb2lkIEdvIEFkdmFuY2UgdW50aWwgdGhlIFhUWDI1RjEyOEIgaXMg
YWxzbwo+Pj4gbWFpbmxpbmVkLgo+Pj4KPj4+IFRoYW5rIHlvdS4KPj4+Cj4+Pj4gKwl9Owo+Pj4+
ICt9Owo+Pj4+ICsKPj4+PiAgICAmdHNhZGMgewo+Pj4+ICAgIAlzdGF0dXMgPSAib2theSI7Cj4+
Pj4gICAgfTsKPj4+PiAtLSAKPj4+PiAyLjE3LjEKPj4+Pgo+Pj4+Cj4+Pj4KPj4+Cj4+Cj4KPgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
