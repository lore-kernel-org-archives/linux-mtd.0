Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC04DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 20:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEfqrdm+4M1ZBRefVa9d84eHmUVGW/xqWJCO+oXCSck=; b=nyWiKGX24lqxx8
	7M+w4sDbed8BX7ZiCYBm+ywI2j2o9LVuSqoXGrWjafzeTELz7cAeikAFuStR5HA1RgdVZ+LdBKrT4
	YbkvyB3d0f40VjyQQFsXCdmssjtc6ye9zV5KusmEGR52MEPtwwffFq+dynEIWllyG6ihC9Cc3RU0L
	jZHZiqWd14sz9ETm6Bg0waVF1ZAlJbxNMzwt58lhax9/S27JIcQuzlpTw6yFbHc7rNJCB3VPHOXz7
	oTFBE0I17GC6gx6Cvod4Wy0xRTAgyutTapB5e5N2cmKTFeqqtauZOQ8xBo/bnBr/H0KTulrIYXjUc
	ydsoyD+uuBMneKKJ8LNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no9j7-00G7XV-99; Mon, 09 May 2022 20:11:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no9j3-00G7WF-DH
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 20:11:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B034616D7
 for <linux-mtd@lists.infradead.org>; Mon,  9 May 2022 20:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E1C385BE
 for <linux-mtd@lists.infradead.org>; Mon,  9 May 2022 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652127083;
 bh=KgbkuAWcAZAtlly2dGO/ru9Wcb6YFEOvc5D53ztwe1g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZroXpDHV8m3uvWP15OxOZr3pOXzhtlgKfqlthkmHP5tgkQlwvIMt7OazQ89NM5Hzv
 zqS0A/1v5KDNQewtqDIwDIcy+CoLK2VxTEwTF06UsHSjmBc7moCd57WkSmxdObjaWC
 wRpQu/6Cai7Ov5ynIIr51emPMZWJ3z4xrA/nwKFOsS3m4fbSNcKJS5ka2MBZcQJ9SG
 y5j+aGdwm953bmtceFEHNJYe9KFhmknNkUNdDToHJGYzD4UrqDAggbPaw94Y3SNYcb
 mmaRzdE/ScDXoaTrUe7H5Jc7LHHJTP68yTF8ZvKVBRHVvPAk1oZuEbOm9HzQHiwipE
 3L8/sM/WIAPUw==
Received: by mail-pg1-f172.google.com with SMTP id s16so2846379pgs.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 13:11:23 -0700 (PDT)
X-Gm-Message-State: AOAM5329otNMTi2mJaPyFiSGkiceXB/Fewe/W+iQZwTCi31rjHHqlsTP
 uaDjvoAIfC2nVKZyOv+iEVf+s/fnz7htv8lbsw==
X-Google-Smtp-Source: ABdhPJyNfsJjiheHv8YpRlfRjiAzEZNoSI2TP/1P0uIzUtueTLIZeAoOJi21y1r/+RutXA01GPq9VsMWBC5AAj8touY=
X-Received: by 2002:a63:d842:0:b0:3c6:ab6b:5f3c with SMTP id
 k2-20020a63d842000000b003c6ab6b5f3cmr6788575pgj.148.1652127082959; Mon, 09
 May 2022 13:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220217102448.27586-1-zajec5@gmail.com>
 <Yh/ovYMV104jc+CE@robh.at.kernel.org>
 <fb18b5e2-d273-adf6-3e14-77628abc4560@gmail.com>
In-Reply-To: <fb18b5e2-d273-adf6-3e14-77628abc4560@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 May 2022 15:11:11 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+KPiy4Tg3+qeMYHuSM5y2Y1X6tsAvQsWrWsoQiugtykw@mail.gmail.com>
Message-ID: <CAL_Jsq+KPiy4Tg3+qeMYHuSM5y2Y1X6tsAvQsWrWsoQiugtykw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: add UBI binding
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tom Rini <trini@konsulko.com>, 
 Ricardo Salveti <ricardo@foundries.io>, Michal Simek <michal.simek@xilinx.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>, Sean Anderson <seanga2@gmail.com>, 
 U-Boot Mailing List <u-boot@lists.denx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_131125_565187_B7159063 
X-CRM114-Status: GOOD (  33.84  )
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

T24gVGh1LCBNYXIgMywgMjAyMiBhdCAyOjMyIEFNIFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAyLjAzLjIwMjIgMjI6NTksIFJvYiBIZXJyaW5nIHdyb3Rl
Ogo+ID4gT24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMTE6MjQ6NDhBTSArMDEwMCwgUmFmYcWCIE1p
xYJlY2tpIHdyb3RlOgo+ID4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KPiA+Pgo+ID4+IFVCSSBpcyBvZnRlbiB1c2VkIG9uIGVtYmVkZGVkIGRldmljZXMgdG8gc3Rv
cmUgVUJJIHZvbHVtZXMgd2l0aCBkZXZpY2UKPiA+PiBjb25maWd1cmF0aW9uIC8gY2FsaWJyYXRp
b24gZGF0YS4gU3VjaCB2b2x1bWVzIG1heSBuZWVkIHRvIGJlIGRvY3VtZW50ZWQKPiA+PiBhbmQg
cmVmZXJlbmNlZCBmb3IgcHJvcGVyIGJvb3QgJiBzZXR1cC4KPiA+Pgo+ID4+IFNvbWUgZXhhbXBs
ZXM6Cj4gPj4gMS4gVS1Cb290IGVudmlyb25tZW50IHZhcmlhYmxlcwo+ID4+IDIuIERldmljZSBj
YWxpYnJhdGlvbiBkYXRhCj4gPj4gMy4gRGVmYXVsdCBzZXR1cCAoZS5nLiBpbml0aWFsIHBhc3N3
b3JkKQo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+ID4+IC0tLQo+ID4+ICAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3ViaS55
YW1sICAgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwo+ID4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDY3IGluc2VydGlvbnMoKykKPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvdWJpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvdWJpLnlhbWwKPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uY2QwODFmMDZkNGNiCj4gPj4gLS0tIC9kZXYvbnVsbAo+ID4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91YmkueWFtbAo+
ID4+IEBAIC0wLDAgKzEsNjcgQEAKPiA+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ID4+ICslWUFNTCAxLjIKPiA+PiArLS0tCj4gPj4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvdWJpLnlh
bWwjCj4gPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIwo+ID4+ICsKPiA+PiArdGl0bGU6IFVCSSAoVW5zb3J0ZWQgQmxvY2sgSW1hZ2VzKSBk
ZXZpY2UKPiA+PiArCj4gPj4gK2Rlc2NyaXB0aW9uOiB8Cj4gPj4gKyAgVUJJIGlzIGEgbGF5ZXIg
cHJvdmlkaW5nIGxvZ2ljYWwgdm9sdW1lcyAoY29uc2lzdGluZyBvZiBsb2dpY2FsIGJsb2Nrcykg
b24gdG9wCj4gPj4gKyAgb2YgcmF3IGZsYXNoIGRldmljZXMuIEl0IGRlYWxzIHdpdGggbG93LWxl
dmVsIGZsYXNoIGlzc3VlcyAoYml0LWZsaXBzLCBiYWQKPiA+PiArICBwaHlzaWNhbCBlcmFzZWJs
b2Nrcywgd2VhcmluZykgcHJvdmlkaW5nIGEgcmVsaWFibGUgZGF0YSBzdG9yYWdlLgo+ID4+ICsK
PiA+PiArICBVQkkgZGV2aWNlIGlzIGJ1aWx0IGFuZCBzdG9yZWQgaW4gYSBzaW5nbGUgZmxhc2gg
cGFydGl0aW9uLgo+ID4+ICsKPiA+PiArICBTb21lICh1c3VhbGx5IGVtYmVkZGVkKSBkZXZpY2Vz
IHVzZSBVQkkgdm9sdW1lcyBvZiBzcGVjaWZpYyBuYW1lcyBvciBpbmRleGVzCj4gPj4gKyAgdG8g
c3RvcmUgc2V0dXAgLyBjb25maWd1cmF0aW9uIGRhdGEuIFRoaXMgYmluZGluZyBhbGxvd3MgZGVz
Y3JpYmluZyBzdWNoCj4gPj4gKyAgdm9sdW1lcyBzbyB0aGV5IGNhbiBiZSBpZGVudGlmaWVkIGFu
ZCByZWZlcmVuY2VkIGJ5IGNvbnN1bWVycy4KPiA+PiArCj4gPj4gK21haW50YWluZXJzOgo+ID4+
ICsgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4+ICsKPiA+PiArYWxs
T2Y6Cj4gPj4gKyAgLSAkcmVmOiBwYXJ0aXRpb24ueWFtbCMKPiA+PiArCj4gPj4gK3Byb3BlcnRp
ZXM6Cj4gPj4gKyAgY29tcGF0aWJsZToKPiA+PiArICAgIGNvbnN0OiB1YmkKPiA+PiArCj4gPj4g
K3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4+ICsgICJedm9sdW1lLVswLTlhLWZdKyQiOgo+ID4+ICsg
ICAgdHlwZTogb2JqZWN0Cj4gPj4gKyAgICBkZXNjcmlwdGlvbjogVUJJIHZvbHVtZQo+ID4+ICsg
ICAgcHJvcGVydGllczoKPiA+PiArICAgICAgdm9sdW1lLW5hbWU6Cj4gPj4gKyAgICAgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nCj4gPj4gKyAgICAgIHZv
bHVtZS1pZDoKPiA+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzIKPiA+PiArICAgIGFueU9mOgo+ID4+ICsgICAgICAtIHJlcXVpcmVkOgo+ID4+
ICsgICAgICAgICAgLSB2b2x1bWUtbmFtZQo+ID4+ICsgICAgICAtIHJlcXVpcmVkOgo+ID4+ICsg
ICAgICAgICAgLSB2b2x1bWUtaWQKPiA+PiArCj4gPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UKPiA+PiArCj4gPj4gK2V4YW1wbGVzOgo+ID4+ICsgIC0gfAo+ID4+ICsgICAgcGFydGl0
aW9ucyB7Cj4gPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiA+
PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+PiArICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwxPjsKPiA+PiArCj4gPj4gKyAgICAgICAgcGFydGl0aW9uQDAgewo+ID4+ICsgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInViaSI7Cj4gPj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAgMHgxMDAwMDAwPjsKPiA+PiArICAgICAgICAgICAgbGFiZWwgPSAiZmlsZXN5c3RlbSI7Cj4g
Pj4gKwo+ID4+ICsgICAgICAgICAgICBlbnY6IHZvbHVtZS0wIHsKPiA+PiArICAgICAgICAgICAg
ICAgIHZvbHVtZS1uYW1lID0gInUtYm9vdC1lbnYiOwo+ID4KPiA+IFdoeSBub3QgZG8gJ2NvbXBh
dGlibGUgPSAidS1ib290LGVudiI7JyB0byBhbGlnbiB3aXRoIG5vcm1hbCBwYXJ0aXRpb25zPwo+
Cj4gSSBtZWFuIHRvIHJlc2VydmUgImNvbXBhdGlibGUiIGZvciBkZXNjcmliaW5nIFVCSSB2b2x1
bWUgY29udGVudC4KPgo+IElmIEkgbWFuYWdlIHRvIGdldAo+IFtQQVRDSCBWM10gZHQtYmluZGlu
Z3M6IG52bWVtOiBhZGQgVS1Cb290IGVudmlyb25tZW50IHZhcmlhYmxlcyBiaW5kaW5nCj4gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0
Y2gvMjAyMjAyMjgxMzEyNTAuMTY5NDMtMS16YWplYzVAZ21haWwuY29tLwo+IGFjY2VwdGVkLCBp
dCdsbCBhbGxvdyBtZSB0byBsYXRlciB3b3JrIG9uIHNvbWV0aGluZyBsaWtlOgo+Cj4gZW52OiB2
b2x1bWUtMCB7Cj4gICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxlbnYiOwo+ICAgICAgdm9sdW1l
LW5hbWUgPSAidS1ib290LWVudiI7Cj4gfTsKPgo+IChJIGJlbGlldmUpIEknbGwgbmVlZCAoaW4g
dGhlIGZpbmFsIHNoYXBlKSB0d28gcHJvcGVydGllczoKPiAxLiBPbmUgZm9yIGRlc2NyaWJpbmcg
VUJJIHZvbHVtZSAoImNvbXBhdGlibGUiKQo+IDIuIE9uZSBmb3IgaWRlbnRpZnlpbmcgVUJJIHZv
bHVtZSAoInZvbHVtZS1uYW1lIiAvICJ2b2x1bWUtaWQiKQo+Cj4gSXQncyBzaW1pbGFyIGRlc2ln
biB0byB0aGUgImNvbXBhdGlibGUiIHZzLiAicmVnIiBpbiBJTyBodyBibG9ja3MuCgpUaGF0J3Mg
d2hhdCBpdCBpcyB2cy4gd2hhdCBpbnN0YW5jZS4gWW91IG5lZWQgYSBiZXR0ZXIgZXhhbXBsZSBp
Zgp0aGF0J3Mgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBzaG93LiBJIGd1ZXNzIGlmIHlvdSB3ZXJl
IGRvaW5nIEEvQgp1cGRhdGVzIHlvdSdkIGhhdmUgc29tZXRoaW5nIGxpa2UgJ3ZvbHVtZS1uYW1l
ID0gInUtYm9vdC1lbnYtYiInPwoKPgo+Cj4gPiBPciAnbGFiZWwnPwo+Cj4gSSBjb3VsZCByZXBs
YWNlICJ2b2x1bWUtbmFtZSIgd2l0aCAibGFiZWwiIGJ1dCBzb21lb25lIG9uY2UgdG9sZCBtZSB0
aGF0Ogo+ICA+ICdsYWJlbCcgaXMgc3VwcG9zZWQgdG8gY29ycmVzcG9uZCB0byBhIHN0aWNrZXIg
b24gYSBwb3J0IG9yIHNvbWV0aGluZwo+ICA+IGh1bWFuIGlkZW50aWZpYWJsZQoKWWVzLCBpdCBj
b3VsZCBiZSBhIGh1bWFuIHdhbnRpbmcgdG8gaWRlbnRpZnkgaXQuIFRoZSBxdWVzdGlvbiBpcwp3
aGV0aGVyIHMvdyBkb2VzIHRvby4KClRoZSBvdGhlciBhc3BlY3QgaXMgdGhlcmUncyBhbHNvIGZp
bGVzeXN0ZW0vcGFydGl0aW9uIGxhYmVsJ3MuIFRob3NlCmFyZSBnZW5lcmFsbHkgc2V0IGJ5IGh1
bWFucyBhbmQgb3BhcXVlIHRvIHRoZSBzL3cuIElmIHRoZSB1c2UgaXMKYWxpZ25lZCB3aXRoIGhv
dyB0aG9zZSBsYWJlbHMgYXJlIHVzZWQsIHRoZW4gSSdkIGJlIG9rYXkgd2l0aCB0aGUgRFQKJ2xh
YmVsJyBoZXJlLgoKPgo+IDspIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY29tbWVudC8y
ODEyMjE0Lwo+Cj4gU28gSSBkb24ndCB3YW50IHRvIGFidXNlICJsYWJlbCIgaGVyZS4KPgo+Cj4g
PiBXZSBoYXZlIGVub3VnaCB3YXlzIHRvIGlkZW50aWZ5IHRoaW5ncywgSSBkb24ndCB0aGluayB3
ZSBuZWVkIGFub3RoZXIuCj4gPgo+ID4+ICsgICAgICAgICAgICB9Owo+ID4+ICsKPiA+PiArICAg
ICAgICAgICAgY2FsaWJyYXRpb246IHZvbHVtZS0xIHsKPiA+Cj4gPiBBcmUgMCBhbmQgMSBtZWFu
aW5nZnVsIG9yIGp1c3QgbWFkZSB1cCBpbmRleGluZz8KPgo+IE1hZGUgdXAgaW5kZXhpbmcuIEkg
bmVlZCB1bmlxdWUgbm9kZW5hbWVzIGJ1dCBAWzAtOWEtZl0gZG9lc24ndCBhcHBwbHkgaGVyZS4K
Ck1heWJlIHVzZSAidm9sdW1lLSR2b2x1bWVuYW1lIiBvciAidm9sdW1lLSR2b2x1bWVpZCIgaW5z
dGVhZD8KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
