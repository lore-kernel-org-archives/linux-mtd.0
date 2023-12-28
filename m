Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA49C3DA6E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uJeGNC9IZ8/2MdbOiIkAXXZRZ7NdJBsXo59bkZ7KSqg=; b=BUpPOx3QgPWSfC
	ikpVpoGfd182fAUoJH3Nv8HdItgm/YJLJUhgPooXI0D/WzWuuUE19MfhglHbMZjyeu55bcp0EJL94
	DfBZ/vLr5gjTraJiueBn2BntuunuLdfpoq0lYq+IvIqKTse/qCS0AV7T2nADTOETAErS0f+T382iU
	9L6X9vfoFPlsPtV+Xxo3kdpykW//J6Ab3AGxHpQnQQkTYC5wi30Y3ujX7EmHIrv1gLig8CWMpiAez
	4U41yH1M1KkSIS02h7RRHTuK/fU4MfaIR5pu39aGJts7NNVKuvnXEvqxJzOyglJ3s7nPvWjGKJspf
	dz5ZaAQUq8OVKrNA8/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rItPb-00H8yq-1b;
	Thu, 28 Dec 2023 16:39:11 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rItPX-00H8yR-1Q
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 16:39:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c66b093b86so4797809a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 28 Dec 2023 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703781544; x=1704386344; darn=lists.infradead.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nARAYPfyBK1x80nYZeDQPS/bdcpX2U9aWZYT5iqpu3c=;
        b=UfcV0dAaJlHyo+XIJv4PJ5yY/lRNH1x7z4hNknzRMy8NHaF5eLZEStf0Rqd3cT7owt
         1ZYvsr4FKFcuoKwCCXZT5YOmw8RGEZeSpT5YAKMXcn6I8H9TJwGVQjWH/FSsfSHxvZzu
         Um3Aab/86LmAUnJ+6UOfPY3NyjCThma9QyOGANkOUcyUzeg1bmjqrtUjLu3nt/KHnuUk
         2E3HhN8xdDUJo90IE7EIzNNo6/Qv2wyUc/MS7LUuD/6nYxeXa1QeTWHqZWWOJJRh1GjO
         rWiNIt6uS0JBPjdkRmYqOMiKFkBt+EzKd7RQ2HiCc1T4kjCospk8rEGqsa+RWW5VaE/t
         FfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703781544; x=1704386344;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nARAYPfyBK1x80nYZeDQPS/bdcpX2U9aWZYT5iqpu3c=;
        b=MZli/HoW4FMc35KxKKFiu9r4avz+79IuheVEHEWjEuo0vRQ3ZSPS/eoF5uXwfBqK/h
         GW7pDPzg2FsF7RX8uDMD06CbPSUhd+HhH4LE3fXKH40DIT/3O416XGCR/5g80f7sKD7H
         iwNRN8PGWdXFpqYtGyk5ZwM6knilWy74OrR+QqFaUzfzH4yTbljKvJecwuRTMLNY6nk8
         AV0qEafh5X1hnhX66nEME0+aSQvIzK3fCVkVL3yGjOKECgoiG+WsAeLZQ1hw9lRJzarg
         poD0xyc7Der3Klg6/UlDpZgZDe3e0YSsF/Rdyjm4TDL5CuYvG5TGiJZkpjx5IS+NjQbR
         U6eQ==
X-Gm-Message-State: AOJu0YwgykW+U+1Jl5LYsbaLkl9UNsuM5nNfzMlA9iTv9UK9eIwa3eQq
	nBmWc/Jp2WIGddca1j9+XC1IO9HMbTw=
X-Google-Smtp-Source: AGHT+IFx3l8R4xCyvhHqDuRd2xax2k1kPhWlRrJ5LcW8XatCZKa5dYgI/cJTWWn2Ux23Z6nJ5pkglQ==
X-Received: by 2002:a17:90a:ad48:b0:28c:ab31:7813 with SMTP id w8-20020a17090aad4800b0028cab317813mr453607pjv.11.1703781544553;
        Thu, 28 Dec 2023 08:39:04 -0800 (PST)
Received: from smtpclient.apple ([49.37.241.39])
        by smtp.gmail.com with ESMTPSA id px9-20020a17090b270900b0028c952fd855sm3178552pjb.52.2023.12.28.08.39.03
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Dec 2023 08:39:04 -0800 (PST)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: mtd0 device is missing in /sys/class/mtd
Message-Id: <5AF66848-442A-460B-BAD8-31818FDC9DAC@gmail.com>
Date: Thu, 28 Dec 2023 22:08:51 +0530
To: linux-mtd@lists.infradead.org
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_083907_485313_59DC670D 
X-CRM114-Status: GOOD (  12.10  )
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

SGkgQWxsLAoKSSB3YXMgYXMgYmVnaW5uZXIgaW4gbGludXggZGV2aWNlIGRyaXZlciBkZXZlbG9w
bWVudCwgYW5kIHJlY2VudGx5IEkgd2FzIHdvcmtpbmcgb24gYSBkZXZpY2UgZHJpdmVyIGZvciBl
c3BpIHByb3RvY29sIGFuZCB3YXMgc3R1Y2sgd2l0aCBhIHByb2JsZW0uCgpJIGhhdmUgYW4gbXRk
IGRldmljZSBkcml2ZXIgdGhyb3VnaCB3aGljaCBvbmUgY291bGQgYWNjZXNzIHRoZSBOT1IgZmxh
c2ggY29ubmVjdGVkIHRvIHRoZSBvdGhlciBlbmQgb2YgIGVzcGkgYnVzLiBUaGUgZHJpdmVyIHNl
ZW1zIHRvIGhhdmUgcHJvYmVkIHN1Y2Nlc3NmdWxseSAsIEkgc2VlIGFuIGVudHJ5IGZvciBteSBt
dGQgZGV2aWNlIGluIC9wcm9jL210ZCBidXQgLCBJIGRvbnQgc2VlIGFuIGVudHJ5IGZvciBteSBt
dGQgZGV2aWNlIGluIHRoZSAvc3lzL2NsYXNzL210ZC4KCkhlcmUgYXJlIGZldyBsb2dzIG9mIGlu
dGVyZXN0IDoKCnJvb3RAbXlib3g6fiMgY2F0IC9wcm9jL210ZApkZXY6ICAgIHNpemUgICBlcmFz
ZXNpemUgIG5hbWUKbXRkMDogMDQwMDAwMDAgMDAwMDEwMDAgImFzcGVlZC1lc3BpLWZsYXNo4oCd
IDw8PDw84oCU4oCUIFRoaXMgaXMgbXkgbXRkIGRldmljZQptdGQxOiAwNDAwMDAwMCAwMDAxMDAw
MCAiYm1jIgptdGQyOiAwMDBlMDAwMCAwMDAxMDAwMCAidS1ib290IgptdGQzOiAwMDAyMDAwMCAw
MDAxMDAwMCAidS1ib290LWVudiIKbXRkNDogMDA5MDAwMDAgMDAwMTAwMDAgImtlcm5lbCIKbXRk
NTogMDIwMDAwMDAgMDAwMTAwMDAgInJvZnMiCm10ZDY6IDAxNjAwMDAwIDAwMDEwMDAwICJyd2Zz
IgptdGQ3OiAwNDAwMDAwMCAwMDAxMDAwMCAiYWx0LWJtYyIKbXRkODogMDAwZTAwMDAgMDAwMTAw
MDAgImFsdC11LWJvb3QiCm10ZDk6IDAwMDIwMDAwIDAwMDEwMDAwICJhbHQtdS1ib290LWVudiIK
bXRkMTA6IDAwOTAwMDAwIDAwMDEwMDAwICJhbHQta2VybmVsIgptdGQxMTogMDIwMDAwMDAgMDAw
MTAwMDAgImFsdC1yb2ZzIgptdGQxMjogMDE2MDAwMDAgMDAwMTAwMDAgImFsdC1yd2Zz4oCdCgoK
cm9vdEBteWJveDovc3lzL2NsYXNzL210ZCMgbHMKbXRkMSAgICAgbXRkMTBybyAgbXRkMTFybyAg
bXRkMTJybyAgbXRkMiAgICAgbXRkMyAgICAgbXRkNCAgICAgbXRkNSAgICAgbXRkNiAgICAgbXRk
NyAgICAgbXRkOCAgICAgbXRkOQptdGQxMCAgICBtdGQxMSAgICBtdGQxMiAgICBtdGQxcm8gICBt
dGQycm8gICBtdGQzcm8gICBtdGQ0cm8gICBtdGQ1cm8gICBtdGQ2cm8gICBtdGQ3cm8gICBtdGQ4
cm8gICBtdGQ5cm8KCkkgd2FzIGV4cGVjdGluZyBtdGQwIHRvIGJlIHByZXNlbnQgaW4gdGhlIC9z
eXMvY2xhc3MvbXRkLCBidXQgaXRzIG5vdCB0aGVyZS4KCkxvb2tpbmcgYXQgZG1lc2c6Cgpyb290
QG15Ym94Oi9zeXMvY2xhc3MvbXRkIyBkbWVzZyB8IGdyZXAgLWllIG10ZCAtQTUgLWllIGVzcGkK
WyAgICAwLjY4NTAwNl0gRW50ZXJlZCB0aGUgYXNwZWVkX2VzcGlfY3RybF9wcm9iZSBmdW5jdGlv
bgpbICAgIDAuNjkwOTkwXSBkZXZpY2UgbWF0Y2hlZCA6ICAxClsgICAgMC42OTkyMjVdIGVzcGkg
YWxsb2Mgc3RhcnRlZApbICAgIDAuNzA0NzI2XSBlc3BpIHJlYWQgZnJvbSBkZXZpY2UgdHJlZSwg
Zmxhc2ggc2l6ZSA6ICA2NzEwODg2NApbICAgIDAuNzEyNDE2XSBlc3BpIGZsYXNoIGVuYWJsZWQK
WyAgICAwLjcxNjU3Ml0gZXNwaSBmbGFzaCBjaGFubmVsIGlzIHJlYWR5ClsgICAgMC43MjA5NDBd
IGVzcGkgZmxhc2ggYWxsb2NhdGlvbiBjb21wbGV0ZWQKWyAgICAwLjcyNTI1OV0gYXNwZWVkLWVz
cGktY3RybCAxZTZlZTAwMC5lc3BpLWN0cmw6IG1vZHVsZSBsb2FkZWQKLS0KWyAgICAwLjk2Mjc2
NF0gNSBmaXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBibWMK
WyAgICAwLjk2OTY3NV0gQ3JlYXRpbmcgNSBNVEQgcGFydGl0aW9ucyBvbiAiYm1jIjoKWyAgICAw
Ljk3NDc3Nl0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAwZTAwMDAgOiAidS1ib290IgpbICAgIDAu
OTgxOTgyXSAweDAwMDAwMDBlMDAwMC0weDAwMDAwMDEwMDAwMCA6ICJ1LWJvb3QtZW52IgpbICAg
IDAuOTg5NTU3XSAweDAwMDAwMDEwMDAwMC0weDAwMDAwMGEwMDAwMCA6ICJrZXJuZWwiClsgICAg
MC45OTY3NzJdIDB4MDAwMDAwYTAwMDAwLTB4MDAwMDAyYTAwMDAwIDogInJvZnMiClsgICAgMS4w
MDM3NTldIDB4MDAwMDAyYTAwMDAwLTB4MDAwMDA0MDAwMDAwIDogInJ3ZnMiCi0tClsgICAgMS4w
NDgzMDRdIDUgZml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2Ug
YWx0LWJtYwpbICAgIDEuMDU1NTYzXSBDcmVhdGluZyA1IE1URCBwYXJ0aXRpb25zIG9uICJhbHQt
Ym1jIjoKWyAgICAxLjA2MTA5Nl0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAwZTAwMDAgOiAiYWx0
LXUtYm9vdCIKWyAgICAxLjA2ODY3Ml0gMHgwMDAwMDAwZTAwMDAtMHgwMDAwMDAxMDAwMDAgOiAi
YWx0LXUtYm9vdC1lbnYiClsgICAgMS4wNzY2MDddIDB4MDAwMDAwMTAwMDAwLTB4MDAwMDAwYTAw
MDAwIDogImFsdC1rZXJuZWwiClsgICAgMS4wODQyMTFdIDB4MDAwMDAwYTAwMDAwLTB4MDAwMDAy
YTAwMDAwIDogImFsdC1yb2ZzIgpbICAgIDEuMDkxNTk0XSAweDAwMDAwMmEwMDAwMC0weDAwMDAw
NDAwMDAwMCA6ICJhbHQtcndmc+KAnQoKYW5kIHRoZSBtdGQgZGV2aWNlcyBsaXN0ZWQgaW4gL3N5
cy9jbGFzcy9tdGQgZnJvbSBtdGQxIHRocm91Z2ggbXRkMTIgYXJlIGJhc2ljYWxseSBmcm9tIHRo
ZSBwYXJ0aXRpb25zIGxpc3QgYWJvdmUuCgpyb290QG15Ym94Oi9zeXMvY2xhc3MvbXRkIyBmb3Ig
ZGlyIGluICo7IGRvIGNhdCAkZGlyL25hbWU7IGRvbmUKYm1jCmFsdC1rZXJuZWwKYWx0LXJvZnMK
YWx0LXJ3ZnMKdS1ib290CnUtYm9vdC1lbnYKa2VybmVsCnJvZnMKcndmcwphbHQtYm1jCmFsdC11
LWJvb3QKYWx0LXUtYm9vdC1lbnYKCkRvZXMgYW55b25lIGtub3cgd2hhdCBjb3VsZCBiZSB0aGUg
cG9zc2libGUgcmVhc29uIGZvciB0aGUgcHJvYmxlbSA/IEFueSBoaW50cy9oZWxwIHdvdWxkIGJl
IGFwcHJlY2lhdGVkLgoKVGhhbmtzLApNYW5vagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
