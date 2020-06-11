Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC82C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 16:04:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE64206A4
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 16:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="stRfe7sD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z92vUS4v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE64206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deurRTuO6Is61q9NWkZfISHAjJ30U3QK9shZce/ER8Q=; b=stRfe7sDwTbZL0
	dmge9BveGQF71iv/EFWwpRrn1V8TS4qzWq0wWu+3DaJC1OEAZClEA6TCBXcW0gq2XYtKYXHEbmeZt
	O11Uj75d99mSeES5InQmZbh0D3qYasHgQagdFcdIkL50BulRV/MLz0HZWVvU0LUaQUKQFOZoM1FF1
	x0DGudQqTXh+t+zrZJ2ou9MwKxJr2Fy4AF7K5rF/fZ0p8pIBvM+WWcDDJkNHlJbIpDdGJRwwbWRcQ
	yh8IYsGc9P8v/O02y9Y/Z5bKL4jrHfNOG4kP2ueb2VJYhlMQJ8x4N6JUCMD92RUBbq0swBTFlE/vY
	/g7ec1AUgrzl8j5tqVWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjPh5-00042R-No; Thu, 11 Jun 2020 16:04:43 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjPh2-000423-PQ
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 16:04:42 +0000
Received: by mail-il1-x144.google.com with SMTP id t8so5909785ilm.7
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2020 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6QgP2oZvpsF1JRXIhUxXLqPHdCzhLmzL7DYVCPQ3hw0=;
 b=Z92vUS4vJqNYB/xIUI4RTxkMavBjZ5p2banNf0tuWBsTQ2RVALs4G3AeMn2PRXYmxM
 byejBgZpMCIXuxlFac4UzWl/c03+RrLQqwDAoXdWMH+R32Mwm0N9Ulom8sMZVkVlgMIc
 N5+Ve6oMRWntAz2BOoc0sNz5if6nSuHBRk2opw79sUKNJuEQxEvYZ67zJGGXS92Zx+lA
 CU5F4LSfqFbr/yvXkQ0HdNG/imXtdrVasABo1CYCUWpkJQjCZejOt3DM/QTFgG1fE+2W
 9KwRyBB7MwMsp/ykJUmTDyoK3SDf7o6mpwZHNOmXnDVOeavS6cb4O1wp8BO4jC0bxm66
 dL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6QgP2oZvpsF1JRXIhUxXLqPHdCzhLmzL7DYVCPQ3hw0=;
 b=IlMhvDhHKxE+zEa30pj3PIAVdrK9hFNEH2HBTxKp/wHO4fyHim8rXIHV2zb/okW/Aj
 E/gJmx+P6YXgQfslT/zBswPt4g3qflfM/daQyYUnH54f3zPXYI7ZjeycHeE6yo3oZitD
 o/hhst+M0+eYJVtmwJ4CkZccRmvcJ7cn/5W9QAy0bvIWV1Iap5Uy7tiz8kRi2STpCiYC
 nj7faILO2d2UPzGZR1YFrtlmUZqN9FEO74wp9TDRVXt11qU7maq7j2CgkT64hbTtTIp2
 fRTbcByP8vzYnrAFjCq1Zm7jzraem8E3BksUgD0MNojSTnt7+ZJRnT89HHltSr89dcCG
 QUdw==
X-Gm-Message-State: AOAM532dOUi9c2ZA5i3SXcvOH3DdE5JsQDyXPqIARiZP0uJNxgbVe5qj
 oeX2Bp2NQa2ychAkcH9MrzG1/pLxe9rSlzOV8LY=
X-Google-Smtp-Source: ABdhPJwteAWxdqw7GZDJTzA0giSI51iE1i/CVhjwKS3MqtkEaZp5HCakg/gy0hay4aj96XJDCTiGE/Zvzy9KNn1zyMI=
X-Received: by 2002:a92:c94b:: with SMTP id i11mr9053840ilq.177.1591891480001; 
 Thu, 11 Jun 2020 09:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
 <20200611054454.2547-2-kdasu.kdev@gmail.com>
 <20200611092707.75da8c6a@xps13>
In-Reply-To: <20200611092707.75da8c6a@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Thu, 11 Jun 2020 12:04:29 -0400
Message-ID: <CAC=U0a3RXScu12LkU+hCv_5Lp_he92ExRFSgqLkwx40D6Xtrag@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: Ecc error handling on EDU
 transfers
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_090440_828669_6E6146DE 
X-CRM114-Status: GOOD (  28.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMzoyNyBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEthbWFsLAo+Cj4gS2FtYWwgRGFzdSA8a2Rh
c3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9uIFRodSwgMTEgSnVuIDIwMjAgMDE6NDQ6NTQKPiAt
MDQwMDoKPgo+ID4gSW1wbGVtZW50ZWQgRUNDIGNvcnJlY3RhYmxlIGFuZCB1bmNvcnJlY3RhYmxl
IGVycm9yIGhhbmRsaW5nIGZvciBFRFUKPgo+IEltcGxlbWVudD8KPgo+ID4gcmVhZHMuIElmIEVD
QyBjb3JyZWN0YWJsZSBiaXRmbGlwcyBhcmUgZW5jb3VudGVyZWQgIG9uIEVEVSB0cmFuc2ZlciwK
Pgo+IGV4dHJhIHNwYWNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
Cj4KPiA+IHJlYWQgcGFnZSBhZ2FpbiB1c2luZyBwaW8sIFRoaXMgaXMgbmVlZGVkIGR1ZSB0byBh
IGNvbnRyb2xsZXIgbG1pdGF0aW9uCj4KPiBzL3Bpby9QSU8vCj4KPiA+IHdoZXJlIHJlYWQgYW5k
IGNvcnJlY3RlZCBkYXRhIGlzIG5vdCB0cmFuc2ZlcnJlZCB0byB0aGUgRE1BIGJ1ZmZlciBvbiBF
Q0MKPiA+IGVycm9ycy4gVGhpcyBob2xkcyB0cnVlIGZvciBFQ0MgY29ycmVjdGFibGUgZXJyb3Jz
IGJleW9uZCBzZXQgdGhyZXNob2xkLgo+Cj4gZXJyb3IuCj4KPiBOb3Qgc3VyZSB3aGF0IHRoZSBs
YXN0IHNlbnRlbmNlIG1lYW5zPwo+CgpOQU5EIGNvbnRyb2xsZXIgYWxsb3dzIGZvciBzZXR0aW5n
IGEgY29ycmVjdGFibGUgIEVDQyB0aHJlc2hvbGQgbnVtYmVyCm9mIGJpdHMgYmV5b25kIHdoaWNo
IGl0IHdpbGwgYWN0dWFsbHkgcmVwb3J0IHRoZSBlcnJvciB0byB0aGUgZHJpdmVyLgplLmcuIGZv
ciBCQ0gtNCB0aGUgdGhyZXNob2xkIGlzIDMsIHNvIDMtYml0IGFuZCA0LWJpdCBlcnJvcnMgd2ls
bApnZW5lcmF0ZSBjb3JyZWN0YWJsZSBFQ0MgaW50ZXJydXB0IGhvd2V2ZXIgMS1iaXQgYW5kIDIt
Yml0IGVycm9ycyB3aWxsCmJlIGNvcnJlY3RlZCBzaWxlbnRseS4KRnJvbSB0aGUgYWJvdmUgZXhh
bXBsZSBFRFUgaGFyZHdhcmUgd2lsbCBub3QgdHJhbnNmZXIgY29ycmVjdGVkIGRhdGEKdG8gdGhl
IERNQSBidWZmZXIgZm9yIDMtYml0IGFuZCA0LWJpdCBlcnJvcnMgdGhhdCBnZXQgcmVwb3J0ZWQu
IFNvCm9uY2Ugd2UgZGV0ZWN0CnRoZSBlcnJvciBkdWluZyBFRFUgd2UgcmVhZCB0aGUgcGFnZSBh
Z2FpbiB1c2luZyBwaW8uCgo+ID4KPiA+IEZpeGVzOiBhNWQ1M2FkMjZhOGIgKCJtdGQ6IHJhd25h
bmQ6IGJyY21uYW5kOiBBZGQgc3VwcG9ydCBmb3IgZmxhc2gtZWR1IGZvciBkbWEgdHJhbnNmZXJz
IikKPiA+IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29tPgo+
ID4gLS0tCj4KPiBNaW5vciBuaXRzIGJlbG93IDopCj4KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+IGluZGV4IDBjMWQ2ZTU0MzU4Ni4uZDdkYWE4M2M4
YTU4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+
ID4gQEAgLTE4NTUsNiArMTg1NSwyMiBAQCBzdGF0aWMgaW50IGJyY21uYW5kX2VkdV90cmFucyhz
dHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCwgdTY0IGFkZHIsIHUzMiAqYnVmLAo+ID4gICAgICAg
ZWR1X3dyaXRlbChjdHJsLCBFRFVfU1RPUCwgMCk7IC8qIGZvcmNlIHN0b3AgKi8KPiA+ICAgICAg
IGVkdV9yZWFkbChjdHJsLCBFRFVfU1RPUCk7Cj4gPgo+ID4gKyAgICAgaWYgKHJldCA9PSAwICYm
IGVkdV9jbWQgPT0gRURVX0NNRF9SRUFEKSB7Cj4KPiAhcmV0Cj4KPiA+ICsgICAgICAgICAgICAg
dTY0IGVycl9hZGRyID0gMDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAg
ICAgICAgICogY2hlY2sgZm9yIGVjYyBlcnJvcnMgaGVyZSwgc3VicGFnZSBlY2MgZXJyb3MgYXJl
Cj4gPiArICAgICAgICAgICAgICAqIHJldGFpbmVkIGluIGVjYyBlcnJvciBhZGRyIHJlZ2lzdGVy
Cj4KPiBzL2VjYy9FQ0MvCj4gcy9lcnJvcy9lcnJvcnMvCj4gcy9hZGRyL2FkZHJlc3MvCj4KPiA+
ICsgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIGVycl9hZGRyID0gYnJjbW5hbmRf
Z2V0X3VuY29ycmVjY19hZGRyKGN0cmwpOwo+ID4gKyAgICAgICAgICAgICBpZiAoIWVycl9hZGRy
KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZXJyX2FkZHIgPSBicmNtbmFuZF9nZXRfY29y
cmVjY19hZGRyKGN0cmwpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChlcnJfYWRkcikK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FVUNMRUFOOwo+ID4gKyAg
ICAgICAgICAgICB9IGVsc2UKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUJBRE1T
RzsKPgo+IEkgZG9uJ3QgbGlrZSB2ZXJ5IG11Y2ggdG8gc2VlIHRoZXNlIHZhbHVlcyBiZWluZyB1
c2VkIHdpdGhpbiBOQU5ECj4gY29udHJvbGxlciBkcml2ZXJzIGJ1dCBJIHNlZSBpdCdzIGFscmVh
ZHkgdGhlIGNhdXNlLCBzbyBJIGd1ZXNzIEkgY2FuCj4gbGl2ZSB3aXRoIHRoYXQuCj4KPiA+ICsg
ICAgIH0KPiA+ICsKPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4KPiA+IEBAIC0yMDU4
LDYgKzIwNzQsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JlYWQoc3RydWN0IG10ZF9pbmZvICpt
dGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgICAgICB1NjQgZXJyX2FkZHIgPSAwOwo+
ID4gICAgICAgaW50IGVycjsKPiA+ICAgICAgIGJvb2wgcmV0cnkgPSB0cnVlOwo+ID4gKyAgICAg
Ym9vbCBlZHVfcmVhZCA9IGZhbHNlOwo+ID4KPiA+ICAgICAgIGRldl9kYmcoY3RybC0+ZGV2LCAi
cmVhZCAlbGx4IC0+ICVwXG4iLCAodW5zaWduZWQgbG9uZyBsb25nKWFkZHIsIGJ1Zik7Cj4gPgo+
ID4gQEAgLTIwNzUsNiArMjA5MiwxMCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JlYWQoc3RydWN0
IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU87Cj4gPiAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKGhhc19l
ZHUoY3RybCkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgZWR1X3JlYWQgPSB0cnVlOwo+Cj4g
WW91IGRvbid0IG5lZWQgdGhpcyBleHRyYSB2YWx1ZSwgeW91IGFscmVhZHkgaGF2ZSB0aGUgY21k
IHBhcmFtZXRlcgo+IHdoaWNoIHRlbGxzIHlvdSBpZiBpdCBpcyBhIHJlYWQgb3IgYSB3cml0ZS4g
WW91IG1pZ2h0IGV2ZW4gd2FudCB0bwo+IGNyZWF0ZSBhIGlmIGJsb2NrIHNvIHNldCBkaXIgYW5k
IGVkdV9jbWQgYW5kIGV2ZW50dWFsbHkgYSBsb2NhbAo+IGVkdV9yZWFkIGlmIHlvdSB0aGluayBp
dCBzdGlsbCBtYWtlcyBzZW5zZS4KPgoKSSBuZWVkZWQgdGhlIHZhbHVlIHNpbmNlIGRtYSBhbmQg
ZWR1IHJlYWQgaGFzIG11bHRpcGxlIGNvbmRpdGlvbnMgbGlrZQpvb2IgaXMgbm90IGluY2x1ZGVk
LCBidWZmZXIgaXMgYWxpZ25lZCwgdmlydHVhbCBhZGRyZXNzIGlzIGdvb2QuIFRoaXMKaW5kaWNh
dGVzIHRvCnRoZSBpZiAobXRkX2lzX2JpdGZsaXAoZXJyKSkgIGJsb2NrIHRoYXQgdGhlIGVycm9y
IHdhcyBmcm9tIGFuIGVkdQp0cmFuc2FjdGlvbiB0aGF0IGhhcHBlbmVkLlRoaXMgd2F5IGFsbCBl
Y2MgZXJyb3IgaGFuZGxpbmcgZm9yIGRtYSwKZWR1LCBwaW8gaXMgaW4gb25lIHBsYWNlLgpBbHNv
IHRoZXJlIGlzIG1vcmUgY29udHJvbGxlciB2ZXJzaW9uIHNwZWNpZmljIGxvZ2ljIGZvciByZWFk
IGVycm9yCmhhbmRsaW5nIGluIHRoZXJlIGFuZCB0aGlzIGFsbG93cyB1cyB0byBtYWludGFpbiB0
aGUgaGllcmFyY2h5IGhvdyB3ZQpoYW5kbGUgYm90aCBjb3JyZWN0YWJsZQphbmQgdW5jb3JyZWN0
YWJsZSBlcnJvci4KCj4gPiArCj4gPiAgICAgICB9IGVsc2Ugewo+ID4gICAgICAgICAgICAgICBp
ZiAob29iKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1lbXNldChvb2IsIDB4OTksIG10ZC0+
b29ic2l6ZSk7Cj4gPiBAQCAtMjEyMiw2ICsyMTQzLDExIEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRf
cmVhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiA+ICAg
ICAgIGlmIChtdGRfaXNfYml0ZmxpcChlcnIpKSB7Cj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBjb3JyZWN0ZWQgPSBicmNtbmFuZF9jb3VudF9jb3JyZWN0ZWQoY3RybCk7Cj4gPgo+ID4g
KyAgICAgICAgICAgICAvKiBpbiBjYXNlIG9mIGVkdSBjb3JyZWN0YWJsZSBlcnJvciB3ZSByZWFk
IGFnYWluIHVzaW5nIHBpbyAqLwo+Cj4gcy9lZHUvRURVLyA/Cj4gcy9waW8vUElPLwo+Cj4gPiAr
ICAgICAgICAgICAgIGlmIChlZHVfcmVhZCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBlcnIg
PSBicmNtbmFuZF9yZWFkX2J5X3BpbyhtdGQsIGNoaXAsIGFkZHIsIHRyYW5zLCBidWYsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb29iLCAmZXJy
X2FkZHIpOwo+ID4gKwo+ID4gICAgICAgICAgICAgICBkZXZfZGJnKGN0cmwtPmRldiwgImNvcnJl
Y3RlZCBlcnJvciBhdCAweCVsbHhcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgKHVuc2ln
bmVkIGxvbmcgbG9uZyllcnJfYWRkcik7Cj4gPiAgICAgICAgICAgICAgIG10ZC0+ZWNjX3N0YXRz
LmNvcnJlY3RlZCArPSBjb3JyZWN0ZWQ7Cj4KCldpbGwgZml4IGFsbCB0aGUgb3RoZXIgdHlwb3Mu
Cgo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MKS2FtYWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
