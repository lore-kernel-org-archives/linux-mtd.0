Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C229C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiycmQm5jAmon29daKqfq6/mvFDI7Jd+AXkrj341rO8=; b=4shwDBataw7CS8
	MLgLcmxO41XsXij0AhYtPopBXn9246gXEtvQIBssuMLOD+qXQNM5HOQnMJY3O4gR2CI2I0cli+jcE
	mcW0kfpWXjV/9CWInCDnuBbdyMwDzMaeDfV6CZCM2HocwbSeduMAX5nMWZ/DJ1H9CHCWXvfMOtRs4
	O5yJMmj46qx6KxZMERCr0dq9um2LSwg2SA54WFaWRsshifddkXjZedDQUlMlV+1EV4dzl7tpSNVrb
	Ytb5IGg+HIe1qhTxWD94EAc7gTf1SeV+PJBiZul2fPj5nTANw4NvJpF6dLGmHhkryP7hXmy6baQ8C
	hEUgLur/gkwsuJielrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlYc3-001dqi-LD; Mon, 02 May 2022 16:09:27 +0000
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYbm-001dj3-Rh
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 16:09:15 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 40C7320A88;
 Mon,  2 May 2022 16:09:01 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 18:08:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0015a36cd29-1587-4259-883a-5c3137477e16,
 1C738C3314058F8CE8CF02D37F1FC3678EA14F63) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <449f47d2-f700-e71d-996b-ce30c6906d89@kaod.org>
Date: Mon, 2 May 2022 18:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Joel Stanley <joel@jms.id.au>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Pratyush
 Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, <linux-kernel@vger.kernel.org>, Tao Ren
 <rentao.bupt@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>, Jae Hyun Yoo
 <quic_jaehyoo@quicinc.com>, <linux-aspeed@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
References: <20220502081341.203369-1-clg@kaod.org>
 <20220502081341.203369-3-clg@kaod.org>
 <1651505609.452113.1161768.nullmailer@robh.at.kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1651505609.452113.1161768.nullmailer@robh.at.kernel.org>
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 256f9c92-6a2e-4112-84d2-d224bad78371
X-Ovh-Tracer-Id: 152277964116167437
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudehkedtudfhgfelgffggfeffeefgefhudejvdekveeuveegieelteejiedugeevnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_090911_240092_D240E113 
X-CRM114-Status: GOOD (  18.10  )
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

T24gNS8yLzIyIDE3OjMzLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBNb24sIDAyIE1heSAyMDIy
IDEwOjEzOjMyICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPj4gVGhlICJpbnRlcnJ1
cHQiIHByb3BlcnR5IGlzIG9wdGlvbmFsIGJlY2F1c2UgaXQgaXMgb25seSBuZWNlc3NhcnkgZm9y
Cj4+IGNvbnRyb2xsZXJzIHN1cHBvcnRpbmcgRE1BcyAoTm90IGltcGxlbWVudGVkIHlldCBpbiB0
aGUgbmV3IGRyaXZlcikuCj4+Cj4+IENjOiBDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFz
cGVlZHRlY2guY29tPgo+PiBUZXN0ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
Cj4+IFRlc3RlZC1ieTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+PiBUZXN0ZWQt
Ynk6IEphZSBIeXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29tPgo+PiBSZXZpZXdlZC1i
eTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2
MDAtZm1jLnlhbWwgICAgICB8IDgyICsrKysrKysrKysrKysrKysrKysKPj4gICBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKwo+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sCj4+
Cj4gCj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9
LW0gZHRfYmluZGluZ19jaGVjaycKPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlz
IG5ldyBpbiB2NS4xMyk6Cj4gCj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgo+IC4vRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbDo2
MjoxOiBbZXJyb3JdIHN5bnRheCBlcnJvcjogZm91bmQgY2hhcmFjdGVyICdcdCcgdGhhdCBjYW5u
b3Qgc3RhcnQgYW55IHRva2VuIChzeW50YXgpCgpkcmF0LiBJIGZvcmdvdCB0byByZXJ1biB0aGUg
Y2hlY2sgYWZ0ZXIgcHJldHRpZnlpbmcgdGhlIGV4YW1wbGUuCgpXaWxsIHJlc2VuZCBhIHY2IHdp
dGhvdXQgdGhlIHRhYnMuCgpUaGFua3MsCgpDLgoKPiAKPiBkdHNjaGVtYS9kdGMgd2FybmluZ3Mv
ZXJyb3JzOgo+IG1ha2VbMV06ICoqKiBEZWxldGluZyBmaWxlICdEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy5leGFtcGxlLmR0cycKPiBUcmFj
ZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gICAgRmlsZSAiL3Vzci9sb2NhbC9iaW4v
ZHQtZXh0cmFjdC1leGFtcGxlIiwgbGluZSA1MiwgaW4gPG1vZHVsZT4KPiAgICAgIGJpbmRpbmcg
PSB5YW1sLmxvYWQob3BlbihhcmdzLnlhbWxmaWxlLCBlbmNvZGluZz0ndXRmLTgnKS5yZWFkKCkp
Cj4gICAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9uMy4xMC9kaXN0LXBhY2thZ2VzL3J1YW1l
bC95YW1sL21haW4ucHkiLCBsaW5lIDQzNCwgaW4gbG9hZAo+ICAgICAgcmV0dXJuIGNvbnN0cnVj
dG9yLmdldF9zaW5nbGVfZGF0YSgpCj4gICAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9uMy4x
MC9kaXN0LXBhY2thZ2VzL3J1YW1lbC95YW1sL2NvbnN0cnVjdG9yLnB5IiwgbGluZSAxMTksIGlu
IGdldF9zaW5nbGVfZGF0YQo+ICAgICAgbm9kZSA9IHNlbGYuY29tcG9zZXIuZ2V0X3NpbmdsZV9u
b2RlKCkKPiAgICBGaWxlICJfcnVhbWVsX3lhbWwucHl4IiwgbGluZSA3MDYsIGluIF9ydWFtZWxf
eWFtbC5DUGFyc2VyLmdldF9zaW5nbGVfbm9kZQo+ICAgIEZpbGUgIl9ydWFtZWxfeWFtbC5weXgi
LCBsaW5lIDcyNCwgaW4gX3J1YW1lbF95YW1sLkNQYXJzZXIuX2NvbXBvc2VfZG9jdW1lbnQKPiAg
ICBGaWxlICJfcnVhbWVsX3lhbWwucHl4IiwgbGluZSA3NzUsIGluIF9ydWFtZWxfeWFtbC5DUGFy
c2VyLl9jb21wb3NlX25vZGUKPiAgICBGaWxlICJfcnVhbWVsX3lhbWwucHl4IiwgbGluZSA4ODks
IGluIF9ydWFtZWxfeWFtbC5DUGFyc2VyLl9jb21wb3NlX21hcHBpbmdfbm9kZQo+ICAgIEZpbGUg
Il9ydWFtZWxfeWFtbC5weXgiLCBsaW5lIDc3MywgaW4gX3J1YW1lbF95YW1sLkNQYXJzZXIuX2Nv
bXBvc2Vfbm9kZQo+ICAgIEZpbGUgIl9ydWFtZWxfeWFtbC5weXgiLCBsaW5lIDg0OCwgaW4gX3J1
YW1lbF95YW1sLkNQYXJzZXIuX2NvbXBvc2Vfc2VxdWVuY2Vfbm9kZQo+ICAgIEZpbGUgIl9ydWFt
ZWxfeWFtbC5weXgiLCBsaW5lIDkwNCwgaW4gX3J1YW1lbF95YW1sLkNQYXJzZXIuX3BhcnNlX25l
eHRfZXZlbnQKPiBydWFtZWwueWFtbC5zY2FubmVyLlNjYW5uZXJFcnJvcjogd2hpbGUgc2Nhbm5p
bmcgYSBibG9jayBzY2FsYXIKPiAgICBpbiAiPHVuaWNvZGUgc3RyaW5nPiIsIGxpbmUgNDksIGNv
bHVtbiA1Cj4gZm91bmQgYSB0YWIgY2hhcmFjdGVyIHdoZXJlIGFuIGluZGVudGF0aW9uIHNwYWNl
IGlzIGV4cGVjdGVkCj4gICAgaW4gIjx1bmljb2RlIHN0cmluZz4iLCBsaW5lIDYyLCBjb2x1bW4g
MQo+IG1ha2VbMV06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL01ha2Vm
aWxlOjI2OiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3Qy
NjAwLWZtYy5leGFtcGxlLmR0c10gRXJyb3IgMQo+IG1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1
bmZpbmlzaGVkIGpvYnMuLi4uCj4gLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sOiAgd2hpbGUgc2Nhbm5pbmcgYSBibG9jayBzY2Fs
YXIKPiAgICBpbiAiPHVuaWNvZGUgc3RyaW5nPiIsIGxpbmUgNDksIGNvbHVtbiA1Cj4gZm91bmQg
YSB0YWIgY2hhcmFjdGVyIHdoZXJlIGFuIGluZGVudGF0aW9uIHNwYWNlIGlzIGV4cGVjdGVkCj4g
ICAgaW4gIjx1bmljb2RlIHN0cmluZz4iLCBsaW5lIDYyLCBjb2x1bW4gMQo+IC9idWlsZHMvcm9i
aGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbDogaWdub3JpbmcsIGVycm9yIHBhcnNpbmcgZmls
ZQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTQwMTogZHRfYmluZGluZ19jaGVja10gRXJyb3IgMgo+
IAo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6Cj4gCj4gU2VlIGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvCj4gCj4gVGhpcyBjaGVjayBjYW4gZmFp
bCBpZiB0aGVyZSBhcmUgYW55IGRlcGVuZGVuY2llcy4gVGhlIGJhc2UgZm9yIGEgcGF0Y2gKPiBz
ZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBtb3N0IHJlY2VudCByYzEuCj4gCj4gSWYgeW91IGFscmVh
ZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQo+
IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQt
c2NoZW1hIGlzIHVwIHRvCj4gZGF0ZToKPiAKPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdy
YWRlCj4gCj4gUGxlYXNlIGNoZWNrIGFuZCByZS1zdWJtaXQuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
