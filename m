Return-Path: <SRS0=wBIi=V7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA02C433FF
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Aug 2019 08:49:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F3521783
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Aug 2019 08:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dz47Rzp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F3521783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uROWNzPfL9LREi4676RvB/hGty7ZIXQJ4qO2pJIrFUk=; b=dz47Rzp8xHm5TA
	pe1775K88wmZN32dR4MKnqAqVIFcX3XshKCEOlJVCyEKgbBcp2HEatqBOja3UTyETQm2Csf+9DPaR
	/8bLtk9MhNMzxZS2Kw6ZQAvSqCbYjfwSUYMchKSmb9esJ/zxetnTHySRpqKiJPe/plsraoHD0KiZf
	hRcmZmzD9aZCy1mfD5pNMW/TmBFtHW4Ajt6tSE2BF3orZ4tykqbT5gTl3SarYrZ3pIahgiwtyZeVS
	KYmDn0pEscu9HPmvuIATXDx59vCtbctUfb1VnEaHbNDcUjliGiWTSm+KZQ2R29N5rVRl2gaQPRMKe
	b62OIhOXwjnyXEE/eOHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htpit-0004zu-BO; Sat, 03 Aug 2019 08:49:07 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htpip-0004zU-CC
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2019 08:49:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A4ADD6089354;
 Sat,  3 Aug 2019 10:48:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4m96ACjIWITF; Sat,  3 Aug 2019 10:48:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5B159608311C;
 Sat,  3 Aug 2019 10:48:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Gxz6X_jDXm5a; Sat,  3 Aug 2019 10:48:49 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3743B6089354;
 Sat,  3 Aug 2019 10:48:49 +0200 (CEST)
Date: Sat, 3 Aug 2019 10:48:49 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sergeant Peppercorn <speppercorn109@gmail.com>
Message-ID: <1019514474.57102.1564822129140.JavaMail.zimbra@nod.at>
In-Reply-To: <CAMxq0fO=0P8972FKvscmNxCBxq0m8_f2DST-Oa9HtNeUA-FKsA@mail.gmail.com>
References: <CAMxq0fNSWrUFMmmTs8Ri9gFOvS+KQJvZN3-_KuiqXi9bbmCB0Q@mail.gmail.com>
 <CAFLxGvz92UR2M7KJ_dMMW-F47_pLLxSTOrGwdQ5Cc0kuSiTA8Q@mail.gmail.com>
 <CAMxq0fO=0P8972FKvscmNxCBxq0m8_f2DST-Oa9HtNeUA-FKsA@mail.gmail.com>
Subject: Re: UBIFS ECC errors
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS ECC errors
Thread-Index: 1tgDozC5E1Vu3NghYqfzyqvKa8L1Lw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190803_014903_564973_F24CC0AC 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlNlcmdlYW50IFBlcHBlcmNv
cm4iIDxzcGVwcGVyY29ybjEwOUBnbWFpbC5jb20+Cj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIi
IDxyaWNoYXJkLndlaW5iZXJnZXJAZ21haWwuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gR2VzZW5kZXQ6IEZyZWl0YWcsIDIuIEF1Z3VzdCAy
MDE5IDE4OjE0OjU1Cj4gQmV0cmVmZjogUmU6IFVCSUZTIEVDQyBlcnJvcnMKCj4gSGksIG1hbnkg
dGhhbmtzIGZvciB0aGUgcmVwbHkuCj4gCj4gSSBoYXZlIHNlZW4gcG9zdHMgb24gYml0ZmxpcHMg
aW4gZW1wdHkgc3BhY2UgaXNzdWVzIGJlZm9yZSwgYnV0IGRvbid0Cj4gcmVtZW1iZXIgc2VlaW5n
IGFueSBmaXhlcy4gRG9lcyB0aGlzIG1lYW4gdGhlIGtlcm5lbCBVQkkgZHJpdmVycyBtdXN0Cj4g
YmUgcGF0Y2hlZD8gQ2FuIHlvdSBlbGFib3JhdGUgb24gd2hhdCBmaXhlcyBvciB3aGVyZSB0byBm
aW5kIHBhdGNoZXMsCj4gZXRjLCBvciB3aGF0IHRvIGRvIGFib3V0IHRoaXMsIHRoZW4/IEFsbCBJ
IGNhcmUgYWJvdXQgaXMgZ2V0dGluZyB0aGlzCj4gdG8gd29yaywgYW5kIGhvcGVmdWxseSB3aXRo
b3V0IG5lZWRpbmcgdG8gcmVmb3JtYXQgdGhlIHJvb3QgZmlsZQo+IHN5c3RlbSBvbiA1MCwwMDAg
dW5pdHMgaW4gdGhlIGZpZWxkLgoKWW91ciBrZXJuZWwgaXMgcHJldHR5IG9sZCwgc28gSSBndWVz
cyB5b3UgZG9uJ3QgaGF2ZSB0aGlzIGNvbW1pdDoKNzMwYTQzZmJjMTM1ICgibXRkOiBuYW5kOiBh
ZGQgbmFuZF9jaGVja19lcmFzZWQgaGVscGVyIGZ1bmN0aW9ucyIpCiAKQml0ZmxpcHMgaW4gZW1w
dHkgcGFnZXMgc2hvdWxkIGJlIGhhbmRsZWQgaW4gdGhlIE5BTkQgbGF5ZXIuCgpQbGVhc2UgZG9u
J3QgYmxpbmRseSBhcHBseSB0aGlzIHBhdGNoLCBpdCBtYXkgaGF2ZSBkZXBlbmRlbmNpZXMgb3Ig
d2lsbAp1bmNvdmVyIG90aGVyIGJ1Z3MuIFN1Y2ggYXMgZml4OgpmZGYyZTgyMTA1MjkgKCJtdGQ6
IG5hbmQ6IGdwbWk6IEZpeCBmYWlsdXJlIHdoZW4gYSBlcmFzZWQgcGFnZSBoYXMgYSBiaXRmbGlw
IGF0IEJCTSIpCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
