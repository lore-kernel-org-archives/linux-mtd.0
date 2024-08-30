Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD3EC83F0B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFv6RUHkSX4l0ulP/AUClu0d1cMsawkIu9UUhGSWVxk=; b=btSPdkb4/B6HCm
	qUGrzJLyVQGxEm3c+JqMLuEhkRukwwtiU2QZHnbwze4GairR7SVSbmaoXzHf0YHAlmq1Z2u1uCQuv
	81UaeoNUv7dBfhZj7nYWT5TKfB5oYH1eTI712cOZjFWfen4vrLFkgDZ39AHeCZ9CTdEKLGZxLz/pX
	CndEovykKx6OoLP2ep5cPzJpgyDrhbac9Mxo0hIZZXAGnl3IWapaaKZ5maewIrpKjpij7y6pvwN5P
	DT3F1flAQoZELAv+cXWAtveNloFrGfWhuO8hhRz7xbAfHVNdJOgn49mTc9pRPvFnkjV7bfzFagBNn
	TH2ubTmlPSNkXN1G16/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxAe-00000005Oac-3JBA;
	Fri, 30 Aug 2024 08:39:52 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjx8h-00000005O0r-3cG4
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 08:37:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7bcf8077742so1088061a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2024 01:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725007070; x=1725611870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+Vo4SFaxBp6TviPv9XIPO+2SC03XabOidYaoFKJEWU=;
        b=M3REeakJuMg9BRfGtvIaC7ZwAY44uKFRRVZJQDx3nZolEalS4F7gLNJDwN0ZMHCgea
         1xzFM8CvkP59kyY4I/Ype4TdAhMUu5F34TZMK/KnPXdeq+A5+mTv811QPKiCazVHTm3r
         mFolNqRR5ZiNdc6enTnrqoXK707OxXUIELrwdTGD2ddqFRQ2RuZJ3HnkcSxVb8bGsK3f
         5QZ75qFueI6QTcDoTc5JafaO66yjRj3UZfaCme3v3vVC5k3I3ydgv/Fr8hLgyFqpWdva
         zOq27q3+3DUAbO4UG9sFiIpUbjw4YMw0NZAAolg+HobJjT4B6Gl9U8DTFyvH6/r6XquC
         zqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007070; x=1725611870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+Vo4SFaxBp6TviPv9XIPO+2SC03XabOidYaoFKJEWU=;
        b=I62catVFcSkh28IDGZsq/H9a9tz2xTCqOqUD1Wuf7Lg1xq7HjWBEkM2wATtj62bmQ6
         oJ/WWYV9AFuQHWFWGbXtdiDW8Iy8EKHw3B6fXxWVeLoFJcggsnGLdSz+wYsiNl8PXG/Q
         VR0jsnpsPQd2YckB5TqzoJKjNIhzghcWVXlhzP6Z5saHTykCXxlXy2qGFu2yJNg4sajf
         xkoNlp23UfPpcfvbY9vrP3F3pJfliU3VVS+ob3EqX7fmaFRaDI2g3mfdBUi4YjG1vHgg
         GsrRaoHQtemLTiZqWzRjpzoysIfdMn0goRgl7VjKnbYuy1FFIcsa0jo/jGw+XgbjF+92
         UUtA==
X-Forwarded-Encrypted: i=1; AJvYcCVpM5cnV279P2lh7oXU99ETsuNLEpYltT4Ikv/xhTKsB1wgXAqBjwuJ5PS98dl0f7pfeT/iI9a5QRI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkt2J/OC1NmyHjGNiWCvJSgVPIH98jl4HuKndvV9AoVzG2QCHt
	QnkfkKHVeQ8OHDpVTJOzZ0Eq2xk3YuQ9qPmBypWMhDEPCA9Tml71S62Xioi38fjVO3en5khpz8p
	DFqFYbk0U93jOoWUOiOacqrZtAftRyg==
X-Google-Smtp-Source: AGHT+IHyiOiuICn2agzHUF+aPU+pV7UPEDvVDbnDr9SRm6D47qPQOApSDem2YZXVTRin+j6HFciyHk76YolfUOwND+Q=
X-Received: by 2002:a05:6a20:e196:b0:1be:c4bb:6f31 with SMTP id
 adf61e73a8af0-1cce1011dd6mr6217049637.18.1725007070309; Fri, 30 Aug 2024
 01:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240829032517.1517198-1-linchengming884@gmail.com>
 <20240829032517.1517198-3-linchengming884@gmail.com> <20240830092303.00ca7cc6@xps-13>
In-Reply-To: <20240830092303.00ca7cc6@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 30 Aug 2024 16:35:44 +0800
Message-ID: <CAAyq3SZge=9BzFUOmLy35bfQguoU4xRrOp3pQH=sfi2=vFnqtw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: spinand: macronix: Use the flag in Macronix driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_013751_923791_4FACDB3C 
X-CRM114-Status: GOOD (  27.64  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQ45pyIMzDml6Ug6YCx5LqUIOS4i+WNiDM6MjPlr6vpgZPvvJoKPgo+IEhpIENoZW5n
TWluZywKPgo+IGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAyOSBBdWcg
MjAyNCAxMToyNToxNyArMDgwMDoKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWlu
Z2xpbkBteGljLmNvbS50dz4KPiA+Cj4gPiBNYWNyb25peCBzZXJpYWwgTkFORCBmbGFzaCB3aXRo
IGEgdHdvLXBsYW5lIHN0cnVjdHVyZSByZXF1aXJlcwo+ID4gaW5zZXJ0aW9uIG9mIHRoZSBQbGFu
ZSBTZWxlY3QgYml0IGludG8gdGhlIGNvbHVtbiBhZGRyZXNzIGR1cmluZwo+ID4gdGhlIHdyaXRl
X3RvX2NhY2hlIG9wZXJhdGlvbi4KPiA+Cj4gPiBBZGRpdGlvbmFsbHksIGZvciBNWDM1e1UsRn0y
RzE0QUMgYW5kIE1YMzVMRjJHRTRBQiwgaW5zZXJ0aW9uIG9mCj4gPiB0aGUgUGxhbmUgU2VsZWN0
IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcyBpcyByZXF1aXJlZCBkdXJpbmcKPiA+IHRoZSBy
ZWFkX2Zyb21fY2FjaGUgb3BlcmF0aW9uLgo+ID4KPgo+IFBBVEggMSBpcyBmaW5lIGV4Y2VwdCB0
aGUgY29tbWl0IHRpdGxlLCBsZXQgbWUgZXhwbGFpbi4gT25jZSBhcHBsaWVkIGluCj4gdGhlIGtl
cm5lbCB0cmVlLCB0aGVyZSBpcyBubyBjb3ZlciBsZXR0ZXIgYW55bW9yZS4gU28gYm90aCB0aXRs
ZXMgd291bGQKPiBiZSAiQWRkIHN1cHBvcnQgZm9yIHRoZSBmbGFnIiBhbmQgIlVzZSB0aGUgZmxh
Zy4uLiIsIHdoaWNoIGlzIHJlYWxseQo+IG1pc3NpbmcgdGhlIGltcG9ydGFudCBpbmZvcm1hdGlv
biBhcyB3ZSBkb24ndCBrbm93IHdoYXQgdGhpcyBmbGFnIGlzCj4gZm9yLiBGdXJ0aGVybW9yZSwg
dGhlIGZhY3QgdGhhdCB3ZSBkZWNpZGVkIHRvIHVzZSBhIGZsYWcgaXMgYW4KPiBpbXBsZW1lbnRh
dGlvbiBkZXRhaWwsIHdoYXQgaXMgaW1wb3J0YW50IGlzIHRoZSBmZWF0dXJlOiBzZXR0aW5nIHRo
ZQo+IHBsYW5lIHNlbGVjdCBiaXQuCj4KPiBDYW4geW91IHBsZWFzZSBjaGFuZ2UgdGhlIGZpcnN0
IGNvbW1pdCB0aXRsZSB0bzoKPgo+IG10ZDogc3BpbmFuZDogQWRkIHN1cHBvcnQgZm9yIHNldHRp
bmcgcGxhbmUgc2VsZWN0IGJpdHMKPgo+IGFuZCBmb3IgdGhlIHNlY29uZCwgc29tZXRoaW5nIGxp
a2U6Cj4KPiBtdGQ6IHNwaW5hbmQ6IG1hY3Jvbml4OiBGbGFnIHBhcnRzIG5lZWRpbmcgZXhwbGlj
aXQgcGxhbmUgc2VsZWN0Cj4KClN1cmUsIEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCB0aXRsZXMg
YXMgc3VnZ2VzdGVkLgoKPiA+IFNpZ25lZC1vZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21p
bmdsaW5AbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNy
b25peC5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9zcGkvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMK
PiA+IGluZGV4IDNmOWU5YzU3Mjg1NC4uZjE3Y2Q0YTZmNGQwIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9z
cGkvbWFjcm9uaXguYwo+ID4gQEAgLTExOCw3ICsxMTgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHNwaW5hbmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmd3JpdGVfY2Fj
aGVfdmFyaWFudHMsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAo+ID4gLSAgICAgICAgICAgICAgICAgIFNQSU5B
TkRfSEFTX1FFX0JJVCwKPiA+ICsgICAgICAgICAgICAgICAgICBTUElOQU5EX0hBU19RRV9CSVQg
fCBTUElOQU5EX0hBU19QUF9QTEFORV9TRUxFQ1RfQklUIHwKPiA+ICsgICAgICAgICAgICAgICAg
ICBTUElOQU5EX0hBU19SRUFEX1BMQU5FX1NFTEVDVF9CSVQsCj4KPiBBbmQgSSBrbm93IHRoaXMg
aXMgbm90IHdoYXQgdGhlIG5vcm1hbCBjb2Rpbmcgc3R5bGUgd291bGQgYXNrIGZvciwgYnV0Cj4g
SSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSB0aGUgdHdvIHBsYW5lIHNlbGVjdCBiaXRzIG9uIHRoZSBz
YW1lIGxpbmUgaWYKPiBwb3NzaWJsZSwgb3RoZXJ3aXNlIG9uIHR3byBpbmRlcGVuZGVudCBsaW5l
cywgc28gZWl0aGVyOgo+Cj4gICAgICAgICAgICAgICAgIFFFX0JJVCB8Cj4gICAgICAgICAgICAg
ICAgIFBQX1NFTEVDVF9CSVQgfCBSRUFEIFNFTEVDVF9CSVQsCj4KPiBvciBvdGhlcndpc2U6Cj4K
PiAgICAgICAgICAgICAgICAgUUVfQklUIHwKPiAgICAgICAgICAgICAgICAgUFBfU0VMRUNUX0JJ
VCB8Cj4gICAgICAgICAgICAgICAgIFJFQUQgU0VMRUNUX0JJVCwKPgo+IEFuZCBmaW5hbGx5LCBj
b3VsZCB3ZSBuYW1lIHRoZSBmb3JtZXIKPgo+ICAgICAgICAgICAgICAgICBTUElOQU5EX0hBU19Q
Uk9HX1BMQU5FX1NFTEVDVF9CSVQKPgo+ID8gQmVjYXVzZSAiUFAiIHNvdW5kcyBhIGxpdHRsZSBi
aXQgdG9vIGNyeXB0aWMuCj4KCk5vIHByb2JsZW0uIEkgd2lsbCBhZGp1c3QgdGhlIGZvcm1hdHRp
bmcgdG8gaGF2ZSB0aGUgdHdvIHBsYW5lIHNlbGVjdCBiaXRzIG9uCnNlcGFyYXRlIGxpbmVzIGFu
ZCBhbHNvIHJlbmFtZSBpdCB0byBTUElOQU5EX0hBU19QUk9HX1BMQU5FX1NFTEVDVF9CSVQKdG8g
YXZvaWQgYW55IGNvbmZ1c2lvbi4KCj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcg
TWluZyBMaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
