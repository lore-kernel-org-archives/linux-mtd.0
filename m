Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDD8C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2k/wsip/1vFBZXOF07Y0CnjdvlBfgks6z1Z7T4PUzR4=; b=pr/TZxmmTPasDA
	YCeV/dt2bE+2HG3drWnAYc/mFq+4b7VjfCnIqSfxJSKyAkLvFhHyuW49HchyeGwU59zsPtTiH75Xi
	VDzJfo4TLSwdOImrCWIK9Bgd/dP0Cca4kDjdZHfXqPiKqzuY7syTf6VY/XP1xQ5YyhWi1shN3FeV2
	3f7Yq67+KajTySgbePxl/6uf9LXjUtvKKe9yamfaqrIDbgN0UkGMi/4k5oiGxq/IXYZekm6ygW0ut
	K0votXkyqn7p7nz2T+dh4ACJL4h2Zi8TPZbXNMlhtuL02WRjYhMM3s7JVOztf4nH/+9mONySMo+i5
	Qs0Kd14UkkQwjOopeYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLyT3-00000006pDM-2P4D;
	Mon, 02 Jun 2025 06:16:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLyT1-00000006pBV-00EN
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 06:16:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-311ea13388fso684679a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2025 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748844974; x=1749449774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg+fzmBmJzpfowpLETdoRjYjZL+2Q+5MM7s/tg0DnuI=;
        b=EHK8LhVjg7ihtoTyyIwZB/nEjF3pPCRftX5igQ+lQKEJtysomHDh7twqhYY3isqkOt
         j85IM5px3PF7bi5d8M1pOWZnBmL1wiPi9BnrhpF/qTHN4PFUdOM+jvg2qYaNBqHp/OXa
         tYkmI737ksHcsXUGTDIj1sCKHCu54N5vmTsh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844974; x=1749449774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kg+fzmBmJzpfowpLETdoRjYjZL+2Q+5MM7s/tg0DnuI=;
        b=QTahMlpmZFLBSyqJ/LuqXPIw26yHNC3w5Kl/gcU5ffmil2AxOqfhMfjC1tXsai2IId
         sX7DB91MU1UJWBvkM+QdoNQIU2l62iDqUQchJMAgyOkbCe6aNMM4SLcpKW5s/+S+tDOl
         Q5tW/87W4sLUNO0ZLSvbukKFa+AJq3ccw7bMAC7l7p+cTUNcvtQyXm8MPmqGaQdaRZ0b
         IH9gWq37EfnS+AqxbmRkRgG8fQhP8hdISvUmwKGbE6iTBmiaysm7apM+hkWp8ajxjTos
         MC6qkxH2axBinheVuds5LG0R/4vmuVGLE1qWPFzjA3zeFutHg+rJW88Bat0HnD+GK1Mu
         0JgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsKbYfn/cMLYPOax1cXpw28csgQhtWR75O/8mXPv9zdfeX53vjDn7xL+Etu/SsDoUouaNkPwjeswk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlTtZeE5iX1WbYKl9pO1GOlnj0+1ka3ThNQD+zpSlbuwCsVmFB
	GMf/Osh7m6UVHcfc2/hcL7P5lLHrrvnM+lUxQcrbAo43DwwDcSTNCf6EcCu6itpbloeT07oJVkN
	E6HKKh8mGFQ6FwQSg4QVQJekbLDwRmqN09uOY5n8m
X-Gm-Gg: ASbGnctF8AvcZkCORaaqPwlqU93a3ZsDzHkLjzOa9Ol/woE8bdjgqQ5E/iGJSqD0BoI
	gSa1VMQqDRyEi4CQvx5bMn29LQLAWFdQs9gnBdmTQqh0Zv7sVBKucuczOBJlpQJKiNP2RJR9v4i
	zy0b5siWmpZTKjZ2SSsUCpHkzjbkC6qsAmx516Ej6NXP9I
X-Google-Smtp-Source: AGHT+IFMlfQUD7moOpfg4aT4yDgNNHn2G/ju7GUIqlBaYZ8TuXzg41PK7q+ydNibjtimH5jvesqqedaYEBQfto0+oXM=
X-Received: by 2002:a17:90b:384e:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-3124db30c05mr6707357a91.5.1748844973604; Sun, 01 Jun 2025
 23:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250530034713.4165309-1-dregan@broadcom.com> <CAOiHx=nzNZiOiBKUVqpTA5S8uY+ZNdPpLpEQGGDN9jP2-4Lj8Q@mail.gmail.com>
In-Reply-To: <CAOiHx=nzNZiOiBKUVqpTA5S8uY+ZNdPpLpEQGGDN9jP2-4Lj8Q@mail.gmail.com>
From: David Regan <dregan@broadcom.com>
Date: Sun, 1 Jun 2025 23:16:01 -0700
X-Gm-Features: AX0GCFuVyL7dDgRdoT4ePcHrZD_g_s6cPa8iqimsPGxMvpcaZjE13ahnxTwc0SY
Message-ID: <CAA_RMS5xf7fmMWp_a0Jy_4Sd365gH=MBjS6bi4o7ocx43M61rA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, dgcbueu@gmail.com, 
	dregan@mail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_231615_078482_D691C7E3 
X-CRM114-Status: GOOD (  24.12  )
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

SGkgSm9uYXMsCgpPbiBGcmksIE1heSAzMCwgMjAyNSBhdCAxOjI34oCvQU0gSm9uYXMgR29yc2tp
IDxqb25hcy5nb3Jza2lAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gRnJpLCBNYXkg
MzAsIDIwMjUgYXQgNTo0OOKAr0FNIERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPiB3
cm90ZToKPiA+Cj4gPiBDdXJyZW50bHkgd2UgYXR0ZW1wdCB0byBnZXQgdGhlIGFtb3VudCBvZiBm
bGlwcGVkIGJpdHMgZnJvbSBhIGhhcmR3YXJlCj4gPiBsb2NhdGlvbiB3aGljaCBpcyByZXNldCBv
biBldmVyeSBzdWJwYWdlLiBJbnN0ZWFkIG9idGFpbiB0b3RhbCBmbGlwcGVkCj4gPiBiaXRzIHN0
YXQgZnJvbSBoYXJkd2FyZSBhY2N1bXVsYXRvci4gSW4gYWRkaXRpb24gaWRlbnRpZnkgdGhlIGNv
cnJlY3QKPiA+IG1heGltdW0gc3VicGFnZSBjb3JyZWN0ZWQgYml0cy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiA+IFJldmlld2VkLWJ5
OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBLYW1hbCBEYXN1IDxrYW1hbC5kYXN1QGJyb2FkY29tLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA0OCArKysrKysrKysrKysr
KysrKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5j
Cj4gPiBpbmRleCA2MmJkZGEzYmU5MmYuLjQzYWI0YWVkZGE1NSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+IEBAIC0zNjEsNiArMzYxLDcgQEAg
ZW51bSBicmNtbmFuZF9yZWcgewo+ID4gICAgICAgICBCUkNNTkFORF9DT1JSX0NPVU5ULAo+ID4g
ICAgICAgICBCUkNNTkFORF9DT1JSX0VYVF9BRERSLAo+ID4gICAgICAgICBCUkNNTkFORF9DT1JS
X0FERFIsCj4gPiArICAgICAgIEJSQ01OQU5EX1JFQURfRVJST1JfQ09VTlQsCj4gPiAgICAgICAg
IEJSQ01OQU5EX1VOQ09SUl9FWFRfQUREUiwKPiA+ICAgICAgICAgQlJDTU5BTkRfVU5DT1JSX0FE
RFIsCj4gPiAgICAgICAgIEJSQ01OQU5EX1NFTUFQSE9SRSwKPiA+IEBAIC0zODksNiArMzkwLDcg
QEAgc3RhdGljIGNvbnN0IHUxNiBicmNtbmFuZF9yZWdzX3YyMVtdID0gewo+ID4gICAgICAgICBb
QlJDTU5BTkRfQ09SUl9USFJFU0hPTERfRVhUXSAgID0gICAgIDAsCj4gPiAgICAgICAgIFtCUkNN
TkFORF9VTkNPUlJfQ09VTlRdICAgICAgICAgPSAgICAgMCwKPiA+ICAgICAgICAgW0JSQ01OQU5E
X0NPUlJfQ09VTlRdICAgICAgICAgICA9ICAgICAwLAo+ID4gKyAgICAgICBbQlJDTU5BTkRfUkVB
RF9FUlJPUl9DT1VOVF0gICAgID0gICAgIDAsCj4gPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX0VY
VF9BRERSXSAgICAgICAgPSAgMHg2MCwKPiA+ICAgICAgICAgW0JSQ01OQU5EX0NPUlJfQUREUl0g
ICAgICAgICAgICA9ICAweDY0LAo+ID4gICAgICAgICBbQlJDTU5BTkRfVU5DT1JSX0VYVF9BRERS
XSAgICAgID0gIDB4NjgsCj4gPiBAQCAtNDE5LDYgKzQyMSw3IEBAIHN0YXRpYyBjb25zdCB1MTYg
YnJjbW5hbmRfcmVnc192MzNbXSA9IHsKPiA+ICAgICAgICAgW0JSQ01OQU5EX0NPUlJfVEhSRVNI
T0xEX0VYVF0gICA9ICAgICAwLAo+ID4gICAgICAgICBbQlJDTU5BTkRfVU5DT1JSX0NPVU5UXSAg
ICAgICAgID0gICAgIDAsCj4gPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX0NPVU5UXSAgICAgICAg
ICAgPSAgICAgMCwKPiA+ICsgICAgICAgW0JSQ01OQU5EX1JFQURfRVJST1JfQ09VTlRdICAgICA9
ICAgICAwLAo+ID4gICAgICAgICBbQlJDTU5BTkRfQ09SUl9FWFRfQUREUl0gICAgICAgID0gIDB4
NzAsCj4gPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX0FERFJdICAgICAgICAgICAgPSAgMHg3NCwK
PiA+ICAgICAgICAgW0JSQ01OQU5EX1VOQ09SUl9FWFRfQUREUl0gICAgICA9ICAweDc4LAo+ID4g
QEAgLTQ0OSw2ICs0NTIsNyBAQCBzdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3NfdjUwW10g
PSB7Cj4gPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX1RIUkVTSE9MRF9FWFRdICAgPSAgICAgMCwK
PiA+ICAgICAgICAgW0JSQ01OQU5EX1VOQ09SUl9DT1VOVF0gICAgICAgICA9ICAgICAwLAo+ID4g
ICAgICAgICBbQlJDTU5BTkRfQ09SUl9DT1VOVF0gICAgICAgICAgID0gICAgIDAsCj4gPiArICAg
ICAgIFtCUkNNTkFORF9SRUFEX0VSUk9SX0NPVU5UXSAgICAgPSAgICAgMCwKPgo+IEkgc2VlIHRo
aXMgcmVnaXN0ZXIgaW4gQkNNNjMyNjgncyBOQU5EIGNvbnRyb2xsZXIgYXQgMHg4MCwgd2hpY2gg
aXMgYQo+IHY0Lnggb25lLCBzbyBJJ20gc3VycHJpc2VkIHY1LjAgZG9lc24ndCBoYXZlIGl0LiBP
ciBkb2VzIGl0IG5vdCB3b3JrCj4gdGhlcmU/IEkgZG9uJ3Qga25vdyBpZiB2My4zIGFsc28gaGFz
IGl0IG9yIGlmIHVzaW5nIHRoaXMgb24gdjQueCB3b3VsZAo+IHJlcXVpcmUgYSBzZXBhcmF0ZSBi
cmNtbmFuZF9yZWdzIGVudHJ5LgoKVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dCwgSSBk
aWQganVzdCB2ZXJpZnkgdGhlIHJlZ2lzdGVyIGF0IG9mZnNldAoweDgwIGRvZXMgYXBwZWFyIHRv
IHdvcmsgY29ycmVjdGx5IG9uIG15IDYzMjY4LiBJJ2xsIHB1dCBzb21lIHVwZGF0ZQppbiB0aGUg
bmV4dCBwYXRjaCByZXZpc2lvbiB0byByZWZsZWN0IHRoaXMuCgo+Cj4gQ2FuJ3QgcmVhbGx5IGNv
bW1lbnQgb24gdGhlIHJlbWFpbmluZyBjaGFuZ2VzLgo+Cj4gUmVnYXJkcywKPiBKb25hcwoKLURh
dmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
