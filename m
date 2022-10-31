Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382FFECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BZPV9+biFD0SAS+s1NDh4Yojs5rQ9CDDbG9IXzLau4=; b=y61qAw0fbGEV3e
	SIOHdTUUz8aced69hb7DyxpNXJdP6tLOgCsMarE76Y6c3xmTkbM3J5QWRAlpuHlgiZjqzr3F2D6U/
	Tu+sgkE0HEWV/dlFrmRV/+2nzhwNEpXxB0GKs0+U8e3CcB3qKOc7uN51NyzICcbylO+5quyd5dKCO
	MKWPXRTCsF3/Z/3x4Eunkv7nxJeekUV5mjjtL48SZK8nbxdRhJRn/OczWl9ilwvjTv6pYFCFwlgvn
	QBjeHpe0VDhKSklvjX077PRb5v55nIx6ER7e4mVkPezsJzSwBqyFZsYzosCyKobNUBRjgiKO3CUAC
	3QW0BBZyCiLLv4BUZy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW3G-00CLp9-UZ; Mon, 31 Oct 2022 14:46:11 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW2o-00CLbk-6G; Mon, 31 Oct 2022 14:45:43 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13c2cfd1126so13658761fac.10;
        Mon, 31 Oct 2022 07:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/FH10O3eEqn0o6aN8sU7z4Nn4gIFyCFRKnoNg2C2xQ=;
        b=XhtVmFQ9dGaMnpEeBx+6KTDiCt7u9B8BXAiluJd2O0dlP2eZAiN5JJYqAwAoEVj8hO
         /kEnPZ05QAZR4yRtzq3niWcbm+iVrjIgUOK1asN56hzwD9BnbAjmozFx2zHcV/Z0x0bF
         HM1894900XKGTOrwl5E67CzgMwj0+yqsV3ND7nmOF1HVuuUq3Lskfx1wsIeq+E35DEe4
         4vhuUc1w5z3eWRbIog8FsYVvHoul6Rug6jn1UzFDHqtP4uT/dwgxMyULTrY+ytvS85CN
         m3guGfap1YVnCAarr6Yf1xRJ4zI4LHgTK/7eZeQR4ASTi4V+Ig1C0Zw+kdo964H1I0g7
         RVQg==
X-Gm-Message-State: ACrzQf3DkjslKGRw/+zcKy7oqsfu1iFm4ijPTqYeU7gdavRgIRBc2NN4
	1TstkOQNWIg2Tmo/nhBIig==
X-Google-Smtp-Source: AMsMyM4gN4Iq1Ov3dfpswcegWaJYp37N5YBOswH241Qjw5B5vTf4Z3GAqdV0Xl9o8o3INqomAwal+Q==
X-Received: by 2002:a05:6870:630f:b0:132:8af2:c8f2 with SMTP id s15-20020a056870630f00b001328af2c8f2mr17541017oao.284.1667227540101;
        Mon, 31 Oct 2022 07:45:40 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q7-20020a056871080700b0012b298699dbsm3093444oap.1.2022.10.31.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:45:39 -0700 (PDT)
Received: (nullmailer pid 2861020 invoked by uid 1000);
	Mon, 31 Oct 2022 14:45:41 -0000
Date: Mon, 31 Oct 2022 09:45:41 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Weinberger <richard@nod.at>, William Zhang <william.zhang@broadcom.com>, Joel Peshkin <joel.peshkin@broadcom.com>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V3 2/2] dt-bindings: nvmem: u-boot,env: add Broadcom's
 variant binding
Message-ID: <166722753485.2860867.13096604705900447995.robh@kernel.org>
References: <20221018154202.4634-1-zajec5@gmail.com>
 <20221018154202.4634-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018154202.4634-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_074542_264314_A4D13897 
X-CRM114-Status: GOOD (  16.14  )
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

Ck9uIFR1ZSwgMTggT2N0IDIwMjIgMTc6NDI6MDIgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gQnJvYWRj
b20gdXNlcyBVLUJvb3QgZm9yIGEgbG90IG9mIHRoZWlyIGJjbWJjYSBmYW1pbGl5IGNoaXBzZXRz
LiBVLUJvb3QKPiBzdG9yZXMgaXRzIGNvbmZpZ3VyYXRpb24gaW4gYW4gZW52aXJvbm1lbnQgZGF0
YSBibG9jay4KPiAKPiBTdWNoIGJsb2NrcyBhcmUgdXN1YWxseSBzdG9yZWQgb24gZmxhc2ggYXMg
YSBzZXBhcmF0ZWQgcGFydGl0aW9uIGF0Cj4gaGFyZGNvZGVkIGFkZHJlc3MuIEJyb2FkY29tIGhv
d2V2ZXIgZGVjaWRlZCB0bzoKPiAxLiBTdG9yZSBlbnYgZGF0YSBibG9jayBpbnNpZGUgVS1Cb290
IHBhcnRpdGlvbgo+IDIuIEF2b2lkIHN0aWNraW5nIHRvIGhhcmRjb2RlZCBvZmZzZXRzCj4gMy4g
VXNlIGN1c3RvbSBoZWFkZXIgd2l0aCAidUVudiIgbWFnaWMgYW5kIGVudiBkYXRhIGxlbmd0aAo+
IAo+IEV4YW1wbGUgKGxlbmd0aCAweDQwMDApOgo+ICQgaGV4ZHVtcCAtbiAzMiAtQyAtcyAweDQw
MDAwIC9kZXYvbXRkYmxvY2swCj4gMDAwNDAwMDAgIDc2IDZlIDQ1IDc1IDAwIDQwIDAwIDAwICAz
NCA4OSA3YSA4MiA0OSA0ZCA0MSA0NyAgfHZuRXUuQC4uNC56LklNQUd8Cj4gMDAwNDAwMTAgIDQ1
IDNkIDRlIDQxIDRlIDQ0IDNhIDMxICA0ZCAyYyAzMSAzMCAzMiAzNCA0ZCAwMCAgfEU9TkFORDox
TSwxMDI0TS58Cj4gKDB4NDAwMDAgb2Zmc2V0IGlzIHVuaXQgc3BlY2lmaWMgYW5kIGNhbiBjaGFu
Z2UpCj4gCj4gU3RhcnRpbmcgd2l0aCB0aGUgY29tbWl0IDExOGYzZmJlNTE3ZjQgKCJkdC1iaW5k
aW5nczogbXRkOiBwYXJ0aXRpb25zOgo+IHN1cHBvcnQgbGFiZWwvbmFtZSBvbmx5IHBhcnRpdGlv
biIpIERUIGNhbiBkZXNjcmliZSBwYXJ0aXRpb25zIG1hdGNoaW5nCj4gdGhlbSBieSBhIG5hbWUg
KHdpdGhvdXQgc3BlY2lmeWluZyBhY3R1YWwgYWRkcmVzcykuIFdpdGggdGhhdCBmZWF0dXJlCj4g
YW5kIHRoaXMgYmluZGluZyBjaGFuZ2UgaXQncyBwb3NzaWJsZSB0bzoKPiAxLiBTcGVjaWZ5IERU
IG5vZGUgZm9yIEJyb2FkY29tJ3MgVS1Cb290IGVudiBkYXRhIHN1YnBhcnRpdGlvbgo+IDIuIEFk
ZCBub2RlcyBmb3Igc3BlY2lmaWMgZW52aXJvbm1lbnQgZGF0YSB2YXJpYWJsZXMKPiAzLiBSZWZl
cmVuY2UgdGhlbSBhcyBOVk1FTSBjZWxscwo+IAo+IFRoaXMgYmluZGluZyBpcyB1bmxpa2VseSB0
byBoZWxwIEJyb2FkY29tJ3MgVS1Cb290LiBVLUJvb3QgU1BMIG5lZWRzIHRvCj4gZmluZCBlbnZp
cm9ubWVudCBkYXRhIGVhcmx5IChiZWZvcmUgaXQgYWNjZXNzZXMgRFRCKSBhbmQgaXQgZG9lcyB0
aGF0IGJ5Cj4gbG9va2luZyBmb3IgYW4gInVFbnYiIG1hZ2ljLiBEaXJ0eSB3YXkuCj4gCj4gVGhp
cyBiaW5kaW5nIGNhbiBob3dldmVyIGJlIHVzZWQgYnkgb3BlcmF0aW5nIHN5c3RlbXMuIEl0IGFs
bG93cwo+IGRlc2NyaWJpbmcgY2xlYW5seSBVLUJvb3QsIGl0cyBlbnYgZGF0YSBhbmQgdmFyaWFi
bGVzLiBJdCB0ZWxscwo+IG9wZXJhdGluZyBzeXN0ZW0gYWJvdXQgQnJvYWRjb20tc3BlY2lmaWMg
ZW52IGRhdGEgc28gaXQgY2FuIHBhcnNlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBWMjogV29yayBvbiBiZXR0ZXIgY29t
bWl0IGJvZHkgJiBhZGQgZXhhbXBsZQo+IFYzOiBBdm9pZCBkdXBsaWNhdGVkICJtYWMiIGxhYmVs
Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCB8
IDIxICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KykKPiAKCkFwcGxpZWQsIHRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
