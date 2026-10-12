Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FDCA9EDE
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5gso5Y3tzs1jJGdZQ+EtbSv6kdsiQi0Ookvx4MCkBo=; b=r3mFOYhNfFfaC5
	KgaiSJpmo2gh2LuBPac7gOZtl6J6+Kddxr6x+dp6V5ux3q/1I2UKHQMkXZE1ILsLrNh8+GpohltO8
	UEaAmTmOKq0peVx7l0v5s+EJFiiPd4Fnfc3C+k8k3L0+D90v4VpEePZfBhtot6MKEObMcZW710dla
	gi41ZdZHBkrFEda8CV24m6DM2ULoWxGm/aeqBPjAcrDZ49fpv9l5XIiyZdSOEQ4MAht0LkC6KqrCM
	VSZYEfTKe9CoRfvKGxGYcULqgYwaZJvjpHgMF3SpbJhKf2yvKczi6d/MvKJauxQ7ESOJ6GmFiWP1p
	PPEicRevO2en3eL0xGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKj1-0000000BEBa-3OsO;
	Mon, 12 Oct 2026 18:26:15 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKiz-0000000BEAH-0nBU
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:26:14 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-7c1916da745so3482624137.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 11:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829572; cv=none;
        d=google.com; s=arc-20260327;
        b=k8P9v+ygcSnhhr751PBXQA9XtMuhGwnuXl5a/5QrIWUpKQ4wEt11tFS97NmYv+jqep
         0TzglZQCSuxbfMM1bjErqpXg3fybpKwYIMnOmJURrgDoyXKM0tC3GMMTFmXIqpqvHCbM
         HJUROMC9hPG9pzF/DXWRf0GNbNQj3LVDdAbaoCu/eElnnxwzUNLrfX4g27LC6LnxmHmH
         hHUvjMNO4/DaQ+2BZX6MLBrDj08qHDsIB8d1BrWbo80ZoVCF/bT4TXOx44NiOOOMqCZQ
         ++cGYbr27FsL91zW+fKMq1R3uoC7cWPz0wyMJy6x0dputvEYVzoEuwzrkToj6sFmbBQW
         cgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        fh=fzqlI3X2xJ2SjtsU9LVIFl5B0kBK7yuR4+f6en+G8lY=;
        b=SuoTu1oXUCShiKNkfbE8jAHBdrgiYrjX1vASIQLY3MCTr29KPxCrGTZEFO0yLz7kZp
         vAGRHtv3gLd8h5HEYTiXHrE5tyectnHBcEnOjjqjoTyy1W8mK3kY2E9UPhtHK2QM3BVh
         iRQ9RF0+pfKAxyktb52HlIu1GzX9US5IJuJXKxRoash2XP0TxRpFPFYyhkvliWkQKTcm
         9rhcLc4D/nHsuH8fza1eyQ+0ryZFRMb3SqRu/5aF2ovuQu9/hMlHBjhdsnY5bad1ERBD
         1sKQwdb/Z/61FZNZ2h3T1kajtIAYeONooPyMlJoJyo+M14Zs+yWIZqjzGWLWAf2nvuxQ
         i1Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829572; x=1792434372; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        b=VcI0MkVdN8a7DSww9jnTv9fx+ZNa56aI3011lIheW6togsat4whoXd9tCDPBbTJT0E
         wDh2V1PX1kxkDifbY2LIp+bcobp6NpYpt9TBANvVYea087VWiheRMteams51HLhmGzi4
         mS/TCHiGdP9VNrA0fJX9PyHJuCqei9W9y1Xj6juVlYgifZrQiDWs/nzav/p8gOp58/97
         mcrTClgMT2N4iYufZMlBZRV8GLigQ43nelwq4p5bx8S2LtgL/o+2BR5td6oBsvetcw6l
         Gy8urMZUcUyd9yONJrgyhM+LZy+bQtwXHAoAdN0gotUAKfIPevE1klgn8H7vXT62JywP
         Dk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829572; x=1792434372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        b=XzENiJjO+lcSYNd0PNd9hDbOFpUyLpPlX8q82S0KG0l76vmo/IrSnDQBI544nmTgq5
         h88ez1X8M8QDduq55tqzILmiZj5VMBIN2ncCzN8e5EkwOYunBdVnbzoI7jEcsydu5x0e
         eh5lyaQfkpBPFAHds2Kr9dwZ2bMErA1pk2VKIuR3KNYUBOzVPcREryhSbMf9fCjbPItB
         chQEfjIUcjVnRid3NeyzdxWdhxIsVoMo0ppJVHWkqn+weAyoWOz+oN9TJFgf1Day6TjE
         2vz1WZBWeX2iVPa888yyv0dH+ccf2gBoUGbX82qvY4E7SUP3nN7PKtznoHybnz48dupD
         kNlA==
X-Forwarded-Encrypted: i=1; AKwUvByWhAilNnjC9lnHLn5Eh2KDzlrruuVP/bA5SrcY7e9OCj1BNLn9LRi9nFZ4yq89Vcmxr3wrgXTHJUQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLFkp8hLxp5WyLhUFGj77W4b/O6gSYN7O7uETueUGaz14FDEo1s
	oF4xUwcTQhbGK4ct4xNgRePm5cFxiwQaM0/oyFXSop7sWToFcQI89V0mLhQSX0RWbSkUVNXIzDb
	PK0hDXZEJqfvRR7wcWcGtJHLmjhcL7TOMDzbO
X-Gm-Gg: AYBFou0V3CBmfEtHgh4AEH42mL2e4zOoTIZSi6ybNtguyUAdjiIH+4GtdIakv6/Dm8C
	GnQTTdU7n8JNYX9D6t4ylXhya65Uwv7Wk1DbeQ7OzOIASJUPBEV2GKVh4akJJgw11ZluebyLkKg
	mAPgjY06Jr+Lnt0I36CVrCLxlGB53FqqWe15LOocBiJ+MlFOpYWpRFpbanL3enKNbtJk7QSRxSc
	VPZnPqalmZM6vod4q2F0S80anosWVsmy54/RMNjHdnRkEM5KkKduqv8I27U7/CGbq0E6g1COj2E
	rr71RFNEeX9iOw0YwofTDJV1BDOL5BK+YzAPnek1HH3X17JOIun0krv4fS8OVrz/096fZu3Ajwm
	67t5LzmnZwqQQls0I3Ha0B1us6RlWua2z27lDHIYZ0WM54f4p6v5CRzE3nXV6iKEosK1VBdUOO4
	TUb++C56CTRu8BedssqJH97OThUsdwJmQ7hSbzms0iVVmf
X-Received: by 2002:a05:6102:370f:b0:798:24e8:23f4 with SMTP id
 ada2fe7eead31-7cb42a03e2dmr2294757137.7.1791829571647; Mon, 12 Oct 2026
 11:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com> <8733ua23xs.fsf@bootlin.com>
In-Reply-To: <8733ua23xs.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 12:26:00 -0600
X-Gm-Features: AclHuK-YE9EZvdISkdO2ItcawmmP4G9wFY0yyJFRi71wZBtPLVkiWianJdKsR5A
Message-ID: <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112613_255011_74AD7940 
X-CRM114-Status: GOOD (  41.32  )
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMTI6MDLigK9QTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gMTQvMDkvMjAy
NiBhdCAxNTowOTo0NyAtMDYsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPiB3cm90ZToKPgo+ID4gQSB0aW1lZC1vdXQgd2FpdCBjYW4gcmV0dXJuIHdoaWxlIHRoZSBp
bnRlcnJ1cHQgaGFuZGxlciBpcyBzdGlsbCB1c2luZwo+ID4gdGhlIHByZXZpb3VzIG9wZXJhdGlv
bidzIGludGVycnVwdCBzdGF0dXMgYW5kIGVuYWJsZSBtYXNrLiBTdGFydGluZyB0aGUKPiA+IG5l
eHQgd2FpdCBjYWxscyBpbml0X2NvbXBsZXRpb24oKSBvbiB0aGUgc2FtZSBvYmplY3QsIHdoaWNo
IGNhbiByZXNldCBpdHMKPiA+IHdhaXRxdWV1ZSBsb2NrIHdoaWxlIHRoZSBvbGQgaGFuZGxlciBj
YWxscyBjb21wbGV0ZSgpLiBUaGUgb2xkIGhhbmRsZXIKPiA+IGNhbiBhbHNvIGNvbXBsZXRlIHRo
ZSBuZXcgd2FpdCBvciByZXN0b3JlIGFuIG9ic29sZXRlIGludGVycnVwdCBtYXNrLgo+ID4KPiA+
IEluaXRpYWxpemUgdGhlIGNvbXBsZXRpb24gb25jZSBpbiBwcm9iZSBhbmQgdXNlIHJlaW5pdF9j
b21wbGV0aW9uKCkgZm9yCj4gPiBlYWNoIGludGVycnVwdC1kcml2ZW4gd2FpdC4gT24gdGltZW91
dCwgZGlzYWJsZSBhbmQgc3luY2hyb25pemUgdGhlIElSUQo+ID4gYmVmb3JlIG1hc2tpbmcgY29u
dHJvbGxlciBpbnRlcnJ1cHRzIGFuZCBhY2tub3dsZWRnaW5nIHRoZSB3YWl0ZWQtZm9yCj4gPiBl
dmVudHMuIERyYWluaW5nIHRoZSBoYW5kbGVyIGZpcnN0IGFsc28gcHJldmVudHMgYSBwYXJ0aWFs
LWV2ZW50IGhhbmRsZXIKPiA+IGZyb20gcmV3cml0aW5nIHRoZSBlbmFibGUgbWFzayBhZnRlciBp
dCBoYXMgYmVlbiBjbGVhcmVkLiBGbHVzaCB0aGVzZQo+ID4gcmVnaXN0ZXIgd3JpdGVzIGJlZm9y
ZSByZS1lbmFibGluZyB0aGUgSVJRIGxpbmUsIGxlYXZpbmcgdGhlIGNvbnRyb2xsZXIncwo+ID4g
aW50ZXJydXB0IHNvdXJjZXMgbWFza2VkLgo+ID4KPiA+IEZvciBzdWNjZXNzZnVsIHdhaXRzLCBt
b3ZlIGNvbXBsZXRlKCkgYWZ0ZXIgdGhlIGhhbmRsZXIncyByZWdpc3RlciB1cGRhdGVzCj4gPiBz
byB0aGF0IHRoZSBuZXh0IG9wZXJhdGlvbiBjYW5ub3QgcmFjZSB3aXRoIHRob3NlIHVwZGF0ZXMu
IEtlZXAgcG9sbGluZwo+ID4gdW5jaGFuZ2VkIGFuZCBsZWF2ZSBjb250cm9sbGVyIGFuZCBETUEg
YWJvcnQgaGFuZGxpbmcgdG8gdGhlIGV4aXN0aW5nCj4gPiBjYWxsZXJzLgo+ID4KPiA+IEZpeGVz
OiAxZmVmNjJjMTQyM2IgKCJtdGQ6IG5hbmQ6IGFkZCBzdW54aSBOQU5EIGZsYXNoIGNvbnRyb2xs
ZXIgc3VwcG9ydCIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0K
Pgo+IFNvIGZyb20gdGhlIGNvbW1pdCBsb2cgSSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBmaXhp
bmcgYSByYWNlLiBUaGUKPiBwcm9ibGVtIHNlZW1zIGxlZ2l0aW1hdGUuCj4KPiA+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
ID4KPgo+IC4uLgo+Cj4gPiBAQCAtNDE0LDEyICs0MTYsMTMgQEAgc3RhdGljIGlycXJldHVybl90
IHN1bnhpX25mY19pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ID4gICAgICAgaWYg
KCEoaWVuICYgc3QpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gSVJRX05PTkU7Cj4gPgo+ID4g
LSAgICAgaWYgKChpZW4gJiBzdCkgPT0gaWVuKQo+ID4gLSAgICAgICAgICAgICBjb21wbGV0ZSgm
bmZjLT5jb21wbGV0ZSk7Cj4gPiAtCj4gPiArICAgICAvKiBGaW5pc2ggdXBkYXRpbmcgdGhlIGlu
dGVycnVwdCBzdGF0ZSBiZWZvcmUgd2FraW5nIHRoZSBuZXh0IG9wZXJhdGlvbi4gKi8KPiA+ICAg
ICAgIHdyaXRlbChzdCAmIE5GQ19JTlRfTUFTSywgbmZjLT5yZWdzICsgTkZDX1JFR19TVCk7Cj4g
PiAgICAgICB3cml0ZWwofnN0ICYgaWVuICYgTkZDX0lOVF9NQVNLLCBuZmMtPnJlZ3MgKyBORkNf
UkVHX0lOVCk7Cj4gPgo+ID4gKyAgICAgaWYgKChpZW4gJiBzdCkgPT0gaWVuKQo+ID4gKyAgICAg
ICAgICAgICBjb21wbGV0ZSgmbmZjLT5jb21wbGV0ZSk7Cj4gPiArCj4gPiAgICAgICByZXR1cm4g
SVJRX0hBTkRMRUQ7Cj4gPiAgfQo+ID4KPiA+IEBAIC00MzUsMTYgKzQzOCwxOSBAQCBzdGF0aWMg
aW50IHN1bnhpX25mY193YWl0X2V2ZW50cyhzdHJ1Y3Qgc3VueGlfbmZjICpuZmMsIHUzMiBldmVu
dHMsCj4gPiAgICAgICAgICAgICAgIHRpbWVvdXRfbXMgPSBORkNfREVGQVVMVF9USU1FT1VUX01T
Owo+ID4KPiA+ICAgICAgIGlmICghdXNlX3BvbGxpbmcpIHsKPiA+IC0gICAgICAgICAgICAgaW5p
dF9jb21wbGV0aW9uKCZuZmMtPmNvbXBsZXRlKTsKPiA+ICsgICAgICAgICAgICAgcmVpbml0X2Nv
bXBsZXRpb24oJm5mYy0+Y29tcGxldGUpOwo+Cj4gVGhlIHdob2xlIGNoYW5nZSBhcm91bmQgKHJl
KWluaXRfY29tcGxldGlvbiBsb29rcyByZWxldmFudCAoaGVyZSBhbmQgaW4gdGhlIGhhbmRsZXIp
Lgo+Cj4gPgo+ID4gICAgICAgICAgICAgICB3cml0ZWwoZXZlbnRzLCBuZmMtPnJlZ3MgKyBORkNf
UkVHX0lOVCk7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGlt
ZW91dCgmbmZjLT5jb21wbGV0ZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXRfbXMpKTsKPiA+IC0gICAgICAg
ICAgICAgaWYgKCFyZXQpCj4gPiArICAgICAgICAgICAgIGlmICghcmV0KSB7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgLyogRHJhaW4gdGhlIGhhbmRsZXIgYmVmb3JlIGl0IGNhbiByZXN0b3Jl
IGFuIG9sZCBJUlEgbWFzay4gKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkaXNhYmxlX2ly
cShuZmMtPmlycSk7Cj4KPiBkaXNhYmxlX2lycSgpIGZvciBzZXJpYWxpemluZyBhY2Nlc3NlcyB0
byBhIHNpbmdsZSByZWdpc3Rlcj8KClRoZSBpbnRlbnRpb24gd2FzIHRvIGRyYWluIGFuIGluLWZs
aWdodCBoYW5kbGVyIGJlZm9yZSBjbGVhbmluZyB1cCB0aGUKdGltZWQtb3V0IHdhaXQsIHJhdGhl
ciB0aGFuIGp1c3Qgc2VyaWFsaXplIHRoZSByZWdpc3RlciB3cml0ZS4KZGlzYWJsZV9pcnEoKSBw
cm92aWRlcyB0aGF0IHN5bmNocm9uaXphdGlvbiBhcyB3ZWxsIGFzIG1hc2tpbmcgdGhlIGxpbmUu
Ckl0IGlzIG9ubHkgdXNlZCBvbiB0aW1lb3V0LCBhbmQgdGhpcyBJUlEgaXMgcmVxdWVzdGVkIHdp
dGhvdXQgSVJRRl9TSEFSRUQuCgpBIHNwaW5sb2NrIGNvdWxkIGFsc28gYWRkcmVzcyB0aGlzLCBw
cm92aWRlZCBpdCBjb3ZlcnMgdGhlIGhhbmRsZXIncwpzdGF0dXMvZW5hYmxlIHJlYWRzIHRocm91
Z2ggY29tcGxldGUoKSwgdG9nZXRoZXIgd2l0aCB0aGUgd2FpdGVyJ3MKY2xlYW51cCBhbmQgcmVh
cm1pbmcuIFByb3RlY3Rpbmcgb25seSB0aGUgcmVnaXN0ZXIgd3JpdGVzIHdvdWxkIGxlYXZlCnRo
ZSBoYW5kbGVyIGFibGUgdG8gYWN0IG9uIGFuIG9sZCBzbmFwc2hvdC4KCj4gSXQKPiBjZXJ0YWlu
bHkgd29ya3MgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgaXMgc28gY29tbW9uIHRvIHVzZSBpdCBsaWtl
IHRoYXQsCj4gZm9yIHN1Y2ggc2ltcGxlIGNhc2VzLiBUeXBpY2FsbHkgaW4gdGhpcyBjYXNlIEkg
d291bGQgaGF2ZSB1c2VkIGEKPiBzcGlubG9jayBtYXliZT8gT3IgZXZlbiBiZXR0ZXIsIHdoeSBu
b3QganVzdCBhdm9pZCB0aGUgcmFjZSBlbnRpcmVseQo+IGFuZCBoYW5kbGUgdGhlIHJlZ2lzdGVy
IGluIHRoZSB3YWl0ZXI/CgpPbmUgZGV0YWlsIHRvIGFjY291bnQgZm9yIGlzIHRoYXQgdGhlIE1C
VVMgRE1BIHBhdGggd2FpdHMgZm9yIGJvdGgKTkZDX0NNRF9JTlRfRkxBRyBhbmQgTkZDX0RNQV9J
TlRfRkxBRy4gVGhlIGhhbmRsZXIgY3VycmVudGx5IGFja25vd2xlZGdlcwphbmQgbWFza3MgZWFj
aCBldmVudCBhcyBpdCBhcnJpdmVzLCBsZWF2aW5nIHRoZSByZW1haW5pbmcgZXZlbnQgZW5hYmxl
ZAp1bnRpbCBib3RoIGhhdmUgY29tcGxldGVkLgoKTW92aW5nIHRoZSByZWdpc3RlciBoYW5kbGlu
ZyB0byB0aGUgd2FpdGVyIHdvdWxkIHRoZXJlZm9yZSBuZWVkIHRvCnByZXNlcnZlIHBhcnRpYWwt
ZXZlbnQgdHJhY2tpbmcgYW5kIGF2b2lkIGxlYXZpbmcgYW4gYXNzZXJ0ZWQgaW50ZXJydXB0CnNv
dXJjZSBlbmFibGVkIHdoaWxlIHdhaXRpbmcgZm9yIHRoZSB0YXNrIHRvIHJ1bi4KCj4gWW91IGNl
cnRhaW5seSBkb24ndCBuZWVkIHRvIHdyaXRlCj4gaXQgaW4gdGhlIElSUSBoYW5kbGVyLiBZb3Ug
Y2FuIGhhbmRsZSB0aGUgSVJRIGNvbmZpZ3VyYXRpb24gYXQgdGhlCj4gZGV2aWNlIGxldmVsLCB3
aGljaCB3aWxsIGFsc28gcHJldmVudCB0aGUgbmVlZCBmb3IgeW91ciBleHRyYQo+IHJlYWRsICJi
YXJyaWVyIiBiZWZvcmUgZW5hYmxpbmcgdGhlIElSUS4KPgo+IEZ1cnRoZXJtb3JlLCBub3cgdGhh
dCBJIGhhdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZywgcmUtcmVhZGluZyB0aGUKPiBjb21taXQg
bG9nLCBJIG5vdyBkaXNhZ3JlZSB3aXRoIHRoZSBmaXJzdCBwYXJ0IG9mOgo+Cj4gPlRoZSBvbGQg
aGFuZGxlciBjYW4gYWxzbyBjb21wbGV0ZSB0aGUgbmV3IHdhaXQgb3IgcmVzdG9yZSBhbiBvYnNv
bGV0ZSBpbnRlcnJ1cHQgbWFzay4KPgo+ICJjb21wbGV0ZSB0aGUgbmV3IHdhaXQiPyBJIGRvbid0
IHNlZSBob3cgYSBzdGFsZSBoYW5kbGVyIGNvbXBsZXRlcyB0aGUKPiBuZXh0IHdhaXQgZ2l2ZW4g
dGhlIGhhbmRsZXIgaXMgYSBoYXJkIElSUSBhbmQgdGhlIGludGVycnVwdCBlbmFibGUKPiByZWdp
c3RlciBpcyBjbGVhcmVkIG9uIHRpbWVvdXQuCgpUaGUgY2FzZSBJIGhhZCBpbiBtaW5kIGlzIGFu
IGFscmVhZHktcnVubmluZyBoYW5kbGVyIG9uIGFub3RoZXIgQ1BVOgoKQ1BVIDA6IFJlYWQgc3Qg
YW5kIGllbiBmb3Igb3BlcmF0aW9uIEEuCkNQVSAxOiBUaW1lIG91dCBvcGVyYXRpb24gQSwgbWFz
ay9hY2tub3dsZWRnZSBpdHMgaW50ZXJydXB0cywKICAgICAgIHRoZW4gZXZlbnR1YWxseSByZWlu
aXRpYWxpemUgdGhlIGNvbXBsZXRpb24gZm9yIG9wZXJhdGlvbiBCLgpDUFUgMDogQ2FsbCBjb21w
bGV0ZSgpIGJhc2VkIG9uIHRoZSBzYXZlZCBzdCBhbmQgaWVuIGZyb20gb3BlcmF0aW9uIEEuCgpD
bGVhcmluZyB0aGUgZGV2aWNlJ3MgZW5hYmxlIHJlZ2lzdGVyIGRvZXMgbm90IGludmFsaWRhdGUg
dGhvc2UgbG9jYWwKdmFsdWVzIG9yIHdhaXQgZm9yIHRoZSBydW5uaW5nIGhhbmRsZXIgdG8gZmlu
aXNoLiBIYXJkLUlSUSBjb250ZXh0CnByZXZlbnRzIHRoaXMgb3ZlcmxhcCBvbiB0aGUgc2FtZSBD
UFUsIGJ1dCBub3QgYWNyb3NzIENQVXMuCgpUaGF0IGRpc3RpbmN0aW9uIHdhcyBub3QgZXhwbGlj
aXQgZW5vdWdoIGluIHRoZSBjb21taXQgbWVzc2FnZS4gSSdtCm9wZW4gdG8gYSBkaWZmZXJlbnQg
aW1wbGVtZW50YXRpb247IHRoZSByZXF1aXJlbWVudCBJIHdhbnRlZCB0byBwcmVzZXJ2ZQppcyB0
aGF0IHRoZSBvbGQgaGFuZGxlciBjYW5ub3QgdXBkYXRlIHRoZSBtYXNrIG9yIHNpZ25hbCB0aGUg
Y29tcGxldGlvbgphZnRlciB0aGUgd2FpdGVyIGhhcyBjbGVhbmVkIHVwIGFuZCByZXVzZWQgaXQu
Cgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
