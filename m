Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573EAC433E4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 15:16:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22FD220672
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 15:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oofz6u+2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22FD220672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Su75c/yf5xCWNvjfaxCFkTvtrDoGMXqFkiP28+2xlbI=; b=oofz6u+2z3FeIq3WpQpKhItU7
	aMn+ishdchakukv2iBkSuTh/1YSXNMzkyh+WeDOsUQPdbGzQrOz9ZH2tEbaW3MlQfTIm3JGLOd4Zw
	BMxBdBzK+seMz5v0Zi5+ah1EgIoRvhqwZa3MEE7AgQY5e+PO5JrPtQBdOyAuhlrbhs+iDTmTbUpb3
	P2pcU586dBzKGKUl2JriENTsJ6xq4glh1w1txWOWFr9fJWEN4xhWz9GIpiRWBIKws0hGzpnrPbfsn
	gpH++ADP+cU32ETa6y0NsusMtav6Yw2urCe7xka1GX34igBFxjpXzPUfD/jwx+vg0KvfYP5i1ZS/T
	xIX+WhFEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k04rF-0006ai-TB; Mon, 27 Jul 2020 15:16:05 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k04r9-0006a7-9g
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 15:16:00 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MelWf-1kYJ4w1ezd-00al88 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul
 2020 17:15:55 +0200
Received: by mail-qv1-f51.google.com with SMTP id l13so1260962qvt.10
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2020 08:15:53 -0700 (PDT)
X-Gm-Message-State: AOAM532jRb/nr0gM1nBcwpkScIcJy/iVGjcLSC3rx1gX74caoe45nzPY
 tWZ2gBV8lO/BYx7pwCZpWHId6PRSWf1efKmyXGw=
X-Google-Smtp-Source: ABdhPJz8JYqQMrxytjrFJZ6So17u6EFfd3xP72JlJzwExdG83wSW6pg2ww44Y8DvCC/6WlC7KCmUOokvY6zbG6c7byE=
X-Received: by 2002:ad4:4c09:: with SMTP id bz9mr21830645qvb.210.1595862953011; 
 Mon, 27 Jul 2020 08:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
In-Reply-To: <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 17:15:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
Message-ID: <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Daniel Gutson <daniel@eclypsium.com>
X-Provags-ID: V03:K1:oX2oUzFkQWkQC8tSAdnTv9krh/fidMIKfcPvPTc/sTtxs4zGkST
 mJqTl9hX9y6/wb8ZKUc3d4LQfOWdqrDXwFLUZiJ317r1SNfmRGWzbrBfohjjj60reBilnN8
 2jqRBOR5MrlprLeR+FsVD/ClX/EfwAketGKWA2cVFUa9lrW2bp8S1UFIvvhrmkjPXPULZOU
 YUdsmBfezr3zl9dz4By7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fciSxGoXqK8=:uIJmo5/UsGaf38odET8qXw
 0qokl9/o6V9st4l3ERWyFZGG3qx3zQpEJrE8/3uuaVHKevTJFODlDAjNC8CI6tzGFWfegfQZG
 9G2NcgKOtKO4YxS9nLUSdRHgMYcb4zJIYwhCxPI//BiWlWtAs/nRHUjIYRjql88NVxW3EHAGr
 /RZnCNrpDHgZUOWSkO+cj1Mq5s9+40aEZ0oEnYbtA2OBGAf3ErQJavB3HXmZa9cDUmL5So9hH
 Jq12/VmfeyF4wtzp1Iu1nPhM9ErfH4I2eVjvIIqktYQYoMTtorBgHOyiNfG26thDsazRAXr4w
 rN3SChE5StWUzYpBBNjghzvusKZyRvG8LTmTONJtw2jSDpTYEEwW5ZI++1hVRND8qjfBbriAA
 8wijs6n5NQa3noxzexUOQyn6F9zA40JlUB1SiJfKELlWY+gFVCB5YinQkK5af4sUN9XFFDx6/
 N/cU4LNct+HZu1gpA0EzN67Z+C2gzxs78ylAbWmEAPatJY/BcvgEbJVg+lADZWubDi9knsklS
 eBPLeq6gUOpTqQWFilJx9S+6my0NwGVnLNBAs9VvmPvEEW3dFzzdyToKPIZ0WbiRUUD3FZ+pa
 lqqo96LtgM+ZtsJlDzR4GMaRiemAfMXvr4fPtzz5y5YD+ocjtq3IICOOeEkiaXugdVCLqPDul
 SEVh4AuZMZ6dqdOwq8Y4lpRaXyGj/Xi8tjKdeLlluEgRYxSsQ3B2Fw908ZBIsrCucCq+mevDQ
 82ce1px//SNB1uMXx45sV/s8dEntQR3/a797YMldfVfUreCefTrlh3QKFGZEDScLZJif+xMs4
 8gYH85RN+Fdw3Jdt25t+G0qbKdoHgMNwtrsMwA+Bal2szpjwIx62WVY/UG8UHAYESsR7ehnRT
 29PE9L5TSh8gi8J2a9qF/qDjJ22uAI1iJwycTES9squZCEnpxAe0gvlImzoLq73Kzr91leRXe
 SAXYM9PUdn8KWYW0nYXxYnrLYjczdY6btdC4W8q0cj3TnjH2IuWxM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_111559_543949_3F0937FF 
X-CRM114-Status: GOOD (  17.35  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgNTowNSBQTSBEYW5pZWwgR3V0c29uIDxkYW5pZWxAZWNs
eXBzaXVtLmNvbT4gd3JvdGU6Cj4gT24gU3VuLCBKdWwgMjYsIDIwMjAgYXQgNDoxNyBBTSBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPj4KPj4g
T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMDI6MjA6MDNQTSAtMDMwMCwgRGFuaWVsIEd1dHNvbiB3
cm90ZToKPj4gPiBFbCBzw6FiLiwgMjUganVsLiAyMDIwIDI6NTYgYS4gbS4sIEdyZWcgS3JvYWgt
SGFydG1hbiA8Cj4+ID4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IGVzY3JpYmnDszoKPj4g
Pgo+PiA+Cj4+ID4gMSkgSSBqdXN0IGRpZCB0aGUgc2FtZSB0aGF0IGludGVsLXNwaS5jIGRvZXMu
Cj4+Cj4+IE5vIG5lZWQgdG8gY29weSBiYWQgZXhhbXBsZXMgOikKPgo+Cj4gRGlkbid0IGtub3cg
aXQgd2FzIGEgYmFkIGV4YW1wbGUuIFdoYXQncyBpcyB0aGUgY3VycmVudCBtb2Rlcm4gbWVjaGFu
aXNtIHRoYXQgcmVwbGFjZXMgaW5pdGlhbGl6YXRpb24tdGltZSBjb25maWd1cmF0aW9uPwoKSSdk
IHNheSB5b3UnZCBnZW5lcmFsbHkgd2FudCB0aGlzIHRvIGJlIGEgcGVyLWluc3RhbmNlIHNldHRp
bmcsIHdoaWNoCmNvdWxkIGJlIGEgc3lzZnMgYXR0cmlidXRlIG9mIHRoZSBwaHlzaWNhbCBkZXZp
Y2UsIG9yIGFuIGlvY3RsIGZvciBhbgpleGlzdGluZyB1c2VyIHNwYWNlIGFic3RyYWN0aW9uLgoK
SW4gdGhlIGNoYW5nZWxvZywgeW91IHNob3VsZCBhbHNvIGV4cGxhaW4gd2hhdCB0aGlzIGlzIHVz
ZWQgZm9yLiBEbwp5b3UgYWN0dWFsbHkgd2FudCB0byB3cml0ZSB0byBhIGRldmljZSB0aGF0IGlz
IG1hcmtlZCByZWFkLW9ubHksIG9yCmFyZSB5b3UganVzdCB0cnlpbmcgdG8gbWFrZSB0aGUgaW50
ZXJmYWNlIG1vcmUgY29uc2lzdGVudCBiZXR3ZWVuIHRoZQp0d28gZHJpdmVycz8KCiAgICAgQXJu
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
