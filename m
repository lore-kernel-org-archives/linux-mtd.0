Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCE1C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 01:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zn/0kem+KWQnoiCzSxhCDHnHheyWakLEL3YZD39RUbU=; b=PMdfI/v9dHy2VE
	otW1Z99d+27sxkxdWzDvlTOWMNKwr+fKNRrCBh6znOkQebS64wQpDRSVN5lKuM3emTB2qEBfa9acZ
	g5f80ZFl+K31fWPqUg4EkkJB21q4ckjRVrGDgA08ok0jr9IC+b2RkmGH9HOoe+nHCjGSd7QvB6SDg
	Aybe0LDPg6Vzp/Gv9M1vPQJbWMKqK7Do1foVZgq4gNWtLDp7nd96Nw0pAxEf4BINzQxLlaPOBKeZY
	ZfkHSHet4OLNrOj3OjvCe/ouZGwV8ZxCS/Ipb8SyXDoGmKNv/Q9M9Wz7M9+jwVkkJfBzoIySv6kZH
	Fbs+tbU1+gl6nxndPB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhAn-004HX4-So; Fri, 21 Oct 2022 01:50:09 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhAl-004HW9-6z
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 01:50:08 +0000
Received: by mail-ot1-f51.google.com with SMTP id d18-20020a05683025d200b00661c6f1b6a4so986838otu.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2022 18:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXtMniGRjo+alje14xIQkt51WSfg95TNsE4aKDJMY7o=;
        b=qt11UM9pGvRPERKubdVTskZhHA5appUTizf0Z1hH+MRt5lTJjfZPemWEJeijMZasWi
         7sC0djTO1BdF4sMO/zRDecMnqisBUkDx+HkkF6NQHzpn6Zwh9YTBXvBSlSOL4QpR6gm4
         J6nQ8UsB6Zi+MxHUqp8HvVENTpSmscn1FJX7xX4l1SwGiwbQryDYgk/WgKUNuLHKWyqs
         KqEixznT/uD2tIDmxgoRAwMYykYpfDuuf2ugfB4EoOPYRF0gB39U3CasUgvz8gpxRG7Q
         W29vD8Xlgpbx9PncmSQJ2nkBSiflJWbvftgzrgjXHeLHIkNLU6FNxObaRSzfjLFGgDSF
         MM7g==
X-Gm-Message-State: ACrzQf2chlVwlBX4EItyWVEqDS8SY2E7JKwN1Rc8lrjMdhO0Z4PwQjI+
	LXxmT0/auN7zLZlQs/ag3w==
X-Google-Smtp-Source: AMsMyM4Ciguq4zEE6+Xcmz64LPGpou0MBUCld6E6Pc+SNUryDONCLu6wvFK4dmjJbxf5kFDRs5pQ1w==
X-Received: by 2002:a9d:1b2:0:b0:661:9d4b:3673 with SMTP id e47-20020a9d01b2000000b006619d4b3673mr8168039ote.139.1666317005754;
        Thu, 20 Oct 2022 18:50:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w135-20020aca308d000000b003549dde122fsm614032oiw.5.2022.10.20.18.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 18:50:04 -0700 (PDT)
Received: (nullmailer pid 2149816 invoked by uid 1000);
	Fri, 21 Oct 2022 01:50:06 -0000
Date: Thu, 20 Oct 2022 20:50:06 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mikhail Zhilkin <csharper2005@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Chaitanya Kulkarni <kch@nvidia.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] mtd: core: set ROOT_DEV for partitions marked as
 root devices in DT
Message-ID: <20221021015006.GA2145299-robh@kernel.org>
References: <20221019114855.31639-1-zajec5@gmail.com>
 <20221019115041.31805-1-zajec5@gmail.com>
 <c8d12dd0-7504-0198-dacb-b3723d82fc60@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8d12dd0-7504-0198-dacb-b3723d82fc60@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_185007_274122_58CDA9CD 
X-CRM114-Status: GOOD (  20.06  )
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

T24gV2VkLCBPY3QgMTksIDIwMjIgYXQgMDE6NTM6MTVQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDE5LjEwLjIwMjIgMTM6NTAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiA+
IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+IAo+ID4gVGhpcyBh
ZGRzIHN1cHBvcnQgZm9yICJsaW51eCxyb290LWRldmljZSIgYmluZGluZyB0aGF0IGlzIHVzZWQg
dG8gbWFyawo+ID4gcm9vdCBkZXZpY2UgTVREIHBhcnRpdGlvbi4gSXQncyB1c2VmdWwgZm9yIGRl
dmljZXMgdXNpbmcgZGV2aWNlIHRyZWUKPiA+IHRoYXQgZG9uJ3QgaGF2ZSBib290bG9hZGVyIHBh
c3Npbmcgcm9vdCBpbmZvIGluIGNtZGxpbmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL210ZC9t
dGRjb3JlLmMgfCA3ICsrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9t
dGQvbXRkY29yZS5jCj4gPiBpbmRleCAwNzI0OWFmNGY4OTAuLjAzNGIwNmFmZjY2MCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRk
Y29yZS5jCj4gPiBAQCAtMjgsNiArMjgsNyBAQAo+ID4gICAjaW5jbHVkZSA8bGludXgvbGVkcy5o
Pgo+ID4gICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgv
bnZtZW0tcHJvdmlkZXIuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcm9vdF9kZXYuaD4KPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0
aXRpb25zLmg+Cj4gPiBAQCAtNzM1LDYgKzczNiwxMiBAQCBpbnQgYWRkX210ZF9kZXZpY2Uoc3Ry
dWN0IG10ZF9pbmZvICptdGQpCj4gPiAgIAkJbm90LT5hZGQobXRkKTsKPiA+ICAgCW11dGV4X3Vu
bG9jaygmbXRkX3RhYmxlX211dGV4KTsKPiA+ICsKPiA+ICsJaWYgKG9mX2ZpbmRfcHJvcGVydHko
bXRkX2dldF9vZl9ub2RlKG10ZCksICJsaW51eCxyb290ZnMiLCBOVUxMKSkgewo+IAo+IEkgZm9y
Z290IHRvIHJlLWRvICJmb3JtYXQtcGF0Y2giIGFmdGVyICJjb21taXQgLS1hbWVuZCIuCj4gcy9s
aW51eCxyb290ZnMvbGludXgscm9vdC1kZXZpY2UvCgpJdCdzIHJlYWxseSB0aGUgZmlsZXN5c3Rl
bSB5b3UgYXJlIHRhZ2dpbmcsIG5vdCBhIGRldmljZSwgc28gSSB0aGluayAKJ2xpbnV4LHJvb3Rm
cycgaXMgYmV0dGVyLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
