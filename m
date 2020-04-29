Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92F9C83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 14:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E315206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 14:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQoPdpBq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E315206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZ1ugoooVx9al8BCrnx1ZL7phYzqiGQthCVXZVU40DA=; b=nQoPdpBqVmcK86
	2BAoZW3z6Mg98vnGxDp+/hlyrN5XmS6EgF6BugN0Ole0dwYScLADRNfE4I3bFYHGt2GRnag0zggX6
	bdEFUHZ39bAI5/s4xh93oL3Hjj6Gd5yV+vcnEFDkexUoGIVZmIEelTCdPm8dJ5HwVPHSptiecJLKj
	VNNSflOw/iAZO6bmeWdGG3E97vEEv7ImW+dX3w/QGc7qJUTtD9TaVGipN+e7aTI3ylAtqVx8AEjh3
	xCI3/7Vuvtct3ebykF1V405N1sndCd+qooPolw6j6c76ApkVWacUCGy7UsI1sAWsn+6rGDUT93NcN
	2m8d70H8qjqAta0+j2Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTo8f-0001RM-6F; Wed, 29 Apr 2020 14:56:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTo8b-0001Q2-Rn
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 14:56:39 +0000
Received: from localhost ([127.0.0.1] helo=vostro)
 by Galois.linutronix.de with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <john.ogness@linutronix.de>)
 id 1jTo8X-0001n7-9E; Wed, 29 Apr 2020 16:56:33 +0200
From: John Ogness <john.ogness@linutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
References: <20200119215233.7292-1-richard@nod.at>
Date: Wed, 29 Apr 2020 16:56:31 +0200
In-Reply-To: <20200119215233.7292-1-richard@nod.at> (Richard Weinberger's
 message of "Sun, 19 Jan 2020 22:52:33 +0100")
Message-ID: <875zdibasg.fsf@vostro.fn.ogness.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_075638_037214_14257EBA 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKCkNvdWxkIHlvdSBDQyB0aGlzIHBhdGNoIHRvIHN0YWJsZT8gSXQgZml4ZXMg
YSBzZXJpb3VzIHByb2JsZW0gdGhhdCBJIGFtCnNlZWluZyBvbiByZWFsIGRldmljZXMgKGkuZS4g
TGludXggbm90IGJlaW5nIGFibGUgdG8gbW91bnQgaXRzIHJvb3QKZmlsZXN5c3RlbSBhZnRlciBh
IHBvd2VyIGN1dCkuIFRoYW5rcy4KCkpvaG4gT2duZXNzCgpPbiAyMDIwLTAxLTE5LCBSaWNoYXJk
IFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPiBPcnBoYW5zIGFyZSBhbGxvd2Vk
IHRvIHBvaW50IHRvIGRlbGV0ZWQgaW5vZGVzLgo+IFNvIC1FTk9FTlQgaXMgbm90IGEgZmF0YWwg
ZXJyb3IuCj4KPiBSZXBvcnRlZC1ieTog0JrQvtGH0LXRgtC60L7QsiDQnNCw0LrRgdC40LwgPGZp
ZG9fbWF4QGluYm94LnJ1Pgo+IFJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6ICJDaHJpc3RpYW4gQmVy
Z2VyIiA8Q2hyaXN0aWFuLkJlcmdlckBkZS5ib3NjaC5jb20+Cj4gRml4ZXM6IGVlMTQzOGNlNWRj
NCAoInViaWZzOiBDaGVjayBsaW5rIGNvdW50IG9mIGlub2RlcyB3aGVuIGtpbGxpbmcgb3JwaGFu
cy4iKQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gLS0tCj4gIGZzL3ViaWZzL29ycGhhbi5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMv
b3JwaGFuLmMgYi9mcy91Ymlmcy9vcnBoYW4uYwo+IGluZGV4IDU0ZDZkYjYxMTA2Zi4uMjY0NTkx
NzM2MGI5IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL29ycGhhbi5jCj4gKysrIGIvZnMvdWJpZnMv
b3JwaGFuLmMKPiBAQCAtNjg4LDE0ICs2ODgsMTQgQEAgc3RhdGljIGludCBkb19raWxsX29ycGhh
bnMoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19zY2FuX2xlYiAqc2xlYiwKPiAg
Cj4gIAkJCWlub19rZXlfaW5pdChjLCAma2V5MSwgaW51bSk7Cj4gIAkJCWVyciA9IHViaWZzX3Ru
Y19sb29rdXAoYywgJmtleTEsIGlubyk7Cj4gLQkJCWlmIChlcnIpCj4gKwkJCWlmIChlcnIgJiYg
ZXJyICE9IC1FTk9FTlQpCj4gIAkJCQlnb3RvIG91dF9mcmVlOwo+ICAKPiAgCQkJLyoKPiAgCQkJ
ICogQ2hlY2sgd2hldGhlciBhbiBpbm9kZSBjYW4gcmVhbGx5IGdldCBkZWxldGVkLgo+ICAJCQkg
KiBsaW5rYXQoKSB3aXRoIE9fVE1QRklMRSBhbGxvd3MgcmViaXJ0aCBvZiBhbiBpbm9kZS4KPiAg
CQkJICovCj4gLQkJCWlmIChpbm8tPm5saW5rID09IDApIHsKPiArCQkJaWYgKGVyciA9PSAwICYm
IGluby0+bmxpbmsgPT0gMCkgewo+ICAJCQkJZGJnX3JjdnJ5KCJkZWxldGluZyBvcnBoYW5lZCBp
bm9kZSAlbHUiLAo+ICAJCQkJCSAgKHVuc2lnbmVkIGxvbmcpaW51bSk7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
