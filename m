Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EDAC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0DhIE8jMg7730H66tAPE784MCp2jfIGyfM+kdaAPXM=; b=dgLB0vriBk00aVoSmO7eA1CD/C
	BIRJASYHO1sSCtq79PSWel9V32xVAbC62+EKdOGxExUO8/TPR1kNDRcfRt1SdN9L+ZlEPLe/mFaeh
	6+rDVDm9PJT+itXElvuI9tKAqrWC5l1PTi6BFqsbESvrfQvswO8p92p9OXOwxUjl6qidXz2Etk9rv
	uWI2ZFFM15BwR0KudPMJZVd/ZL0tCGMnXwyXrnQUmQWccIFfAKJDvf7JErbRikA6QrtqsiBtTmGh3
	mcpRm+GcWryRAgiXjCpgoRFIceDY/HWBlf6GZuNARBpQiz/j5BPEPhDhTCHzOnAKtNnk5NKAT1IJD
	Y5qT4AGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFdbm-006xCd-0E; Sun, 24 Jul 2022 15:33:30 +0000
Received: from out28-169.mail.aliyun.com ([115.124.28.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFdbi-006x8o-S0
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 15:33:28 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07456556|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0166075-7.73192e-05-0.983315;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.OcQouzA_1658676787;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.OcQouzA_1658676787)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 23:33:09 +0800
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
To: Mike Yang <reimu@sudomaker.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
 <487a93c4-3301-aefd-abba-aabf4cb8ec90@linaro.org>
 <37062a5d-9da3-fbaf-89bd-776f32be36d9@wanyeetech.com>
 <d1a0dd15-3621-14e9-b931-417cefaab017@linaro.org>
 <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
 <YtxLoPOykLDTzTn9@sirena.org.uk>
 <f05045fa-9ecd-d312-0eaa-5d19498453fc@linaro.org>
 <b52a8e97-3b8e-c67b-4440-2d7428edb4fa@sudomaker.com>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <b6232d28-8a24-c769-7d63-d4f7af493375@wanyeetech.com>
Date: Sun, 24 Jul 2022 23:33:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b52a8e97-3b8e-c67b-4440-2d7428edb4fa@sudomaker.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_083327_404439_27ADDBA0 
X-CRM114-Status: GOOD (  19.97  )
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

SGkgTWlrZSwKCk9uIDIwMjIvNy8yNCDkuIrljYg0OjQ5LCBNaWtlIFlhbmcgd3JvdGU6Cj4gT24g
Ny8yNC8yMiAwNDowNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjMvMDcvMjAy
MiAyMToyNywgTWFyayBCcm93biB3cm90ZToKPj4+IE9uIFN1biwgSnVsIDI0LCAyMDIyIGF0IDAy
OjQ3OjE0QU0gKzA4MDAsIE1pa2UgWWFuZyB3cm90ZToKPj4+PiBPbiA3LzI0LzIyIDAxOjQzLCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+PiBPbiAyMy8wNy8yMDIyIDE4OjUwLCBaaG91
IFlhbmppZSB3cm90ZToKPj4+Pj4+IE5vIG9mZmVuc2UsIGRvZXMgaXQgcmVhbGx5IG5lZWQgdG8g
YmUgbmFtZWQgdGhhdCB3YXk/Cj4+Pj4+PiBJIGNhbid0IHNlZW0gdG8gZmluZCBkb2N1bWVudGF0
aW9uIHdpdGggaW5zdHJ1Y3Rpb25zIG9uIHRoaXMgOigKPj4+IC4uLgo+Pj4KPj4+Pj4gQWxsIGJp
bmRpbmdzIGFyZSB0byBmb2xsb3cgdGhpcyBydWxlLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgd2h5
IHlvdQo+Pj4+PiB0aGluayBpdCBpcyBhbiBleGNlcHRpb24gZm9yIHlvdT8KPj4+PiBaaG91IGRp
ZG4ndCBhc2sgeW91IHRvIG1ha2UgYW4gZXhjZXB0aW9uLiBUaGV5IGhhdmUgYSB2YWxpZAo+Pj4+
IHBvaW50IGFuZCB0aGV5J3JlIGFza2luZyB3aHkuCj4+Pj4gWW91IG1heSB3YW50IHRvIGF2b2lk
IGZ1cnRoZXIgaW5jaWRlbnRzIG9mIHRoaXMga2luZCBieSBzdG9wCj4+Pj4gYmVpbmcgYm9zc3kg
YW5kIGFjdHVhbGx5IHdyaXRpbmcgYSBndWlkZWxpbmUgb2YgbmFtaW5nIHRoZXNlCj4+Pj4gLnlh
bWwgZmlsZXMgYW5kIHB1Ymxpc2ggaXQgc29tZXdoZXJlIG9ubGluZS4KPj4+IFllYWgsIEkgZG8g
aGF2ZSB0byBzYXkgdGhhdCBJIHdhcyBhbHNvIGNvbXBsZXRlbHkgdW5hd2FyZSB0aGF0Cj4+PiB0
aGVyZSB3YXMgYW55IGVuZm9yY2VkIGNvbnZlbnRpb24gaGVyZS4KPj4gSW5kZWVkLCBpdCdzIG5v
dCBhIGVuZm9yY2VkIHBhdHRlcm4uIEJ1dCB0aGVyZSBhcmUgbWFueSBvdGhlcgo+PiBpbnNpZ25p
ZmljYW50IG9uZXMgd2hpY2ggd2UgYWxzbyB0ZW5kIHRvIGZvcmdldCBkdXJpbmcgcmV2aWV3LCBs
aWtlCj4+IHVzaW5nIHdvcmRzICJEZXZpY2UgVHJlZSBiaW5kaW5ncyIgaW4gdGl0bGUgb3IgdXNp
bmcgdW5uZWNlc3NhcnkgcXVvdGVzCj4+IGFyb3VuZCAicmVmcyIgKGFsc28gaW4gSUQgb2Ygc2No
ZW1hKS4gSXQncyBub3QgYSBiaWcgZGVhbCwgYnV0IEkgYXNrCj4+IHdoZW4gSSBub3RpY2UgaXQu
Cj4gR29vZC4gVGhhbmtzIGZvciBwYXlpbmcgYXR0ZW50aW9uIHRvIHRoZXNlIGRldGFpbHMuCj4K
Pgo+Pj4gWmhvdSBhbHJlYWR5IG1lbnRpb25lZCBoZSB3YXMgdW5hYmxlIGZpbmQgdGhlIG5hbWlu
ZyBndWlkZWxpbmVzIG9mIHRoZXNlIC55YW1sIGZpbGVzLgo+Pj4KPj4+IEFwcGFyZW50bHkgeW91
IHRoaW5rIGl0J3MgdW5hY2NlcHRhYmxlIGZvciBuZXcgY29udHJpYnV0b3JzIG9mIGEgY2VydGFp
biBzdWJzeXN0ZW0gdG8gdXNlIGV4aXN0aW5nIGNvZGUgYXMgZXhhbXBsZXMsIGFuZC9vciB0aGV5
J3JlIHJlc3BvbnNpYmxlIGZvciBmaWd1cmluZyBvdXQgd2hhdCdzIGEgZ29vZCBleGFtcGxlIGFu
ZCB3aGF0J3MgYSBiYWQgb25lIGluIHRoZSBleGlzdGluZyBjb2RlYmFzZS4KPj4gSXQncyBldmVy
eXdoZXJlIGluIHRoZSBrZXJuZWwsIHdoYXQgY2FuIEkgc2F5PyBJZiB5b3UgY29weSBleGlzdGlu
Zwo+PiBjb2RlLCB5b3UgbWlnaHQgY29weSBwb29yIGNvZGUuLi4KPiBTdGlsbCwgaXQgc2hvdWxk
bid0IGJlIGEgcmVzcG9uc2liaWxpdHkgb2YgbmV3IGNvbnRyaWJ1dG9ycyB0byBkZXRlcm1pbmUg
dGhlIHF1YWxpdHkgb2YgYW4gZXhpc3RpbmcgcGllY2Ugb2YgY29kZSwgdW5sZXNzIHRoZXJlIGFy
ZSBjbGVhciBndWlkZWxpbmVzIChpLmUuIG9uZSBzaG91bGQgdXNlIHRoZSBuZXcgImNzLWdwaW9z
IiBhdHRyaWJ1dGUgaW4gU1BJIGNvbnRyb2xsZXJzKS4KPgo+Pj4+IEl0IG1pZ2h0IG5ldmVyIGdy
b3cgdG8gbmV3IGRldmljZXMgKGJlY2F1c2UgdGhleSBtaWdodCBiZSBkaWZmZXJlbnQpLCBzbwo+
Pj4+IHRoYXQgaXMgbm90IHJlYWxseSBhbiBhcmd1bWVudC4KPj4+IEl0IGlzIGFuIGFyZ3VtZW50
LiBBIHZlcnkgdmFsaWQgb25lLgo+Pj4KPj4+ICJ0aGV5ICptaWdodCogYmUgZGlmZmVyZW50Ii4g
WW91IG1heSB3YW50IHRvIGdldCB5b3VyIGhhbmRzIG9uIHJlYWwgaGFyZHdhcmUgYW5kIHRyeSBh
bm90aGVyIHdvcmQuIE9yIGF0IGxlYXN0IHJlYWQgdGhlIGRhdGFzaGVldHMgaW5zdGVhZCBvZiBi
ZWxpZXZpbmcgeW91ciBpbWFnaW5hdGlvbi4KPj4+Cj4+PiBJIHdvdWxkIGVuam95IGR1cGxpY2F0
aW5nIHRoZSBzdCxzdG0zMi1zcGkueWFtbCBpbnRvIHN0LHN0bTMye2YsaH17MC4uN30tc3BpLnlh
bWwgaWYgSSdtIGJvcmVkIGF0IGEgU3VuZGF5IGFmdGVybm9vbi4KPj4+Cj4+Pj4gQWxsIGJpbmRp
bmdzIGFyZSB0byBmb2xsb3cgdGhpcyBydWxlLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlv
dQo+Pj4+IHRoaW5rIGl0IGlzIGFuIGV4Y2VwdGlvbiBmb3IgeW91Pwo+Pj4gWmhvdSBkaWRuJ3Qg
YXNrIHlvdSB0byBtYWtlIGFuIGV4Y2VwdGlvbi4gVGhleSBoYXZlIGEgdmFsaWQgcG9pbnQgYW5k
IHRoZXkncmUgYXNraW5nIHdoeS4KPj4gSG0sIGV2ZXJ5b25lIGhhcyB0aGUgc2FtZSB2YWxpZCBw
b2ludCBhbmQgc3VjaCByZWNvbW1lbmRhdGlvbiBpcyB0bwo+PiBldmVyeW9uZSwgYWx0aG91Z2gg
aXQgaXMgbm90aGluZyBzZXJpb3VzLgo+Pgo+Pj4gWW91IG1heSB3YW50IHRvIGF2b2lkIGZ1cnRo
ZXIgaW5jaWRlbnRzIG9mIHRoaXMga2luZCBieSBzdG9wIGJlaW5nIGJvc3N5IGFuZCBhY3R1YWxs
eSB3cml0aW5nIGEgZ3VpZGVsaW5lIG9mIG5hbWluZyB0aGVzZSAueWFtbCBmaWxlcyBhbmQgcHVi
bGlzaCBpdCBzb21ld2hlcmUgb25saW5lLgo+PiBJIGRpZCBub3Qgc2VlIGFueSBpbmNpZGVudCBo
ZXJlLi4uIFByb2Nlc3Mgb2YgcmV2aWV3IGluY2x1ZGVzIGNvbW1lbnRzCj4+IGFuZCB0aGVyZSBp
cyBub3RoaW5nIGJhZCBoYXBwZW5pbmcgd2hlbiB5b3UgcmVjZWl2ZSBhIGNvbW1lbnQuIE5vCj4+
IGluY2lkZW50Li4uCj4KPiBPa2F5LiBBZnRlciBjYXJlZnVsIGluc3BlY3Rpb24gb2YgdGhlIElu
Z2VuaWMgZGF0YXNoZWV0cywgbm93IEkgaGF2ZSB0aGUgY29uY2x1c2lvbjogVGhlIEluZ2VuaWMg
WDEwMDAsIFgxMDIxLCBYMTUwMCwgWDE1MDEsIFgxNTIwLCBYMTYwMCwgWDE4MDAsIFgxODMwLCBY
MjAwMCwgWDIxMDAsIFgyNTAwIGhhdmUgdGhlIHNhbWUgU0ZDIGNvbnRyb2xsZXIuCgoKQWN0dWFs
bHksIHlvdSBhcmUgYWxzbyBtaXNzaW5nIG91dCB0aGUgWDE2MzAgYW5kIFgxNjYwLCBhbmQgdGhl
IHVwY29taW5nIApYMjYwMC4KCgo+Cj4gWDE2MDAgaGFzIGEgbmV3ZXIgdmVyc2lvbiAobGV0J3Mg
c2F5IHYyKSBvZiB0aGUgU0ZDLCBhbmQgWDIwMDAtMjUwMCBoYXZlIHYzLiBPdGhlcnMgaGF2ZSB0
aGUgb3JpZ2luYWwgdmVyc2lvbiAobGV0J3Mgc2F5IHYxKS4gRWFjaCBuZXcgdmVyc2lvbiBpbnRy
b2R1Y2VkIG5ldyBmZWF0dXJlcyBzdWNoIGFzIGFyYml0cmFyeSBETUEgc2l6ZXMsIGFuZCB0aGUg
cmVzdCBmZWF0dXJlcyBhcmUgdGhlIHNhbWUuCj4KPgo+IFNvIElNTyB0aGUgbmFtZSAiaW5nZW5p
YyxzZmMueWFtbCIgaXMgcGVyZmVjdGx5IGxvZ2ljYWwuCj4KPgo+IFJlZ2FyZHMsCj4gTWlrZSBZ
YW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
