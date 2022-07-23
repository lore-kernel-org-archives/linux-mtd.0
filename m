Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C17C43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxwpsgjBDp+zkueq7aZ5zl/qAJgrpAK20jKmKHCim8M=; b=a3uOjeLd4dk2Ry
	N0tLEasu9rsPI+BeoaxQbRKboksTdglBc7/T/ZKVkN/FByypHGXNtj1w1b5eXAMt8YD+/W9ZoTTR5
	c+hcMDD5jhDKORNs4mdODbT2JGfKtoMPK4jwpzLCEizTbUunNBrRSj6bXFqkFPVfjbuf4Ovqd7+4e
	MoOi+JTiGGjUTNNgW0pA6MF1g0loMO6e/3vkTu4ZQ292m9AAFDAvpDMn8HOHf01fJZp20djWnTQJJ
	ODUz4vfKy8j5QbGSzkN9i1AX0W7/TPabfFr1Obm/w5IOL7PbLkIOy9jOke0m3V9E7j6ogWTPRjXgx
	8BnnoULhsXPclMpoGNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLNb-006uP5-Iz; Sat, 23 Jul 2022 20:05:39 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLNX-006uMs-SC
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 20:05:37 +0000
Received: by mail-lj1-x231.google.com with SMTP id m9so8921258ljp.9
        for <linux-mtd@lists.infradead.org>; Sat, 23 Jul 2022 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3I2kmw70ab8Sogw9ISGUW++Hbm5TK7LsIWm3GHiAUaQ=;
        b=AXKBB5Rj/xYBPPRUJBU9H3C/UuoCoDGV21IjYFI5yEeYC0uIqYjrS6HTpePaDtxBoj
         +yvAS/CtpTMuyECK9BUskJlRvfUVAHWjOJbl7JHTLtc2qZN5NPEQIH+tOaWSMBrqCN8q
         4HgSpTNmPZmRGVGOqfb1+eZw6RP7Fx5QAa2hE4N4gqXEtjTUO6TDCgZZbGFkU0vvjU3s
         VD8UGGxyGOgPZhQglGfKf3uWDnZRaO747LPa5t0260xeFGTPbhLi0pNgQdqP34GIGA0L
         R20pYwytMaJwEBEk4SnB9r+Eka6/ZvpAvQZzpX9+M748n1ogTXBPqKbMkxZHyHM8Tryw
         XTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3I2kmw70ab8Sogw9ISGUW++Hbm5TK7LsIWm3GHiAUaQ=;
        b=5hMH1fWhxNIXB5ATt6VIdcrcbWdjmc31QHthSze7sgvOFivTyPEM26LjcOzhyrgZ2e
         AZp2uvdZH1a82h7OqFmxU5EVLBI3L4t4ZY+VAVA8Kio3Gm+ApGgg355ZrZHPTJPoaESk
         ym+U2fGhg7hJU0hGcyxAO6Ahgl1N0TpUYLR5NbqdjW/K3xQN7Kgnzstl+p/02xl6nGCN
         adz7Py1h3gJE/bCHz4Rxz5fY+dxb1WXf+OL4gKA49Io31gSwB9LA1mlUv9aI2HKCr1Gs
         GLtGTOOVj49yrHTC7uUdVHgfwr3z5T4UGAVWp2CMRhoiRhInae+XLrYAugv0T2rk6WiK
         UC1g==
X-Gm-Message-State: AJIora+OdoleUnZCRcLed6kLzhH5DQennY7mDcfMo4U/ezKnrP15d7eY
	9bk3ZdyQTJNp3aRApzgdM+qhVQ==
X-Google-Smtp-Source: AGRyM1un+YOkOEREyXZGaDp+YVQkM6P1c7QgtXC/+R2hsX+NDmSLbuXrAnacfdA+4OXjgVqXLzWhHA==
X-Received: by 2002:a2e:bd89:0:b0:25a:86c8:93ca with SMTP id o9-20020a2ebd89000000b0025a86c893camr1760237ljq.419.1658606733295;
        Sat, 23 Jul 2022 13:05:33 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id z6-20020a0565120c0600b00489d15132eesm1794041lfu.306.2022.07.23.13.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 13:05:32 -0700 (PDT)
Message-ID: <34bed9a9-a995-c922-c197-062c7170f6f3@linaro.org>
Date: Sat, 23 Jul 2022 22:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Content-Language: en-US
To: Mike Yang <reimu@sudomaker.com>, Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_130535_967520_2231E092 
X-CRM114-Status: GOOD (  21.14  )
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

T24gMjMvMDcvMjAyMiAyMDo0NywgTWlrZSBZYW5nIHdyb3RlOgo+IE9uIDcvMjQvMjIgMDE6NDMs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDIzLzA3LzIwMjIgMTg6NTAsIFpob3Ug
WWFuamllIHdyb3RlOgo+Pj4gSGkgS3J6eXN6dG9mLAo+Pj4KPj4+IE9uIDIwMjIvNy8yMyDkuIrl
jYgxOjQ2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+IE9uIDIyLzA3LzIwMjIgMTg6
NDgsIOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIHdyb3RlOgo+Pj4+PiBBZGQgdGhlIFNGQyBiaW5k
aW5ncyBmb3IgdGhlIFgxMDAwIFNvQywgdGhlIFgxNjAwIFNvQywgdGhlIFgxODMwIFNvQywKPj4+
Pj4gYW5kIHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdlbmljLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiDlkajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4K
Pj4+Pj4gLS0tCj4+Pj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2Zj
LnlhbWwgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDY0IGluc2VydGlvbnMoKykKPj4+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9pbmdlbmljLHNmYy55YW1sCj4+Pj4+Cj4+
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2lu
Z2VuaWMsc2ZjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2lu
Z2VuaWMsc2ZjLnlhbWwKPj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4gaW5kZXggMDAw
MDAwMDAuLmI3YzRjZjQKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKPj4+Pj4gQEAgLTAs
MCArMSw2NCBAQAo+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4+ICslWUFNTCAxLjIKPj4+Pj4gKy0tLQo+Pj4+PiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zcGkvaW5nZW5pYyxzZmMueWFtbCMKPj4+
PiBGaWxlIG5hbWUgc2hvdWxkIGJlIHJhdGhlciBiYXNlZCBvbiBmaXJzdCBjb21wYXRpYmxlLCBz
bwo+Pj4+IGluZ2VuaWMseDEwMDAtc2ZjLnlhbWwKPj4+Cj4+Pgo+Pj4gTm8gb2ZmZW5zZSwgZG9l
cyBpdCByZWFsbHkgbmVlZCB0byBiZSBuYW1lZCB0aGF0IHdheT8KPj4+IEkgY2FuJ3Qgc2VlbSB0
byBmaW5kIGRvY3VtZW50YXRpb24gd2l0aCBpbnN0cnVjdGlvbnMgb24gdGhpcyA6KAo+Pj4KPj4+
IFRoZSB1c2Ugb2YgImluZ2VuaWMsc2ZjLnlhbWwiIGluZGljYXRlcyB0aGF0IHRoaXMgaXMgdGhl
IGRvY3VtZW50YXRpb24KPj4+IGZvciB0aGUgU0ZDIG1vZHVsZSBmb3IgYWxsIEluZ2VuaWMgU29D
cywgd2l0aG91dCBtaXNsZWFkaW5nIHBlb3BsZSBpbnRvCj4+PiB0aGlua2luZyBpdCdzIG9ubHkg
Zm9yIGEgc3BlY2lmaWMgbW9kZWwgb2YgU29DLiBBbmQgdGhlcmUgc2VlbSB0byBiZSBtYW55Cj4+
PiBvdGhlciB5YW1sIGRvY3VtZW50cyB0aGF0IHVzZSBzaW1pbGFyIG5hbWVzIChlZy4gZnNsLHNw
aS1mc2wtcXNwaS55YW1sLAo+Pj4gc3BpLXJvY2tjaGlwLnlhbWwsIHNwaS1ueHAtZnNwaS55YW1s
LCBpbmdlbmljLHNwaS55YW1sLCBzcGktc2lmaXZlLnlhbWwsCj4+PiBvbWFwLXNwaS55YW1sKSwg
bWF5YmUgdGhlc2UgeWFtbCBmaWxlcyB0aGF0IGFyZSBub3QgbmFtZWQgd2l0aCBmaXJzdAo+Pj4g
Y29tcGF0aWJsZSBhcmUgYWxzbyBmb3IgdGhlIHNhbWUgY29uc2lkZXJhdGlvbi4gOikKPj4KPj4g
V2UgaGF2ZSBtYW55IGJhZCBleGFtcGxlcywgbWFueSBwb29yIHBhdHRlcm5zIGFuZCB0aGV5IGFy
ZSBuZXZlciBhbgo+PiBhcmd1bWVudCB0byBhZGQgb25lIG1vcmUgYmFkIHBhdHRlcm4uCj4gCj4g
WmhvdSBhbHJlYWR5IG1lbnRpb25lZCBoZSB3YXMgdW5hYmxlIGZpbmQgdGhlIG5hbWluZyBndWlk
ZWxpbmVzIG9mIHRoZXNlIC55YW1sIGZpbGVzLgo+IAo+IEFwcGFyZW50bHkgeW91IHRoaW5rIGl0
J3MgdW5hY2NlcHRhYmxlIGZvciBuZXcgY29udHJpYnV0b3JzIG9mIGEgY2VydGFpbiBzdWJzeXN0
ZW0gdG8gdXNlIGV4aXN0aW5nIGNvZGUgYXMgZXhhbXBsZXMsIGFuZC9vciB0aGV5J3JlIHJlc3Bv
bnNpYmxlIGZvciBmaWd1cmluZyBvdXQgd2hhdCdzIGEgZ29vZCBleGFtcGxlIGFuZCB3aGF0J3Mg
YSBiYWQgb25lIGluIHRoZSBleGlzdGluZyBjb2RlYmFzZS4KCkl0J3MgZXZlcnl3aGVyZSBpbiB0
aGUga2VybmVsLCB3aGF0IGNhbiBJIHNheT8gSWYgeW91IGNvcHkgZXhpc3RpbmcKY29kZSwgeW91
IG1pZ2h0IGNvcHkgcG9vciBjb2RlLi4uCgo+IAo+Pgo+PiBJdCBtaWdodCBuZXZlciBncm93IHRv
IG5ldyBkZXZpY2VzIChiZWNhdXNlIHRoZXkgbWlnaHQgYmUgZGlmZmVyZW50KSwgc28KPj4gdGhh
dCBpcyBub3QgcmVhbGx5IGFuIGFyZ3VtZW50Lgo+IAo+IEl0IGlzIGFuIGFyZ3VtZW50LiBBIHZl
cnkgdmFsaWQgb25lLgo+IAo+ICJ0aGV5ICptaWdodCogYmUgZGlmZmVyZW50Ii4gWW91IG1heSB3
YW50IHRvIGdldCB5b3VyIGhhbmRzIG9uIHJlYWwgaGFyZHdhcmUgYW5kIHRyeSBhbm90aGVyIHdv
cmQuIE9yIGF0IGxlYXN0IHJlYWQgdGhlIGRhdGFzaGVldHMgaW5zdGVhZCBvZiBiZWxpZXZpbmcg
eW91ciBpbWFnaW5hdGlvbi4KPiAKPiBJIHdvdWxkIGVuam95IGR1cGxpY2F0aW5nIHRoZSBzdCxz
dG0zMi1zcGkueWFtbCBpbnRvIHN0LHN0bTMye2YsaH17MC4uN30tc3BpLnlhbWwgaWYgSSdtIGJv
cmVkIGF0IGEgU3VuZGF5IGFmdGVybm9vbi4KPiAKPj4KPj4gQWxsIGJpbmRpbmdzIGFyZSB0byBm
b2xsb3cgdGhpcyBydWxlLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdQo+PiB0aGluayBp
dCBpcyBhbiBleGNlcHRpb24gZm9yIHlvdT8KPiAKPiBaaG91IGRpZG4ndCBhc2sgeW91IHRvIG1h
a2UgYW4gZXhjZXB0aW9uLiBUaGV5IGhhdmUgYSB2YWxpZCBwb2ludCBhbmQgdGhleSdyZSBhc2tp
bmcgd2h5LgoKSG0sIGV2ZXJ5b25lIGhhcyB0aGUgc2FtZSB2YWxpZCBwb2ludCBhbmQgc3VjaCBy
ZWNvbW1lbmRhdGlvbiBpcyB0bwpldmVyeW9uZSwgYWx0aG91Z2ggaXQgaXMgbm90aGluZyBzZXJp
b3VzLgoKPiBZb3UgbWF5IHdhbnQgdG8gYXZvaWQgZnVydGhlciBpbmNpZGVudHMgb2YgdGhpcyBr
aW5kIGJ5IHN0b3AgYmVpbmcgYm9zc3kgYW5kIGFjdHVhbGx5IHdyaXRpbmcgYSBndWlkZWxpbmUg
b2YgbmFtaW5nIHRoZXNlIC55YW1sIGZpbGVzIGFuZCBwdWJsaXNoIGl0IHNvbWV3aGVyZSBvbmxp
bmUuCgpJIGRpZCBub3Qgc2VlIGFueSBpbmNpZGVudCBoZXJlLi4uIFByb2Nlc3Mgb2YgcmV2aWV3
IGluY2x1ZGVzIGNvbW1lbnRzCmFuZCB0aGVyZSBpcyBub3RoaW5nIGJhZCBoYXBwZW5pbmcgd2hl
biB5b3UgcmVjZWl2ZSBhIGNvbW1lbnQuIE5vCmluY2lkZW50Li4uCgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
