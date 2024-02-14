Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7375C48260
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 03:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpixLfdgzDojQ/VZ/eig7o3FVofRATsnfAdL8JNfVj8=; b=3PiLW/dQkxNU43
	RJaLQJJkVEo1s27T6KANRBJD3wJlgWKvlMiZcWcLLaOzFeQdDhwUfSygiKQAcmHrdSeY4f+a830Na
	bJFvpXtYPw7Q/xkB2v3O9Cjve+EkwOh3yhr+zuTPVyJwXBu3rq8GBRhQcj+5Joyg/cns6riwqfWZg
	Ob5oK3RF94YtAAng8ZkJBwGKbm9vQ8hF48QbTkoayCCQoYp+dmCRTUKtZCOHpCsl0smv7bjuJ0E4s
	9zb9O2KJ2MjG/qwYB65tCrMs56ZG7bgu7znNTfILwhAWRTmtec5oVGnxt+uoVB3phqiqvx4Mw7ivH
	2jrbbVn+IWIyfGLkdKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5nO-0000000Bc9d-2MuK;
	Wed, 14 Feb 2024 03:18:50 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5nM-0000000Bc7r-2Jfh
	for linux-mtd@lists.infradead.org;
	Wed, 14 Feb 2024 03:18:50 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-42a99dc9085so260641cf.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2024 19:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707880721; x=1708485521; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCvKWGSZEcrU3I62UsBWqAtToZ+Q/bkHpybmK6GQZiU=;
        b=ZyBLQusDx3WVOf9lFRGMyAgL8D3J6Sphoq8X8JR/ut6IFlopGoCCkjTzlQ81CAKLNb
         GLsXjL2BBLf8gxYYy4BApQiM86Se8mlNscI85IqGeeu26QJgASJ3yK0b5mKFWyzczJCn
         02M+to0Y7utsrWJ8F3TNW3uFQLDh38u5SKGS6UnbsU88FbLyAemXX/j4DjkasC9LBaM2
         WcNDloFf5ANdOU8PGd7tMYTk3JbIiTzvPCtErUsHGP0tfPIkHcfXGfbsDpOunMPRngDT
         vX7P8YPhgYAdRRbfAO4Ix+m6DCbQCJnqIFDFf+sh64254l/r+9YzAx7LA3FlWBQLD6/s
         hr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707880721; x=1708485521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCvKWGSZEcrU3I62UsBWqAtToZ+Q/bkHpybmK6GQZiU=;
        b=prVFy4knR+/8wXYZqOOAPqWN6+rL6QU3QrTQ2yJ26MPpxhRE8vTD/Zf6ZKudvlja3x
         p2M9cCccAA5TaWmknnB/E9FWCezX4+m+QtIaTfleUPyfL9wqRnf1SmEokNZLN3OIsgBJ
         dTAWvkypRPdJUmXJDvjrb/edSyJzeQmG1lZTAPX4JnDASBhvl2FlrfdV/8AxK0qbbFOL
         DTKwhbI36L3vphZztuq2c3bHL/MeLTkw/k92m3dE4bHS0FQD2e+6NF4WUkKpfpBHvtxt
         uxY8xQPtiU0EaWnfFPsjds21eE8JjJT0hk4tRZQJWH+5U+xMbWIUIUkrls30IQ/LoSB9
         Kxkw==
X-Forwarded-Encrypted: i=1; AJvYcCWtTM+Zn8oZIewl2Z5KemdaIHJ/uxXn+6OdeWAx+qS7AtWq+UYtp6LZcj8Z9R/TOjEz6eXHOhGAqlU31h6O/NUONtuLdVb0j3nPJ+4NQA==
X-Gm-Message-State: AOJu0YwKHiXhtUF8h/3J1boq/eRsqgCjMeKdr2yW8AcXnmWGw0bTmXyS
	0qVkg7yREIIPnnc1Yy2kEJ0TnO1rJ6HJdrTPpOyQKVCfKu+oM4BywPLbr8/GNgSzMjiMvHXQtoN
	0pILv7FaxEmXbTkCZYa/OoI8kYNSIMGnUoF00
X-Google-Smtp-Source: AGHT+IEp+qv5fTphOIfgPXLRE+ClfamHmS/tNOlBEDSEnlU91CYmiW1H+DkSTjWWiWmrKrbLLHofzXQl4CbqVQ+DLpc=
X-Received: by 2002:a05:622a:1882:b0:42c:501c:ed12 with SMTP id
 v2-20020a05622a188200b0042c501ced12mr228524qtc.4.1707880720926; Tue, 13 Feb
 2024 19:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20240123014517.5787-1-mcpratt@pm.me> <20240123014517.5787-2-mcpratt@pm.me>
In-Reply-To: <20240123014517.5787-2-mcpratt@pm.me>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 13 Feb 2024 19:18:03 -0800
Message-ID: <CAGETcx-udSMDLEmwynQMxEnaHb5TR=nD+YJysAx7Jc73UVKdZA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] driver core: fw_devlink: Use driver to determine
 probe ability
To: Michael Pratt <mcpratt@pm.me>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	abel.vesa@linaro.org, alexander.stein@ew.tq-group.com, 
	andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com, brgl@bgdev.pl, 
	colin.foster@in-advantage.com, djrscally@gmail.com, 
	dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru, 
	frowand.list@gmail.com, geert@linux-m68k.org, heikki.krogerus@linux.intel.com, 
	kernel@pengutronix.de, linus.walleij@linaro.org, linux@roeck-us.net, 
	luca.weiss@fairphone.com, magnus.damm@gmail.com, martin.kepplinger@puri.sm, 
	miquel.raynal@bootlin.com, rafal@milecki.pl, ansuelsmth@gmail.com, 
	richard@nod.at, sakari.ailus@linux.intel.com, sudeep.holla@arm.com, 
	tglx@linutronix.de, tony@atomide.com, vigneshr@ti.com, dianders@chromium.org, 
	jpb@kernel.org, rafael@kernel.org, 
	Android Kernel Team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_191848_640372_C08230D9 
X-CRM114-Status: GOOD (  33.44  )
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

SGkgTWljaGFlbCwKClRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMgYW5kIGJlaW5nIHdpbGxpbmcg
dG8gd29yayBvbiBhIGZpeC4KCk9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDU6NDbigK9QTSBNaWNo
YWVsIFByYXR0IDxtY3ByYXR0QHBtLm1lPiB3cm90ZToKPgo+IFRoZSBmdW5jdGlvbiBfX2Z3X2Rl
dmxpbmtfcGlja3VwX2RhbmdsaW5nX2NvbnN1bWVycygpCj4gaW50ZW5kcyB0byBpZ25vcmUgc3Vw
cGxpZXJzIHRoYXQgYXJlIGFscmVhZHkgY2FwYWJsZSBvZiBwcm9iaW5nLAoKZndfZGV2bGluayBp
c24ndCB0cnlpbmcgdG8gZmlndXJlIG91dCBpZiBhIGZ3bm9kZSBpcyAiYWxyZWFkeSBjYXBhYmxl
IgpvZiBwcm9iaW5nLiBJdCdzIHRyeWluZyB0byBmaWd1cmUgb3V0IGlmIGEgZndub2RlIHdpbGwg
TkVWRVIgcHJvYmUuIElmCml0J3MganVzdCBsb29raW5nIGF0ICJyaWdodCBub3ciIG9yICJhbHJl
YWR5IGNhcGFibGUiLCBpdCBiZWNvbWVzCmtpbmRhIHVzZWxlc3MuCgo+IGJ1dCB1c2VzIHdoZXRo
ZXIgb3Igbm90IGEgYnVzIHN0cnVjdCBpcyBkZWZpbmVkIGluIHRoZSBkZXZpY2Ugc3RydWN0LgoK
QmVjYXVzZSBpZiB5b3UgZG9uJ3QgbmVlZCBhIGNsYXNzIG9mIGRldmljZXMgdG8gcHJvYmUsIHlv
dSBhZGQgdGhlbSB0bwphICJjbGFzcyIgbm90IGEgImJ1cyIuCgo+IFRoZXJlIGFyZSBzb21lIGNh
c2VzIHdoZXJlIGEgZmlybXdhcmUgY2hpbGQgbm9kZQo+IGNhbiBiZSBhZGRyZXNzIHRyYW5zbGF0
YWJsZSBidXQgbm90IGFibGUgdG8gcHJvYmUKPiAoZS5nLiB0aGUgdXNlIG9mIG9mX3BsYXRmb3Jt
X3BvcHVsYXRlKCkgZm9yIE1URCBwYXJ0aXRpb25zKSwKPiBzbyB3aGV0aGVyIG9yIG5vdCBhIGRy
aXZlciBpcyBwcmVzZW50IGlzIGEgbW9yZSBhY2N1cmF0ZSB3YXkKPiB0byBndWVzcyB3aGV0aGVy
IGEgZndub2RlIHJlcHJlc2VudHMgYSByZWFsIHByb2JpbmcgZGV2aWNlIGhlcmUuCgpObywgY2hl
Y2tpbmcgZm9yIHRoZSBkcml2ZXIgaXMgbm90IGEgIm1vcmUgYWNjdXJhdGUgd2F5IiBmb3IgdGhl
CnJlYXNvbnMgbWVudGlvbmVkIGFib3ZlLgoKPiBUaGlzIGFsc28gc2VydmVzIGFzIGEgcHJlcGFy
YXRpb24gc3RlcCBmb3IgZnVydGhlciBjaGFuZ2VzCj4gdG8gZndfZGV2bGluayBpbmNsdWRpbmcg
bWFraW5nIHRoZSBjb250ZW50cyBvZiB0aGlzIGZ1bmN0aW9uCj4gbGVzcyBzdHJpY3QgaW4gb3Jk
ZXIgdG8gY29tcGVuc2F0ZSBmb3IgbW9yZSBjYXNlcyBiZWluZyBwYXNzZWQgaW50bwo+IHRoZSBy
ZXN0IG9mIHRoZSBmdW5jdGlvbiBiZWNhdXNlIHRoZSByZXR1cm4gY2FzZSBpcyBub3cgbW9yZSBz
dHJpY3QuCgpUaGlzIGNoYW5nZSBpdHNlbGYgaXMgYSBkZWZpbml0ZSBOYWNrLCBidXQgSSdsbCBs
b29rIGF0IHlvdXIgb3RoZXIKcGF0Y2hlcyB0byBzZWUgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBk
by4KCj4gIkhleSEgV2hvJ3MgZHJpdmluZyB0aGUgYnVzPyIKClRoZSBkcml2ZXIgaXNuJ3QgaGVy
ZSB5ZXQuIEhlJ2xsIGJlIGhlcmUgaW4gYSB3aGlsZS4gQnV0IGF0IGxlYXN0IHRoaXMKaXMgYSBt
b2RlIG9mIHRyYW5zcG9ydGF0aW9uIGFuZCBub3QgYSBmb290YmFsbCBzdGFkaXVtIDopCgpTZWUg
bW9yZSBiZWxvdy4KCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBQcmF0dCA8bWNwcmF0dEBwbS5t
ZT4KPiAtLS0KPiAgZHJpdmVycy9iYXNlL2NvcmUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmFzZS9jb3JlLmMgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCj4gaW5kZXggMTRkNDZhZjQwZjlh
Li5jMDVhNWY2YjA2NDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9iYXNlL2NvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvYmFzZS9jb3JlLmMKPiBAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyB2b2lkIF9f
Zndub2RlX2xpbmtzX21vdmVfY29uc3VtZXJzKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmcm9tLAo+
ICAgKiBAbmV3X3N1cDogZndub2RlIG9mIG5ldyBzdXBwbGllcgo+ICAgKgo+ICAgKiBJZiB0aGUg
QGZ3bm9kZSBoYXMgYSBjb3JyZXNwb25kaW5nIHN0cnVjdCBkZXZpY2UgYW5kIHRoZSBkZXZpY2Ug
c3VwcG9ydHMKPiAtICogcHJvYmluZyAodGhhdCBpcywgYWRkZWQgdG8gYSBidXMpLCB0aGVuIHdl
IHdhbnQgdG8gbGV0IGZ3X2RldmxpbmsgY3JlYXRlCj4gKyAqIHByb2JpbmcgKHRoYXQgaXMsIGJv
dW5kIHRvIGEgZHJpdmVyKSwgdGhlbiB3ZSB3YW50IHRvIGxldCBmd19kZXZsaW5rIGNyZWF0ZQo+
ICAgKiBNQU5BR0VEIGRldmljZSBsaW5rcyB0byB0aGlzIGRldmljZSwgc28gbGVhdmUgQGZ3bm9k
ZSBhbmQgaXRzIGRlc2NlbmRhbnQncwo+ICAgKiBmd25vZGUgbGlua3MgYWxvbmUuCj4gICAqCj4g
QEAgLTIyNSw3ICsyMjUsNyBAQCBzdGF0aWMgdm9pZCBfX2Z3X2RldmxpbmtfcGlja3VwX2Rhbmds
aW5nX2NvbnN1bWVycyhzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+ICB7Cj4gICAgICAg
ICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqY2hpbGQ7Cj4KPiAtICAgICAgIGlmIChmd25vZGUtPmRl
diAmJiBmd25vZGUtPmRldi0+YnVzKQo+ICsgICAgICAgaWYgKGZ3bm9kZS0+ZGV2ICYmIGZ3bm9k
ZS0+ZGV2LT5kcml2ZXIpCgpUaGlzIHdpbGwgY29tcGxldGVseSBicmVhayBmd19kZXZsaW5rIHdo
ZW4gbW9kdWxlcyBhcmUgZW5hYmxlZC4gV2hpY2gKaXMgd2hlcmUgZndfZGV2bGluayBpcyBhbHNv
IHZlcnkgbXVjaCBuZWVkZWQuIEFuZCBpZiBtb2R1bGVzIGFyZQpsb2FkZWQgdXNpbmcgdWRldiBl
dmVudHMsIHRoaXMgaXMgZ3VhcmFudGVlZCB0byBicmVhayBmb3IgdGhvc2UgY2FzZXMuCkFsc28s
IHRoZSBkcml2ZXIgZ2V0cyBzZXQgQUZURVIgYSBkZXZpY2UgaXMgcHJvYmVkLiBOb3QgYmVmb3Jl
LiBTbywgSQp0aGluayB5b3UgYXJlIGp1c3QgZGVsZXRpbmcvaW5jb3JyZWN0bHkgbW92aW5nIGEg
d2hvbGUgYnVuY2ggb2YgZGV2aWNlCmxpbmtzIHRoYXQgd291bGQgaGF2ZSBiZWVuIGNyZWF0ZWQu
CgpBIGZpcnN0IGxldmVsIHNhbml0eSB0ZXN0IGZvciBhbnkgZndfZGV2bGluayBjaGFuZ2UgaXMg
dG8gdGFrZSBhCnN1ZmZpY2llbnRseSBjb21wbGljYXRlZCBib2FyZC9zeXN0ZW0gYW5kIHRoZW4g
Y29tcGFyZSB0aGUgb3V0cHV0IG9mCnRoaXMgY29tbWFuZCBiZWZvcmUgYW5kIGFmdGVyIHlvdXIg
Y2hhbmdlczoKbHMgLTEgL3N5cy9jbGFzcy9kZXZsaW5rCgpUaGUgZGlmZiB5b3Ugc2VlIHNob3Vs
ZCBiZSBleGFjdGx5IHdoYXQgeW91IGV4cGVjdC93YW50IHRvIGhhcHBlbi4gSWYKdGhlcmUgYXJl
IG90aGVyIHVuZXhwZWN0ZWQgZGlmZnMgaXQncyBnZW5lcmFsbHkgYSBidWcuIEkndmUgY2F1Z2h0
IHNvCm1hbnkgYnVncyBpbiBteSBjaGFuZ2VzIChiZWZvcmUgSSBzZW5kIHRoZW0pIHRoaXMgd2F5
LgoKQWxzbywgaWYgYSBkZXZpY2UgaXMgbmV2ZXIgc3VwcG9zZWQgdG8gcHJvYmUsIGl0IHNob3Vs
ZCBub3QgYmUgYWRkZWQKdG8gYSBidXMgYW55d2F5LiBUaGF0J3Mgd2hhdCBhICJjbGFzcyIgaXMg
Zm9yLiBJdCdzIGZvciBhIGNsYXNzIG9mCmRldmljZXMuIEFkZGluZyBhIGRldmljZSB0byBhIGJ1
cyBhbmQgdGhlbiBuZXZlciBwcm9iaW5nIGl0IGlzIHN1Y2ggYQp3YXN0ZS4gQW5kIHRoaXMgZGV2
aWNlIChhdCBsZWFzdCBmb3IgbnZtZW0tY2VsbHMpIGlzIG5ldmVyIGV2ZW4KcmVmZXJlbmNlZCAt
LSB3aGljaCBpcyBhbiBldmVuIGJpZ2dlciB3YXN0ZSBvZiBtZW1vcnkuCgpJJ2QgcmVhbGx5IHBy
ZWZlciBpZiBzb21lb25lIHdpdGggbnZtZW0gY2VsbHMgZXhwZXJpZW5jZSAoaGludCBoaW50Ck1p
Y2hhZWwgaGludCBoaW50IDopICkgY2FuIGNsZWFuIHVwIHRoZSBmcmFtZXdvcmsgdG8gbm90IGNy
ZWF0ZQpkZXZpY2VzIHVubmVjZXNzYXJpbHkgb3IgYXQgbGVhc3QgbWFrZSBpdCBhIGRldmljZSB0
aGF0J3MgYWRkZWQgdG8gYQpjbGFzcyBpbnN0ZWFkIG9mIGEgYnVzLgoKLVNhcmF2YW5hCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
