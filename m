Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21766C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 13:32:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D760B60E8C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 13:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D760B60E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhtAOmvyG7qnGGUVINfkqrcF8aTMeRoaswjoux38OEY=; b=YrOMdi6V3Pvoyb
	bnRNXylu9fJLJrQ9OSAV/+3nAD6XZORifunTZ7pJCuGTyo2DrzLZ185msEsRNaYKoxdpxPSL8mvUi
	3/Aa9l1UJWjzwhUf/WymyOcVYTtgHiHtb1VoHQlkXbhM8AxEtY7KHfslPf1F13V528hjKnLW4vSuc
	r4+1S/CUmU+mcQMaleAr8iVZ6huBsSQcY6uE5GzEXjSExPff9vGKtMXaPqhjwVugFQAKdMFTwh5RU
	Rgd1s9Y/qmout1B7mDXEZugoaDrqJxrXW//6wcG1JDb9xL/ggnWVIMM5ilAbTKvsZZ9f1AZFYK94U
	y0WaTu3R1nDLW7kDRQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg5VA-007wqV-Nv; Thu, 28 Oct 2021 13:31:28 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg5V7-007wop-Es
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 13:31:27 +0000
Received: by mail-qv1-xf29.google.com with SMTP id c9so3684331qvm.5
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Vtcm+cVDOBMQDVtuIHnCW+Jxhn6Pk4wSFgRiWHBeVNY=;
 b=HO1OOsaSM0hufdukw2ilon9Xex9Jnv9qQ+IkBO+hVTz0fyLoFM0rnwnCdx84Zun6X6
 h15QuMuah7hHrp23BSPVXN7de8q581aTq3W2Z5uNyyts8fJzcPcRa1r+W8iBDhW/EK6f
 e7o6UpIWkOc6Hl6ls+zqgIHIPNRRUwU+o1lc15FrsCjbtjyuXQpTWIjhcqRquDi3/CtM
 zoFm+HxUbjFHIU8F6Gi4c1JHZlVZGvpCDdG4io4Chqn64NDEGwvFspPyNVHMSqnQ9JEi
 4Uw5M8eOLidcPorLFl1iRvJFkbxCZXk9IDoThkNk/dZQZvBJoagsMjEQv8hSaQk2Zi+o
 2J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Vtcm+cVDOBMQDVtuIHnCW+Jxhn6Pk4wSFgRiWHBeVNY=;
 b=N2z3poPb0gc8keVSz/5nm8TwihbZ5sBnOOaWA+RBEfZ3RlS+Y0+WmXkJhfy9tOs9DT
 2+TKxetXkqgyITTm+J2mWxGEk3881/RNDGWQy9m7CCmt/31tfwPhXt3rmRTXE1n7yvU3
 5DTpiiRk2APpvEeT+sT3OMgAnbzqIlopqpa97RBULfT7OhmM+Tdco5I/hwpjxE5jCt11
 Bj/i7IjkNvHXw+2I8vQQivcnhR01A++Lc/1UbDonDMHUcICzkOwllMLkDUhQW2UjhZ+B
 1vk9nzTe2BkVMTXmM/wy0nig+n+YCd1oHQggEZQiMAIHh2p9SwdLQNfxoDwP30ykLgVa
 euBA==
X-Gm-Message-State: AOAM531qGikSCDjqe2XOioH8buqvN3hKo2dXS/Z4avuL1BdZvZ0ixqXI
 XCkhM9wkAOeuHTR/9Aq8t9s=
X-Google-Smtp-Source: ABdhPJyUY18X671/2pSGXpXoiWAbPSpeqwbtTgratogff+hDZC0XPS6OUASRhTResJBtoQ+ZmGTj7w==
X-Received: by 2002:a05:6214:1786:: with SMTP id
 ct6mr4022776qvb.58.1635427882948; 
 Thu, 28 Oct 2021 06:31:22 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id bs33sm1955780qkb.130.2021.10.28.06.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:31:22 -0700 (PDT)
Date: Thu, 28 Oct 2021 09:31:19 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Ezequiel Garcia <ezequiel@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
Message-ID: <20211028133119.GA21237@localhost>
References: <20210801234509.18774-1-ezequiel@collabora.com>
 <20211026150350.GA5136@localhost>
 <876982414.38679.1635274892099.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <876982414.38679.1635274892099.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_063125_533236_A6FA5FEF 
X-CRM114-Status: GOOD (  27.95  )
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

T24gVHVlIDIwMjEtMTAtMjYgQCAwOTowMTozMiBQTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3Rl
Ogo+IFRyZXZvciwKPiAKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246
ICJUcmV2b3IgV29lcm5lciIgPHR3b2VybmVyQGdtYWlsLmNvbT4KPiA+IEFuOiAiRXplcXVpZWwg
R2FyY2lhIiA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiA+IENDOiAibGludXgtbXRkIiA8bGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz4sICJyaWNoYXJkIgo+ID4gPHJpY2hhcmRAbm9kLmF0PiwgIk1pcXVl
bCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFnaGF2ZW5k
cmEiIDx2aWduZXNockB0aS5jb20+Cj4gPiBHZXNlbmRldDogRGllbnN0YWcsIDI2LiBPa3RvYmVy
IDIwMjEgMTc6MDM6NTAKPiA+IEJldHJlZmY6IFJlOiBbUEFUQ0ggMC8zXSBtdGRibG9jazogQWR2
ZXJ0aXNlIGFib3V0IFVCSSBhbmQgVUJJIGJsb2NrCj4gCj4gPiBPbiBTdW4gMjAyMS0wOC0wMSBA
IDA4OjQ1OjAyIFBNLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6Cj4gPj4gSGkgUmljaGFyZCwgYW5k
IGV2ZXJ5b25lIGVsc2U6Cj4gPj4gCj4gPj4gQnJvd3NpbmcgdGhlIGludGVybmV0IGZvciAiSkZG
UzIgbXRkIiByZXN1bHRzIGluIHR1dG9yaWFscywgYXJ0aWNsZXMKPiA+PiBhbmQgZ2l0aHViLmdp
c3RzMCB0aGF0IHBvaW50IHRvIG10ZGJsb2NrLgo+ID4+IAo+ID4+IEluIGZhY3QsIGV2ZW4gdGhl
IE1URCB3aWtpIG1lbnRpb25zIHRoYXQgSkZGUzIKPiA+PiBuZWVkcyBtdGRibG9jayB0byBtb3Vu
dCBhIHJvb3RmczoKPiA+PiAKPiA+PiAgIGh0dHA6Ly93d3cubGludXgtbXRkLmluZnJhZGVhZC5v
cmcvZmFxL2pmZnMyLmh0bWwKPiA+PiAKPiA+PiBNb3Jlb3ZlciwgSSBzdXNwZWN0IHRoZXJlIG1h
eSBiZSBsb3RzIG9mIHVzZXJzCj4gPj4gdGhhdCBzdGlsbCBiZWxpZXZlIG10ZGJsb2NrIGlzIHNv
bWVob3cgbmVlZGVkIHRvCj4gPj4gbW91bnQgU3F1YXNoRlMuCj4gPj4gCj4gPj4gSSd2ZSB0YWtl
biBhIHZlcmJvc2Ugcm91dGUgYW5kIGFkZGVkIGEgcHJfd2Fybgo+ID4+IHdhcm5pbmcgaWYgdGhl
IGRldmljZXMgYXJlIE5BTkQuIEkgZG9uJ3QgdGhpbmsgdXNpbmcKPiA+PiBOQU5EIHdpdGhvdXQg
VUJJIGlzIHRvbyB3aXNlLCBhbmQgZ2l2ZW4gdGhlIGFtb3VudAo+ID4+IG9mIG91dGRhdGVkIHR1
dG9yaWFscyBJIGJlbGlldmUgc29tZSBhZHZlcnRpc2luZwo+ID4+IHdpbGwgaGVscC4KPiA+IAo+
ID4gTm90IGFsbCBOQU5EIHBhcnRpdGlvbnMgb24gYSBkZXZpY2Ugd2lsbCBjb250YWluIGxpbnV4
IHJvb3QgZmlsZXN5c3RlbXMuIEZvciBhCj4gPiBsaW51eCByb290IGZpbGVzeXN0ZW0gcGVyaGFw
cyB1c2luZyBVQkkvVUJJRlMgaXMgcHJlZmVycmVkLCB5ZXQgdGhlc2UgbWVzc2FnZXMKPiA+IHBy
aW50IG91dCBmb3IgZWFjaCBhbmQgZXZlcnkgTkFORCBwYXJ0aXRpb246Cj4gPiAKPiA+CVsgICAg
MC45MDA4MjddIENyZWF0aW5nIDggTVREIHBhcnRpdGlvbnMgb24gIm54cF9scGMzMjIwX3NsYyI6
Cj4gPglbICAgIDAuOTA2NDMxXSAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDAyMDAwMCA6ICJib290
cm9tIgo+ID4JWyAgICAwLjkxMzUyM10gbXRkYmxvY2s6IE1URCBkZXZpY2UgJ2Jvb3Ryb20nIGlz
IE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkKPiA+CWJsb2NrIGRldmljZXMgaW5zdGVh
ZC4KPiA+CVsgICAgMC45MzMzMzRdIDB4MDAwMDAwMDIwMDAwLTB4MDAwMDAwMDgwMDAwIDogInVi
b290Igo+ID4JWyAgICAwLjk0MDQzOV0gbXRkYmxvY2s6IE1URCBkZXZpY2UgJ3Vib290JyBpcyBO
QU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJCj4gPglibG9jayBkZXZpY2VzIGluc3RlYWQu
Cj4gPglbICAgIDAuOTYzMzIyXSAweDAwMDAwMDA4MDAwMC0weDAwMDAwMDQ0MDAwMCA6ICJmYmtl
cm5lbCIKPiA+CVsgICAgMC45NzA2NTVdIG10ZGJsb2NrOiBNVEQgZGV2aWNlICdmYmtlcm5lbCcg
aXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nCj4gPglVQkkgYmxvY2sgZGV2aWNlcyBpbnN0
ZWFkLgo+ID4JWyAgICAwLjk5MzM2MV0gMHgwMDAwMDA0NDAwMDAtMHgwMDAwMDA5MjAwMDAgOiAi
ZmJyb290ZnMiCj4gPglbICAgIDEuMDAwNzI1XSBtdGRibG9jazogTVREIGRldmljZSAnZmJyb290
ZnMnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZwo+ID4JVUJJIGJsb2NrIGRldmljZXMg
aW5zdGVhZC4KPiA+CVsgICAgMS4wMjMzMTVdIDB4MDAwMDAwOTIwMDAwLTB4MDAwMDAwY2UwMDAw
IDogImNfa2VybmVsIgo+ID4JWyAgICAxLjAzMDcyMl0gbXRkYmxvY2s6IE1URCBkZXZpY2UgJ2Nf
a2VybmVsJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcKPiA+CVVCSSBibG9jayBkZXZp
Y2VzIGluc3RlYWQuCj4gPglbICAgIDEuMDUzNDQ0XSAweDAwMDAwMGNlMDAwMC0weDAwMDAwMGQw
MDAwMCA6ICJjX19hdGFncyIKPiA+CVsgICAgMS4wNjA3NDJdIG10ZGJsb2NrOiBNVEQgZGV2aWNl
ICdjX19hdGFncycgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nCj4gPglVQkkgYmxvY2sg
ZGV2aWNlcyBpbnN0ZWFkLgo+ID4JWyAgICAxLjA4MzM0OV0gMHgwMDAwMDBkMDAwMDAtMHgwMDAw
MDEwMDAwMDAgOiAiY19yb290ZnMiCj4gPglbICAgIDEuMDkwNzAyXSBtdGRibG9jazogTVREIGRl
dmljZSAnY19yb290ZnMnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZwo+ID4JVUJJIGJs
b2NrIGRldmljZXMgaW5zdGVhZC4KPiA+CVsgICAgMS4xMTMzMzVdIDB4MDAwMDAxMDAwMDAwLTB4
MDAwMDIwMDAwMDAwIDogIm1lbmRlciIKPiA+CVsgICAgMS4xMzE2MjddIG10ZGJsb2NrOiBNVEQg
ZGV2aWNlICdtZW5kZXInIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkKPiA+CWJs
b2NrIGRldmljZXMgaW5zdGVhZC4KPiA+IAo+ID4gTkFORCB0ZW5kcyB0byBiZSBzb21ldGhpbmcg
Zm91bmQgb24gb2xkZXIgZGV2aWNlcywgdGhlIGZpcm13YXJlL2Jvb3Rsb2FkZXJzCj4gPiBvZiBv
bGRlciBkZXZpY2VzIGNvdWxkbid0IHBvc3NpYmx5IHVuZGVyc3RhbmQgVUJJL1VCSUZTIHNvIG1h
bnkgb2YgdGhlc2UKPiA+IHBhcnRpdGlvbnMgbmVlZCBiZSAicmF3IiBwYXJ0aXRpb25zLCBvciB1
c2Ugc29tZXRoaW5nIHRoYXQgcHJlZGF0ZXMgVUJJLgo+ID4gCj4gPiBJcm9uaWNhbGx5IG15ICJt
ZW5kZXIiIHBhcnRpdGlvbiBjb250YWlucyBhIFVCSSAod2l0aCBtdWx0aXBsZSBVQklGU2VzIGlu
c2lkZSkKPiA+IHlldCBJIGdvdCB0aGUgc2FtZSAicGxlYXNlIHVzZSBVQkkiIG1lc3NhZ2UgYXMg
YWxsIHRoZSBvdGhlcnMgKGxvbCkKPiA+IAo+ID4gSSdtIHNwZWNpZnlpbmcgbXkgcGFydGl0aW9u
cyBpbiBEVCB3aXRoOgo+ID4gCj4gPiBwYXJ0aXRpb25zIHsKPiA+ICAgICAgICBjb21wYXRpYmxl
ID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
ID4gICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gCj4gPiAgICAgICAgbXRkMEAwICAgICAg
IHsgbGFiZWwgPSAiYm9vdHJvbSI7ICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAyMDAwMD47IH07
Cj4gPiAgICAgICAgbXRkMUAyMDAwMCAgIHsgbGFiZWwgPSAidWJvb3QiOyAgICAgcmVnID0gPDB4
MDAwMjAwMDAgMHgwMDA2MDAwMD47IH07Cj4gPiAgICAgICAgbXRkMkA4MDAwMCAgIHsgbGFiZWwg
PSAiZmJrZXJuZWwiOyAgcmVnID0gPDB4MDAwODAwMDAgMHgwMDNjMDAwMD47IH07Cj4gPiAgICAg
ICAgbXRkM0A0NDAwMDAgIHsgbGFiZWwgPSAiZmJyb290ZnMiOyAgcmVnID0gPDB4MDA0NDAwMDAg
MHgwMDRlMDAwMD47IH07Cj4gPiAgICAgICAgbXRkNEA5MjAwMDAgIHsgbGFiZWwgPSAiY19rZXJu
ZWwiOyAgcmVnID0gPDB4MDA5MjAwMDAgMHgwMDNjMDAwMD47IH07Cj4gPiAgICAgICAgbXRkNUBj
ZTAwMDAgIHsgbGFiZWwgPSAiY19fYXRhZ3MiOyAgcmVnID0gPDB4MDBjZTAwMDAgMHgwMDAyMDAw
MD47IH07Cj4gPiAgICAgICAgbXRkNkBkMDAwMDAgIHsgbGFiZWwgPSAiY19yb290ZnMiOyAgcmVn
ID0gPDB4MDBkMDAwMDAgMHgwMDMwMDAwMD47IH07Cj4gPiAgICAgICAgbXRkN0AxMDAwMDAwIHsg
bGFiZWwgPSAibWVuZGVyIjsgICAgcmVnID0gPDB4MDEwMDAwMDAgMHgxZjAwMDAwMD47IH07Cj4g
PiB9Owo+ID4gCj4gPiB3aGljaCBpcyB3aHksIEkgYXNzdW1lLCBJJ20gZ2V0dGluZyB0aGVzZSBt
ZXNzYWdlcy4gSXMgdGhlcmUgYSBVQkktZnJpZW5kbHkKPiA+IHdheSB0byBkZWZpbmUgdGhlbSB0
byBhdm9pZCB0aGVzZSBtZXNzYWdlcz8KPiAKPiBIbW0sIG1heWJlIGl0IG1ha2VzIHNlbnNlIHRv
IGFkdmVydGlzZSBpdCBvbmx5IG9uY2UgYW5kIG5vdCBmb3IgZWFjaCBtdGRibG9jayBkZXZpY2Uu
CgpBcmUgdGhlcmUga25vd24gYnVncyBvciBpc3N1ZXMgdXNpbmcgdWJpL2pmZnMyL3NxdWFzaGZz
IG9uIHRvcCBvZiBtdGRibG9jaz8gSXMKbXRkYmxvY2sgYmVpbmcgZGVwcmVjYXRlZD8gSWYgc28g
SSBjb3VsZCBjZXJ0YWlubHkgdW5kZXJzdGFuZCB3YXJuaW5nIHVzZXJzIG9mCnRoZSBzaXR1YXRp
b24uCgpJcyB0aGVyZSBhIHNhZmUvZWFzeSB3YXkgdG8gdXBkYXRlIGFuIG9sZGVyIGRldmljZSBp
biBhIHdheSB0aGF0IHdpcGVzCnRoZSBlbnRpcmUgZmxhc2ggd2hpbGUgcnVubmluZyBmcm9tIGZs
YXNoPyBJZiBub3QgdGhlbiBoYXZpbmcgdGhlIGtlcm5lbApwZXJwZXR1YWxseSBhZHZlcnRpc2lu
ZyB0aGF0IEknbSBub3QgdXNpbmcgbXkgZmxhc2ggYSBjZXJ0YWluIHdheSBpc24ndCB2ZXJ5CnVz
ZWZ1bCwgZXNwZWNpYWxseSBpZiB0aGVyZSBhcmVuJ3QgYW55IHVuZGVybHlpbmcgcmVhc29ucyB3
aHkgbXkgdXNhZ2UgaXNuJ3QKdmFsaWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
