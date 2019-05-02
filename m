Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F1EC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 08:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FFC2075E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 08:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZOOr4Em";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndqW3mP7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FFC2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9naa8beTLmxzb1Q1Z3wgMqA2xYXE2I0wp0kBXqufc/M=; b=TZOOr4EmJTDlw2
	9x/JtzbgxNYE9/jneOXQa0rSPZ2tsQwKpFkSY8/tzwNgI97z/ipMDwv5r2egRQqyCvnBQeVN4KxV4
	h43v53uQC8lf4DV9xP0NJ1Nc3LSAPOnCebfaiSmzHUxslq7PjMmPGEn//tAoKMzqIlIJgzl52ITev
	XgJi2ZTyrKNJfN3HN5xpOOaXNHAyLUKuuONTHOQlTWSFw6B1v9KyuzCOqRNBhSwMb58lCljrQo0Gq
	c/oba8fQRb6VTvD7A/JohiH2MQ6CvXslLoZJOpkADogGkjttE3CI8+iuEi/ECnaaz6en/q5LmaEL1
	pAIlPEPc46YImuVN8yuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM7Hd-00071N-16; Thu, 02 May 2019 08:41:37 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM7Ha-00070t-3A
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 08:41:35 +0000
Received: by mail-it1-x144.google.com with SMTP id v143so2030390itc.1
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K4OgCJhQf1RCHc0gxAMiXKeGdaGGkpYQYrG1YDmor08=;
 b=ndqW3mP7X943elO5hRn0uw7A31GJKR2oll9etmkipUU13uQqA2X4QpeLianjJ5kKfT
 B7rgoaPIqDWpyUyKem90TcR9pOtBxZpymis61LhpDPb5jE3PBbmnc3unKmYwIMUfw8vv
 LjXGqSz1LIq3aQhfiH0AbtX2jqETFmIr447sudysjnNECd4frWClaHo7HzyQ7CrlD29t
 QgKHBKFh9c9Sdq+HH4OieGn6E2D2f+z+Xx9C8Dyfn13WnH97OKjzbJAx0YjzAcVB7VXT
 Ss87nq+ExVddDAM3F4jLvIxdA+lN1wazRQFVGxz6+WLqoVzUXQf6PcnDB5FJWSrjRCVp
 v8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K4OgCJhQf1RCHc0gxAMiXKeGdaGGkpYQYrG1YDmor08=;
 b=kAnaKO14r4K3YnD8kjy3ObgR/QXiy5VL5xEFW102kFzpXxt4xB2ofDk1cYRjpsttws
 NWPnAovOEvqzOHI8S35ryf4zYj9y6/7XB0P5p+3atkiqTLgrq5jm5eQmEYLTuLcOVgNq
 KFrolrVJmYyzDLbvprLLWWjBTaGbRjML1waPePSMfdS/S4xMjtPfneCB4nygGjkve+4g
 QlwXD+SaPfjHVqCTFym+na09UaB+InTjKjKHPz7LkrcLNvs+udCFDU2Hb/Q3BQSBt47f
 A6MrjZU8SQuuGmGgWMPzNS+MIGgmC4293KxT+XlGns0atQ/fibjxkFBCM5kiXn33apbc
 DJ9w==
X-Gm-Message-State: APjAAAUOYUepYB4CBK0p//2N1zpTcJK6gSv3evHC0lZ3Rhc65b50EcMl
 KMdYK8FaidLPmqMYI3zON3l7To63NmC3JoKpLeT1n9hc
X-Google-Smtp-Source: APXvYqwlzMfIDeeLnxvg8F8pQApRYPFkN5K6jYDokW3XadTir4RTT4tXnwv+PS8fCCKpMM1zl63D4nV8dxK7nwrEX1Q=
X-Received: by 2002:a24:c488:: with SMTP id v130mr1625014itf.96.1556786492758; 
 Thu, 02 May 2019 01:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
 <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
 <20190502083632.0ec0fb4e@collabora.com>
 <CA+Ln22H4ua9Zuh4eKaWfHtqh8DieyiS=5s7wS6-TbmA5Dsop4A@mail.gmail.com>
 <20190502085518.5d248167@collabora.com>
 <CA+Ln22EJ3G9ez4XZ3ysZBt6thsqDYDtik8fw-gfExR9Y7wFN9A@mail.gmail.com>
 <20190502092126.22f1ace5@collabora.com>
In-Reply-To: <20190502092126.22f1ace5@collabora.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Thu, 2 May 2019 17:41:20 +0900
Message-ID: <CA+Ln22Es-P9J5unVYwH2kM-+3Zz6Jb9GtsL=HcHsgbjwmi5sMw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_014134_135360_6CC1806D 
X-CRM114-Status: GOOD (  35.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>, marek.vasut@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MjAxOeW5tDXmnIgy5pelKOacqCkgMTY6MjEgQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT46Cj4KPiBPbiBUaHUsIDIgTWF5IDIwMTkgMTU6NTg6MjQgKzA5MDAK
PiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gMjAxOeW5
tDXmnIgy5pelKOacqCkgMTU6NTUgQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT46Cj4gPiA+Cj4gPiA+IE9uIFRodSwgMiBNYXkgMjAxOSAxNTo0Mjo1OSArMDkw
MAo+ID4gPiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gPiAyMDE55bm0NeaciDLml6Uo5pyoKSAxNTozNiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPjoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBUb21hc3os
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCAyIE1heSAyMDE5IDE1OjIzOjMzICswOTAwCj4g
PiA+ID4gPiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IDIwMTnlubQ15pyIMuaXpSjmnKgpIDEwOjU0IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Ogo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gRnJpLCBBcHIg
MjYsIDIwMTkgYXQgMDY6NDI6MjNQTSArMDIwMCwgUGF3ZcWCIENobWllbCB3cm90ZToKPiA+ID4g
PiA+ID4gPiA+IEZyb206IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGR0LWJpbmRpbmdzIGZv
ciBTYW1zdW5nIE9uZU5BTkQgZHJpdmVyLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gPiA+
ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNo
bWllbEBnbWFpbC5jb20+Cj4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiA+ICAuLi4v
YmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQgICAgICAgICAgfCA0NiArKysrKysrKysr
KysrKysrKysrCj4gPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMo
KykKPiA+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0Cj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dAo+ID4gPiA+ID4gPiA+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzQxZDk3Y2Mx
NTEzCj4gPiA+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiA+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQK
PiA+ID4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsNDYgQEAKPiA+ID4gPiA+ID4gPiA+ICtEZXZpY2Ug
dHJlZSBiaW5kaW5ncyBmb3IgU2Ftc3VuZyBTb0MgT25lTkFORCBjb250cm9sbGVyCj4gPiA+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ID4gPiA+
ID4gPiA+ICsgLSBjb21wYXRpYmxlIDogdmFsdWUgc2hvdWxkIGJlIGVpdGhlciBvZiB0aGUgZm9s
bG93aW5nLgo+ID4gPiA+ID4gPiA+ID4gKyAgIChhKSAic2Ftc3VuZyxzM2M2NDAwLW9uZW5hbmQi
IC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgUzNDNjQwMCBTb0MsCj4gPiA+ID4gPiA+ID4gPiArICAgKGIpICJzYW1zdW5nLHMz
YzY0MTAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aAo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBTM0M2NDEwIFNvQywKPiA+ID4gPiA+ID4gPiA+ICsgICAo
YykgInNhbXN1bmcsczVwYzEwMC1vbmVuYW5kIiAtIGZvciBvbmVuYW5kIGNvbnRyb2xsZXIgY29t
cGF0aWJsZSB3aXRoCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIFM1UEMxMDAgU29DLAo+ID4gPiA+
ID4gPiA+ID4gKyAgIChkKSAic2Ftc3VuZyxzNXB2MjEwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQg
Y29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgUzVQQzEx
MC9TNVBWMjEwIFNvQ3MuCj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArIC0gcmVn
IDogdHdvIG1lbW9yeSBtYXBwZWQgcmVnaXN0ZXIgcmVnaW9uczoKPiA+ID4gPiA+ID4gPiA+ICsg
ICAtIGZpcnN0IGVudHJ5OiBjb250cm9sIHJlZ2lzdGVycy4KPiA+ID4gPiA+ID4gPiA+ICsgICAt
IHNlY29uZCBhbmQgbmV4dCBlbnRyaWVzOiBtZW1vcnkgd2luZG93cyBvZiBwYXJ0aWN1bGFyIE9u
ZU5BTkQgY2hpcHM7Cj4gPiA+ID4gPiA+ID4gPiArICAgICBmb3IgdmFyaWFudHMgYSksIGIpIGFu
ZCBjKSBvbmx5IG9uZSBpcyBhbGxvd2VkLCBpbiBjYXNlIG9mIGQpIHVwIHRvCj4gPiA+ID4gPiA+
ID4gPiArICAgICB0d28gY2hpcHMgY2FuIGJlIHN1cHBvcnRlZC4KPiA+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiA+ICsgLSBpbnRlcnJ1cHQtcGFyZW50IDogcGhhbmRsZSBvZiBpbnRlcnJ1
cHQgY29udHJvbGxlciB0byB3aGljaCB0aGUgT25lTkFORAo+ID4gPiA+ID4gPiA+ID4gKyAgIGNv
bnRyb2xsZXIgaXMgd2lyZWQsCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGlzIGlzIGlt
cGxpZWQgYW5kIGNhbiBiZSByZW1vdmVkLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAr
IC0gaW50ZXJydXB0cyA6IHNwZWNpZmllciBvZiBpbnRlcnJ1cHQgc2lnbmFsIHRvIHdoaWNoIHRo
ZSBPbmVOQU5EIGNvbnRyb2xsZXIKPiA+ID4gPiA+ID4gPiA+ICsgICBpcyB3aXJlZDsgc2hvdWxk
IGNvbnRhaW4ganVzdCBvbmUgZW50cnkuCj4gPiA+ID4gPiA+ID4gPiArIC0gY2xvY2stbmFtZXMg
OiBzaG91bGQgY29udGFpbiB0d28gZW50cmllczoKPiA+ID4gPiA+ID4gPiA+ICsgICAtICJidXMi
IC0gYnVzIGNsb2NrIG9mIHRoZSBjb250cm9sbGVyLAo+ID4gPiA+ID4gPiA+ID4gKyAgIC0gIm9u
ZW5hbmQiIC0gY2xvY2sgc3VwcGxpZWQgdG8gT25lTkFORCBtZW1vcnkuCj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiBJZiB0aGUgY2xvY2sganVzdCBnb2VzIHRvIHRoZSBPbmVOQU5EIGRldmlj
ZSwgdGhlbiBpdCBzaG91bGQgYmUgaW4gdGhlCj4gPiA+ID4gPiA+ID4gbmFuZCBkZXZpY2Ugbm9k
ZSByYXRoZXIgdGhhbiB0aGUgY29udHJvbGxlciBub2RlLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IChUcnlpbmcgaGFyZCB0byByZWNhbGwgdGhlIGRldGFpbHMgYWJvdXQg
dGhpcyBoYXJkd2FyZS4pCj4gPiA+ID4gPiA+IEFGQUlSIHRoZSBjbG9jayBnb2VzIHRvIHRoZSBj
b250cm9sbGVyIGFuZCB0aGUgY29udHJvbGxlciB0aGVuIGZlZWRzCj4gPiA+ID4gPiA+IGl0IHRv
IHRoZSBtZW1vcnkgY2hpcHMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEFsc28gSSBkb24ndCB0
aGluayB3ZSBzaG91bGQgaGF2ZSBhbnkgbmFuZCBkZXZpY2Ugbm9kZXMgaGVyZSwgc2luY2UKPiA+
ID4gPiA+ID4gdGhlIG1lbW9yeSBpdHNlbGYgaXMgb25seSBleHBvc2VkIHZpYSB0aGUgY29udHJv
bGxlciwgd2hpY2ggb2ZmZXJzCj4gPiA+ID4gPiA+IHZhcmlvdXMgcXVlcmllcyB0byBwcm9iZSB0
aGUgbWVtb3J5IGF0IHJ1bnRpbWUsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8KPiA+ID4gPiA+ID4g
ZGVzY3JpYmUgaXQgaW4gRFQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSXQncyBwcm9iYWJseSB0cnVl
LCB0aG91Z2ggbm90IHByb3ZpZGluZyB0aGlzIGNvbnRyb2xsZXIvZGV2aWNlCj4gPiA+ID4gPiBz
ZXBhcmF0aW9uIGZvciBOQU5EIGNvbnRyb2xsZXIvZGV2aWNlcyBoYXMgcHJvdmVuIHRvIGJlIGEg
bWlzdGFrZSBmb3IKPiA+ID4gPiA+IHJhdyBOQU5EIGNvbnRyb2xsZXJzIChzb21lIHByb3BzIGFw
cGx5IHRvIHRoZSBjb250cm9sbGVycyBhbmQgb3RoZXJzIHRvCj4gPiA+ID4gPiB0aGUgTkFORCBk
ZXZpY2UsIG5vdCB0byBtZW50aW9uIHRoYXQgc29tZSBjb250cm9sbGVycyBzdXBwb3J0Cj4gPiA+
ID4gPiBpbnRlcmFjdGluZyB3aXRoIHNldmVyYWwgY2hpcHMpLCBzbywgaWYgdGhhdCdzIGEgbmV3
IGJpbmRpbmcsIEknZAo+ID4gPiA+ID4gcmVjb21tZW5kIGhhdmluZyB0aGlzIHNlcGFyYXRpb24g
ZXZlbiBpZiBpdCdzIG5vdCBzdHJpY3RseSByZXF1aXJlZC4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+
ID4gPiBOb3RlIHRoYXQgT25lTkFORCBpcyBhIHRvdGFsbHkgZGlmZmVyZW50IHRoaW5nIHRoYW4g
dGhlIHR5cGljYWwgTkFORAo+ID4gPiA+IG1lbW9yeSB3aXRoIE5BTkQgaW50ZXJmYWNlLiBPbmVO
QU5EIGNoaXBzIGhhdmUgYSBOT1ItbGlrZSBpbnRlcmZhY2UsCj4gPiA+ID4gd2l0aCBpbnRlcm5h
bCBjb250cm9sbGVyIGFuZCBidWZmZXJzIGluc2lkZSwgc28gdGVjaG5pY2FsbHkgdGhleSBjYW4K
PiA+ID4gPiBiZSBldmVuIHVzZWQgd2l0aG91dCBhbnkgc3BlY2lhbCBjb250cm9sbGVyIG9uIHRo
ZSBTb0MsIHZpYSBhIGdlbmVyaWMKPiA+ID4gPiBwYXJhbGxlbCBob3N0IGludGVyZmFjZSBhbmQg
cG9zc2libHkgc29tZSByZWd1bGFyIERNQSBlbmdpbmUgZm9yIENQVQo+ID4gPiA+IG9mZmxvYWQu
Cj4gPiA+Cj4gPiA+IFllcywgSSBrbm93IHRoYXQuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGUg
Y29udHJvbGxlciBkZXNpZ24gb2YgdGhlIFNvQ3MgaW4gcXVlc3Rpb24gZnVydGhlciBhYnN0cmFj
dHMgdGhlCj4gPiA+ID4gT25lTkFORCdzIHByb2dyYW1taW5nIGludGVyZmFjZSBpbnRvIGEgbnVt
YmVyIG9mIGhpZ2ggbGV2ZWwgb3BlcmF0aW9ucwo+ID4gPiA+IGFuZCBhdHRlbXB0cyB0byBoaWRl
IHRoZSBkZXRhaWxzIG9mIHRoZSB1bmRlcmx5aW5nIG1lbW9yeSwgc28gSSBkb24ndAo+ID4gPiA+
IHNlZSB0aGUgcG9pbnQgb2YgZGVzY3JpYmluZyB0aGUgbWVtb3J5IGluIERUIGhlcmUsIGl0IHdv
dWxkIGFjdHVhbGx5Cj4gPiA+ID4gZGVmZWF0IHRoZSBwdXJwb3NlIG9mIHRoaXMgY29udHJvbGxl
ci4KPiA+ID4KPiA+ID4gSSBkb24ndCBzZWUgaG93IGhhdmluZyBhIHN1Ym5vZGUgZm9yIHRoZSBO
QU5EIGNoaXAgd291bGQgY2hhbmdlCj4gPiA+IGFueXRoaW5nIG9uIGhvdyB0aGUgY29udHJvbGxl
ciBpbnRlcmFjdHMgd2l0aCB0aGUgTkFORCBkZXZpY2UuIE15IHBvaW50Cj4gPiA+IGlzLCBpZiB3
ZSBldmVyIG5lZWQgdG8gYWRkIHByb3BzIHRoYXQgYXBwbHkgdG8gdGhlIGRldmljZSByYXRoZXIg
dGhhbgo+ID4gPiB0aGUgY29udHJvbGxlciBpdHNlbGYsIGhhdmluZyBhIHNpbmdsZSBub2RlIHRv
IHJlcHJlc2VudCBib3RoIGVsZW1lbnRzCj4gPiA+IGlzIG5vdCB0aGF0IGdyZWF0Lgo+ID4KPiA+
IFlvdSBtZWFuLCBqdXN0IGhhdmluZyBhIHZlcnkgZ2VuZXJpYyBvbmVuYW5kQDAgbm9kZSB0aGF0
IGRvZXNuJ3QKPiA+IHJlYWxseSBpbmNsdWRlIGFueSBpbmZvcm1hdGlvbiwgZXhjZXB0IG1heWJl
IHRoZSBwYXJ0aXRpb24gdGFibGU/Cj4KPiBZZXMuCj4KPiA+IEkKPiA+IGd1ZXNzIHRoYXQgd291
bGRuJ3QgaGF2ZSBhbnkgbmVnYXRpdmUgc2lkZSBlZmZlY3RzIGluZGVlZC4KPiA+Cj4gPiBNeSBw
b2ludCB3YXMgdGhhdCB3ZSBkb24ndCB3YW50IHRvIHB1dCB0aGluZ3MgbGlrZSBjaGlwIHZlbmRv
ciwgc2l6ZSwKPiA+IGV0Yy4gaW4gRFQsIHNpbmNlIHRoYXQncyBlbnVtZXJhYmxlLgo+Cj4gT2gs
IGRlZmluaXRlbHkgbm90LCBhbmQgdGhhdCdzIGV4YWN0bHkgaG93IHdlIGRvIGl0IGZvciBOQU5E
IGRldmljZXMuCj4gRXZlcnl0aGluZyB0aGF0J3MgZGlzY292ZXJhYmxlIGlzIG5vdCBkZXNjcmli
ZWQgaW4gdGhlIERULCBidXQgc29tZQo+IHRoaW5ncyBjYW4ndCBiZSBkaXNjb3ZlcmVkIHRoaXMg
d2F5IChsaWtlIHdoZW4geW91IHdhbnQgdG8gb3ZlcnJpZGUgdGhlCj4gRUNDIHN0cmVuZ3RoIGFu
ZCB1c2UgU1ctYmFzZWQgaW1wbGVtIGluc3RlYWQgb2YgdGhlIEhXLWJhc2VkIG9uZSkuIEkKPiBr
bm93IG5vbmUgb2YgdGhpcyBhcHBsaWVzIHRvIE9uZU5BTkQgeWV0LCBJJ20ganVzdCBvdmVyLWNh
dXRpb3VzIGFib3V0Cj4gdGhhdCBzaW5jZSBEVCBiaW5kaW5ncyBjaGFuZ2VzIGFyZSBoYXJkIHRv
IG1ha2Ugb25jZSB0aGUgYmluZGluZ3MgYXJlCj4gaW4gdXNlLgoKTWFrZXMgc2Vuc2UuIFRoYW5r
cyBmb3IgY2xhcmlmeWluZyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
