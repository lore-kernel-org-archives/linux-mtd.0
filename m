Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1015AC47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 17:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D51D22084D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 17:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXDAAyKa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8nJut5v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D51D22084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qa00cNP5OVi/m5ej0f03HduHqVNPNFw3rDY/DiujoA=; b=QXDAAyKaQ1dNIO
	Boj8H/5Uk5eScOjbPlE8AU3XgEio3DogzHQ6YpsbKjviwb6Ty6JsJU6RAamr5eoe1WC4xtWpxKaWK
	ZBb1FX1qm2WV5JOPVYziHdzkoNlzioJ8gYAP5ypUzYDNbkDO/j7AYDoQplhYqi36iNxetl66ewKJO
	0ANaC/wRsYR+zihd9aKFHt2tK8JQV5QppSQOMphg53NWFMLt8UTT0QZj1LzXsBHHXBZMTfP2sIREv
	pENmXpBRSoagcyd5M9ySG/IgLcgoF3Vy+fE+F71LKJDQMvQNXjO0z264f81XPWZgnLf5VOA0rS9LA
	7PGuxjFZLj69l0xCmssQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGRFr-0001yo-0I; Fri, 04 Oct 2019 17:20:35 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGRFo-0001yL-Tx
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 17:20:34 +0000
Received: by mail-io1-xd44.google.com with SMTP id q10so15235737iop.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2019 10:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sKSw8LHZWbzHBzhBHzIOue57k2GC5Z1ZStIkEWKfwgk=;
 b=H8nJut5vMkDRbQ9IMz8Sz2DcHe4QqerOmNEZ82FANGu9ZivVe/t4xGYoF6I9nLVwD7
 RR8V+7CPA2Y+VP+3wAElS4y9hZu7YTTvaw1t+cjyFpGzAd71HMx7+ehjTXW33GBnOh3O
 /rGnNXmfNg3RQnvHEOff7bHYgiKEjXxibgufvwO4jnTJYdFsZH8TmUyINqDNFuGQ9IUq
 hoRQcy32Nv/S5z/SRkd4gbd1RpNOrSpOZXiWk8HaHbUHXqvuZJhvQxdpXZGrm+JMqreg
 jRT6D0AKj9AbqSt2/vRYYN+zuG13++ESvIXV503LB/YCKzEVnkD2ona1uEXFNkKeZrlk
 brZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sKSw8LHZWbzHBzhBHzIOue57k2GC5Z1ZStIkEWKfwgk=;
 b=gsYFNmghAPuwLRDrCdqwUUBCISDxbQ+LD314x47pAicrUMDYpsi1B/hEeixf/Tx2N+
 gVXnVdyPxnN4atcCkkFTQkaNPE7HwqxtCJQtTghx1HCoLT9Uqi6385OyHi0fWl6LvzCl
 xClE5qvmPkzit1yWWKq/q/6YIkoZ6VstjECoxVMTw1/FBqwde8282Q3Z+qpVK0jskWeR
 eX/TXFq0rYlXzf0liXuhtjeKvB20O54GY+GjKUE3OrIdoArypxwwFj/KyZ/UHYT97jPe
 aTc1679Z+ZDBOFYpkPQUpPulWdqMbifd6Co9qjYIZSUJwzgBn0i/R1c3wVWy7Q4JTXFG
 49nA==
X-Gm-Message-State: APjAAAURSinmw325xUQwCdNKFeCZp83yioIvZJ5frrQvCJDkis2Tk6Go
 wUADIIKjzrw6YW5eWsg2NddNSh9Z8lpbLMZip+A=
X-Google-Smtp-Source: APXvYqzAxM+PiltX2TIBjv/ydm3UZ3bSSprb2UNGgPoDAaW9AZlWIyu5QGysW701lNcNQYSychifgmrLEaiO6SabKUI=
X-Received: by 2002:a92:b112:: with SMTP id t18mr16647383ilh.252.1570209631842; 
 Fri, 04 Oct 2019 10:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190925154302.17708-1-navid.emamdoost@gmail.com>
 <CAEkB2ETTmCsuOFDsJQ8LbBPHNgckpDFn2XhVePwAQEsCRsJo6g@mail.gmail.com>
 <20191004175740.5dd84c38@xps13>
In-Reply-To: <20191004175740.5dd84c38@xps13>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Fri, 4 Oct 2019 12:20:20 -0500
Message-ID: <CAEkB2ERissJF6EOhMtoO+RBXJOVnZYuMBnkvL2DxxMKfVJoYXQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: prevent memory leak in onenand_scan
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_102032_990847_F2A57F11 
X-CRM114-Status: GOOD (  16.89  )
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
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Navid Emamdoost <emamd001@umn.edu>, linux-mtd@lists.infradead.org,
 Stephen McCamant <smccaman@umn.edu>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmtzIE1pcXVlbCBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuIHYyIHdhcyBzZW50LgoKVGhhbmsg
eW91LApOYXZpZC4KCk9uIEZyaSwgT2N0IDQsIDIwMTkgYXQgMTA6NTcgQU0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBOYXZpZCwKPgo+IE5h
dmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAz
MCBTZXAgMjAxOQo+IDE2OjM3OjE3IC0wNTAwOgo+Cj4gPiBXb3VsZCB5b3UgcGxlYXNlIHRha2Ug
YSBsb29rIGF0IHRoaXMgcGF0Y2g/Cj4gPgo+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6
NDMgQU0gTmF2aWQgRW1hbWRvb3N0Cj4gPiA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEluIG9uZW5hbmRfc2NhbiBpZiBzY2FuX2JidCBmYWlscyB0aGUgYWxs
b2NhdGVkIGJ1ZmZlcnMgc2hvdWxkIGJlCj4gPiA+IHJlbGVhc2VkLgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIHwg
NSArKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29u
ZW5hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCj4g
PiA+IGluZGV4IDc3YmQzMmE2ODNlMS4uNzljMDFmNDI5MjVhIDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmMKPiA+ID4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCj4gPiA+IEBAIC0zOTc3LDggKzM5Nzcs
MTEgQEAgaW50IG9uZW5hbmRfc2NhbihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IG1heGNoaXBz
KQo+ID4gPiAgICAgICAgIHRoaXMtPmJhZGJsb2NrcG9zID0gT05FTkFORF9CQURCTE9DS19QT1M7
Cj4gPiA+Cj4gPiA+ICAgICAgICAgcmV0ID0gdGhpcy0+c2Nhbl9iYnQobXRkKTsKPiA+ID4gLSAg
ICAgICBpZiAoKCFGTEVYT05FTkFORCh0aGlzKSkgfHwgcmV0KQo+ID4gPiArICAgICAgIGlmICgo
IUZMRVhPTkVOQU5EKHRoaXMpKSB8fCByZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGtmcmVl
KHRoaXMtPnBhZ2VfYnVmKTsKPgo+IEFwcGFyZW50bHkgeW91IG1pc3NlZDoKPgo+ICNpZmRlZiBD
T05GSUdfTVREX09ORU5BTkRfVkVSSUZZX1dSSVRFCj4gICAgICAgICBrZnJlZSh0aGlzLT52ZXJp
ZnlfYnVmKTsKPiAjZW5kaWYKPgo+ID4gPiArICAgICAgICAgICAgICAga2ZyZWUodGhpcy0+b29i
X2J1Zik7Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiArICAgICAgIH0K
PiA+ID4KPiA+ID4gICAgICAgICAvKiBDaGFuZ2UgRmxleC1PbmVOQU5EIGJvdW5kYXJpZXMgaWYg
cmVxdWlyZWQgKi8KPiA+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYX0RJRVM7IGkrKykK
PiA+ID4gLS0KPiA+ID4gMi4xNy4xCj4gPiA+Cj4gPgo+ID4KPgo+IFRoYW5rcywKPiBNaXF1w6hs
CgoKCi0tIApOYXZpZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
