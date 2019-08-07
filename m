Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A9EC32751
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 16:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564EE2229C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 16:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a2F23qkK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPxurNgt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564EE2229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwnIfdBw4uNKf3GfBvhSv1NtpTfYQR4+ZgLq7gTPai0=; b=a2F23qkKiznAfD
	SR+hRyAfUXZGnWnWDRiYHCkZZbjractp3pNB2eqaZgup/Py6ClsRyXJ12Pkvg6zRCWnKWe8o9Ghmu
	bg19gYVhu4NwFGXeg9czm5bAdaiW9Mzgfh9e5ARABn4ARcnHspjdfxOHdv1w11UJMiqjkVEzd3tY2
	FfS2BVW68Y1DZnUORLz5YDh0LIkEjbUPciS7AkS9heKFZiwdwxpP/ujf1sRF/J9knEXj4MRP+WjsY
	1ICWY/ljeo9hrSzDWcwHGJrz2otiIfDpct/gjbZjZ5C8nqtWDrDjtkDL/gMi3n2ysSMcXhdJYZjvA
	R3nLTP363MUviPGhmN0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvPAQ-0002Zw-Dt; Wed, 07 Aug 2019 16:52:02 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvPAD-0002P5-8C
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 16:51:50 +0000
Received: by mail-lf1-x141.google.com with SMTP id j17so10525669lfp.3
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2019 09:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8lrAVHk4MoThfByio1tlJPdFHIjBH+prIsMiUlpaM9s=;
 b=YPxurNgtmlrvsq1vZlPOYJ3JFf7+6p6pDC2vysrerbgxEJMbqBjlecs9mvU4JulDtU
 3xs8BumhVNC1fAbhIpRf+Of0CeXAYbkv9d397Xidr3gJiXhqLG18Zl9AiqQGHEOadK+l
 o9T8A9mrn5ljFcZbiBQvEfm53+vYv7koU+rkOMPal3kA2IX2RTggflc1PXiz1SrNiHL7
 dPm2s2C+cEYViHlhXs+4olzYIqryNm4OEel++VmjTYQEfmsWR4hwKQM7+ILJb0oEZpJq
 rf1QQW9qxgxyouRNdlNUj0q1FzUVX044YTJS+RpMiHSaUAfzX1mHnhFZFqX6GifB0+f4
 4wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8lrAVHk4MoThfByio1tlJPdFHIjBH+prIsMiUlpaM9s=;
 b=fbEBE/3FtG2Cr4c41+u+2ukyCGsV4SZIXT0w74cBbU+BVlr1BzzolsKRI73Cb7Zcs+
 HLIxz0QX7HJe7fdRFBsoeWhs6/BxRK/YjRPMS0yhKLxl8bA4B3f0ySPNvgNzK9OqKO/R
 o2X/g1lRwBMu46mOWyhwykbIy0ru49n/rhUg4t1xkvlcVI4KFwx0WD9e8lW21phTMkhd
 KV+CFHZDhD+3vlvCXRPKCa7pXKKa3Ipgyh7Bp+zycYXviuK3VhgReJ/FQz09fFihSpmP
 lgC3LM8O+my3X0ut6XT1WX47GjyBPOUxSEkEMg1KIa1UuXDmQrjLaESOHnllgm96Zn5t
 7xMQ==
X-Gm-Message-State: APjAAAU3LM5oWAZyai3ehFQIkewT0ak0SUqVhycb3lK4nI1yOuoukP6F
 qDKavEPGAmr22Qp5IlSqI/+TLhmOTT76JG3hD0KIdnkgmps=
X-Google-Smtp-Source: APXvYqzQMz5tSBll0OkHi4XawiRAu1p2A63iCjtcvY47C0nOCTzH5lL4N0AfUZVk5hF2lsfare60dhUx0ePu2Xolrf0=
X-Received: by 2002:a19:4349:: with SMTP id m9mr6441297lfj.64.1565196707144;
 Wed, 07 Aug 2019 09:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMxq0fNSWrUFMmmTs8Ri9gFOvS+KQJvZN3-_KuiqXi9bbmCB0Q@mail.gmail.com>
 <CAFLxGvz92UR2M7KJ_dMMW-F47_pLLxSTOrGwdQ5Cc0kuSiTA8Q@mail.gmail.com>
 <CAMxq0fO=0P8972FKvscmNxCBxq0m8_f2DST-Oa9HtNeUA-FKsA@mail.gmail.com>
 <1019514474.57102.1564822129140.JavaMail.zimbra@nod.at>
In-Reply-To: <1019514474.57102.1564822129140.JavaMail.zimbra@nod.at>
From: Sergeant Peppercorn <speppercorn109@gmail.com>
Date: Wed, 7 Aug 2019 09:51:36 -0700
Message-ID: <CAMxq0fPvj+gMnUysDDN8j2wXNQj3Th_HwVV2NWmm8pjSe7Q_vQ@mail.gmail.com>
Subject: Re: UBIFS ECC errors
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_095149_286351_E3C8B70A 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIHNvIGFyZSB5b3Ugc2F5aW5nIHRoYXQgSSBzaG91bGQgdHJ5IHRvIG1lcmdlIGluIHRoZXNl
IHR3byBjb21taXRzCmZvciBhIHByb3BlciBmaXggZm9yIHRoaXM/CjczMGE0M2ZiYzEzNSAoIm10
ZDogbmFuZDogYWRkIG5hbmRfY2hlY2tfZXJhc2VkIGhlbHBlciBmdW5jdGlvbnMiKQpmZGYyZTgy
MTA1MjkgKCJtdGQ6IG5hbmQ6IGdwbWk6IEZpeCBmYWlsdXJlIHdoZW4gYSBlcmFzZWQgcGFnZSBo
YXMgYQpiaXRmbGlwIGF0IEJCTSIpCgpJIGFtIGFzc3VtaW5nIHRoZXNlIGFyZSBmcm9tIHRoZSBt
YWlubGluZSBrZXJuZWw/CgpJZiBub3QsIGhvdyBkbyBJIGZpeCB0aGlzPyB0aGlzIG90aGVyIHBh
dGNoLCBpbnN0ZWFkIG9yIHdpdGggdGhvc2UgdHdvIGNvbW1pdHM/Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxNC1KYW51YXJ5LzA1MTM1Ny5odG1sCgpU
aGUgcGF0Y2ggZG9lc24ndCBzZWVtIHRvIGJlIGFibGUgdG8gYXBwbHkgY2xlYW5seSB0byBteSBr
ZXJuZWwgc28gSQptdXN0IGRvIHNvbWUgZGVlcCBtZXJnaW5nLiBJIGhhdmUgbm90IGxvb2tlZCBm
b3IgdGhlIHR3byBjb21taXRzIHlldC4KCkFyZSB0aGVyZSBhbnkgb3RoZXIgYWx0ZXJuYXRpdmVz
PwoKVGhlbmtzIGluIGFkdmFuY2UgZm9yIGFueSBoZWxwLgoKT24gU2F0LCBBdWcgMywgMjAxOSBh
dCAxOjQ4IEFNIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+Cj4g
LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gVm9uOiAiU2VyZ2VhbnQgUGVwcGVy
Y29ybiIgPHNwZXBwZXJjb3JuMTA5QGdtYWlsLmNvbT4KPiA+IEFuOiAiUmljaGFyZCBXZWluYmVy
Z2VyIiA8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWlsLmNvbT4KPiA+IENDOiAibGludXgtbXRkIiA8
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gPiBHZXNlbmRldDogRnJlaXRhZywgMi4g
QXVndXN0IDIwMTkgMTg6MTQ6NTUKPiA+IEJldHJlZmY6IFJlOiBVQklGUyBFQ0MgZXJyb3JzCj4K
PiA+IEhpLCBtYW55IHRoYW5rcyBmb3IgdGhlIHJlcGx5Lgo+ID4KPiA+IEkgaGF2ZSBzZWVuIHBv
c3RzIG9uIGJpdGZsaXBzIGluIGVtcHR5IHNwYWNlIGlzc3VlcyBiZWZvcmUsIGJ1dCBkb24ndAo+
ID4gcmVtZW1iZXIgc2VlaW5nIGFueSBmaXhlcy4gRG9lcyB0aGlzIG1lYW4gdGhlIGtlcm5lbCBV
QkkgZHJpdmVycyBtdXN0Cj4gPiBiZSBwYXRjaGVkPyBDYW4geW91IGVsYWJvcmF0ZSBvbiB3aGF0
IGZpeGVzIG9yIHdoZXJlIHRvIGZpbmQgcGF0Y2hlcywKPiA+IGV0Yywgb3Igd2hhdCB0byBkbyBh
Ym91dCB0aGlzLCB0aGVuPyBBbGwgSSBjYXJlIGFib3V0IGlzIGdldHRpbmcgdGhpcwo+ID4gdG8g
d29yaywgYW5kIGhvcGVmdWxseSB3aXRob3V0IG5lZWRpbmcgdG8gcmVmb3JtYXQgdGhlIHJvb3Qg
ZmlsZQo+ID4gc3lzdGVtIG9uIDUwLDAwMCB1bml0cyBpbiB0aGUgZmllbGQuCj4KPiBZb3VyIGtl
cm5lbCBpcyBwcmV0dHkgb2xkLCBzbyBJIGd1ZXNzIHlvdSBkb24ndCBoYXZlIHRoaXMgY29tbWl0
Ogo+IDczMGE0M2ZiYzEzNSAoIm10ZDogbmFuZDogYWRkIG5hbmRfY2hlY2tfZXJhc2VkIGhlbHBl
ciBmdW5jdGlvbnMiKQo+Cj4gQml0ZmxpcHMgaW4gZW1wdHkgcGFnZXMgc2hvdWxkIGJlIGhhbmRs
ZWQgaW4gdGhlIE5BTkQgbGF5ZXIuCj4KPiBQbGVhc2UgZG9uJ3QgYmxpbmRseSBhcHBseSB0aGlz
IHBhdGNoLCBpdCBtYXkgaGF2ZSBkZXBlbmRlbmNpZXMgb3Igd2lsbAo+IHVuY292ZXIgb3RoZXIg
YnVncy4gU3VjaCBhcyBmaXg6Cj4gZmRmMmU4MjEwNTI5ICgibXRkOiBuYW5kOiBncG1pOiBGaXgg
ZmFpbHVyZSB3aGVuIGEgZXJhc2VkIHBhZ2UgaGFzIGEgYml0ZmxpcCBhdCBCQk0iKQo+Cj4gVGhh
bmtzLAo+IC8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
