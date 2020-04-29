Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16F3C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 18:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9750420661
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 18:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fq4pVQeR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9750420661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ohr6djtk4eGgBzIJHS11KmQr0TJdnBvv3YV7aB2Bli4=; b=Fq4pVQeRnHtA09
	1D9WQt+GqeSR2cPR53h51U7Pa6O630ZkI/NYFfIIRXC0X6L5fNV4MoUAKuYi/PUB0LqRGsWpQUobE
	6J3V4HdYw2RCp7OFFfS+dlM4TAArVSorCWTWCvpWFBtA+++bellSYhy6mw9P6aTsaOwO8/owG1pHS
	wS5X4JnCLD0ilaXkchVecMb7W4xQM6tRPumuOxA6mTAgUEHtCnClfQTaPKhgbIs4kGVw3AbqKhYjP
	5QyQCmE+wTNBLKDCZSnb+dh21i3HgliIOct3MRUlgrTyaWzUrCiKw/Suu76l/WpaKE39IMedV1wn3
	nngan6V5CAYtd6EcUieQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTrnd-0008BC-9l; Wed, 29 Apr 2020 18:51:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTrna-0008Ah-Et
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 18:51:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5A18D6071A61;
 Wed, 29 Apr 2020 20:51:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NbIDHCmeZZST; Wed, 29 Apr 2020 20:51:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 008C262257A2;
 Wed, 29 Apr 2020 20:51:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TPdioTLx9-de; Wed, 29 Apr 2020 20:51:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D3EA26089348;
 Wed, 29 Apr 2020 20:51:06 +0200 (CEST)
Date: Wed, 29 Apr 2020 20:51:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: stable <stable@vger.kernel.org>
Message-ID: <1537701093.171645.1588186266734.JavaMail.zimbra@nod.at>
In-Reply-To: <875zdibasg.fsf@vostro.fn.ogness.net>
References: <20200119215233.7292-1-richard@nod.at>
 <875zdibasg.fsf@vostro.fn.ogness.net>
Subject: Please queue ubifs: Fix ubifs_tnc_lookup() usage in
 do_kill_orphans() for stable (was: Re: [PATCH] ubifs: Fix
 ubifs_tnc_lookup() usage in do_kill_orphans())
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: Please queue ubifs: Fix ubifs_tnc_lookup() usage in
 do_kill_orphans() for stable (was: Re: [PATCH] ubifs: Fix ubifs_tnc_lookup()
 usage in do_kill_orphans())
Thread-Index: vuDlWTB9U53gSqUpBqsVy2sOOiFwnA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_115110_796439_AE4C527B 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkpvaG4gT2duZXNzIiA8am9o
bi5vZ25lc3NAbGludXRyb25peC5kZT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4K
PiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4
LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IE1pdHR3
b2NoLCAyOS4gQXByaWwgMjAyMCAxNjo1NjozMQo+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIHViaWZz
OiBGaXggdWJpZnNfdG5jX2xvb2t1cCgpIHVzYWdlIGluIGRvX2tpbGxfb3JwaGFucygpCgo+IEhp
IFJpY2hhcmQsCj4gCj4gQ291bGQgeW91IENDIHRoaXMgcGF0Y2ggdG8gc3RhYmxlPyBJdCBmaXhl
cyBhIHNlcmlvdXMgcHJvYmxlbSB0aGF0IEkgYW0KPiBzZWVpbmcgb24gcmVhbCBkZXZpY2VzIChp
LmUuIExpbnV4IG5vdCBiZWluZyBhYmxlIHRvIG1vdW50IGl0cyByb290Cj4gZmlsZXN5c3RlbSBh
ZnRlciBhIHBvd2VyIGN1dCkuIFRoYW5rcy4KCkp1c3QgY2hlY2tlZCBhZ2FpbiwgYmV0dGVyIGFz
ayBzdGFibGUgbWFpbnRhaW5lcnMuIDotKQoKU3RhYmxlIG1haW50YWluZXJzLCBjYW4geW91IHBs
ZWFzZSBtYWtlIHN1cmUgdGhpcyBwYXRjaCB3aWxsIG1ha2UgaXQKaW50byBzdGFibGU/ClRoZSB1
cHN0cmVhbSBjb21taXQgaXM6CjRhYjI1YWM4YjJiNSAoInViaWZzOiBGaXggdWJpZnNfdG5jX2xv
b2t1cCgpIHVzYWdlIGluIGRvX2tpbGxfb3JwaGFucygpIikKCkkgYWx3YXlzIHRob3VnaHQgaGF2
aW5ncyBhIEZpeGVzLVRhZyBpcyBlbm91Z2ggdG8gbWFrZSBzdXJlIGl0IHdpbGwKZ2V0IHBpY2tl
ZCB1cC4gSXNuJ3QgdGhpcyB0aGUgY2FzZT8KClRoYW5rcywKLy9yaWNoYXJkCiAKPiBKb2huIE9n
bmVzcwo+IAo+IE9uIDIwMjAtMDEtMTksIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+IHdyb3RlOgo+PiBPcnBoYW5zIGFyZSBhbGxvd2VkIHRvIHBvaW50IHRvIGRlbGV0ZWQgaW5v
ZGVzLgo+PiBTbyAtRU5PRU5UIGlzIG5vdCBhIGZhdGFsIGVycm9yLgo+Pgo+PiBSZXBvcnRlZC1i
eTog0JrQvtGH0LXRgtC60L7QsiDQnNCw0LrRgdC40LwgPGZpZG9fbWF4QGluYm94LnJ1Pgo+PiBS
ZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiAiQ2hyaXN0aWFuIEJlcmdlciIgPENocmlzdGlhbi5CZXJn
ZXJAZGUuYm9zY2guY29tPgo+PiBGaXhlczogZWUxNDM4Y2U1ZGM0ICgidWJpZnM6IENoZWNrIGxp
bmsgY291bnQgb2YgaW5vZGVzIHdoZW4ga2lsbGluZyBvcnBoYW5zLiIpCj4+IFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4+IC0tLQo+PiAgZnMvdWJp
ZnMvb3JwaGFuLmMgfCA0ICsrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9vcnBoYW4uYyBiL2Zz
L3ViaWZzL29ycGhhbi5jCj4+IGluZGV4IDU0ZDZkYjYxMTA2Zi4uMjY0NTkxNzM2MGI5IDEwMDY0
NAo+PiAtLS0gYS9mcy91Ymlmcy9vcnBoYW4uYwo+PiArKysgYi9mcy91Ymlmcy9vcnBoYW4uYwo+
PiBAQCAtNjg4LDE0ICs2ODgsMTQgQEAgc3RhdGljIGludCBkb19raWxsX29ycGhhbnMoc3RydWN0
IHViaWZzX2luZm8gKmMsIHN0cnVjdAo+PiB1Ymlmc19zY2FuX2xlYiAqc2xlYiwKPj4gIAo+PiAg
CQkJaW5vX2tleV9pbml0KGMsICZrZXkxLCBpbnVtKTsKPj4gIAkJCWVyciA9IHViaWZzX3RuY19s
b29rdXAoYywgJmtleTEsIGlubyk7Cj4+IC0JCQlpZiAoZXJyKQo+PiArCQkJaWYgKGVyciAmJiBl
cnIgIT0gLUVOT0VOVCkKPj4gIAkJCQlnb3RvIG91dF9mcmVlOwo+PiAgCj4+ICAJCQkvKgo+PiAg
CQkJICogQ2hlY2sgd2hldGhlciBhbiBpbm9kZSBjYW4gcmVhbGx5IGdldCBkZWxldGVkLgo+PiAg
CQkJICogbGlua2F0KCkgd2l0aCBPX1RNUEZJTEUgYWxsb3dzIHJlYmlydGggb2YgYW4gaW5vZGUu
Cj4+ICAJCQkgKi8KPj4gLQkJCWlmIChpbm8tPm5saW5rID09IDApIHsKPj4gKwkJCWlmIChlcnIg
PT0gMCAmJiBpbm8tPm5saW5rID09IDApIHsKPj4gIAkJCQlkYmdfcmN2cnkoImRlbGV0aW5nIG9y
cGhhbmVkIGlub2RlICVsdSIsCj4gPiAgCQkJCQkgICh1bnNpZ25lZCBsb25nKWludW0pOwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
