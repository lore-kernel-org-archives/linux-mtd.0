Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8E5C54FCF
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 16:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3A720724
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 16:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5hvmgmZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgbZE9/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3A720724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ewi8rjFAybKSSnDhAim5VyZfQg2mFSTH6EmORoK3u0=; b=L5hvmgmZIJDDtw
	meDXO0/Z2nAGzi2eo5HpPOc8zozLUQaf9pewZTinblOhntjAcWd0LuxtopFiBUpFRG2DJEzMrGHUo
	TB1+OJMAbsFxIP0hcq6nJzTNxB5HMFQHS7D6xNwpwr4DCTM4zK36TFKVmQw01kgaYkXGuu/4Zr/Ki
	goSOA+bYOsWaBmtyJ7Bt/qT5KAtQ+eTUCBXOR+NmPVDl6r3XiJlVTyCrx+89X65Oj/ttZ7zh23H5s
	rZ/8D6DKO6La7TNv7kV+d9pjqNheDRHjgPJAF7KPeQBfYOFa4uh9GN+L/uDWvnRMnMKJXfKKXXEOw
	ItBziruJwT1/fWXf3UTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG31k-0007IQ-LZ; Sun, 22 Mar 2020 16:00:40 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG31h-0007Fm-Hy
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 16:00:38 +0000
Received: by mail-ot1-x343.google.com with SMTP id r2so10939188otn.6
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2020 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SYiCnFnfRHlqaygJVA/1P7qPVGUSBBy4QcILvZZOkGA=;
 b=EgbZE9/3BsdWQeNge3RSSq/gOYwAu7Zfh3uoz90KIGMz3Mil8jsyzp7kXiFXN4jTyB
 L3+RqIfiFB0hPRgF33nHkQKBmnvdFjuez4NLo+Gpf6uL6rFgT3LjJ/JapCFf7pYL0bly
 BWvaD7LXU7OWfNY+wQWiOAx7e9vMFiuxbZBKbx+6gy8Cq/1OCrYAL1qY/pBVqhlEO19D
 ShM2BVc7QVId7UivIpJKB2bT2tuKYzXNqTPHiDrd0+8x+wl394WeAiJ9+ctl4a5nGEk2
 MB5uFMnt6O/T9fGij3a569qqJoID5pATRdlsez0N4fEpf0tz9PylMfGjT6trCZcCQYcA
 ZlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SYiCnFnfRHlqaygJVA/1P7qPVGUSBBy4QcILvZZOkGA=;
 b=C6EC1UjUz7DqtSUgQbzySkVidHtD3AUKyuW7MrTxDXXk+pUoafRxJnUs39NrL4WdgS
 6vHBSg0LinOjAgUERpbBbodN1kbTO2ftkfU+LyeAWVfQGL5yegH/h4iEfE0k/gjl8+1V
 sxAl9tM1EOscrggf2JMWGHI+lVgGZlq4AQiEWpYiLUzot4D7mASu9vXWcxTBT3CRUhlP
 AretGyxR5eMIw2NY6iQo0xxDi1EeKYeBOCjP1K4dkdqErMz5l6fsscLLiJGyfgYbkllf
 PM+aSBINX19FV/7oDEbx+TT98Ux4yS6c9UcEutDdc6MdYKrXSdF89zon61LgEe/Y70Tl
 TE2g==
X-Gm-Message-State: ANhLgQ3oUbghPCtpryaNbT49gVs+YajBaMn5mbH4AkrwYY4fazhFfREC
 mU28dmePsxm+pnvSvE1hcy27+CSU48WiV81lj4o=
X-Google-Smtp-Source: ADFU+vu+vEEsEFEmBJc5LW2zDinKmeacmkah0ZHN50vZvfvpXBoy+0oTRYFsnmZNDxt6Ig1+Sz1frW9NJIFs0NRj1FQ=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr5396185oth.338.1584892836602; 
 Sun, 22 Mar 2020 09:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYL889zuXgDhLE3SdwzC4idZ6tbe2oqXQRpZT2M6SrRbFg@mail.gmail.com>
 <CAP6exY+m7SGgkg1Ng7tzDU8m--vb4bg=Re_C3OX8jdPAZGn17w@mail.gmail.com>
 <20200322120911.70af403c@xps13>
 <CAP6exYJoQNHheoe0zr2yy+f+9SYEM2=ExE_A-TfTsRbhLpF7pA@mail.gmail.com>
In-Reply-To: <CAP6exYJoQNHheoe0zr2yy+f+9SYEM2=ExE_A-TfTsRbhLpF7pA@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Sun, 22 Mar 2020 09:00:25 -0700
Message-ID: <CAP6exYKa+AbhwTc8Kyi8qyLvN2FKuJ=_GQCKemn7O2YZo7Rz1g@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: add | as a separator after mtd-id
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_090037_620178_46EAF0A3 
X-CRM114-Status: GOOD (  24.19  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

YWggbnZtIGxvb2tlZCBhIGJpdCBtb3JlIGF0IHRoZSBsaXN0IGFuZCBnb3QgbXkgYW5zd2VyIG9u
IHBhdGNoIHNlcmllcy4KCgpPbiBTdW4sIE1hciAyMiwgMjAyMCBhdCA4OjQyIEFNIHJvbiBtaW5u
aWNoIDxybWlubmljaEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSSBhZ3JlZSB3aXRoIHlvdSBvbiBj
aGFuZ2luZyB0aGUgUENJIGRyaXZlciBuYW1lLCBhcyBvcHBvc2VkIHRvIHRoaXMKPiBjaGFuZ2Uu
IEkgZG9uJ3QgbGlrZSAnfCcgdmVyeSBtdWNoIGVpdGhlci4KPgo+IEkgYW0gdGhpbmtpbmcganVz
dCB0byBjaGFuZ2UgJzonIHRvICcuJywgZS5nLgo+IDAwMDA6MDA6MWYuMyAtPiAwMDAwLjAwLjFm
LjMKPgo+IEl0IGlzIGFuIGV4dHJlbWVseSBzaW1wbGUgY2hhbmdlIC0tICBhZGQgb25lIGZvciBs
b29wIGluIHRoZSBwY2kgbWFwCj4gY29kZSAtLSBhbmQgbm90aGluZyBlbHNlIG5lZWQgY2hhbmdl
Lgo+Cj4gSWYgdGhpcyBzb3VuZHMgZ29vZCB0byB5b3UsIEknbGwgc2VuZCBhIG5ldyAyLXBhdGNo
IHNlcmllcyB3aXRoIHRoYXQKPiBjaGFuZ2UgYW5kIHdpdGggdGhlIGludGVsLXNwaSBkcml2ZXIg
Y2hhbmdlZCB0byBzaG93IGhvdyBvbmUgY2FuIHVzZQo+IGNvbW1hbmQgbGluZSBwYXJ0aXRpb25p
bmc/Cj4KPiBBbHNvLCBhcyBJIGFtIGNvbWluZyBiYWNrIHRvIHRoaXMgYWZ0ZXIgYSB2ZXJ5IGxv
bmcgdGltZSwgaG93IGRvIHlvdQo+IGxpa2UgeW91ciBwYXRjaCBzZXJpZXMgdG8gbG9vaz8gSXQg
c2VlbXMgdGhlIGdpdCBjb21tYW5kIHRvIGdlbmVyYXRlCj4gdGhlc2UgY3JlYXRlcyAzIGZpbGVz
LCB0aGUgZmlyc3QgbnVtYmVyZWQgMCB3aXRoIG5vIGNvZGUgaW4gaXQuIE15Cj4gcmVhZGluZyBv
ZiB0aGUgZG9jcyBpbXBsaWVzIHNlbmRpbmcgdGhpcyBuby1jb2RlIGVtYWlsIGlzIG5vdCBhIGdv
b2QKPiBpZGVhPyBBbnkgcmVjb21tZW5kYXRpb25zIGhlcmU/Cj4KPiB0aGFua3MgdmVyeSBtdWNo
IGZvciB5b3VyIGNvbW1lbnQhCj4KPiByb24KPgo+IE9uIFN1biwgTWFyIDIyLCAyMDIwIGF0IDQ6
MDkgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGkgUm9uYWxkLAo+ID4KPiA+IHJvbiBtaW5uaWNoIDxybWlubmljaEBnbWFpbC5jb20+
IHdyb3RlIG9uIFNhdCwgMjEgTWFyIDIwMjAgMDg6NDQ6MDcKPiA+IC0wNzAwOgo+ID4KPiA+ID4g
QW55b25lPyBUaGlzIHdpbGwgYmUgZ29pbmcgaW50byB1c2UgYXQgR29vZ2xlIGludGVybmFsbHkg
YW5kIEknZCBsaWtlCj4gPiA+IHRvIGdldCBpdCB1cHN0cmVhbS4KPiA+ID4KPiA+ID4gVGhlIG9u
bHkgb3RoZXIgb3B0aW9uIHRoYXQgd291bGQgd29yayBpcyB0byB0YWtlIHRoZSBwY2ktZm9ybWF0
IG5hbWVzCj4gPiA+IGNyZWF0ZWQgYnkgaW50ZWwtc3BpLXBjaSB0aGF0IGhhdmUgOiBpbiB0aGVt
IGFuZCBjaGFuZ2UgdGhlIDogdG8gJy4nLgo+ID4gPiBJcyB0aGF0IG1vcmUgYWNjZXB0YWJsZT8K
PiA+Cj4gPiBPbmUgaW1wb3J0YW50IHRoaW5nIHRvIG5vdGU6IEJvb3Rsb2FkZXJzIHNoYXJlIHRo
ZSBzYW1lIG10ZHBhcnRzCj4gPiBkZWZpbml0aW9uIGFuZCBzaG91bGQgYmUgdXBkYXRlZCBpZiB3
ZSBkZWNpZGUgdG8gc3VwcG9ydCBhIG5ldwo+ID4gc2VwYXJhdG9yLiBVLWJvb3QgYW5kIEJhcmVi
b3ggYXQgbGVhc3QuCj4gPgo+ID4gSSB0aGluayBjaGFuZ2luZyBqdXN0IEludGVsJ3MgUENJIGRy
aXZlciBuYW1lIHdvdWxkIGJlIG11Y2ggbW9yZQo+ID4gcHJhY3RpY2FsIGZvciB1cyBiZWNhdXNl
IEkgZG9uJ3QgZmluZCB0aGUgJ3wnIHNlcGFyYXRvciBiZWluZwo+ID4gZGVzY3JpcHRpdmUgYXQg
YWxsLgo+ID4KPiA+IEhvd2V2ZXIsIEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBwb3NpdGlvbiBhbmQg
SSB3b3VsZCB3ZWxjb21lCj4gPiBSaWNoYXJkLCBWaWduZXNoLCBUdWRvciBhbmQgQm9yaXMnIHBv
aW50IG9mIHZpZXcuCj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
