Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1007C4332B
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A45020714
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urRz6w4K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOLElhn5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A45020714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8Wiyi2dR8E4ov3P0+GOU4DoSXP4Y50yQy5O7ej/o+I=; b=urRz6w4KJwl/Je
	m52IVOeCrjAIgdIlacCH8YsetgdzOqdpVMBbG1oD+aZCnRrKsojz6op55UwTFehyBdAAY2liH4Xl5
	hbksZh667lTQej39fdFNsIU0EuhByD7C7ivHefKH/PyPg0NNatbDjKP+rTios6ibQ5VvIpYLOiLTm
	gfifafDG6CwHgnsoWzcgt73F9YDVT4/LiigPUETqvxOLDM+xVZ2aCSrDivHU6nRjts97esQ3riVAU
	RklORE9axEsM9F2kPPGdtzmL1p7k4ebe5uDVFePFwJEvJowCaG5d/LOtMK704uL5mU1xlqdDK0oIu
	8DS5PWs9iwPWbOpaTYXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG2k2-0000E2-Tp; Sun, 22 Mar 2020 15:42:22 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG2k0-0000Dc-9t
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 15:42:21 +0000
Received: by mail-oi1-x241.google.com with SMTP id y71so12099754oia.7
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2020 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fy/wboDUlhDhPaDDMrlfQsrSIBMKEb0KXSC0Jr2VvJ4=;
 b=hOLElhn5x55QKWPWBb1OoTpBn6nhQqgougTzDJpNIdJGor+ppmWiwUlmHG6pcBPZtH
 l6VzfE4fO4+Xyjvtf2NWVc4d2AGmnYFZwlN/c9Q2lGtOygaqO41EWF6Rjm4ytWT1W4z0
 WRPjxTNbHk9TU2oGVsmfmPLGyDIFbQyCBwoHdfc1a/IkF0l0l4ruGA7ruZngPfaWOqn2
 bwXoS8SVlaFTlbbqCAFNAwGFQm9OLvjjiX4hrsSjzqjSHjrzJ4gXPJopIBobRfNKcJ8R
 ofx4LL5QWmgUH243cYCSBbIPCHr805BqEWEHMKCGQsjFB3ynpc6ckqHf7wnO2oSNglqw
 ygUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fy/wboDUlhDhPaDDMrlfQsrSIBMKEb0KXSC0Jr2VvJ4=;
 b=e6UC+si3LVhVJc6Cft268yn6ZBSj7GRb4LDDtN7ed206CZC3ppSgi+Jhcbryfpg8sP
 8Idj75zlNU+CgKXpZ0brRAJTWJgbOTRW6p4tzbWQLc7DTgb/NXLt62oqo55SzTRvCLUk
 jGrSs+K+t7/3cSue6DgDimWSMWIC/fpOk7mVXHJqYsB26E4D/neGNBxwhH/jd73iGFr6
 jn4yXXEiBezchhb3ibunUurr5f/BgESsE6GEUt1yFI0fZG0eXS4i0MnkUsovM62/vPmi
 q0De2IqIqplyOUZdF3ow+nmBE9I56V3QuqZUrpod+1P13lSpdN9zAuXyKGFu4JKlaS/3
 phSw==
X-Gm-Message-State: ANhLgQ2yuiMQeufd+S6xMH2nTnlNLpzvT1OWcg0K0Gs4rNq5WqOhEvs4
 J2rXZGRoFk1oja5+dLOzwhPqYwR6zmA8pAV/OOI=
X-Google-Smtp-Source: ADFU+vsTuyH7fh9vnN6AUSPYSeIO63vkwEX4Fkie2mLu0A8OddFVKtfV61U0pnSa7VtFe7cVEPv28VR1cnTmZHquOUY=
X-Received: by 2002:aca:5d8a:: with SMTP id
 r132mr12507047oib.129.1584891738500; 
 Sun, 22 Mar 2020 08:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYL889zuXgDhLE3SdwzC4idZ6tbe2oqXQRpZT2M6SrRbFg@mail.gmail.com>
 <CAP6exY+m7SGgkg1Ng7tzDU8m--vb4bg=Re_C3OX8jdPAZGn17w@mail.gmail.com>
 <20200322120911.70af403c@xps13>
In-Reply-To: <20200322120911.70af403c@xps13>
From: ron minnich <rminnich@gmail.com>
Date: Sun, 22 Mar 2020 08:42:07 -0700
Message-ID: <CAP6exYJoQNHheoe0zr2yy+f+9SYEM2=ExE_A-TfTsRbhLpF7pA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: add | as a separator after mtd-id
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_084220_368869_AF4DFC30 
X-CRM114-Status: GOOD (  17.74  )
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

SSBhZ3JlZSB3aXRoIHlvdSBvbiBjaGFuZ2luZyB0aGUgUENJIGRyaXZlciBuYW1lLCBhcyBvcHBv
c2VkIHRvIHRoaXMKY2hhbmdlLiBJIGRvbid0IGxpa2UgJ3wnIHZlcnkgbXVjaCBlaXRoZXIuCgpJ
IGFtIHRoaW5raW5nIGp1c3QgdG8gY2hhbmdlICc6JyB0byAnLicsIGUuZy4KMDAwMDowMDoxZi4z
IC0+IDAwMDAuMDAuMWYuMwoKSXQgaXMgYW4gZXh0cmVtZWx5IHNpbXBsZSBjaGFuZ2UgLS0gIGFk
ZCBvbmUgZm9yIGxvb3AgaW4gdGhlIHBjaSBtYXAKY29kZSAtLSBhbmQgbm90aGluZyBlbHNlIG5l
ZWQgY2hhbmdlLgoKSWYgdGhpcyBzb3VuZHMgZ29vZCB0byB5b3UsIEknbGwgc2VuZCBhIG5ldyAy
LXBhdGNoIHNlcmllcyB3aXRoIHRoYXQKY2hhbmdlIGFuZCB3aXRoIHRoZSBpbnRlbC1zcGkgZHJp
dmVyIGNoYW5nZWQgdG8gc2hvdyBob3cgb25lIGNhbiB1c2UKY29tbWFuZCBsaW5lIHBhcnRpdGlv
bmluZz8KCkFsc28sIGFzIEkgYW0gY29taW5nIGJhY2sgdG8gdGhpcyBhZnRlciBhIHZlcnkgbG9u
ZyB0aW1lLCBob3cgZG8geW91Cmxpa2UgeW91ciBwYXRjaCBzZXJpZXMgdG8gbG9vaz8gSXQgc2Vl
bXMgdGhlIGdpdCBjb21tYW5kIHRvIGdlbmVyYXRlCnRoZXNlIGNyZWF0ZXMgMyBmaWxlcywgdGhl
IGZpcnN0IG51bWJlcmVkIDAgd2l0aCBubyBjb2RlIGluIGl0LiBNeQpyZWFkaW5nIG9mIHRoZSBk
b2NzIGltcGxpZXMgc2VuZGluZyB0aGlzIG5vLWNvZGUgZW1haWwgaXMgbm90IGEgZ29vZAppZGVh
PyBBbnkgcmVjb21tZW5kYXRpb25zIGhlcmU/Cgp0aGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIGNv
bW1lbnQhCgpyb24KCk9uIFN1biwgTWFyIDIyLCAyMDIwIGF0IDQ6MDkgQU0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb25hbGQsCj4KPiBy
b24gbWlubmljaCA8cm1pbm5pY2hAZ21haWwuY29tPiB3cm90ZSBvbiBTYXQsIDIxIE1hciAyMDIw
IDA4OjQ0OjA3Cj4gLTA3MDA6Cj4KPiA+IEFueW9uZT8gVGhpcyB3aWxsIGJlIGdvaW5nIGludG8g
dXNlIGF0IEdvb2dsZSBpbnRlcm5hbGx5IGFuZCBJJ2QgbGlrZQo+ID4gdG8gZ2V0IGl0IHVwc3Ry
ZWFtLgo+ID4KPiA+IFRoZSBvbmx5IG90aGVyIG9wdGlvbiB0aGF0IHdvdWxkIHdvcmsgaXMgdG8g
dGFrZSB0aGUgcGNpLWZvcm1hdCBuYW1lcwo+ID4gY3JlYXRlZCBieSBpbnRlbC1zcGktcGNpIHRo
YXQgaGF2ZSA6IGluIHRoZW0gYW5kIGNoYW5nZSB0aGUgOiB0byAnLicuCj4gPiBJcyB0aGF0IG1v
cmUgYWNjZXB0YWJsZT8KPgo+IE9uZSBpbXBvcnRhbnQgdGhpbmcgdG8gbm90ZTogQm9vdGxvYWRl
cnMgc2hhcmUgdGhlIHNhbWUgbXRkcGFydHMKPiBkZWZpbml0aW9uIGFuZCBzaG91bGQgYmUgdXBk
YXRlZCBpZiB3ZSBkZWNpZGUgdG8gc3VwcG9ydCBhIG5ldwo+IHNlcGFyYXRvci4gVS1ib290IGFu
ZCBCYXJlYm94IGF0IGxlYXN0Lgo+Cj4gSSB0aGluayBjaGFuZ2luZyBqdXN0IEludGVsJ3MgUENJ
IGRyaXZlciBuYW1lIHdvdWxkIGJlIG11Y2ggbW9yZQo+IHByYWN0aWNhbCBmb3IgdXMgYmVjYXVz
ZSBJIGRvbid0IGZpbmQgdGhlICd8JyBzZXBhcmF0b3IgYmVpbmcKPiBkZXNjcmlwdGl2ZSBhdCBh
bGwuCj4KPiBIb3dldmVyLCBJIGRvbid0IGhhdmUgYSBzdHJvbmcgcG9zaXRpb24gYW5kIEkgd291
bGQgd2VsY29tZQo+IFJpY2hhcmQsIFZpZ25lc2gsIFR1ZG9yIGFuZCBCb3JpcycgcG9pbnQgb2Yg
dmlldy4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
