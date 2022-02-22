Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4501EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgBFQDuF42F5cWf0ylDi7/W0F34ETLKnrn0yEUTLAfs=; b=V2NiSmwlQV+NTi
	XOv8Q8VDSvnjbcx5Y2OldydzSwA9VxTvM67MTcbsItp8PsO6tgjvx278oDB+5dpws1/OU/Z5Yy1cs
	PUF09TrimR69oaE/UoUJNl0IzjJafmuTLkm0q7Um62aq2tOhaxq3dq6+p0qnp2OT4Z7Oqaccg0G/Q
	iTPoXc8bKshw3QjkmCcgVdnFSqTY8+AaPX157PCjEUlUyQmA54XK9/+3qcE1ZkhJ1I681g4tQBVdr
	K9FOLh4s04veDoO960jHpYxD7TrSEPbzOlvNOAVmOqbZhqRltPhzh2umYrp5EgmHl7cM/JzsUYIKG
	/KXNWrEcpAycmuzGUdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMZqT-00BCVL-I2; Tue, 22 Feb 2022 18:25:05 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMZqQ-00BCTu-6R
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 18:25:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id h15so22020036edv.7
 for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2022 10:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LeuBg4dOuh5JH3e3jvl1u82+i4KgmUWsl9hqSaPqdVs=;
 b=eGutWihD+Ld7dXfTSK4HpFHNWgyC915Sn/OxmxZwaO0MadBFi0DfhUYgPGrEkZvPLi
 NfmXyZ7DlkyHThFli/HDpOLQZq8nF/d+1q0DuBUxBhPBFadfAOT3pQegs8S0VYRuRZ3S
 Npin/21oE2k8gERsUAS7pZ3Dg9af+GQR+AU1eHtvOuS3Rl/99JVXXnMrFH3z9geabAff
 nVE2M1sL96hghm9nc+alhJAVaVbZTxY5TfSwBZ0MC4LoY1aiTbt5PA9u5hEKjWoUSGPR
 TvGfUNCEorD5JXlybq9gBpGieiEVQG/DvGXz2UncuMuYuZPcqNyE/xYERQMxSK1hLnsl
 bOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LeuBg4dOuh5JH3e3jvl1u82+i4KgmUWsl9hqSaPqdVs=;
 b=gjUdXIYcHzfw7EDavzLZdlCHZqw1TYDINcXswswvy2bIduGT6uwwMRnw3MjWyRihaP
 2PnMK/o1JPKfL2w76bI/iV6nHK0jtG8c1cdfWIgSLB6XXmmaDTpiEa2eabxovFS7ACJo
 Fm3UAIjKDzecqE46sdo5fELlQr/BCvCb8ix5asvG7mDneeHjKGLEIM2LKgZqCPIYu1wP
 TmYFKfAX2X1skxyAdv5z6SqiQGfeUeFKPMmAKv3uxG2kaX18vTqWtWhvR5yxhqpcltjh
 0qkgd5FynjYisOomUdOeS8+yAMPDmFHqgSWE3FGbQB1LLmvbsCT7nzjclaoqNx+rlJK1
 9B6w==
X-Gm-Message-State: AOAM531fNQUbZTE7spAf+ZBVZ3sChzvc+nZDvTlUqiCzW+HuqY/to0uM
 Pm4vRwzmoTT8oWGC+2Qo0eM=
X-Google-Smtp-Source: ABdhPJxoyMZ8ZfL/45gLF23XftB2tGAsBn5C+bSzH3BEgsPFAqAj4Wy+s5Dv07GAAkizLi/ajIJZHw==
X-Received: by 2002:a05:6402:f04:b0:410:f0a5:5b02 with SMTP id
 i4-20020a0564020f0400b00410f0a55b02mr28509835eda.209.1645554300299; 
 Tue, 22 Feb 2022 10:25:00 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.gmail.com with ESMTPSA id j19sm6624244ejo.202.2022.02.22.10.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:24:59 -0800 (PST)
Date: Tue, 22 Feb 2022 19:24:58 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document
 new partition-dynamic nodes
Message-ID: <YhUqemzE42oNfwiU@Ansuel-xps.localdomain>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
 <20220220173905.14165-2-ansuelsmth@gmail.com>
 <YhUpEOgMBX4iL2CB@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhUpEOgMBX4iL2CB@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_102502_274144_A34CAC0C 
X-CRM114-Status: GOOD (  30.32  )
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

T24gVHVlLCBGZWIgMjIsIDIwMjIgYXQgMTI6MTg6NTZQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBGZWIgMjAsIDIwMjIgYXQgMDY6Mzk6MDRQTSArMDEwMCwgQW5zdWVsIFNt
aXRoIHdyb3RlOgo+ID4gRG9jdW1lbnQgbmV3IHBhcnRpdGlvbi1keW5hbWljIG5vZGVzIHVzZWQg
dG8gcHJvdmlkZSBhbiBPRiBub2RlIGZvcgo+ID4gcGFydGl0aW9uIHJlZ2lzdHJlZCBhdCBydW50
aW1lIGJ5IHBhcnNlcnMuIFRoaXMgaXMgcmVxdWlyZWQgZm9yIG52bWVtCj4gPiBzeXN0ZW0gdG8g
ZGVjbGFyZSBhbmQgZGV0ZWN0IG52bWVtLWNlbGxzLgo+ID4gCj4gPiBXaXRoIHRoZXNlIHNwZWNp
YWwgcGFydGl0aW9ucywgb25seSB0aGUgbGFiZWwgaXMgcmVxdWlyZWQgYXMgdGhlIHBhcnNlcgo+
ID4gd2lsbCBwcm92aWRlIHJlZyBhbmQgb2Zmc2V0IG9mIHRoZSBtdGQuIE5WTUVNIHdpbGwgdXNl
IHRoZSBkYXRhIGZyb20gdGhlCj4gPiBwYXJzZXIgYW5kIHByb3ZpZGUgdGhlIE5WTUVNIGNlbGxz
IGRlY2xhcmVkIGluIHRoZSBEVFMsICJjb25uZWN0aW5nIiB0aGUKPiA+IGR5bmFtaWMgcGFydGl0
aW9uIHdpdGggYSBzdGF0aWMgZGVjbGFyYXRpb24gb2YgY2VsbHMgaW4gdGhlbS4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIC4uLi9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24tZHluYW1pYy55YW1sICAgICB8IDU0
ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygr
KQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLWR5bmFtaWMueWFtbAo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Bh
cnRpdGlvbi1keW5hbWljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLWR5bmFtaWMueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTQ1MTI4ZTc1NGFjCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvcGFydGl0aW9uLWR5bmFtaWMueWFtbAo+ID4gQEAgLTAsMCArMSw1NCBAQAo+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiA+
ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi1keW5hbWljLnlhbWwjCj4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiAr
dGl0bGU6IER5bmFtaWMgUGFydGl0aW9uCj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsg
IFRoaXMgYmluZGluZyBkZXNjcmliZXMgYSBzaW5nbGUgZmxhc2ggcGFydGl0aW9uIHRoYXQgaXMg
ZHluYW1pY2FsbHkgYWxsb2NhdGVkCj4gPiArICBieSBhIGRlZGljYXRlZCBwYXJzZXIgdGhhdCBp
cyBub3QgYSBmaXhlZC1wYXJ0aXRpb24gcGFyc2VyLiBUbyBkZWNsYXJlIGEKPiA+ICsgIHBhcnRp
dGlvbiB0aGUgbGFiZWwgaXMgcmVxdWlyZWQuIFRoaXMgY2FuIGJlIHVzZWQgdG8gZ2l2ZSBhIGR5
bmFtaWMgcGFydGl0aW9uCj4gPiArICBhbiBPRiBub2RlIHNvIHRoYXQgc3Vic3lzdGVtcyBsaWtl
IE5WTUVNIGNhbiB3b3JrIGFuZCBwcm92aWRlIE5WTUVNIENlbGxzIHRvCj4gCj4gJ3N1YnN5c3Rl
bXMgbGlrZSBOVk1FTScgaXMgYSBMaW51eCBkZXRhaWwgdGhhdCBzaG91bGRuJ3QgYmUgaW4gYmlu
ZGluZ3MuCj4gCj4gPiArICB0aGUgc3lzdGVtLiBBbiBleGFtcGxlIGlzIGRlY2xhcmluZyB0aGUg
cGFydGl0aW9uIGxhYmVsIGFuZCBhbGwgdGhlIE5WTUVNCj4gPiArICBjZWxscyBpbiBpdC4gVGhl
IHBhcnNlciB3aWxsIGRldGVjdCB0aGUgY29ycmVjdCByZWcgYW5kIG9mZnNldCBhbmQgdGhlIE5W
TUVNCj4gPiArICB3aWxsIHJlZ2lzdGVyIHRoZSBjZWxscyBpbiBpdCBiYXNlZCBvbiB0aGUgZGF0
YSBleHRyYWN0ZWQgYnkgdGhlIHBhcnNlci4KPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsg
IC0gQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiA+ICsKPiA+ICtwcm9wZXJ0
aWVzOgo+ID4gKyAgbGFiZWw6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgbGFiZWwgLyBuYW1l
IGZvciB0aGUgcGFydGl0aW9uIGFzc2lnbmVkIGJ5IHRoZSBwYXJzZXIgYXQKPiA+ICsgICAgICBy
dW50aW1lLiBUaGlzIGlzIG5lZWRlZCBmb3Igc3lic3lzdGVtIGxpa2UgTlZNRU0gdG8gZGVmaW5l
IGNlbGxzIGFuZAo+ID4gKyAgICAgIHJlZ2lzdGVyIHdpdGggdGhpcyBPRiBub2RlLgo+IAo+ICds
YWJlbCcgaXMgZ2VuZXJhbGx5IGZvciBodW1hbiBjb25zdW1wdGlvbiBhbmQgc2hvdWxkIGJlIG9w
YXF1ZSB0byB0aGUgCj4gT1MgKG9yIGF0IGxlYXN0IHRoZSBrZXJuZWwpLiBQZXJoYXBzIG5vZGUg
bmFtZSBzaG91bGQgYmUgdXNlZCBsaWtlIAo+IFJhZmHFgiBpcyBkb2luZyBmb3IgbnZtZW1bMV0u
IFRoYXQgYXBwZWFycyB0byBiZSB0aGUgc2FtZSBwcm9ibGVtIGF0IHRoZSAKPiBuZXh0IGxldmVs
IGRvd24uCj4gCj4gUm9iCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIy
MDIxODA3MDcyOS4zMjU2LTEtemFqZWM1QGdtYWlsLmNvbS8KCk9rIHdpbGwgYWRkIHN1cHBvcnQg
Zm9yIG5vZGUgbmFtZS4gUHJvYmxlbSBpcyB0aGF0IHByb3BlcnRpZXMgaXMgbWFuZGF0b3J5Cmlu
IERvY3VtZW50YXRpb24gYW5kIGNhbid0IGJlIE5vbmUuLi4gc28gaG93IHNob3VsZCBJIGhhbmRs
ZSB0aGlzPyBLZWVwCmxhYmVsIGJ1dCBzZXQgaXQgYXMgbm90IHJlcXVpcmVkPwoKLS0gCglBbnN1
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
