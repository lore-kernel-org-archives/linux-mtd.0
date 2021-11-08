Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0295EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 11:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7D560E8B
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 11:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD7D560E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BC1t17IrGwuAY/YvXHLa6OThoXK+3macAniCl0TzI1g=; b=3mI0YMmpL8jBeq
	K6moTLV+MmS1B1yqVwAvEGtItw+yW72ujYrc0mQTID6oKMrunY+KJ82PPpW7Y4J1gNKNhBO3eytd4
	YlA3We9YCJiJOn88DostozgMqYTQrcWYUqwuZjSGGTjlfuygvqElcuLMZ6KgMSckDSOrvo3jce0bW
	hpWRGCXf2J4lRlXuhXCeNFSPhAhqtyRPRXUBcb6bR56Vc5zaWSRDXeD7VJ9RoZN0dBlBd34RaCcNG
	+TpnqFnsnovn2zzO/pOP3R4hkX3UgNB4rKxax6LZ/gdQ3+p8sd4wKhJpsKM/mafWGKmgP5/kha4jv
	xjch9kyiEH+a2j2CP3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk2of-00GHmN-1Y; Mon, 08 Nov 2021 11:27:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk2oc-00GHlr-IQ
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 11:27:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id t30so26245266wra.10
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xVkvsEXoAtnCua5wtCXj6xBNGgctLW+5eOtfZn3AarU=;
 b=fzMPTlXSbDS6deEYHjAF4P5gzALLMMoWwvbb2glVOksWEnjA7qiKxEsU9cAHj+5rQ1
 Ac9LEe4C7Vqq8PP819CMJ9jlRaQ8oVhdSiv/ocrSIel/Q1WtCmMq/9tVqXuH4YpI6dbh
 nSs6teYPZhMHr3ebfmnjl2JgsCwMVJlC5kpOXrKAm1FIdCd6gN5jOWJLpArFx/ApDG4t
 O6g0n56QYRz036fQ8MGxcXt0t73WUROAba0KGAKBZMOpYTRGFOGbWZ+w3l+9ajNMhdAx
 v+oZzqDwUi2i7FRNoUROgUsolhk8rUTkrTl2Cd749MDe+KSMHwXjOjQQS9QpNbYxKw+6
 DE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xVkvsEXoAtnCua5wtCXj6xBNGgctLW+5eOtfZn3AarU=;
 b=kXRPGJVGAb0nNIED2oPJ0hR09BgAo+NMgSxmX7V4Zozme1Ljc3LR0jCZg88oEE9HcE
 He+Ao6AGYxVw+SRkw8IhMss+QKH7fPZWOBq/I6zMGJHlYhxO+Lyt+qagoHwIZYl0IMkG
 w98mJL9te+ZcEmAwrxWV3faYg1LgHwuKryJxM9Zo+l+wQ0lBBn8rOCaxioJjugMNM4op
 +Ks1VIavguN/9gvIsaOZEvmWqcKv9OoKF11z3xVwpdygY1pM+F4XMKiYMU5jpmeGv1h7
 FHf9xd8Q8Q7vodk83tznoBxr4VareVnOFxReJRSxrKaW7rM+2ibTH4+d8GL8Z3T7ol99
 H6dg==
X-Gm-Message-State: AOAM531MFNQulGd9mfe2SoDw1Fy6isCWsWX900O/kq4SiQVX8a6GJGFf
 T36MFfQ1cezH/FkLdPjXAuRtF7TwHhK9LQ==
X-Google-Smtp-Source: ABdhPJzQ5q9U5aMhrt+itvgDKscaUMvPUE2D61sy6ASoH1wdDWh2fCF1RVVKQwjeWQRX/k7ivG8uAg==
X-Received: by 2002:adf:f60e:: with SMTP id t14mr43532793wrp.112.1636370873064; 
 Mon, 08 Nov 2021 03:27:53 -0800 (PST)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id k37sm16276291wms.21.2021.11.08.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 03:27:52 -0800 (PST)
Date: Mon, 8 Nov 2021 11:27:45 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kumaravel.Thiagarajan@microchip.com,
 Pragash.Mangalapandian@microchip.com, Sundararaman.H@microchip.com,
 axboe@kernel.dk, linux-block@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YYkJsbbHH6wdPvB9@google.com>
References: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YYkEP62JRb4rCuXQ@google.com> <YYkGkEiPb+6J62hn@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYkGkEiPb+6J62hn@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_032754_643597_3E78559D 
X-CRM114-Status: GOOD (  19.50  )
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

T24gTW9uLCAwOCBOb3YgMjAyMSwgR3JlZyBLSCB3cm90ZToKPiBPbiBNb24sIE5vdiAwOCwgMjAy
MSBhdCAxMTowNDozMUFNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBNb24sIDA4IE5v
diAyMDIxLCBLdW1hcmF2ZWwuVGhpYWdhcmFqYW5AbWljcm9jaGlwLmNvbSB3cm90ZToKPiA+IAo+
ID4gPiBEZWFyIExlZSBKb25lcywKPiA+ID4gCj4gPiA+IEkgYW0gS3VtYXJhdmVsIFRoaWFnYXJh
amFuIGZyb20gTWljcm9jaGlwLCBJbmRpYSBhbmQgSSBhbSBuZXcgdG8gTGludXggS2VybmVsIGRl
dmVsb3BtZW50Lgo+ID4gPiAKPiA+ID4gSSBhbSBjdXJyZW50bHkgd29ya2luZyBvbiBsaW51eCBr
ZXJuZWwgZHJpdmVyIGZvciBvbmUgb2Ygb3VyIFBDSWUgYmFzZWQgZGV2aWNlcyB3aG9zZSBCQVIg
MCBtYXBzIGludGVyZmFjZSByZWdpc3RlcnMgZm9yIGEgZ3BpbyBjb250cm9sbGVyLCBhbiBPVFAg
bWVtb3J5IGRldmljZSBjb250cm9sbGVyIGFuZCBhbiBFRVBST00gZGV2aWNlIGNvbnRyb2xsZXIg
aW50byB0aGUgaG9zdCBwcm9jZXNzb3IncyBtZW1vcnkgc3BhY2UuCj4gPiA+IAo+ID4gPiBCYXNl
ZCBvbiBlYXJsaWVyIGlucHV0cyBmcm9tIExpbnVzIFdhbGxlaWosIEkgaGF2ZSBkZXZlbG9wZWQg
dGhpcyBhcyBhIG11bHRpLWZ1bmN0aW9uIGRldmljZSBkcml2ZXIgLSBGaXJzdCBNRkQgZHJpdmVy
IChkcml2ZXJzL21mZCkgZ2V0cyBsb2FkZWQgZm9yIHRoZSBQQ0llIGRldmljZSBhbmQgdGhlbiBp
dCBzcGF3bnMgdHdvIGNoaWxkIGRldmljZXMgZm9yIE9UUC9FRVBST00gYW5kIEdQSU8gc2VwYXJh
dGVseS4KPiA+IAo+ID4gWW91IG1heSB3aXNoIHRvIHNwZWFrIHdpdGggR3JlZyBhYm91dCB5b3Vy
IGFyY2hpdGVjdHVyYWwgZGVjaXNpb25zLgo+ID4gCj4gPiBIZSB1c3VhbGx5IGRpc2xpa2VzIHRo
ZSBjcmVhdGlvbiBvZiBwbGF0Zm9ybSBkZXZpY2VzIGZyb20gUENJIG9uZXMuCj4gCj4gWWVzLCB0
aGF0IGlzIE5PVCBvay4KPiAKPiBQbGF0Zm9ybSBkZXZpY2VzIGFyZSBvbmx5IGZvciBkZXZpY2Vz
IHRoYXQgYXJlIGFjdHVhbGx5IG9uIGEgcGxhdGZvcm0KPiAoaS5lLiBkZXNjcmliZWQgYnkgRFQg
b3Igb3RoZXIgZmlybXdhcmUgdHlwZXMpLgoKVGhpcyBpcyBwcm9iYWJseSBhIGJpdCBvZiBhbiBv
dmVyLXNpbXBsaWZpY2F0aW9uLiAgTG90cyBvZiBsZWdpdGltYXRlCnBsYXRmb3JtIGRldmljZXMg
YXJlIGFjdHVhbGx5IGRlc2NyaWJlZCBieSBEVCBldCBhbC4KCkhvd2V2ZXIsIGl0IGlzIHRydWUg
dGhhdCBkZXZpY2VzIHdoaWNoIHJlc2lkZSBvbiBkZWZpbml0ZSBidXNlczsgUENJLApVU0IsIFBD
TUlBLCBTQ1NJLCBUaHVuZGVyYm9sdCwgZXRjIHNob3VsZCBub3Qgc3Bhd24gdGhlaXIgY2hpbGRy
ZW4gb2ZmCmFzIHBsYXRmb3JtIGRldmljZXMuCgo+IFBDSSBkZXZpY2VzIGFyZSBOT1QKPiBwbGF0
Zm9ybSBkZXZpY2VzLCBwbGVhc2UgdXNlIHRoZSBjb3JyZWN0IGFwaXMgZm9yIHRoaXMgaW5zdGVh
ZCAoaS5lLiB0aGUKPiBhdXggYnVzKQoKR3JlcCBmb3IgImF1eGlsaWFyeV9kZXZpY2UiLgoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIg
U2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0Nz
CkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
