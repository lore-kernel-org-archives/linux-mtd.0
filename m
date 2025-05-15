Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DE1C2D0CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnvVgM5H6LI2g67bi8EwRM/iQgV8ULF8gUCJ9GnQ/74=; b=fmxB1mmUfKnSEm
	hlZqGBXOndvpng4hYWniCNhXzElCqX2pAtZqsyrvtS8GGxQ8qzZeyOVBj2YQwHKGMg5U2193aY1vB
	+K2JGSFU6y+UhXRiBiFvIfQufoJ5NRjyLP6Vd66pO4ytc/Zn7vVEBISGaGm/7vA3d3K/zM0JlGi6w
	1oIVRLLeZt4m6DiLYGvPESYAyhA3iMhSaCSG2cNeqKqWuCRaNlmBlhO66ywAqnxNix4Usph5Yd6x3
	I0+Cq/PnpLaEhtohaPAe6i5MI5OtWiq7gwIe8DE1zZcX0wRz5/2cJZQn64X7aRvfgyxxPqMM6ZAad
	NWepJX2K+2wt9bHbMpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFecf-00000001j7I-2Dy5;
	Thu, 15 May 2025 19:52:05 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeau-00000001ijo-0AAs;
	Thu, 15 May 2025 19:50:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4766631a6a4so14793121cf.2;
        Thu, 15 May 2025 12:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747338615; x=1747943415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijKQzzLB6fn0l9HXOynSzKmWa93u4m5lk6YgCJ/52bA=;
        b=jw6NNKJjZEx+Hactvvon1O+qGqvYhwdQPJhqezsKFnsUkZmr3BBcDbtz98PChkJH2+
         bxnR+Kk5B2/qtLBmGCBHQpm8KtQYh9nwXtk9eByZB2beDFAtstebrtGaG4LeBO+U+GvD
         zEs2KjH5KQuIN24cK6xDbL4Q7MVN7s004jCjZ/5ekhZUiNkVtmlcBhjpVOzb4jOu3SJF
         oAgepSgCl1qrzvJsQnYR/TJRtndt2FFErB/Nsz2VIzRxE6z4EMXtDFLE/nrWQgk/t++M
         NBdyOEAMKVaaZC10viR7Z5LENrZSgm1JO64YOnS7LbxM2Per7uumFq6WmGYMSv1TfGNr
         w7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338615; x=1747943415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijKQzzLB6fn0l9HXOynSzKmWa93u4m5lk6YgCJ/52bA=;
        b=FycgwT12zlQ6FW/AHO1sxFrI9q7InlOrN6SH/cW/zz9G12ml4o8gYgPScfVRCHmIHd
         CbKaObKnAwozarwh4TQwxEaOD18k4S3Qui0k+OlLdHjwT/7GBRCbDWzaNJ+LR9hqwdnx
         wlDdR9DkSzAnUpA41BdvSHP5btyzTF/uzWuB1InB8Et7jRFS4FJgwq9alhBt10Q+yVdR
         SjU/Zo4g+Kwqn+JXFNq38HDzLYZxcEiW4b+BCqKJYdEWfYOLbUcVtnD9jK3DWMbd9DbZ
         7vbbPlFWaFMUtNQjNiQdsxn6jv+qNMhoxf3tl7J/Dop0GSk3yuZR/OsTSvgpVwjbIlb+
         ey4g==
X-Forwarded-Encrypted: i=1; AJvYcCXaeNLc7TBvaVtZCqOwmlG2oXugGTm1KV3dSbzhm3mJ1Vbg/jDSgd+fqAINgzsCGc69+iXr3UXToMlIxPJ5Haqs@lists.infradead.org, AJvYcCXylksegiAtw1EX6HeGCVGvl8SVp0wtSEuCdz8Dcj/5OpFBNNx31RkVDORMuneSpftryglv3TPFUzXx@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ28tKB92UwHYYgdi8mQ2Q87gYdXshac5cHW5FFg+x0BUuSexa
	2XvJOWRzd8FBF/xSMT3i+Sp2eIBfM/1YVTG/xy/tGfVX7cJdjmJsT+GzdA2oHga7VNcsQ1WClS9
	zEjaeO/6+G+HcXeffmeKF3564xRg7naI=
X-Gm-Gg: ASbGncuva5hb89YoTmKPlhL4AhKaWjwTY8jLN3Yxcqq98ABzsv+cojSn5zyMwL1/y/G
	RPSX68AQ3jOeNyQPVvkWsUBi4w1Nb2IZkvjCGKfGD7NqxnADYrnimtICTzbfY8Ed8e6kOxUSwNY
	XIXhvHWtUiI3f3DamOE61kSpQ70p08zN4Z
X-Google-Smtp-Source: AGHT+IFg/wcvnBBQLcYze3vfJPGy+GNXDNI9xDfhAt+JQBd/EhhLBzPOLi2CERDJ8hqiCo+MSJ2a3RvbExF4wMUuIyY=
X-Received: by 2002:a05:622a:8c9:b0:476:b02d:2b4a with SMTP id
 d75a77b69052e-494ae39531dmr14532621cf.27.1747338614671; Thu, 15 May 2025
 12:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com> <20250514204159.GA2988411-robh@kernel.org>
In-Reply-To: <20250514204159.GA2988411-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:50:03 +0300
X-Gm-Features: AX0GCFtuH7yt6ihjR9mFd6CzYnznZejyyxToXHyqEx8rsfGB1bgn9WZkvaxFaRI
Message-ID: <CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash controller
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125016_086128_F8A2EBC5 
X-CRM114-Status: GOOD (  30.88  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTE6NDLigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgTWF5IDEwLCAyMDI1IGF0IDExOjQyOjIxUE0gKzA0
MDAsIEFsZXhleSBDaGFya292IHdyb3RlOgo+ID4gQWRkIGEgYmluZGluZyBmb3IgdGhlIHNlcmlh
bCBmbGFzaCBjb250cm9sbGVyIGZvdW5kIG9uIFZJQS9Xb25kZXJNZWRpYQo+ID4gU29Dcywgd2hp
Y2ggcHJvdmlkZXMgc2VtaS10cmFuc3BhcmVudCBhY2Nlc3MgdG8gU1BJIE5PUiBjaGlwcyBieQo+
ID4gbWFwcGluZyB0aGVpciBjb250ZW50cyB0byB0aGUgcGh5c2ljYWwgQ1BVIGFkZHJlc3Mgc3Bh
Y2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGV5IENoYXJrb3YgPGFsY2hhcmtAZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3ZpYSx2dDg1MDAt
c2ZsYXNoLnlhbWwgfCAxMjIgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS92aWEsdnQ4NTAwLXNmbGFzaC55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS92aWEsdnQ4NTAwLXNmbGFzaC55
YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZDJlYTBkYWNkZDU2MTE4YzBjYjVhMWNiNTEwY2ViNzU5
MWUxZTVjYQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwaS92aWEsdnQ4NTAwLXNmbGFzaC55YW1sCj4gPiBAQCAtMCwwICsxLDEy
MiBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvc3BpL3ZpYSx2dDg1MDAtc2ZsYXNoLnlhbWwjCj4gPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4g
PiArdGl0bGU6IFZJQS9Xb25kZXJNZWRpYSBzZXJpYWwgZmxhc2ggY29udHJvbGxlcgo+ID4gKwo+
ID4gK2Rlc2NyaXB0aW9uOgo+ID4gKyAgVGhpcyBjb250cm9sbGVyIGlzIHVzZWQgb24gVklBL1dv
bmRlck1lZGlhIFNvQ3Mgc3VjaCBhcyBWSUEgVlQ4NTAwLAo+ID4gKyAgV29uZGVyTWVkaWEgV004
ODUwIGFuZCBzaW1pbGFyLiBJdCBwcm92aWRlcyBhIHNlbWktdHJhbnNwYXJlbnQgaW50ZXJmYWNl
Cj4gPiArICBmb3IgcmVhZGluZyBhbmQgd3JpdGluZyBTUEkgTk9SIGNoaXAgY29udGVudHMgdmlh
IGEgcGh5c2ljYWwgbWVtb3J5IG1hcCwKPiA+ICsgIGFic3RyYWN0aW5nIGF3YXkgYWxsIFNQSSBj
b21tdW5pY2F0aW9uLCB3aGlsZSBhbHNvIHByb3ZpZGluZyBhIGRpcmVjdAo+ID4gKyAgbWVjaGFu
aXNtIGZvciBpc3N1aW5nICJwcm9ncmFtbWFibGUgY29tbWFuZHMiIHRvIHRoZSB1bmRlcmx5aW5n
IFNQSSBjaGlwCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEFsZXhleSBDaGFya292
IDxhbGNoYXJrQGdtYWlsLmNvbT4KPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0
aWJsZToKPiA+ICsgICAgZW51bToKPiA+ICsgICAgICAtIHZpYSx2dDg1MDAtc2ZsYXNoCj4gPiAr
ICAgICAgLSB3bSx3bTg1MDUtc2ZsYXNoCj4gPiArICAgICAgLSB3bSx3bTg2NTAtc2ZsYXNoCj4g
PiArICAgICAgLSB3bSx3bTg3NTAtc2ZsYXNoCj4gPiArICAgICAgLSB3bSx3bTg4NTAtc2ZsYXNo
Cj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IE1NSU8gcmVnaXN0ZXJzIHJlZ2lvbiBvZiB0aGUgY29udHJvbGxlcgo+ID4gKyAgICAgIC0g
ZGVzY3JpcHRpb246Cj4gPiArICAgICAgICAgIFBoeXNpY2FsIG1lbW9yeSByZWdpb24gd2l0aGlu
IHdoaWNoIHRoZSBjb250cm9sbGVyIHdpbGwgbWFwIHRoZQo+ID4gKyAgICAgICAgICBmbGFzaCBj
b250ZW50cyBvZiBjaGlwIDAgZm9yIHJlYWRpbmcgYW5kIHdyaXRpbmcuIElmIHRoZSBmbGFzaAo+
ID4gKyAgICAgICAgICBzaXplIGlzIHNtYWxsZXIgdGhhbiB0aGlzIHJlZ2lvbiwgaXQgd2lsbCBi
ZSBtYXBwZWQgYXQgaXRzIGVuZC4KPiA+ICsgICAgICAgICAgTm90ZSB0aGF0IGlmIHRoaXMgY2hp
cCBpcyB1c2VkIGFzIHRoZSBib290IGRldmljZSAoYXMgaXMgbW9zdAo+ID4gKyAgICAgICAgICBv
ZnRlbiB0aGUgY2FzZSksIHRoZSBib290IFJPTSBtYXBzIGl0IGF0IHRoZSB2ZXJ5IGVuZCBvZiB0
aGUKPiA+ICsgICAgICAgICAgQ1BVIGFkZHJlc3Mgc3BhY2UgKGkuZS4gZW5kaW5nIGF0IDB4ZmZm
ZmZmZmYpCj4KPiBQZXJpb2QgbmVlZGVkIG9uIHRoZSBlbmQuCgpOb3RlZCwgdGhhbmsgeW91ISBX
aWxsIGFkanVzdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
Ogo+ID4gKyAgICAgICAgICBQaHlzaWNhbCBtZW1vcnkgcmVnaW9uIHdpdGhpbiB3aGljaCB0aGUg
Y29udHJvbGxlciB3aWxsIG1hcCB0aGUKPiA+ICsgICAgICAgICAgZmxhc2ggY29udGVudHMgb2Yg
Y2hpcCAxIGZvciByZWFkaW5nIGFuZCB3cml0aW5nLiBJZiB0aGUgZmxhc2gKPiA+ICsgICAgICAg
ICAgc2l6ZSBpcyBzbWFsbGVyIHRoYW4gdGhpcyByZWdpb24sIGl0IHdpbGwgYmUgbWFwcGVkIGF0
IGl0cyBlbmQKPgo+IFBlcmlvZCBuZWVkZWQgb24gdGhlIGVuZC4KCkRpdHRvLgoKPiA+ICsKPiA+
ICsgIHJlZy1uYW1lczoKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBjb25zdDogaW8KPiA+
ICsgICAgICAtIGNvbnN0OiBjaGlwMC1tbWFwCj4gPiArICAgICAgLSBjb25zdDogY2hpcDEtbW1h
cAo+ID4gKwo+ID4gKyAgY2xvY2tzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAg
IiNhZGRyZXNzLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDEKPiA+ICsKPiA+ICsgICIjc2l6ZS1j
ZWxscyI6Cj4gPiArICAgIGNvbnN0OiAwCj4KPiBUaGlzIGZvbGxvd3MgdGhlIFNQSSBiaW5kaW5n
LCByaWdodD8gRHJvcCB0aGVzZSAyIGFuZCBhZGQgYSAkcmVmIHRvCj4gc3BpLWNvbnRyb2xsZXIu
eWFtbC4KCk5lZWQgc29tZSBhZHZpY2UgaGVyZS4gV2hpbGUgdGhpcyBjb250cm9sbGVyIHNwZWFr
cyBTUEkgcHJvdG9jb2wgdG8KaXRzIGNvbm5lY3RlZCBmbGFzaCBjaGlwcywgaXQncyBhIHNwZWNp
YWwtcHVycG9zZSB0aGluZyB0aGF0IGRvZXNuJ3QKZXhwb3NlIG11Y2ggU1BJIGZ1bmN0aW9uYWxp
dHkgdG8gdGhlIG91dHNpZGUgd29ybGQsIG5vciBjYW4gaXQgZHJpdmUKYW55IFNQSSBkZXZpY2Vz
IG90aGVyIHRoYW4gU1BJIE5PUiBmbGFzaC4gRG9lcyB0aGF0IHN0aWxsIHF1YWxpZnkgYXMKYW4g
U1BJIGNvbnRyb2xsZXIgYXMgZmFyIGFzIHRoZSBiaW5kaW5ncyBhcmUgY29uY2VybmVkPwoKSGFw
cHkgdG8gcmVmZXJlbmNlIHRoZSBzcGktY29udHJvbGxlci55YW1sIGJpbmRpbmcgaWYgc28uCgo+
ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gKyAgIl5mbGFzaEBbMC0xXSQiOgo+ID4gKyAgICB0
eXBlOiBvYmplY3QKPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKPiA+ICsKPiA+
ICsgICAgcHJvcGVydGllczoKPiA+ICsgICAgICByZWc6Cj4gPiArICAgICAgICBtaW5pbXVtOiAw
Cj4gPiArICAgICAgICBtYXhpbXVtOiAxCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNv
bXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIHJlZy1uYW1lcwo+ID4gKyAgLSBjbG9ja3MK
PiA+ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBs
ZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgc2ZsYXNoOiBzcGktbm9yLWNvbnRyb2xsZXJAZDgwMDIw
MDAgewo+Cj4gc3BpQC4uLgoKUmVsYXRlZCB0byB0aGUgcXVlc3Rpb24gYWJvdmUuLi4gSGFwcHkg
dG8gY2FsbCBpdCBzcGlAIGlmIGFwcHJvcHJpYXRlCmluIHRoaXMgY2FzZS4KCj4gPiArICAgICAg
ICBjb21wYXRpYmxlID0gIndtLHdtODg1MC1zZmxhc2giOwo+ID4gKyAgICAgICAgcmVnID0gPDB4
ZDgwMDIwMDAgMHg0MDA+LAo+ID4gKyAgICAgICAgICAgICAgPDB4ZmY4MDAwMDAgMHg4MDAwMDA+
LAo+ID4gKyAgICAgICAgICAgICAgPDB4ZWY4MDAwMDAgMHg4MDAwMDA+Owo+ID4gKyAgICAgICAg
cmVnLW5hbWVzID0gImlvIiwgImNoaXAwLW1tYXAiLCAiY2hpcDEtbW1hcCI7Cj4gPiArICAgICAg
ICBjbG9ja3MgPSA8JmNsa3NmPjsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArCj4gPiArICAgICAgICBmbGFzaEAw
IHsKPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwo+ID4gKyAg
ICAgICAgICAgIHJlZyA9IDwwPjsKPiA+ICsKPiA+ICsgICAgICAgICAgICBwYXJ0aXRpb25zIHsK
PiA+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiA+
ICsgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAg
ICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICBwYXJ0aXRp
b25AMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJVLWJvb3QiOwo+Cj4gVGhl
IHNvbWV3aGF0IHN0YW5kYXJkIHZhbHVlIGhlcmUgaXMgJ3UtYm9vdCcuCgpOb3RlZCwgdGhhbmtz
IC0gd2lsbCBhZGp1c3QgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4gPiArICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MCAweDUwMDAwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgIHJlYWQtb25s
eTsKPiA+ICsgICAgICAgICAgICAgICAgfTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgcGFy
dGl0aW9uQDEgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiVS1ib290IGVudmly
b25tZW50IDEiOwo+Cj4gdS1ib290LWVudgoKRGl0dG8uCgo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4NTAwMDAgMHgxMDAwMD47Cj4gPiArICAgICAgICAgICAgICAgIH07Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgIHBhcnRpdGlvbkAyIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgIGxhYmVsID0gIlUtYm9vdCBlbnZpcm9ubWVudCAyIjsKPgo+IGFsdC11LWJvb3QtZW52IG9y
IHUtYm9vdC1lbnYtYmFja3VwPwoKRGl0dG8uCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBj
b21tZW50cyBSb2IhCgpCZXN0IHJlZ2FyZHMsCkFsZXhleQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
