Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39ECC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Dx1iq4CpaSZ/VLdfo+QuXhBzdDNSSdNvP46DD0hlWQ=; b=gATCWUPPKDLB+A
	OFzheS7+0QfsFx6FDrS6TYBMSfdRaAMv1UuuI4UJ0bM9cDvAI6SYnrkDRbuDnrjB54on3ZVlQzP1H
	Z4lyHeDr0QqcRdfsos5UytfJDeevZy5km2XNT1pwg8nhsU/zpDAK1kq6tPYj1VbgZpZX4UN443+7S
	vt+SfWOP+Qyqr0g/h90JHR4CHej4AkD9FSdC+hMID8LBgkMO7F+P8LopQe4p9F7N5ehhmoVCUscrc
	YDTSgEZF2UocZ7NkLICbT9gZQ7P937TvgU2M8AsLqXMhGtqw6rcTfz2RdVlz5+TYENho9gD7g8lYa
	+UkY2hv3paL/RqwRsg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFK9t-006SmK-Tk; Sat, 23 Jul 2022 18:47:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFK9q-006Sit-SE
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 18:47:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id e16so7006958pfm.11
        for <linux-mtd@lists.infradead.org>; Sat, 23 Jul 2022 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rsPZ3UqbP1l4DXR/Tzlf3U3kRDsFMBo5YFbvYGqZy2I=;
        b=bVkOWnq0tkioZ9fnbzZDHzlJG1CDmxY4gphW04FvQO8G7UWdyXyK5Jd+jg4CdK9zh9
         PfjWs6VRu4RV0QjXvroA+QEpIA7QY30xpCN8T991BsrRxMFH9Sh39EBSxxCeuxGvAJzY
         UVJJic2IqkXRPyLKgzyyzxmvQg9bF5Vf/3eiAoRSZ1V9DXjwvMHFjVl7LH49Rel+JxGp
         pl8Z1vDW04v0twYFMijKhy3Jls37IAVV/jmtzur3c3jFBlQ5G6dJ4WiDF8GYVpfLs6TQ
         xsO1G2rk6yPQQ13LgWktZ6GBqadQ2vzWYDLJBHrPD0xSmuRZlEf6HUBJBkvCTSsr5rNF
         mrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rsPZ3UqbP1l4DXR/Tzlf3U3kRDsFMBo5YFbvYGqZy2I=;
        b=l5H4IhFwfrgECiCPRhdYImhs+WXgdP8BHaRpYEHPFaofSytqdUntSuwFbZ/2s0CrB5
         S/69X4qXTdCsNN874vTb/j5P2bdqKqsLatndufKgMMWlcFfmLB9o5CAf0UvY9+PUKUGx
         +Hsa/fWF+sNXAhxPv/6YXSH3niPyr4EVzpyH+mqxIhjYFAkRialNVaDCHGFnEKEZf4cR
         xmn9jUXuHgaTDc3Zw8mfl5IG6czrRjFZsK3kvb+e8rPcCKaMBhnBdOM3JCRWUwSjnkJ/
         CN1fGCq7dL9eY10Vis0BEWOrf0ZBrj35fYB6gfdBpD3I7j8f1TQwStZ/OOhM9GcdPDhA
         tojQ==
X-Gm-Message-State: AJIora/ntR1CI8tfyhO0eatwY2xlRVTle0nL+U98AHM/PYNBMsh3qunh
	Gq9W9wXhmmXWBiWo2mLaOtlE9w==
X-Google-Smtp-Source: AGRyM1vQleftizVLXtsyJEZpL+3neARgOltR9mQLjOc8T9CFophol9eh39QEwr/9Qs0tk1aR4aif4A==
X-Received: by 2002:a63:eb02:0:b0:41a:716c:bfb1 with SMTP id t2-20020a63eb02000000b0041a716cbfb1mr4915469pgh.198.1658602039237;
        Sat, 23 Jul 2022 11:47:19 -0700 (PDT)
Received: from [172.16.24.11] ([188.214.106.178])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b0016be4d78792sm6054287plh.257.2022.07.23.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 11:47:18 -0700 (PDT)
Message-ID: <b5505a46-ce76-d0aa-009e-81d9ba16e1d5@sudomaker.com>
Date: Sun, 24 Jul 2022 02:47:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhou Yanjie <zhouyanjie@wanyeetech.com>, tudor.ambarus@microchip.com,
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
From: Mike Yang <reimu@sudomaker.com>
In-Reply-To: <d1a0dd15-3621-14e9-b931-417cefaab017@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_114723_158467_B9B6656C 
X-CRM114-Status: GOOD (  21.29  )
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

T24gNy8yNC8yMiAwMTo0MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMy8wNy8y
MDIyIDE4OjUwLCBaaG91IFlhbmppZSB3cm90ZToKPj4gSGkgS3J6eXN6dG9mLAo+Pgo+PiBPbiAy
MDIyLzcvMjMg5LiK5Y2IMTo0NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDIy
LzA3LzIwMjIgMTg6NDgsIOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIHdyb3RlOgo+Pj4+IEFkZCB0
aGUgU0ZDIGJpbmRpbmdzIGZvciB0aGUgWDEwMDAgU29DLCB0aGUgWDE2MDAgU29DLCB0aGUgWDE4
MzAgU29DLAo+Pj4+IGFuZCB0aGUgWDIwMDAgU29DIGZyb20gSW5nZW5pYy4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRl
Y2guY29tPgo+Pj4+IC0tLQo+Pj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2Vu
aWMsc2ZjLnlhbWwgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQo+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbAo+Pj4+
Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
aW5nZW5pYyxzZmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
aW5nZW5pYyxzZmMueWFtbAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAw
MDAwMDAuLmI3YzRjZjQKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9pbmdlbmljLHNmYy55YW1sCj4+Pj4gQEAgLTAsMCAr
MSw2NCBAQAo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKPj4+PiArJVlBTUwgMS4yCj4+Pj4gKy0tLQo+Pj4+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NwaS9pbmdlbmljLHNmYy55YW1sIwo+Pj4gRmlsZSBu
YW1lIHNob3VsZCBiZSByYXRoZXIgYmFzZWQgb24gZmlyc3QgY29tcGF0aWJsZSwgc28KPj4+IGlu
Z2VuaWMseDEwMDAtc2ZjLnlhbWwKPj4KPj4KPj4gTm8gb2ZmZW5zZSwgZG9lcyBpdCByZWFsbHkg
bmVlZCB0byBiZSBuYW1lZCB0aGF0IHdheT8KPj4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgZG9jdW1l
bnRhdGlvbiB3aXRoIGluc3RydWN0aW9ucyBvbiB0aGlzIDooCj4+Cj4+IFRoZSB1c2Ugb2YgImlu
Z2VuaWMsc2ZjLnlhbWwiIGluZGljYXRlcyB0aGF0IHRoaXMgaXMgdGhlIGRvY3VtZW50YXRpb24K
Pj4gZm9yIHRoZSBTRkMgbW9kdWxlIGZvciBhbGwgSW5nZW5pYyBTb0NzLCB3aXRob3V0IG1pc2xl
YWRpbmcgcGVvcGxlIGludG8KPj4gdGhpbmtpbmcgaXQncyBvbmx5IGZvciBhIHNwZWNpZmljIG1v
ZGVsIG9mIFNvQy4gQW5kIHRoZXJlIHNlZW0gdG8gYmUgbWFueQo+PiBvdGhlciB5YW1sIGRvY3Vt
ZW50cyB0aGF0IHVzZSBzaW1pbGFyIG5hbWVzIChlZy4gZnNsLHNwaS1mc2wtcXNwaS55YW1sLAo+
PiBzcGktcm9ja2NoaXAueWFtbCwgc3BpLW54cC1mc3BpLnlhbWwsIGluZ2VuaWMsc3BpLnlhbWws
IHNwaS1zaWZpdmUueWFtbCwKPj4gb21hcC1zcGkueWFtbCksIG1heWJlIHRoZXNlIHlhbWwgZmls
ZXMgdGhhdCBhcmUgbm90IG5hbWVkIHdpdGggZmlyc3QKPj4gY29tcGF0aWJsZSBhcmUgYWxzbyBm
b3IgdGhlIHNhbWUgY29uc2lkZXJhdGlvbi4gOikKPiAKPiBXZSBoYXZlIG1hbnkgYmFkIGV4YW1w
bGVzLCBtYW55IHBvb3IgcGF0dGVybnMgYW5kIHRoZXkgYXJlIG5ldmVyIGFuCj4gYXJndW1lbnQg
dG8gYWRkIG9uZSBtb3JlIGJhZCBwYXR0ZXJuLgoKWmhvdSBhbHJlYWR5IG1lbnRpb25lZCBoZSB3
YXMgdW5hYmxlIGZpbmQgdGhlIG5hbWluZyBndWlkZWxpbmVzIG9mIHRoZXNlIC55YW1sIGZpbGVz
LgoKQXBwYXJlbnRseSB5b3UgdGhpbmsgaXQncyB1bmFjY2VwdGFibGUgZm9yIG5ldyBjb250cmli
dXRvcnMgb2YgYSBjZXJ0YWluIHN1YnN5c3RlbSB0byB1c2UgZXhpc3RpbmcgY29kZSBhcyBleGFt
cGxlcywgYW5kL29yIHRoZXkncmUgcmVzcG9uc2libGUgZm9yIGZpZ3VyaW5nIG91dCB3aGF0J3Mg
YSBnb29kIGV4YW1wbGUgYW5kIHdoYXQncyBhIGJhZCBvbmUgaW4gdGhlIGV4aXN0aW5nIGNvZGVi
YXNlLgoKPiAKPiBJdCBtaWdodCBuZXZlciBncm93IHRvIG5ldyBkZXZpY2VzIChiZWNhdXNlIHRo
ZXkgbWlnaHQgYmUgZGlmZmVyZW50KSwgc28KPiB0aGF0IGlzIG5vdCByZWFsbHkgYW4gYXJndW1l
bnQuCgpJdCBpcyBhbiBhcmd1bWVudC4gQSB2ZXJ5IHZhbGlkIG9uZS4KCiJ0aGV5ICptaWdodCog
YmUgZGlmZmVyZW50Ii4gWW91IG1heSB3YW50IHRvIGdldCB5b3VyIGhhbmRzIG9uIHJlYWwgaGFy
ZHdhcmUgYW5kIHRyeSBhbm90aGVyIHdvcmQuIE9yIGF0IGxlYXN0IHJlYWQgdGhlIGRhdGFzaGVl
dHMgaW5zdGVhZCBvZiBiZWxpZXZpbmcgeW91ciBpbWFnaW5hdGlvbi4KCkkgd291bGQgZW5qb3kg
ZHVwbGljYXRpbmcgdGhlIHN0LHN0bTMyLXNwaS55YW1sIGludG8gc3Qsc3RtMzJ7ZixofXswLi43
fS1zcGkueWFtbCBpZiBJJ20gYm9yZWQgYXQgYSBTdW5kYXkgYWZ0ZXJub29uLgoKPiAKPiBBbGwg
YmluZGluZ3MgYXJlIHRvIGZvbGxvdyB0aGlzIHJ1bGUsIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aHkgeW91Cj4gdGhpbmsgaXQgaXMgYW4gZXhjZXB0aW9uIGZvciB5b3U/CgpaaG91IGRpZG4ndCBh
c2sgeW91IHRvIG1ha2UgYW4gZXhjZXB0aW9uLiBUaGV5IGhhdmUgYSB2YWxpZCBwb2ludCBhbmQg
dGhleSdyZSBhc2tpbmcgd2h5LgoKWW91IG1heSB3YW50IHRvIGF2b2lkIGZ1cnRoZXIgaW5jaWRl
bnRzIG9mIHRoaXMga2luZCBieSBzdG9wIGJlaW5nIGJvc3N5IGFuZCBhY3R1YWxseSB3cml0aW5n
IGEgZ3VpZGVsaW5lIG9mIG5hbWluZyB0aGVzZSAueWFtbCBmaWxlcyBhbmQgcHVibGlzaCBpdCBz
b21ld2hlcmUgb25saW5lLgoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpCZXN0
IHJlZ2FyZHMsCk1pa2UgWWFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
