Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555B7C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 17:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238AC2072F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 17:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZXEyl1j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyN/Gm00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238AC2072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWQt5Jq3qihppcFs7gqlnP9VKaBSiSxyTUYg7xw2Am8=; b=nZXEyl1j4jW//w
	lg1TVouS+mnCa7b8nZTkJxHpHh4kTOE0K1elLV8c50LCovMPaOCAvlIPLo1L38g+VZDvT8pIoVEPd
	9rQ6ICPj91sCN6EfayHTS02BvalxSTPdE/wXoac/7oyXBDhtIAKMqMQDoXzK6Kp78qaTvfXxLNKs4
	9jKxf1jW0UvonKzygysHcAg6tYYLIN6MyLJPYvCx+2LiiwUEME+Gsu7LFMzIV7TM3Oa1lcO2dVcAi
	NgLbNqURA5ps+5xG/9W5N/qTU6tmTkxwsrILkIP2/ZRzpAzARMPn7KlPpta/PsTAQG9w73IXiHO7W
	zWHUd6jHaVUdt5hKACmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHsQq-0002Tm-EO; Fri, 27 Mar 2020 17:06:08 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHsQm-0002TQ-Nb
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 17:06:06 +0000
Received: by mail-ot1-x342.google.com with SMTP id j16so10500208otl.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2020 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ix9zSdrMY9kR4wVtNcy6g4Fv3xrJkv/wp1J6jdq8Q94=;
 b=oyN/Gm006TUykTBZt3J4QPRvaioYlgo+oMCza4IHg8vL8LFnM+NAg4QhN1RkT8lIF5
 LMPnX2TCWyREz3klLdHbQqbnkP2vD+b0ppDtiDqSg35XYVRxz2ERL2T9UL6U4BNQicw8
 vbVWn+5EBaeT4qwlPM/GtWikkWMIUN0E8MhYqw3KY1O6xD3grn3gSryo1WW/8WLiGHX/
 7KIhgR2EWqUb3HwJ9QWqwuuCIsp8uSZyVpcA39ae0GAbQT0DTpLhyGo0AWmbA1IylyxL
 d+yiIjU7RZyYt82hePiC+txFytfgTnyjs95QOEEPuuVxIcj5EKSGxN7+uC1+Xza54gsi
 JuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ix9zSdrMY9kR4wVtNcy6g4Fv3xrJkv/wp1J6jdq8Q94=;
 b=DzF028EczjuIr884nrzHZLkz9PKIJ3K0JkuX8oFLlzGGfUhbHkK5n4f9K8oVUMwC23
 N7xbIsoz7agT5p7ixhAn5MatIp0e9bgC3w4EBHpePa5lM0/rh/FYyC1XCsx4L1tW7/fb
 5QSX1b3jtLaK9k5hK091R4osZNmf+28L4TsyixNPXSJX5vle96gq+qMYzqPSVfqlqf/G
 zbzZtZglxTXjsV7f4/b41niTbXkBlrPncwfFb09YBe+yItj7HUv1ku0tBhWT1nAubka/
 Y1ZvDNQdvhPSCCg9qCXNt/+67Rknpkqtqeh4vuwOmHJlh7oMftaksHHI47DBk3QSrQKh
 L4mw==
X-Gm-Message-State: ANhLgQ2S5o6cK3hJBH9AeSc7+JXxkWpP46PiP27JcG/UTEMKN+0QX0Wx
 z1CyznoT3l3UCfIbGi60lDAWT4QKoIzkOqDNd5M=
X-Google-Smtp-Source: ADFU+vvlYWEjc2RCJfQQY54317rrqXOw1YrRVGEZ0KXiSpEfRAtLUF+5uQHCg9Blw1jG/MRdPIIGtiMwucnB+CjTMhE=
X-Received: by 2002:a9d:414:: with SMTP id 20mr11314990otc.300.1585328763631; 
 Fri, 27 Mar 2020 10:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
In-Reply-To: <20200327175238.784cf47c@xps13>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Mar 2020 10:05:52 -0700
Message-ID: <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_100604_766315_DDC34472 
X-CRM114-Status: GOOD (  22.80  )
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSBkaWQgdHJ5IHRoZSBcIHRoaW5nIGJ1dCBmb3VuZCBpdCBhIGJpdCB0cmlja3kgdG8gd29yayB3
aXRoLCB3aXRoCmxvdHMgb2YgcG90ZW50aWFsIGZvciBzaW1wbGUgZXJyb3JzLgoKSXQgd291bGQg
cmVxdWlyZSBjbWRsaW5lcyBsaWtlIHRoaXMKbXRkcGFydHM9MDAwMFw6MDBcOjAuMWY6ZXRjZXRj
CgpBIGxvdCBvZiB0aGVzZSBtdGRwYXJ0cyBkZWZpbml0aW9ucyBhcmUgcHJvZHVjZWQgYnkgc2Ny
aXB0cyBhbmQKTWFrZWZpbGVzIGFuZCB0aGVyZSBhcmUgbWFueSwgbWFueSBwbGFjZXMgd2hlcmUg
XFwgaGF2ZSBhIHdheSBvZgp2YW5pc2hpbmcuCgpXZSB0YWxrZWQgaGVyZSBhYm91dCBhbiBvcHRp
b24gd2hlcmUgdGhlIG5hbWUgd291bGQgYmUgaW4gcGFyZW5zIG9yIGJyYWNrZXRzOgptdGRwYXJ0
cz0oMDA6MDA6MC4wKTpldGNldGMKCndoaWNoIEkgdGhpbmsgbG9va3MgYSBsb3QgbmljZXIgYnV0
IGFuZCBsZWF2ZXMgcm9vbSBmb3IgZ3Jvd3RoLCB3aGVyZQppbiBhIGZldyB5ZWFycyBzb21lIG90
aGVyIHN0cmFuZ2UgbmFtZSBjb21lcyBhbG9uZyB0aGF0IG1pZ2h0IGJyZWFrCm91ciBydWxlcy4g
KCkgYW55b25lPwoKQW5vdGhlciBwcm9ibGVtIGlzLCB0aGUgbmFtZSBtYXRjaGluZyBpcyBhIHN0
cmNtcC4gVGhlcmUncyBubwpzZW1hbnRpY3MgaW4gdGhlIG5hbWVzLiBTbyB3aGVyZSwgdGVjaG5p
Y2FsbHksIHRoZXNlICBQQ0kgYWRkcmVzc2VzCmFyZSB0aGUgc2FtZToKMWYuMyBhbmQgMDoxZi4z
IGFuZCAgMDowOjFmLjMgYW5kICAwMDAwOjAwOjFmLjMKdGhlIHN0cmNtcCB3b3VsZCBmYWlsIGJl
dHdlZW4gMWYuMyBhbmQgMDAwMDowMDoxZi4zIC0tIGJ1dCB0aGV5J3JlIHRoZSBzYW1lLgoKVGhp
cyBtZWFucyB0aGF0IHRoZSBQQ0kgbmFtZXMgbXVzdCBiZSBzdHJvbmdseSBzdHJ1Y3R1cmVkOiB0
aGV5IG11c3QKZm9sbG93IHRoZSBydWxlcyBzdWNoIHRoYXQgdGhlIDogYW5kIC4gb2NjdXIgaW4g
YSBmaXhlZCBwbGFjZSBpbiB0aGUKc3RyaW5nLCBtZWFuaW5nIGRldGVybWluaW5nIHRoYXQgYSBz
dHJpbmcgaXMgYSBQQ0kgVEJERiBpcyByZWxhdGl2ZWx5CnNpbXBsZS4KClNvIEkga2VlcCBjb21p
bmcgYmFjayB0byB0aGUgc2ltcGxlICJuYW1lIG1hdGNoZXMgcGF0dGVybiAqKioqOioqOiouKgoo
d2hlcmUgKiBtZWFucyBhbnkgY2hhcikgLS0gaXQncyBhIFBDSSBhZGRyZXNzIiBhcyBtYXliZSB0
aGUgZWFzaWVzdAp0aGluZyB0byBkby4KQnV0IHBvc3NpYmx5IHRoZSAoKSBhcmUgdGhlIGJlc3Qg
ZnV0dXJlLXByb29maW5nLiBJIHJlYWxseSBhbSBub3QgYSBmYW4gb2YgXC4KCnJvbgoKT24gRnJp
LCBNYXIgMjcsIDIwMjAgYXQgOTo1MiBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1pa2EsCj4KPiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eu
d2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlIG9uIEZyaSwgMjcgTWFyCj4gMjAyMCAx
ODo0ODowMiArMDIwMDoKPgo+ID4gT24gRnJpLCBNYXIgMjcsIDIwMjAgYXQgMDU6MTk6MDdQTSAr
MDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+ID4gSGkgTWlrYSwKPiA+ID4KPiA+ID4gTWlr
YSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tPiB3cm90ZSBvbiBG
cmksIDI3IE1hcgo+ID4gPiAyMDIwIDE3OjU2OjA4ICswMjAwOgo+ID4gPgo+ID4gPiA+IEhpLAo+
ID4gPiA+Cj4gPiA+ID4gSSBkb24ndCB0aGluayBpdCBpcyBnb29kIGlkZWEgdG8gY2hhbmdlIFBD
SSBkZXZpY2UgbmFtZSBsaWtlIHRoYXQuCj4gPiA+ID4KPiA+ID4gPiBJbnN0ZWFkIHRoZSBNVEQg
Y21kbGluZSBwYXJzZXIgc2hvdWxkIGJlIHRlYWNoIHRvIGhhbmRsZSBuYW1lcyBsaWtlIHRoaXMK
PiA+ID4gPiBwcm9wZXJseS4KPiA+ID4KPiA+ID4gSXQgaXMgYSBiaXQgbW9yZSBjb21wbGljYXRl
ZCB0aGFuIHRoYXQgc2luY2UgcGFyc2VycyBoYXZlIGJlZW4gdXNpbmcKPiA+ID4gdGhpcyBzeW50
YXggZm9yIGEgbG9uZyB0aW1lIGFuZCwgbW9yZSBpbXBvcnRhbnRseSwgaXQgbWVhbnMKPiA+ID4g
cG90ZW50aWFsbHkgdXBkYXRpbmcgYWxsIGJvb3Rsb2FkZXJzLgo+ID4gPgo+ID4gPiBJIGFtIG5v
dCBhZ2FpbnN0IHVwZGF0aW5nIHRoZSBwYXJzZXIsIGJ1dCB0aGUgcy86L3wvIHNvbHV0aW9uIHBy
b3Bvc2VkCj4gPiA+IGJlZm9yZSBpcyByYXRoZXIgdW5kZXNjcmlwdGl2ZSBhbmQgaXQgaXMgaGFy
ZCB0byBmaW5kIGFuIGFsdGVybmF0aXZlCj4gPiA+IGNoYXJhY3RlciB0aGF0IHdvdWxkIGhhdmUg
YSBtZWFuaW5nIGhlcmUuCj4gPgo+ID4gSSdtIGNvbXBsZXRlbHkgdW5mYW1pbGlhciB3aXRoIHRo
ZXNlIGJ1dCB3b3VsZCBlc2NhcGUgY2hhciB3b3JrIGhlcmU/IEkKPiA+IG1lYW4gaWYgeW91IHdh
bnQgIjoiIHRvIGJlIHBhcnNlZCBsaXRlcmFsbHkgdGhlbiB5b3UgcGFzcyAiXDoiIGluIHRoZQo+
ID4gY29tbWFuZCBsaW5lLiBUaGF0IHNob3VsZCB3b3JrIHdpdGggdGhlIGV4aXN0aW5nIGFuZCBh
bHNvIGFsbG93Cj4gPiBzdXBwb3J0aW5nIFNQSSBOT1IgY29udHJvbGxlcnMgb24gUENJIGJ1cy4K
Pgo+IFdlIHdvdWxkIHN0aWxsIGhhdmUgdG8gdXBkYXRlIGJvb3Rsb2FkZXJzIGNvZGUgYnV0IHRo
YXQgd291bGQgYmUgZWFzeQo+IHRvIGhhbmRsZS4gVGhlIGxvZ2ljIGJlaW5nICJzZWFyY2ggZm9y
IHRoZSBuZXh0ICc6Jywgd2hlbiB5b3UgaGF2ZSBvbmUKPiBjaGVjayBpZiB0aGVyZSBpcyBhICdc
JyBpbiBmcm9udCBvZiBpdC4gSWYgeWVzLCBzZWFyY2ggYWdhaW4iLiBXaHkKPiBub3QuLi4gVGhp
cyBhbHNvIG1lYW5zIHJlY29uc3RydWN0aW5nIHRoZSBuYW1lIGJ5IGRyb3BwaW5nIG1hbnVhbGx5
IHRoZQo+IGFkZGl0aW9uYWwgJ1wnIGluIExpbnV4Lgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
