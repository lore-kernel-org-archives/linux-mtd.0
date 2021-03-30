Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7CCC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 22:20:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2342E619CA
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 22:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2342E619CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r1z9h466vavcJEc0P3b6uK5fgkNMHtvOURBjen1THFE=; b=iFZJePm3G56U8YVGuffpvqjoE
	y2xOeXTDpmi47g8EcAqyH77ujMyF3rOT/OkvlFl4M+s6GWvNfgsUzvY5ON0Rjss6wKYJdrXqPTbrh
	zKXezjObJRdpfRc3YK268jUu32dJvFq7Bm7fCSFJeLKs9EwPJENX1TEhnY9hDR3lmae/+LwiYY9yO
	9xriXOwXUSAVtdY1kHO+Fc8ZXGToELuc2vZnUUhhViA4Q0+oPZ5JT3fS7AGQccaqpJPgNRFukKtdy
	6DoUfvaZJwJAgypQo5ARsqJYSfFlXwGHZVnbZrRvlAl8TYDL3IWm+8VlVlxkd6iG2Ydi4its8hB3b
	9iJ/1p/WQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRMht-004znu-Es; Tue, 30 Mar 2021 22:19:29 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRMhp-004znL-8h
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 22:19:27 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso17050067oti.11
 for <linux-mtd@lists.infradead.org>; Tue, 30 Mar 2021 15:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2HG6bxS1qk7/z0h78vEgTknJko4wlCO+oTcTSzUNmVI=;
 b=tLIhMuHE+Lj4OSAbouRV3OfTw1jX4lBqg5OuA6MMZKHeW8edDm/6rcF5DKiQeWjPAt
 vMHN/Vg764pBfobL85X/FtBU1oZ1GNvpcDdcPRNJtPjnhEstKhR/bT7d2m6zm77DUF6w
 FVuNMZhK1bAQlNB1X6HGCYd+/Eb/g4q2JedAyzZ0oAo/cF1Xz84rbgHkQFGUYp+wT1UB
 0xdrjCBADE08gQ5GZl/P7x/CudRFRuu/QURk79SBrF/LXJsD0Wl1D7QTg5M46IhOAS7q
 f8nMs+FSWoQeBGvpZJs7VyThG0qCRS+eEkgJzskCLzbt4DQ7fm+EbSKBk2GjPNv0/8Nt
 ytCg==
X-Gm-Message-State: AOAM530UjFASCA0XwzyCfuJf1TUO4GziYlV2cdf5BbWS4QrErvnOE9+N
 FzSThqwCFJ2iGam92bzu2w==
X-Google-Smtp-Source: ABdhPJxCGf3RrQ04rjQ3xx9SW74JSdKeolmpb5+DQ3MBuHNGcQYmtg2Sg5yElQdNqXrHgucwrSSGJA==
X-Received: by 2002:a05:6830:18c:: with SMTP id
 q12mr61547ota.355.1617142764085; 
 Tue, 30 Mar 2021 15:19:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v65sm76540oib.42.2021.03.30.15.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:19:23 -0700 (PDT)
Received: (nullmailer pid 815356 invoked by uid 1000);
 Tue, 30 Mar 2021 22:19:22 -0000
Date: Tue, 30 Mar 2021 17:19:22 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ansuel Smith <ansuelsmth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RFC] dt-bindings: mtd: allow NVMEM cells in BCM4908
 partitions
Message-ID: <20210330221922.GA801452@robh.at.kernel.org>
References: <20210329150723.26584-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329150723.26584-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_231925_638200_FC0A95E8 
X-CRM114-Status: GOOD (  23.81  )
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

T24gTW9uLCBNYXIgMjksIDIwMjEgYXQgMDU6MDc6MjNQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBF
dmVyeSBNVEQgcGFydGl0aW9uIGNhbiBiZSBOVk1FTSBwcm92aWRlciBub3cuIEl0J3Mgbm90IGhh
bmRsZWQgYnkgdGhlCj4gc2hhcmVkIHBhcnRpdGlvbi55YW1sIHNvIGFkZCBwcm9wZXIgImNvbXBh
dGlibGUiIHRvIHRoZSBCQ000OTA4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNr
aSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBJZGVhbGx5IEknZCBsaWtlIHRvIGhhdmU6Cj4g
MS4gcGFydGl0aW9uLnlhbWwgYWxsb3dpbmcgIm52bWVtLWNlbGxzIiBieSB1c2luZyBudm1lbS1j
ZWxscy55YW1sCj4gMi4gYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbCB1c2luZyBwYXJ0aXRp
b24ueWFtbCBhbmQgZXh0ZW5kaW5nIHRoZQo+ICAgIGNvbXBhdGlibGUgbGlzdCBieSAiYnJjbSxi
Y200OTA4LWZpcm13YXJlIgo+IAo+IEkgZG9uJ3Qga25vdyBpZiBzdWNoIGEgc29sdXRpb24gaXMg
cG9zc2libGUgdG8gaW1wbGVtZW50IHVzaW5nIFlBTUw/CgpZb3Ugd291bGQgaGF2ZSB0byBkbyBz
b21ldGhpbmcgbGlrZToKCml0ZW1zOgogIC0gY29uc3Q6IGZvbyxiYXIKICAtIHt9CgphbmQgdGhl
biBpbiBwYXJ0aXRpb24ueWFtbDoKCmNvbnRhaW5zOiAKICBjb25zdDogbnZtZW0tY2VsbHMKCkJ1
dCB0aGF0IGRvZXMgd29yayBpZiBudm1lbS1jZWxscyBpcyBub3QgYWx3YXlzIHByZXNlbnQuCgpI
b3dldmVyLCBkbyB3ZSBoYXZlIHBhcnRpdGlvbi55YW1sIGFuZCBudm1lbS1jZWxscy55YW1sIGJh
Y2t3YXJkcz8gCm52bWVtLWNlbGxzLnlhbWwgc2hvdWxkIHJlZmVyZW5jZSBwYXJ0aXRpb24ueWFt
bCBhcyBudm1lbS1jZWxscy55YW1sIGlzIApwYXJ0aXRpb24ueWFtbCBwbHVzIG1vcmUgY29uc3Ry
YWludHMuCgpBbmQgdGhlbiBicmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sIHJlZmVyZW5jZXMg
bnZtZW0tY2VsbHMueWFtbCBhbmQgCnRoZSBhYm92ZSBzY2hlbWEgd291bGQgd29yay4KCj4gCj4g
UHJvcG9zZWQgc29sdXRpb24gKFJGQykgaXNuJ3QgYSByZWFsbHkgY2xlYW4gb25lOgo+IDEuIEl0
IGR1cGxpY2F0ZXMgIm52bWVtLWNlbGxzIiB3aGljaCBpcyBhbHJlYWR5IGluIHRoZSBudm1lbS1j
ZWxscy55YW1sCj4gMi4gR2VuZXJpYyAibnZtZW0tY2VsbHMiIHNob3VsZCBiZSBwYXJ0IG9mIHRo
ZSBwYXJ0aXRpb24ueWFtbAoKSSdtIGZpbmUgd2l0aCB0aGlzIHRvby4gSXQncyBtb3JlIGV4cGxp
Y2l0IGFzIHRvIHdoYXQgdGhlIGNvbXBhdGlibGUgCnN0cmluZ3MgYXJlLgoKPiAKPiBSb2I/IEhl
bHA/IDopCj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgt
cGFydGl0aW9ucy55YW1sICAgICAgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9i
cmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCj4gaW5kZXggN2IxMTNlNWUzNDIxLi4yOGFhM2Jk
ZDExMDMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBh
cnRpdGlvbnMueWFtbAo+IEBAIC0zMiw3ICszMiw5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAg
ICAgJHJlZjogInBhcnRpdGlvbi55YW1sIyIKPiAgICAgIHByb3BlcnRpZXM6Cj4gICAgICAgIGNv
bXBhdGlibGU6Cj4gLSAgICAgICAgY29uc3Q6IGJyY20sYmNtNDkwOC1maXJtd2FyZQo+ICsgICAg
ICAgIGVudW06Cj4gKyAgICAgICAgICAtIGJyY20sYmNtNDkwOC1maXJtd2FyZQo+ICsgICAgICAg
ICAgLSBudm1lbS1jZWxscwo+ICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICAK
PiAgcmVxdWlyZWQ6Cj4gLS0gCj4gMi4yNi4yCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
