Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC7BEFCBD4
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t2yOaeUJWmUuhTiTiJYmpEkOyeV8NH50YzTZW8fq0vA=; b=b4rpUuO1qqfI40oTOsmT+cSMFG
	7e/MdJKSUq3GDcVNDNLJ5/gIixVHrMKiDYNfNos/RQISLsuUlW/HwZpefZ094nbyWEr6e0sxnNQMr
	rv1LAWVQiPrypEBd7GhxOxSgnI+svHVm3q9XN6cl4zT3+Py7rBm0fz2Cxg76x5H3AwBiQbV1uVic1
	tbTgZPBQT/nKovQazfjXXDMO/JI+NCv7jxzgJfUL0U9rLTBUJLWbz3iPY/KWyUdHI4WJagx6Zup8x
	5J41X++GBB+CxVA4SQE4h+/BAlvUaw5HQNOUx15lY7cBhWwDNTT4Bxz6xn7ll6jdrmuIV9BKnR4Gz
	2POq5arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22L9-00000003U1E-16yh;
	Mon, 16 Mar 2026 07:26:15 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22L5-00000003Tyd-3bF6
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 07:26:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 012BA2A8813;
	Mon, 16 Mar 2026 08:25:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1kHUCoMHY-SB; Mon, 16 Mar 2026 08:25:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 86776BE33F;
	Mon, 16 Mar 2026 08:25:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id U_QzWOIkbGqx; Mon, 16 Mar 2026 08:25:57 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4E5C2298580;
	Mon, 16 Mar 2026 08:25:57 +0100 (CET)
Date: Mon, 16 Mar 2026 08:25:57 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, jserv@ccns.ncku.edu.tw, 
	eleanor15x@gmail.com, marscheng@google.com, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at>
In-Reply-To: <20260315193900.218737-1-visitorckw@gmail.com>
References: <20260315193900.218737-1-visitorckw@gmail.com>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: lib/list_sort: introduce list_sort_nonatomic() and remove dummy cmp() calls
Thread-Index: yka9mQdudGGmgf615CanqWIVMhGQsQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_002612_038417_6681B36A 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkt1YW4tV2VpIENoaXUiIDx2
aXNpdG9yY2t3QGdtYWlsLmNvbT4KPiBIaXN0b3JpY2FsbHksIGxpc3Rfc29ydCgpIGltcGxlbWVu
dGVkIGEgaGFjayBpbiBtZXJnZV9maW5hbCgpOgo+ICAgIGlmICh1bmxpa2VseSghKytjb3VudCkp
Cj4gICAgICAgIGNtcChwcml2LCBiLCBiKTsKPiAKPiBUaGlzIHdhcyBkZXNpZ25lZCBzcGVjaWZp
Y2FsbHkgc28gdGhhdCBjYWxsZXJzIGNvdWxkIHBlcmlvZGljYWxseQo+IGludm9rZSBjb25kX3Jl
c2NoZWQoKSB3aXRoaW4gdGhlaXIgY29tcGFyaXNvbiBmdW5jdGlvbnMgd2hlbiBtZXJnaW5nCj4g
aGlnaGx5IHVuYmFsYW5jZWQgbGlzdHMuCj4gCj4gSG93ZXZlciwgYW4gYXVkaXQgb2YgdGhlIGtl
cm5lbCB0cmVlIHJldmVhbHMgdGhhdCBvbmx5IGZzL3ViaWZzLyByZWxpZXMKPiBvbiB0aGlzIG1l
Y2hhbmlzbS4gRm9yIHRoZSB2YXN0IG1ham9yaXR5IG9mIGxpc3Rfc29ydCgpIHVzZXJzIChzdWNo
IGFzCj4gYmxvY2sgbGF5ZXIgSU8gc2NoZWR1bGVycyBhbmQgZmlsZSBzeXN0ZW1zKSwgdGhpcyBy
ZXN1bHRzIGluIGNvbXBsZXRlbHkKPiB3YXN0ZWQgZnVuY3Rpb24gY2FsbHMuIEluIHRoZSB3b3Jz
dC1jYXNlIHNjZW5hcmlvIChtZXJnaW5nIGFuIGFscmVhZHkKPiBzb3J0ZWQgbGlzdCB3aGVyZSAn
YScgaXMgZXhoYXVzdGVkIHF1aWNrbHkpLCB0aGlzIHJlc3VsdHMgaW4KPiBhcHByb3hpbWF0ZWx5
IChOLzIpLzI1NiB1bm5lY2Vzc2FyeSBjbXAoKSBjYWxscy4KCldoeSBpc24ndCB0aGlzIGEgcHJv
YmxlbSBmb3Igb3RoZXIgdXNlcnMgb2YgbGlzdF9zb3J0KCk/CkFyZSB0aGUgbGlzdHMgdGhleSBz
b3J0IGd1YXJhbnRlZWQgdG8gYmUgc2hvcnQ/CgpPciBkaWQgbm9ib2R5IHRlc3QgaGFyZCBlbm91
Z2ggb24gc2xvdyBtYWNoaW5lcyB3aXRob3V0IHByZWVtcHQ/IDstKQoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
