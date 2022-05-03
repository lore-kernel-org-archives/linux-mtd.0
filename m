Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56128C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNACZsWcRTfJ/g8nBLZr32VFf87GHcLat7lF3Q6cECQ=; b=FKDHhU0vdYgrEe
	qBIPRnQdeDEEyDmpJ0bpHU8b3r1GkFNOiI4gjgteTrkPmUh4g4yeBUQhEA2KiLV1qVoj5vtCPBmty
	0QzRDCjO3RqUTusMGPs9l4CcnTE77McMoc6/hFPlmdnHMi8zXWwoDw819tX30DxlBGN2hQJjHJcXN
	6qns4cE68ZIB7kNCSJlHtSM6xIEpvI/kCjAcakKlVIk2sw+9fALxcRLTT1XPY0z1l9pY/oFgVSRdA
	f/xYxEbv4rmx96YHebRVEPOSSbRqKulA6Hib1proKRxb/FywaCjkoOgOinQkK2FZvoaAVw+NlHChp
	NAqjGFMGVYQrhr28CZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlwjt-0075sU-Ku; Tue, 03 May 2022 17:55:09 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlwjr-0075rx-0s; Tue, 03 May 2022 17:55:08 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so9061559oty.3; 
 Tue, 03 May 2022 10:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZZo2FBQdHNqH/5Ul07nNend7TJWI/BleYJWuwRpwI2E=;
 b=ReIOChd5merNr0QjpXQbU0SH7BZ/J2mjNmK7LL4VnhaIjyHvKShclZVZgNjbDBT31V
 SXSmXPpHmP+mKYrc/nOjWfGR4Fwvj8xfzXkm4btuw3I4raUnIEN1KD8/0+j5SBTdAgup
 3dRIEVXBlzCTxZr8VrLlBRlAPR14Oo//HfyfaTfIXqjP9bO3jsOqjBKx+l5oGFGIvv8n
 Jm4MsuIfLcv3XY5HdSgqp3gefe/RABQOpXlFv3btBFJ71aairfYNuXeO2FHClsHQf5FP
 NJVh4QHeFnW73Pa2fUe/49kQpgP6b8rkohf2Td3xSQM8YlM3Nq2t7aJDTcj89oIy+lo7
 3v3Q==
X-Gm-Message-State: AOAM5334IHYx5ZTzTkcTx5didVePbE8SEk2bMP8xVDXRv70bRAP7jg8S
 zEWwesVtAo5oHzqNxlP9ZA==
X-Google-Smtp-Source: ABdhPJwdaRnHFUgHPlJemaTsR7uzxfoyu0Qkat2ke0I3c1OwbntDBxhxcWdOIlhaLbPBYWN8g4E+xg==
X-Received: by 2002:a9d:6c93:0:b0:605:d7a8:7930 with SMTP id
 c19-20020a9d6c93000000b00605d7a87930mr6294448otr.254.1651600505622; 
 Tue, 03 May 2022 10:55:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056870e50300b000e686d13884sm130797oag.30.2022.05.03.10.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:55:05 -0700 (PDT)
Received: (nullmailer pid 3955241 invoked by uid 1000);
 Tue, 03 May 2022 17:55:04 -0000
Date: Tue, 3 May 2022 12:55:04 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Ren <rentao.bupt@gmail.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: [PATCH v6 03/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
Message-ID: <YnFseFBfe5eaIqg0@robh.at.kernel.org>
References: <20220503060634.122722-1-clg@kaod.org>
 <20220503060634.122722-4-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503060634.122722-4-clg@kaod.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_105507_106313_1B43E446 
X-CRM114-Status: GOOD (  24.73  )
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

T24gVHVlLCBNYXkgMDMsIDIwMjIgYXQgMDg6MDY6MjZBTSArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0
ZXIgd3JvdGU6Cj4gVGhpcyBTUEkgZHJpdmVyIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBz
dGF0aWMgbWVtb3J5IGNvbnRyb2xsZXJzCj4gb2YgdGhlIEFTVDI2MDAsIEFTVDI1MDAgYW5kIEFT
VDI0MDAgU29DcyB1c2luZyB0aGUgc3BpLW1lbSBpbnRlcmZhY2UuCj4gCj4gICogQVNUMjYwMCBG
aXJtd2FyZSBTUEkgTWVtb3J5IENvbnRyb2xsZXIgKEZNQykKPiAgICAuIEJNQyBmaXJtd2FyZQo+
ICAgIC4gMyBjaGlwIHNlbGVjdCBwaW5zIChDRTAgfiBDRTIpCj4gICAgLiBPbmx5IHN1cHBvcnRz
IFNQSSB0eXBlIGZsYXNoIG1lbW9yeQo+ICAgIC4gZGlmZmVyZW50IHNlZ21lbnQgcmVnaXN0ZXIg
aW50ZXJmYWNlCj4gICAgLiBzaW5nbGUsIGR1YWwgYW5kIHF1YWQgbW9kZS4KPiAKPiAgKiBBU1Qy
NjAwIFNQSSBGbGFzaCBDb250cm9sbGVyIChTUEkxIGFuZCBTUEkyKQo+ICAgIC4gaG9zdCBmaXJt
d2FyZQo+ICAgIC4gMiBjaGlwIHNlbGVjdCBwaW5zIChDRTAgfiBDRTEpCj4gICAgLiBkaWZmZXJl
bnQgc2VnbWVudCByZWdpc3RlciBpbnRlcmZhY2UKPiAgICAuIHNpbmdsZSwgZHVhbCBhbmQgcXVh
ZCBtb2RlLgo+IAo+ICAqIEFTVDI1MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9sbGVyIChG
TUMpCj4gICAgLiBCTUMgZmlybXdhcmUKPiAgICAuIDMgY2hpcCBzZWxlY3QgcGlucyAoQ0UwIH4g
Q0UyKQo+ICAgIC4gc3VwcG9ydHMgU1BJIHR5cGUgZmxhc2ggbWVtb3J5IChDRTAtQ0UxKQo+ICAg
IC4gQ0UyIGNhbiBiZSBvZiBOT1IgdHlwZSBmbGFzaCBidXQgdGhpcyBpcyBub3Qgc3VwcG9ydGVk
IGJ5IHRoZSBkcml2ZXIKPiAgICAuIHNpbmdsZSwgZHVhbCBtb2RlLgo+IAo+ICAqIEFTVDI1MDAg
U1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCj4gICAgLiBob3N0IGZpcm13YXJl
Cj4gICAgLiAyIGNoaXAgc2VsZWN0IHBpbnMgKENFMCB+IENFMSkKPiAgICAuIHNpbmdsZSwgZHVh
bCBtb2RlLgo+IAo+ICAqIEFTVDI0MDAgTmV3IFN0YXRpYyBNZW1vcnkgQ29udHJvbGxlciAoYWxz
byByZWZlcnJlZCBhcyBGTUMpCj4gICAgLiBCTUMgZmlybXdhcmUKPiAgICAuIE5ldyByZWdpc3Rl
ciBzZXQKPiAgICAuIDUgY2hpcCBzZWxlY3QgcGlucyAoQ0UwIOKIvCBDRTQpCj4gICAgLiBzdXBw
b3J0cyBOT1IgZmxhc2gsIE5BTkQgZmxhc2ggYW5kIFNQSSBmbGFzaCBtZW1vcnkuCj4gICAgLiBz
aW5nbGUsIGR1YWwgYW5kIHF1YWQgbW9kZS4KPiAKPiBFYWNoIGNvbnRyb2xsZXIgaGFzIGEgbWVt
b3J5IHJhbmdlIG9uIHdoaWNoIGZsYXNoIGRldmljZXMgY29udGVudHMgYXJlCj4gbWFwcGVkLiBF
YWNoIGRldmljZSBpcyBhc3NpZ25lZCBhIHdpbmRvdyB0aGF0IGNhbiBiZSBjaGFuZ2VkIGF0IGJv
b3RpbWUKPiB3aXRoIHRoZSBTZWdtZW50IEFkZHJlc3MgUmVnaXN0ZXJzLgo+IAo+IEVhY2ggU1BJ
IGZsYXNoIGRldmljZSBjYW4gdGhlbiBiZSBhY2Nlc3NlZCBpbiB0d28gbW9kZXM6IENvbW1hbmQg
YW5kCj4gVXNlci4gV2hlbiBpbiBVc2VyIG1vZGUsIFNQSSB0cmFuc2ZlcnMgYXJlIGluaXRpYXRl
ZCB3aXRoIGFjY2Vzc2VzIHRvCj4gdGhlIG1lbW9yeSBzZWdtZW50IG9mIGEgZGV2aWNlLiBXaGVu
IGluIENvbW1hbmQgbW9kZSwgbWVtb3J5Cj4gb3BlcmF0aW9ucyBvbiB0aGUgbWVtb3J5IHNlZ21l
bnQgb2YgYSBkZXZpY2UgZ2VuZXJhdGUgU1BJIGNvbW1hbmRzCj4gYXV0b21hdGljYWxseSB1c2lu
ZyBhIENvbnRyb2wgUmVnaXN0ZXIgZm9yIHRoZSBzZXR0aW5ncy4KPiAKPiBUaGlzIGluaXRpYWwg
cGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBVc2VyIG1vZGUuIENvbW1hbmQgbW9kZSBuZWVkcyBhIGxp
dHRsZQo+IG1vcmUgd29yayB0byBjaGVjayB0aGF0IHRoZSBtZW1vcnkgd2luZG93IG9uIHRoZSBB
SEIgYnVzIGZpdHMgdGhlIGRldmljZQo+IHNpemUuIEl0IHdpbGwgY29tZSBsYXRlciB3aGVuIHN1
cHBvcnQgZm9yIGRpcmVjdCBtYXBwaW5nIGlzIGFkZGVkLgo+IAo+IFNpbmdsZSBhbmQgZHVhbCBt
b2RlIFJYIHRyYW5zZmVycyBhcmUgc3VwcG9ydGVkLiBPdGhlciB0eXBlcyB0aGFuIFNQSQo+IGFy
ZSBub3Qgc3VwcG9ydGVkLgo+IAo+IFJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1Pgo+IFRlc3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiBUZXN0
ZWQtYnk6IFRhbyBSZW4gPHJlbnRhby5idXB0QGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IEphZSBI
eXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoaW4t
VGluZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvc3Bp
LW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMgIHwgOTIxIC0tLS0tLS0tLS0tLS0tLS0tLQo+
ICBkcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jICAgICAgICAgICAgICAgICAgfCA3MTcgKysr
KysrKysrKysrKysKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FzcGVlZC1zbWMudHh0
ICAgIHwgIDUxIC0KClRoaXMgYmVsb25ncyB3aXRoIHRoZSBiaW5kaW5nIHBhdGNoLiBCdXQgdGhl
biBpdCBpcyBjb252ZXJ0aW5nIHJhdGhlciAKdGhhbiBhZGRpbmcgYSBiaW5kaW5nLiBZb3Ugc2hv
dWxkIGJlIGNvbnZlcnRpbmcgdGhlIGJpbmRpbmcgYW5kIHRoZW4gCmFkZGluZyB0byBpdCAobGlr
ZSBhZGRpbmcgMjYwMCBzdXBwb3J0KS4KCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvS2NvbmZpZyAgICAgICB8ICAxMCAtCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvTWFrZWZpbGUgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvc3BpL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMSArCj4gIGRyaXZlcnMvc3BpL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIDggZmlsZXMgY2hhbmdlZCwgNzMwIGluc2VydGlv
bnMoKyksIDk4MyBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRk
L3NwaS1ub3IvY29udHJvbGxlcnMvYXNwZWVkLXNtYy5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FzcGVlZC1zbWMudHh0CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
