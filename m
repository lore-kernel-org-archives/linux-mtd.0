Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E83C43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 16:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYylJ6jRg70TjS5bheWMHYOy/3wK+KOz5fwdh77vsS8=; b=gfXykN/w/cwyJSpMyjJfeDkrge
	KhYw4CIGzcEF0NMhGwfOkTRUaadryYW+0LKZSUyCRqQMN02f4jssNbGkiLhhOT6n4dJnjginyTpI8
	Xd/3hkD071g1VZf1Ei/llCYKqsQhhm9apj+deNOP5SmwYoZxRpY3YyrPCQlnxzUegF5vGamIKcKr6
	BEUOBp0SjQsZniNe+uVISwbnxM2vnN8WrdOWP/1ReWj6xIK7y/ywJmBogzTwiHYzQP+j6Tw4vMqBZ
	BmLdCOjL42llz3r8EWl9K/OHCS5mLUl51f/aG5i1HuwQRtpdtQzctYZUVOxO2LyR2uE+wK2F+56Vp
	QhXsPeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFILg-005im3-VK; Sat, 23 Jul 2022 16:51:29 +0000
Received: from out28-172.mail.aliyun.com ([115.124.28.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFILb-005icz-1Z
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 16:51:26 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07959742|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0621329-0.00156306-0.936304;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.Obla2Lb_1658595040;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Obla2Lb_1658595040)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 00:50:42 +0800
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
 <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
Date: Sun, 24 Jul 2022 00:50:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_095123_600400_976A7C4F 
X-CRM114-Status: GOOD (  18.63  )
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

SGkgS3J6eXN6dG9mLAoKT24gMjAyMi83LzIzIOS4iuWNiDE6NDYsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gT24gMjIvMDcvMjAyMiAxODo0OCwg5ZGo55Cw5p2wIChaaG91IFlhbmppZSkg
d3JvdGU6Cj4+IEFkZCB0aGUgU0ZDIGJpbmRpbmdzIGZvciB0aGUgWDEwMDAgU29DLCB0aGUgWDE2
MDAgU29DLCB0aGUgWDE4MzAgU29DLAo+PiBhbmQgdGhlIFgyMDAwIFNvQyBmcm9tIEluZ2VuaWMu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamll
QHdhbnllZXRlY2guY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
aW5nZW5pYyxzZmMueWFtbCAgICAgICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKPj4K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5n
ZW5pYyxzZmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5n
ZW5pYyxzZmMueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMC4u
YjdjNGNmNAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbAo+PiBAQCAtMCwwICsxLDY0IEBACj4+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
Pj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL3NwaS9pbmdlbmljLHNmYy55YW1sIwo+IEZpbGUgbmFtZSBzaG91bGQgYmUgcmF0aGVyIGJh
c2VkIG9uIGZpcnN0IGNvbXBhdGlibGUsIHNvCj4gaW5nZW5pYyx4MTAwMC1zZmMueWFtbAoKCk5v
IG9mZmVuc2UsIGRvZXMgaXQgcmVhbGx5IG5lZWQgdG8gYmUgbmFtZWQgdGhhdCB3YXk/CkkgY2Fu
J3Qgc2VlbSB0byBmaW5kIGRvY3VtZW50YXRpb24gd2l0aCBpbnN0cnVjdGlvbnMgb24gdGhpcyA6
KAoKVGhlIHVzZSBvZiAiaW5nZW5pYyxzZmMueWFtbCIgaW5kaWNhdGVzIHRoYXQgdGhpcyBpcyB0
aGUgZG9jdW1lbnRhdGlvbgpmb3IgdGhlIFNGQyBtb2R1bGUgZm9yIGFsbCBJbmdlbmljIFNvQ3Ms
IHdpdGhvdXQgbWlzbGVhZGluZyBwZW9wbGUgaW50bwp0aGlua2luZyBpdCdzIG9ubHkgZm9yIGEg
c3BlY2lmaWMgbW9kZWwgb2YgU29DLiBBbmQgdGhlcmUgc2VlbSB0byBiZSBtYW55Cm90aGVyIHlh
bWwgZG9jdW1lbnRzIHRoYXQgdXNlIHNpbWlsYXIgbmFtZXMgKGVnLiBmc2wsc3BpLWZzbC1xc3Bp
LnlhbWwsCnNwaS1yb2NrY2hpcC55YW1sLCBzcGktbnhwLWZzcGkueWFtbCwgaW5nZW5pYyxzcGku
eWFtbCwgc3BpLXNpZml2ZS55YW1sLApvbWFwLXNwaS55YW1sKSwgbWF5YmUgdGhlc2UgeWFtbCBm
aWxlcyB0aGF0IGFyZSBub3QgbmFtZWQgd2l0aCBmaXJzdApjb21wYXRpYmxlIGFyZSBhbHNvIGZv
ciB0aGUgc2FtZSBjb25zaWRlcmF0aW9uLiA6KQoKCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEJpbmRpbmdz
IGZvciBTRkMgaW4gSW5nZW5pYyBTb0NzCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIOWR
qOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgo+PiArCj4+
ICtkZXNjcmlwdGlvbjoKPj4gKyAgVGhlIFNQSSBGbGFzaCBDb250cm9sbGVyIGluIEluZ2VuaWMg
U29Dcy4KPj4gKwo+IFlvdSBtaXNzIGhlcmUgYWxsT2YgcmVmZXJlbmNpbmcgc3BpLWNvbnRyb2xs
ZXIuCgoKU3VyZSwgd2lsbCBhZGQgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCgo+PiArcHJvcGVy
dGllczoKPj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBvbmVPZjoKPj4gKyAgICAgIC0gZW51bToK
Pj4gKyAgICAgICAgICAtIGluZ2VuaWMseDEwMDAtc2ZjCj4+ICsgICAgICAgICAgLSBpbmdlbmlj
LHgxNjAwLXNmYwo+PiArICAgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1zZmMKPj4gKyAgICAgIC0g
aXRlbXM6Cj4+ICsgICAgICAgICAgLSBlbnVtOgo+PiArICAgICAgICAgICAgICAtIGluZ2VuaWMs
eDE4MzAtc2ZjCj4+ICsgICAgICAgICAgLSBjb25zdDogaW5nZW5pYyx4MTAwMC1zZmMKPj4gKwo+
PiArICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiAr
ICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+
ICsKPj4gKyAgY2xvY2stbmFtZXM6Cj4+ICsgICAgY29uc3Q6IHNmYwo+IFJlbW92ZSB0aGUgY2xv
Y2stbmFtZXMgZW50aXJlbHksIG5vIGJlbmVmaXRzLgoKClN1cmUuCgoKPj4gKwo+PiArcmVxdWly
ZWQ6Cj4+ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiArICAtIGludGVycnVwdHMKPj4g
KyAgLSBjbG9ja3MKPj4gKyAgLSBjbG9jay1uYW1lcwo+PiArCj4+ICthZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9pbmdlbmljLHgxMDAwLWNndS5oPgo+PiArCj4+ICsJc2ZjOiBz
cGlAMTM0NDAwMDAgewo+PiArCQljb21wYXRpYmxlID0gImluZ2VuaWMseDEwMDAtc2ZjIjsKPgo+
IFVzZSA0IHNwYWNlcyBmb3IgZXhhbXBsZSBpbmRlbnRhdGlvbi4KCgpNeSBmYXVsdCwgd2lsbCBm
aXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCgo+PiArCQlyZWcgPSA8MHgxMzQ0MDAwMCAweDEw
MDA+Owo+PiArCj4+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmludGM+Owo+PiArCQlpbnRlcnJ1
cHRzID0gPDc+Owo+PiArCj4+ICsJCWNsb2NrcyA9IDwmY2d1IFgxMDAwX0NMS19TRkM+Owo+PiAr
CQljbG9jay1uYW1lcyA9ICJzZmMiOwo+PiArCj4+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4g
Tm8gc3RhdHVzIGluIGV4YW1wbGUuCgoKU3VyZSwgd2lsbCByZW1vdmUgaXQgaW4gdGhlIG5leHQg
dmVyc2lvbi4KCgpUaGFua3MgYW5kIGJlc2V0IHJlZ2FyZHMhCgoKPgo+PiArCX07Cj4+ICsuLi4K
Pgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
