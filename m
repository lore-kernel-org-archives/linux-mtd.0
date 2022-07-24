Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B660C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 14:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVFTbdxXaLKNAZcegSj+5ebcOdQ1IAov2cfkLMaKqaI=; b=ls7BfjHSWT7z1vhSuX6U7Gz+Ol
	5W0jnyitHxWVdg5JCsoDYmhtH2Q1PNP06JBQHBeMS+GTC0jXomS2wSQbxuMnqO1vGBI8wK8l1Ju4X
	aq91yPoW/0FDiuIOwECthnxZ2giDlqWzdrKjd7UiQHeQ5HlKgSVuly6tu4gTVrtKaAld5o5G1bJeP
	Xu7NsLZF8EY00x8foMF8KfDr9A+nMJ8oKrhJWmuE06baxbgtHMAm+Q6EMtmSm7Bx2HnS/EhRqY1b+
	+L8hqfH2baGoZj1jwLNDvlFR6Rn34QWuVr8apjO82wPwvHjNM+CMettSAHa+6MBxGDESzC9jg7+bd
	GqWFFDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcz9-006iRn-8o; Sun, 24 Jul 2022 14:53:35 +0000
Received: from out28-73.mail.aliyun.com ([115.124.28.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcz3-006iOl-Ar
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 14:53:31 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07443763|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.00847653-0.000137917-0.991386;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.OcPER7W_1658674379;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.OcPER7W_1658674379)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 22:53:01 +0800
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mike Yang <reimu@sudomaker.com>, tudor.ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
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
 <34bed9a9-a995-c922-c197-062c7170f6f3@linaro.org>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <aa68546e-09a2-3ed7-d9ed-6566a7c9f997@wanyeetech.com>
Date: Sun, 24 Jul 2022 22:52:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <34bed9a9-a995-c922-c197-062c7170f6f3@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_075329_625181_A10F00F2 
X-CRM114-Status: GOOD (  22.30  )
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

SGkgS3J6eXN6dG9mLCBNaWtlICYgTWFyaywKCk9uIDIwMjIvNy8yNCDkuIrljYg0OjA1LCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDIzLzA3LzIwMjIgMjA6NDcsIE1pa2UgWWFuZyB3
cm90ZToKPj4gT24gNy8yNC8yMiAwMTo0MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+
IE9uIDIzLzA3LzIwMjIgMTg6NTAsIFpob3UgWWFuamllIHdyb3RlOgo+Pj4+IEhpIEtyenlzenRv
ZiwKPj4+Pgo+Pj4+IE9uIDIwMjIvNy8yMyDkuIrljYgxOjQ2LCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+Pj4+PiBPbiAyMi8wNy8yMDIyIDE4OjQ4LCDlkajnkLDmnbAgKFpob3UgWWFuamll
KSB3cm90ZToKPj4+Pj4+IEFkZCB0aGUgU0ZDIGJpbmRpbmdzIGZvciB0aGUgWDEwMDAgU29DLCB0
aGUgWDE2MDAgU29DLCB0aGUgWDE4MzAgU29DLAo+Pj4+Pj4gYW5kIHRoZSBYMjAwMCBTb0MgZnJv
bSBJbmdlbmljLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZ
YW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbCAgICAgICB8IDY0ICsr
KysrKysrKysrKysrKysrKysrKysKPj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRp
b25zKCspCj4+Pj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwaS9pbmdlbmljLHNmYy55YW1sCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFt
bAo+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4+IGluZGV4IDAwMDAwMDAwLi5iN2M0
Y2Y0Cj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKPj4+Pj4+IEBAIC0wLDAgKzEsNjQg
QEAKPj4+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkKPj4+Pj4+ICslWUFNTCAxLjIKPj4+Pj4+ICstLS0KPj4+Pj4+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NwaS9pbmdlbmljLHNmYy55YW1sIwo+Pj4+PiBG
aWxlIG5hbWUgc2hvdWxkIGJlIHJhdGhlciBiYXNlZCBvbiBmaXJzdCBjb21wYXRpYmxlLCBzbwo+
Pj4+PiBpbmdlbmljLHgxMDAwLXNmYy55YW1sCj4+Pj4KPj4+PiBObyBvZmZlbnNlLCBkb2VzIGl0
IHJlYWxseSBuZWVkIHRvIGJlIG5hbWVkIHRoYXQgd2F5Pwo+Pj4+IEkgY2FuJ3Qgc2VlbSB0byBm
aW5kIGRvY3VtZW50YXRpb24gd2l0aCBpbnN0cnVjdGlvbnMgb24gdGhpcyA6KAo+Pj4+Cj4+Pj4g
VGhlIHVzZSBvZiAiaW5nZW5pYyxzZmMueWFtbCIgaW5kaWNhdGVzIHRoYXQgdGhpcyBpcyB0aGUg
ZG9jdW1lbnRhdGlvbgo+Pj4+IGZvciB0aGUgU0ZDIG1vZHVsZSBmb3IgYWxsIEluZ2VuaWMgU29D
cywgd2l0aG91dCBtaXNsZWFkaW5nIHBlb3BsZSBpbnRvCj4+Pj4gdGhpbmtpbmcgaXQncyBvbmx5
IGZvciBhIHNwZWNpZmljIG1vZGVsIG9mIFNvQy4gQW5kIHRoZXJlIHNlZW0gdG8gYmUgbWFueQo+
Pj4+IG90aGVyIHlhbWwgZG9jdW1lbnRzIHRoYXQgdXNlIHNpbWlsYXIgbmFtZXMgKGVnLiBmc2ws
c3BpLWZzbC1xc3BpLnlhbWwsCj4+Pj4gc3BpLXJvY2tjaGlwLnlhbWwsIHNwaS1ueHAtZnNwaS55
YW1sLCBpbmdlbmljLHNwaS55YW1sLCBzcGktc2lmaXZlLnlhbWwsCj4+Pj4gb21hcC1zcGkueWFt
bCksIG1heWJlIHRoZXNlIHlhbWwgZmlsZXMgdGhhdCBhcmUgbm90IG5hbWVkIHdpdGggZmlyc3QK
Pj4+PiBjb21wYXRpYmxlIGFyZSBhbHNvIGZvciB0aGUgc2FtZSBjb25zaWRlcmF0aW9uLiA6KQo+
Pj4gV2UgaGF2ZSBtYW55IGJhZCBleGFtcGxlcywgbWFueSBwb29yIHBhdHRlcm5zIGFuZCB0aGV5
IGFyZSBuZXZlciBhbgo+Pj4gYXJndW1lbnQgdG8gYWRkIG9uZSBtb3JlIGJhZCBwYXR0ZXJuLgo+
PiBaaG91IGFscmVhZHkgbWVudGlvbmVkIGhlIHdhcyB1bmFibGUgZmluZCB0aGUgbmFtaW5nIGd1
aWRlbGluZXMgb2YgdGhlc2UgLnlhbWwgZmlsZXMuCj4+Cj4+IEFwcGFyZW50bHkgeW91IHRoaW5r
IGl0J3MgdW5hY2NlcHRhYmxlIGZvciBuZXcgY29udHJpYnV0b3JzIG9mIGEgY2VydGFpbiBzdWJz
eXN0ZW0gdG8gdXNlIGV4aXN0aW5nIGNvZGUgYXMgZXhhbXBsZXMsIGFuZC9vciB0aGV5J3JlIHJl
c3BvbnNpYmxlIGZvciBmaWd1cmluZyBvdXQgd2hhdCdzIGEgZ29vZCBleGFtcGxlIGFuZCB3aGF0
J3MgYSBiYWQgb25lIGluIHRoZSBleGlzdGluZyBjb2RlYmFzZS4KPiBJdCdzIGV2ZXJ5d2hlcmUg
aW4gdGhlIGtlcm5lbCwgd2hhdCBjYW4gSSBzYXk/IElmIHlvdSBjb3B5IGV4aXN0aW5nCj4gY29k
ZSwgeW91IG1pZ2h0IGNvcHkgcG9vciBjb2RlLi4uCj4KPj4+IEl0IG1pZ2h0IG5ldmVyIGdyb3cg
dG8gbmV3IGRldmljZXMgKGJlY2F1c2UgdGhleSBtaWdodCBiZSBkaWZmZXJlbnQpLCBzbwo+Pj4g
dGhhdCBpcyBub3QgcmVhbGx5IGFuIGFyZ3VtZW50Lgo+PiBJdCBpcyBhbiBhcmd1bWVudC4gQSB2
ZXJ5IHZhbGlkIG9uZS4KPj4KPj4gInRoZXkgKm1pZ2h0KiBiZSBkaWZmZXJlbnQiLiBZb3UgbWF5
IHdhbnQgdG8gZ2V0IHlvdXIgaGFuZHMgb24gcmVhbCBoYXJkd2FyZSBhbmQgdHJ5IGFub3RoZXIg
d29yZC4gT3IgYXQgbGVhc3QgcmVhZCB0aGUgZGF0YXNoZWV0cyBpbnN0ZWFkIG9mIGJlbGlldmlu
ZyB5b3VyIGltYWdpbmF0aW9uLgo+Pgo+PiBJIHdvdWxkIGVuam95IGR1cGxpY2F0aW5nIHRoZSBz
dCxzdG0zMi1zcGkueWFtbCBpbnRvIHN0LHN0bTMye2YsaH17MC4uN30tc3BpLnlhbWwgaWYgSSdt
IGJvcmVkIGF0IGEgU3VuZGF5IGFmdGVybm9vbi4KPj4KPj4+IEFsbCBiaW5kaW5ncyBhcmUgdG8g
Zm9sbG93IHRoaXMgcnVsZSwgc28gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UKPj4+IHRoaW5r
IGl0IGlzIGFuIGV4Y2VwdGlvbiBmb3IgeW91Pwo+PiBaaG91IGRpZG4ndCBhc2sgeW91IHRvIG1h
a2UgYW4gZXhjZXB0aW9uLiBUaGV5IGhhdmUgYSB2YWxpZCBwb2ludCBhbmQgdGhleSdyZSBhc2tp
bmcgd2h5Lgo+IEhtLCBldmVyeW9uZSBoYXMgdGhlIHNhbWUgdmFsaWQgcG9pbnQgYW5kIHN1Y2gg
cmVjb21tZW5kYXRpb24gaXMgdG8KPiBldmVyeW9uZSwgYWx0aG91Z2ggaXQgaXMgbm90aGluZyBz
ZXJpb3VzLgo+Cj4+IFlvdSBtYXkgd2FudCB0byBhdm9pZCBmdXJ0aGVyIGluY2lkZW50cyBvZiB0
aGlzIGtpbmQgYnkgc3RvcCBiZWluZyBib3NzeSBhbmQgYWN0dWFsbHkgd3JpdGluZyBhIGd1aWRl
bGluZSBvZiBuYW1pbmcgdGhlc2UgLnlhbWwgZmlsZXMgYW5kIHB1Ymxpc2ggaXQgc29tZXdoZXJl
IG9ubGluZS4KPiBJIGRpZCBub3Qgc2VlIGFueSBpbmNpZGVudCBoZXJlLi4uIFByb2Nlc3Mgb2Yg
cmV2aWV3IGluY2x1ZGVzIGNvbW1lbnRzCj4gYW5kIHRoZXJlIGlzIG5vdGhpbmcgYmFkIGhhcHBl
bmluZyB3aGVuIHlvdSByZWNlaXZlIGEgY29tbWVudC4gTm8KPiBpbmNpZGVudC4uLgoKCkkgaGF2
ZSBubyBpbnRlbnRpb24gb2YgcHJvdm9raW5nIGFyZ3VtZW50cywgSSBqdXN0IGRpZCAqZ3JlcCAt
cm4gImZpcnN0IApjb21wYXRpYmxlIiogaW4gdGhlCkRvY3VtZW50YXRpb24gZm9sZGVyIGFmdGVy
IHlvdSBtZW50aW9uZWQgdGhlIG5hbWluZyBydWxlcyBhYm91dCAiZmlyc3QgCmNvbXBhdGlibGUi
IGJlZm9yZSwKYnV0IGp1c3QgZm91bmQgYSAiZmlyc3QgY29tcGF0aWJsZSIgaW4gIkRvY3VtZW50
YXRpb24vZmIvc3N0ZmIucnN0IiwgYnV0IApJdCBoYXMgYWJzb2x1dGVseQpub3RoaW5nIHRvIGRv
IHdpdGggZmlsZSBuYW1pbmcuIEFzIE1pa2UgYW5kIE1hcmsgc2FpZCwgbXkgcXVlc3Rpb24gaW4g
CnRoZSBwcmV2aW91cyBlbWFpbAp3YXMganVzdCBvdXQgb2YgY3VyaW9zaXR5IGFib3V0IHdoZXJl
IHRvIGxvb2sgZm9yIGEgZGV0YWlsZWQgZXhwbGFuYXRpb24gCm9mIHRoZSBydWxlLgpTaW5jZSBp
dCB3b3VsZCBiZSBzb21ld2hhdCBzdHJhbmdlIHRvIGhhdmUgdHdvICJJbmdlbmljIiB5YW1sIGZp
bGVzIHdpdGggCmRpZmZlcmVudCBuYW1pbmcKcnVsZXMgaW4gdGhlIFNQSSBzdWJzeXN0ZW0sIG1h
eWJlIFJvYiBjYW4gZ3VpZGUgdXMgaGVyZT8KCgpUaGFua3MgYW5kIGJlc3QgcmVnYXJkcyEKCgo+
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
