Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AA3C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Dec 2022 01:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPyVCwUb0ELsJ+nq7zYMWG9gIxucr4E/OOfPAIEjjZM=; b=0sQe8FVe0AeEct
	9hfSg/G2nbR+hKOeSWbwBkHSFXNK/dvXmAmhjERQEbsnB0NGvNO7sXvnuCifwLGqGIuiWnjFoTR94
	l4s27HqWi5nt3oFMfOUL1jAwOry+7X2ylcQ5IT0BWp2bwjMCSi019zLJAv6wKZpQkJQY35KO0+7zz
	IqndFlDAZ0AxTYoaXL7QA7nfCGhczgKxyiFPg6HiHocaIcNVunB/eWKpW/y9vgM9C0Jw7C/zFmZas
	z7EHNKtHrsXrpu7RuGv9XuP3OJFK6vtOfH1tPjZgv0/5lejBdJ4/WjaG+HIZsLAIM6lGn32nDNJka
	ZDzQJQOGDLJ31bhhSomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6MHB-003qF1-8P; Sat, 17 Dec 2022 01:46:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6MH7-003q6e-1v
	for linux-mtd@lists.infradead.org; Sat, 17 Dec 2022 01:46:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so4039082pjo.3
        for <linux-mtd@lists.infradead.org>; Fri, 16 Dec 2022 17:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SPbBEgrOaHNV8xOhHSUjf1emrGY+ICMgqRk2n8nWrI=;
        b=kB1udAvZT6xXPrHig116jEAzPsUx7zkg9OrgLbxxwwUvTSW0mU9HOfNtzC1qYSIudI
         J+Ctp9oMo0iNzzrzhLpESvR8V336gTlu+FW4FSMJrVj/PCMN+Oh73+Y+s9YSwZzZyxhC
         Ve05HraaxAXhI7iqk0nuts+VzGGGCKxzMtSg9Cd0VTiNAhRg+RiqlfdPIfYtqiTpxjKa
         I4A2iBnz7KmI9hjlvmDAAINi6EqGhgPpdm0KAdOo287a3mdoPhEz3d5camsxpFDTZYRB
         pcPYkTfJUzPLV4unMqIrxmrQFZB1K6bqRuovkWHaQCTSN7wXHYCYEx1KVDIwEXI8ECFO
         O6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SPbBEgrOaHNV8xOhHSUjf1emrGY+ICMgqRk2n8nWrI=;
        b=epALOwcCVhCzbbcMAydoHENcutsUhL8xApvXS2YBHsbwuZ/uQ186kVhZCfI/4E9JYi
         aGEJH4wczBaqb2xaqTY/uhHLlUz0dYQgw2D1c+rqGCtFBfAJlQNMASV+rRjEd6epvg56
         uwCipZbyIknOVMvsZ7/8vninwjqM2Uy7h8hJdZcxwbcFSBZLJuLE6MZjjYTuMyAu6NOe
         hGpMcwruCbQqNG3za0eU/SM1EmMNupWE04owT2s8pvKsUKsT/dmtGyE5OpTpKRJa18nj
         qq9KMa5r6/id7JLxfFtKsIqckU+JRsAmZTc3EVAbpCtzJ+IURLKgaJtRybO12hUJ1/Iz
         6P8Q==
X-Gm-Message-State: AFqh2kqbiuRd53sIA61NB1u8ZOO6tcmna2VW9yPyABN0yQ/77DXsWRMX
	crYoZHNa7cbioxBa9AxYqnvxe3TTjE/QgJUoiiMH0Q==
X-Google-Smtp-Source: AMrXdXuD0JNDkYJxldHADHFUTjZ45s8XXqk6J1PG4bpmd3+lReDrwwy/2Hn+lscVVYWRbqQdHt11YDt61guDvu1LQKY=
X-Received: by 2002:a17:90a:3e4f:b0:219:aa90:3198 with SMTP id
 t15-20020a17090a3e4f00b00219aa903198mr1464527pjm.112.1671241557408; Fri, 16
 Dec 2022 17:45:57 -0800 (PST)
MIME-Version: 1.0
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info> <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
 <20221212101449.4e465181@xps-13> <CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
 <20221212173730.64224599@xps-13> <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
 <20221213104643.052d4a06@xps-13> <CALHCpMhOku2b+1y5Z=N5RJ6SvCvNakD2rSyRAqp6Gz3JWVvXGg@mail.gmail.com>
 <20221213175424.79895b63@xps-13> <CAGETcx8YvD5JABuJhah_6oOAUe=QgnOG5gWNL7Hcfxbvq0C2YQ@mail.gmail.com>
 <20221216120456.52072f9f@xps-13>
In-Reply-To: <20221216120456.52072f9f@xps-13>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 16 Dec 2022 17:45:20 -0800
Message-ID: <CAGETcx_=K42PE4cvX7+h2gbNHORUfPmoVAbamn5MRK2VHtk-Dg@mail.gmail.com>
Subject: Re: nvmem-cells regression after adding 'call of_platform_populate()
 for MTD partitions'
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxim Kiselev <bigunclemax@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_174605_134297_D1CC44E4 
X-CRM114-Status: GOOD (  51.24  )
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

T24gRnJpLCBEZWMgMTYsIDIwMjIgYXQgMzowNSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFNhcmF2YW5hLCBNYXhpbSwgTWF4aW0sCj4K
PiBzYXJhdmFuYWtAZ29vZ2xlLmNvbSB3cm90ZSBvbiBXZWQsIDE0IERlYyAyMDIyIDEzOjUzOjU0
IC0wODAwOgo+Cj4gPiBPbiBUdWUsIERlYyAxMywgMjAyMiBhdCA4OjU0IEFNIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBNYXhp
bSwKPiA+ID4KPiA+ID4gYmlndW5jbGVtYXhAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgMTMgRGVj
IDIwMjIgMTQ6MDI6MzQgKzAzMDA6Cj4gPiA+Cj4gPiA+ID4gSSBsb29rZWQgY2xvc2VyIGF0IGNv
bW1pdCA2NThjNDQ0OGJiYmYgYW5kIGJjZGYwMzE1YTYxYSwgNWRiMWMyZGJjMDRjMTYgY29tbWl0
cy4KPiA+ID4gPiBMb29rcyBsaWtlIHdlIGhhdmUgdHdvIGRpZmZlcmVudCBmZWF0dXJlcyBiaW5k
ZWQgdG8gb25lIHByb3BlcnR5IC0gImNvbXBhdGlibGUiLgo+ID4gPiA+Cj4gPiA+ID4gRnJvbSBv
bmUgc2lkZSBpdCBpcyB0aGUgYWJpbGl0eSB0byBmb3J3YXJkIHRoZSBzdWJub2RlIG9mIHRoZSBt
dGQKPiA+ID4gPiBwYXJ0aXRpb24gdG8gdGhlIG52bWVtIHN1YnN5c3RlbSAoNjU4YzQ0NDhiYmJm
IGFuZCBhYzQyYzQ2Zjk4M2UpLgo+ID4gPiA+IEFuZCBmcm9tIGFub3RoZXIgc2lkZSBpcyB0aGUg
YWJpbGl0eSB0byB1c2UgY3VzdG9tIGluaXRpYWxpemF0aW9uIG9mCj4gPiA+ID4gdGhlIG10ZCBw
YXJ0aXRpb24gKGJjZGYwMzE1YTYxYSBhbmQgNWRiMWMyZGJjMDRjMTYpLgo+ID4gPiA+Cj4gPiA+
ID4gV2hhdCBJIG1lYW46Cj4gPiA+ID4gQWNjb3JkaW5nIHRvIGFjNDJjNDZmOTgzZSBJIGNhbiBj
cmVhdGUgRFQgbGlrZSB0aGlzOgo+ID4gPiA+ICAtIHwKPiA+ID4gPiAgICAgcGFydGl0aW9ucyB7
Cj4gPiA+ID4gICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gPiA+
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiA+ID4gICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwxPjsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgcGFydGl0aW9uQDAgewo+ID4gPiA+ICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibnZtZW0tY2VsbHMiOwo+ID4gPiA+ICAgICAgICAgICAg
IHJlZyA9IDwweDQwMDAwIDB4MTAwMDA+Owo+ID4gPiA+ICAgICAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ID4gPiA+ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gPiA+
ICAgICAgICAgICAgIG1hY2FkZHJfZ21hYzE6IG1hY2FkZHJfZ21hYzFAMCB7Cj4gPiA+ID4gICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg2PjsKPiA+ID4gPiAgICAgICAgICAgICB9Owo+ID4g
PiA+ICAgICAgICAgfTsKPiA+ID4gPiAgICAgfTsKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gQW5k
IGFjY29yZGluZyB0byA1ZGIxYzJkYmMwNGMxNiBJIGNhbiBjcmVhdGUgRFQgbGlrZSB0aGlzOgo+
ID4gPiA+ICAtIHwKPiA+ID4gPiAgICAgcGFydGl0aW9ucyB7Cj4gPiA+ID4gICAgICAgICBjb21w
YXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gPiA+ICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4gPiA+ID4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiA+ID4gPgo+ID4g
PiA+ICAgICAgICAgcGFydGl0aW9uQDAgewo+ID4gPiA+ICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAidS1ib290LGVudiI7Cj4gPiA+ID4gICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAw
MD47Cj4gPiA+ID4gICAgICAgICB9Owo+ID4gPiA+ICAgICB9Owo+ID4gPiA+Cj4gPiA+ID4gQnV0
IEkgY2FuIG5vdCB1c2UgdGhlbSBib3RoLCBiZWNhdXNlIG9ubHkgb25lICJjb21wYXRpYmxlIiBw
cm9wZXJ0eSBhbGxvd2VkLgo+ID4gPiA+IFRoaXMgd2lsbCBiZSBpbmNvcnJlY3Q6Cj4gPiA+ID4g
IC0gfAo+ID4gPiA+ICAgICBwYXJ0aXRpb25zIHsKPiA+ID4gPiAgICAgICAgIGNvbXBhdGlibGUg
PSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gPiA+ID4gICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPiA+ID4gPiAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gPiA+Cj4gPiA+ID4gICAg
ICAgICBwYXJ0aXRpb25AMCB7Cj4gPiA+ID4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1LWJv
b3QsZW52IjsgICMgZnJvbSBhYzQyYzQ2Zjk4M2UKPiA+ID4gPiAgICAgICAgICAgICBjb21wYXRp
YmxlID0gIm52bWVtLWNlbGxzIjsgIyBmcm9tIDVkYjFjMmRiYzA0Ywo+ID4gPgo+ID4gPiBXaGF0
IGFib3V0Ogo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVu
diIsICJudm1lbS1jZWxscyI7Cj4gPiA+Cj4gPiA+IGluc3RlYWQ/IHRoYXQgc2hvdWxkIGFjdHVh
bGx5IHdvcmsuCj4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAw
MD47Cj4gPiA+ID4gICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiA+ID4gICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiA+ID4gICAgICAgICAgICAgbWFjYWRkcl9n
bWFjMTogbWFjYWRkcl9nbWFjMUAwIHsKPiA+ID4gPiAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MCAweDY+Owo+ID4gPiA+ICAgICAgICAgICAgIH07Cj4gPiA+ID4gICAgICAgICB9Owo+ID4gPiA+
ICAgICB9Owo+ID4gPiA+Cj4gPiA+ID4gPiBjb21wYXRpYmxlOiBEdXBsaWNhdGUgcHJvcGVydHkg
bmFtZQo+ID4gPiA+Cj4gPiA+ID4g0LLRgiwgMTMg0LTQtdC6LiAyMDIyINCzLiDQsiAxMjo0Niwg
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gSGkgTWF4aW0sCj4gPiA+ID4gPgo+ID4gPiA+ID4gZmlkb19tYXhAaW5ib3gucnUgd3Jv
dGUgb24gTW9uLCAxMiBEZWMgMjAyMiAyMDo1Nzo0OSArMDMwMDoKPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IEhpLCBNaXF1ZWwhCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIDEyLjEyLjIwMjIgMTk6
MzcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gTGV0IG1l
IHRyeSB0byByZWNhcCB0aGUgc2l0dWF0aW9uIGZvciBhbGwgdGhlIHBlb3BsZSBJIGp1c3QgaW52
b2x2ZWQ6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAqIEFuIEV0aGVybmV0IGRyaXZlciBn
ZXRzIGl0cyBtYWMgYWRkcmVzcyBmcm9tIGFuIG52bWVtIGNlbGwuIFRoZQo+ID4gPiA+ID4gPiA+
ICAgIEV0aGVybmV0IGNvbnRyb2xsZXIgRFQgbm9kZSB0aGVuIGhhcyBhbiAibnZtZW0tY2VsbHMi
IHByb3BlcnR5Cj4gPiA+ID4gPiA+ID4gICAgcG9pbnRpbmcgdG93YXJkcyBhbiBudm1lbSBjZWxs
Lgo+ID4gPiA+ID4gPiA+ICogVGhlIG52bWVtIGNlbGwgY29tZXMgZnJvbSBhbiBtdGQgcGFydGl0
aW9uLgo+ID4gPiA+ID4gPiA+ICogVGhlIG10ZCBwYXJ0aXRpb24gaXMgZmxhZ2dlZCB3aXRoIGEg
cGFydGljdWxhciBjb21wYXRpYmxlCj4gPiA+ID4gPiA+ID4gICAgKHdoaWNoIGlzIGFsc28gbmFt
ZWQgIm52bWVtLWNlbGxzIikgdG8gdGVsbCB0aGUga2VybmVsIHRoYXQgdGhlIG5vZGUKPiA+ID4g
PiA+ID4gPiAgICBwcm9kdWNlcyBudm1lbSBjZWxscy4KPiA+ID4gPiA+ID4gPiAqIFRoZSBtdGQg
cGFydGl0aW9uIGl0c2VsZiBoYXMgbm8gZHJpdmVyLCBidXQgaXMgdGhlIGNoaWxkIG5vZGUgb2Yg
YQo+ID4gPiA+ID4gPiA+ICAgICJwYXJ0aXRpb25zIiBjb250YWluZXIgd2hpY2ggaGFzIG9uZSAo
aW4gdGhpcyBjYXNlLAo+ID4gPiA+ID4gPiA+ICAgICJmaXhlZC1wYXJ0aXRpb25zIiwgc2VlIHRo
ZSBzbmlwcGV0IGJlbG93KS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEJlY2F1c2UgdGhl
ICJudm1lbS1jZWxscyIgcHJvcGVydHkgb2YgdGhlIEV0aGVybmV0IG5vZGUgcG9pbnRzIGF0IHRo
ZQo+ID4gPiA+ID4gPiA+IG52bWVtLWNlbGwgbm9kZSwgdGhlIGNvcmUgY3JlYXRlIGEgZGV2aWNl
IGxpbmsgYmV0d2VlbiB0aGUgRXRoZXJuZXQKPiA+ID4gPiA+ID4gPiBjb250cm9sbGVyIChjb25z
dW1lcikgYW5kIHRoZSBtdGQgcGFydGl0aW9uIChwcm9kdWNlcikuCj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiBUaGUgZGV2aWNlIGxpbmsgaW4gdGhpcyBjYXNlIHdpbGwgbmV2ZXIgYmUgc2F0
aXNmaWVkIGJlY2F1c2Ugbm8gZHJpdmVyCj4gPiA+ID4gPiA+ID4gbWF0Y2hlcyB0aGUgIm52bWVt
LWNlbGxzIiBjb21wYXRpYmxlIG9mIHRoZSBwYXJ0aXRpb24gbm9kZS4KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IFJldmVydGluZyBjb21taXQgYmNkZjAzMTVhNjFhICgibXRkOiBjYWxsIG9m
X3BsYXRmb3JtX3BvcHVsYXRlKCkgZm9yIE1URAo+ID4gPiA+ID4gPiA+IHBhcnRpdGlvbnMiKSB3
b3VsZCBJTUhPIG5vdCBtYWtlIG11Y2ggc2Vuc2UsIHRoZSBwcm9ibGVtIGNvbWVzIGZyb20gdGhl
Cj4gPiA+ID4gPiA+ID4gZGV2aWNlIGxpbmsgc2lkZSBhbmQgZXZlbiB0aGVyZSwgdGhlcmUgaXMg
bm90aGluZyByZWFsbHkgIndyb25nIiwKPiA+ID4gPiA+ID4gPiBiZWNhdXNlIEkgcmVhbGx5IGV4
cGVjdCB0aGUgbXRkIGRldmljZSB0byBiZSByZWFkeSBiZWZvcmUgdGhlCj4gPiA+ID4gPiA+ID4g
RXRoZXJuZXQgY29udHJvbGxlciBwcm9iZSwgdGhlIGRldmljZSBsaW5rIGlzIGxlZ2l0aW1hdGUu
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTbyBJIHdvdWxkIGxpa2UgdG8gZXhwbG9yZSBv
dGhlciBhbHRlcm5hdGl2ZXMuIEhlcmUgYXJlIGEgYnVuY2ggb2YKPiA+ID4gPiA+ID4gPiBpZGVh
cywgYnV0IEknbSBvcGVuOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIb3cgYWJvdXQgdG8gY3Jl
YXRlIHNpbXBsZSBkcml2ZXIgd2l0aCBjb21wYXRpYmxlPSJudm1lbS1jZWxsIiBhbmQgdG8gbW92
ZSBhbGwgdGhlIHN1ZmYgZnJvbSBtYWluIG10ZCBkcml2ZXIgd2hpY2ggc2VydmVzIG52bWVtLWNl
bGwgdG8gdGhlIHByb2JlIGZ1bmN0aW9uPwo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgaXMgcHJv
YmFibHkgd29ydGggdGhlIHRyeSBidXQgSSBkb3VidCB5b3UgY2FuIG1ha2UgaXQgd29yayB3aXRo
b3V0Cj4gPiA+ID4gPiByZWdyZXNzaW9ucyBiZWNhdXNlIElJUkMgdGhlIG52bWVtIHJlZ2lzdHJh
dGlvbiBoYXBwZW5zIG5vIG1hdHRlciB0aGUKPiA+ID4gPiA+IGNvbXBhdGlibGUgKG5vdCBtZW50
aW9uaW5nIHRoZSB1c2VyLW90cCBhbmQgZmFjdG9yeS1vdHAgY2FzZXMpLiBZb3UgY2FuCj4gPiA+
ID4gPiBkZWZpbml0ZWx5IHRyeSB0aGlzIG91dCBpZiB5b3UgdGhpbmsgeW91IGNhbiBjb21lIHVw
IHdpdGggc29tZXRoaW5nCj4gPiA+ID4gPiB0aG91Z2guCj4gPiA+ID4gPgo+ID4gPiA+ID4gQnV0
IEkgd291bGQgbGlrZSB0byBoZWFyIGZyb20gdGhlIGRldmljZS1saW5rIGd1cnVzIDopIGJlY2F1
c2UgZXZlbiBpZgo+ID4gPiA+ID4gd2UgZml4IG10ZCB3aXRoIGEgInRyaWNrIiBsaWtlIGFib3Zl
LCBJIGd1ZXNzIHdlJ2xsIHZlcnkgbGlrZWx5IGZpbmQKPiA+ID4gPiA+IG90aGVyIGNvcm5lciBj
YXNlcyBsaWtlIHRoYXQgYW5kIEkgYW0gaW50ZXJlc3RlZCBpbiB1bmRlcnN0YW5kaW5nIHRoZQo+
ID4gPiA+ID4gcmF0aW9uYWxlIG9mIHdoYXQgY291bGQgYmUgYSBwcm9wZXIgZml4Lgo+ID4gPiA+
ID4KPiA+Cj4gPiBSZXNwb25kaW5nIHRvIHRoZSB3aG9sZSB0aHJlYWQuCj4gPgo+ID4gSSdtIGdv
aW5nIGJ5IE1pcXVlbCdzIGZpcnN0IGVtYWlsIGluIHdoaWNoIGhlIGNjJ2VkIG1lIGFuZCBoYXZl
bid0Cj4gPiBhY3R1YWxseSBsb29rZWQgYXQgdGhlIG10ZCBjb2RlLiBDb3VwbGUgb2YgY29tbWVu
dHM6Cj4gPgo+ID4gSW5kZXBlbmRlbnQgb2YgbXRkL252bWVtLWNlbGwsIEkgZ2VuZXJhbGx5IGZy
b3duIG9uIGhhdmluZyBhCj4gPiBjb21wYXRpYmxlIHN0cmluZyBmb3IgYSBjaGlsZCBub2RlIHRo
YXQgeW91IGRvbid0IHRyZWF0IGFzIGEgZGV2aWNlLgo+ID4gRXZlbiBtb3JlIHNvIGlmIHlvdSBh
Y3R1YWxseSBjcmVhdGUgYSBzdHJ1Y3QgZGV2aWNlIGZvciBpdCBhbmQgdGhlbgo+ID4gZG9uJ3Qg
ZG8gYW55dGhpbmcgZWxzZSB3aXRoIGl0LiBUaGF0J3MganVzdCBhIHdhc3RlIG9mIG1lbW9yeS4g
U28sIGluCj4gPiBnZW5lcmFsIHRyeSB0byBhdm9pZCB0aGF0IGluIHRoZSBmdXR1cmUgaWYgeW91
IGNhbi4KPgo+IEFncmVlZCwgaXQgZGlkbid0IHRyaWdnZXJlZCBhbnkgd2FybmluZ3MgaW4gbXkg
aGVhZCBpbiB0aGUgZmlyc3QgcGxhY2UsCj4gc29ycnkgYWJvdXQgdGhhdC4KPgo+ID4gQWxzbywg
dGhlcmUgYXJlIGZsYWdzIHRoZSBwYXJlbnQgZGV2aWNlJ3MgZHJpdmVyIGNhbiBzZXQgdGhhdCds
bCB0ZWxsCj4gPiBmd19kZXZsaW5rIG5vdCB0byB0cmVhdCBhIHNwZWNpZmljIERUIG5vZGUgYXMg
YSByZWFsIGRldmljZS4gU28sIGlmIHdlCj4gPiByZWFsbHkgbmVlZCB0aGF0IEknbGwgZGlnIHVw
IGFuZCBzdWdnZXN0IGEgZml4Lgo+Cj4gSW50ZXJlc3RpbmcsIHRoYXQgd291bGQgaW5kZWVkIHZl
cnkgbGlrZWx5IGZpeCBpdC4KPgo+ID4gTGFzdGx5IGFuZCBtb3JlIGltcG9ydGFudGx5LCBJJ3Zl
IGEgc2VyaWVzWzFdIHRoYXQgc3RvcHMgZGVwZW5kaW5nIG9uCj4gPiB0aGUgY29tcGF0aWJsZSBw
cm9wZXJ0eSBmb3IgZndfZGV2bGluayB0byB3b3JrLiBTbyBpdCBzaG91bGQgYmUKPiA+IHNtYXJ0
ZXIgdGhhbiBpdCBpcyB0b2RheS4gQnV0IHRoYXQgc2VyaWVzIGhhcyBrbm93biBidWdzIGZvciB3
aGljaCBJCj4gPiBnYXZlIHRlc3QgZml4ZXMgaW4gdGhhdCB0aHJlYWQuIEkgcGxhbiB0byBtYWtl
IGEgdjIgb2YgdGhhdCBzZXJpZXMKPiA+IHdpdGggdGhhdCBmaXggYW5kIEknbSBleHBlY3Rpbmcg
aXQnbGwgZml4IGEgYnVuY2ggb2YgZndfZGV2bGluawo+ID4gaXNzdWVzLgo+ID4KPiA+IEZlZWwg
ZnJlZSB0byBnaXZlIHYxICsgc3F1YXNoaW5nIHRoZSBmaXhlcyBhIHNob3QgaWYgeW91IGFyZSBl
eGNpdGVkCj4gPiB0byB0cnkgaXQuIE90aGVyd2lzZSwgSSdsbCB0cnkgbXkgYmVzdCB0byBnZXQg
YXJvdW5kIHRvIGl0IHRoaXMgd2Vlawo+ID4gKGtpbmRhIHN3YW1wZWQgdGhvdWdoICsgaG9saWRh
eXMgY29taW5nIHVwLCBzbyBubyBwcm9taXNlcykuCj4KPiBDYW4geW91IHBsZWFzZSBpbmNsdWRl
IHVzIGluIHlvdXIgbmV4dCBzdWJtaXNzaW9uPwo+ICogTWF4aW0gS2lzZWxldiA8YmlndW5jbGVt
YXhAZ21haWwuY29tPgo+ICogTWF4aW0gS29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KPiAq
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpXaWxsIGRvLgoKLVNh
cmF2YW5hCgo+Cj4gPiBbMV0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIwODEw
MDYwMDQwLjMyMTY5Ny0xLXNhcmF2YW5ha0Bnb29nbGUuY29tLwo+Cj4gTWF4aW0sIGFueSBjaGFu
Y2UgeW91IGdpdmUgdGhpcyBhIHRyeT8KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
