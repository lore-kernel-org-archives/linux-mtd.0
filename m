Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6761FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:28:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 333F4206CD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5uZbjyD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjHjc/P7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 333F4206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=csGffYB3TjJ2AGjVEBuBd8SM0wetnSbEbMogjb6vTxQ=; b=G5uZbjyDxa+d2U4aB7+i8EPvN
	17BMr/jhNznIu7RlBi2i+Foc4WdyB4MC60cJf4cKP/Wnam0Ruy9vASiPqzKM9z985SZSyuDkhY7Pp
	LRbjaIiY7Dy/bXrk4u1nm/o6rreMdfsm8SfJyXJMxc/NS+jCNUzZmnFhNZ5UA6Uq21rMIDS+jp/WE
	gPJjtpQzHF5F1T6otp16C3exJJPcQeP/AnR9EGluOl2o0GL73UIFJZ9iEKCQGFCvNO9tkgA2IB7Dq
	jPBrc44DybyqYDAuECdR+DHRO7J2l3xu/fUSA6qru+xf0Mj+N3PSAXtoxN1R/uBmAavaCLZg2aitR
	vYXPZFv/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslkp-0004ji-4r; Tue, 07 Jul 2020 11:27:15 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslkm-0004ic-K2
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 11:27:13 +0000
Received: by mail-qt1-x842.google.com with SMTP id w34so11338893qte.1
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2020 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S/3PCAPfoxjGBDIjaZGp6+CalyT9Vs4Hs7aWN08fHIU=;
 b=NjHjc/P7fmDgZed8pANwRNAML3xmnqNssiiYmOrhnjV/bvIQ22gKhbyes5Vt/TSWmX
 qQLblKrx3BpyKYTO9NgM4eRsbRyTEv5NEWbMS+a08Vn3kxnEKk3+I0oZaaF0L2W422Nd
 gx4dX5ZMrSrbOxHKUbCTJq1x1YyD9N3O3OfWdq/1OvO0II6S5C1pkdyOnjKzH6W5OltO
 /Nfh5kPJn90NcSeCDEyPzBdV5EBoOXWZR6kzVNilIhYQ/B4jQBqnCn1v1XRQbztjT41A
 syamgNh4AEfLBlpDtx1aNud7umPUhdDCPx2r1geuWq0a6qE+UzBxulPRhiYpDgYRhicA
 DJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S/3PCAPfoxjGBDIjaZGp6+CalyT9Vs4Hs7aWN08fHIU=;
 b=dbrXFbJHcAHj1j8iVF30hdiKYtsBIM48TDnln+Bemw5P50LrtiL6vaDpLS26HP1kIP
 iDRu5OUva/J5nxEZJCbRsD0/G+VI9keqLB5V/gqI6keRoVyFb2QJ1CfKunDUiSdllu9h
 dBI3pOJgJQPtkbdsVfCSS8wqfHGg9R6PLsKFIUE47rXRqYGfiOhEDWcillCAqRi5EPAI
 8/dJ5pI9ilOyLUWmW05XlRjg1QNL7srEdjFENqMWPvGoPKr1IIWCQoB9pHuIilRkWdWk
 B3+aL/ejOtjDL0VytXk5HkS/YquInt3nWt8xDO79RM0ZLujuoOoLDjkySKhEp1cGv4f7
 iI9A==
X-Gm-Message-State: AOAM531IgBGAgrsRMmXXOhyN4LX3lSTzmjitydA5d2Y6WxjrkKGPx0I6
 eJGsnWPUFHlVPPan0/Rl44rt6rkHpCObBbp81Vw=
X-Google-Smtp-Source: ABdhPJzISarwTOC7dTcyKLSH3O194wGhx9+uJw36v4j6vyj/0MSpRT+hObOa20ibKb8uAg/xfOihvN2uV8eq+SFdv/Q=
X-Received: by 2002:aed:27c7:: with SMTP id m7mr55886324qtg.13.1594121229629; 
 Tue, 07 Jul 2020 04:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
In-Reply-To: <20200701112643.726986-1-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 7 Jul 2020 13:26:58 +0200
Message-ID: <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_072712_711677_2AEAF842 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMSwgMjAyMCBhdCAxOjI4IFBNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYSBwb3RlbnRpYWwgc3BhY2UgbGVhayBw
cm9ibGVtIHdoaWxlIGxpbmtpbmcgdG1wZmlsZSwgaW4gd2hpY2gKPiBjYXNlLCBpbm9kZSBub2Rl
ICh3aXRoIG5saW5rPTApIGlzIHZhbGlkIGluIHRuYyAob24gZmxhc2gpLCB3aGljaCBsZWFkcwo+
IHRvIHNwYWNlIGxlYWsuIE1lYW53aGlsZSwgdGhlIGNvcnJlc3BvbmRpbmcgZGF0YSBub2RlcyB3
b24ndCBiZSByZWxlYXNlZAo+IGZyb20gdG5jLiBGb3IgZXhhbXBsZSwgKEEgcmVwcm9kdWNlciBj
YW4gYmUgZm91bmQgaW4gTGluayk6Cj4KPiAkIG1vdW50IFVCSUZTCj4gICBbcHJvY2VzcyBBXSAg
ICAgICAgICAgIFtwcm9jZXNzIEJdICAgICAgICAgW1ROQ10gICAgICAgICBbb3JwaGFuIGFyZWFd
Cj4KPiAgdWJpZnNfdG1wZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgaW5vZGVfQSAobmxp
bms9MCkgICAgIGlub2RlX0EKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvX2NvbW1pdCAg
ICAgaW5vZGVfQSAobmxpbms9MCkgICAgIGlub2RlX0EKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAg4oaRCj4gICAgICAgKGNvbW1lbnQ6IEl0IG1ha2VzIHN1cmUgbm90IHJlcGxheSBp
bm9kZV9BIGluIG5leHQgbW91bnQpCj4gIHViaWZzX2xpbmsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlub2RlX0EgKG5saW5rPTApICAgICBpbm9kZV9BCj4gICAgdWJpZnNfZGVsZXRlX29y
cGhhbiAgICAgICAgICAgICAgICAgIGlub2RlX0EgKG5saW5rPTApCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICBkb19jb21taXQgICAgIGlub2RlX0EgKG5saW5rPTApCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0tPiBQT1dFUkNVVCA8LS0tCj4gICAgKHViaWZzX2pubF91cGRhdGUp
Cj4KPiAkIG1vdW50IFVCSUZTCj4gICBpbm9kZV9BIHdpbGwgbmVpdGhlciBiZSByZXBsYXllZCBp
biB1Ymlmc19yZXBsYXlfam91cm5hbCgpIG5vcgo+ICAgdWJpZnNfbW91bnRfb3JwaGFucygpLiBp
bm9kZV9BIChubGluaz0wKSB3aXRoIGl0cyBkYXRhIG5vZGVzIHdpbGwKPiAgIGFsd2F5cyBvbiB0
bmMsIGl0IG9jY3VweSBzcGFjZSBidXQgaXMgbm9uLXZpc2FibGUgZm9yIHVzZXJzLgo+Cj4gQ29t
bWl0IGVlMTQzOGNlNWRjNGQgKCJ1YmlmczogQ2hlY2sgbGluayBjb3VudCBvZiBpbm9kZXMgd2hl
biBraWxsaW5nCj4gb3JwaGFucy4iKSBoYW5kbGVzIHByb2JsZW0gaW4gbWlzdGFrZW5seSBkZWxl
dGluZyByZWxpbmtlZCB0bXBmaWxlCj4gd2hpbGUgcmVwbGF5aW5nIG9ycGhhbiBhcmVhLiBTaW5j
ZSB0aGF0LCB0bXBmaWxlIGlub2RlIHNob3VsZCBhbHdheXMKPiBsaXZlIGluIG9ycGhhbiBhcmVh
IGV2ZW4gaXQgaXMgbGlua2VkLiBGaXggaXQgYnkgcmV2ZXJ0aW5nIGNvbW1pdAo+IDMyZmU5MDVj
MTdmMDAxICgidWJpZnM6IEZpeCBPX1RNUEZJTEUgY29ybmVyIGNhc2UgaW4gdWJpZnNfbGluaygp
IikuCgpXZWxsLCBieSByZXZlcnRpbmcgdGhpcyBjb21taXQgeW91IHJlLWludHJvZHVjZSB0aGUg
aXNzdWUgaXQgZml4ZXMuIDstXAoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
