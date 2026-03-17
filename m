Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D5CFB5EAD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3Z7r8C24Vc+Ty2C56oA89B64M787xxHh+BtDOBv1p8A=; b=QPaqR9a7S9vPpLUHZwpy3f131V
	TpROjKVWiEYcCCuWDIY2ZKKT/1uqiTJmTdX6p+OoIpbP1Q1RI1rbz7ueUapAdjK12IUG60r1wnuML
	Au07lMjndm+Bl42QwBvmFye8JQgCS/NLd1dDW44bimc0oEJIP+WuquPPgBjEOqLBz0Wdsg/wcxWsw
	kiMjcaocyYy5CHz4xRpRCBU33AeZWiUA4KdfCVTLkbR4K8AI3RJPxiwXrN8Nb49d+JAITh43eY/0w
	uxaKluVNxOFHn40ABirQ3Ei8i+YqG/49sk9zLl6WQBjWLKnUrLB2CNnltLdTG8/EED9AFNRNfc+g2
	ZRPxmXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VZJ-00000006dEG-12dR;
	Tue, 17 Mar 2026 14:38:49 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VZG-00000006dDi-2GEK
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 14:38:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 251452A8813;
	Tue, 17 Mar 2026 15:38:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JVFc-2brI84U; Tue, 17 Mar 2026 15:38:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AF22DBE33F;
	Tue, 17 Mar 2026 15:38:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bGQlM34sh7um; Tue, 17 Mar 2026 15:38:41 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 770A52ABFDC;
	Tue, 17 Mar 2026 15:38:41 +0100 (CET)
Date: Tue, 17 Mar 2026 15:38:41 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Christoph Hellwig <hch@infradead.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>, 
	marscheng <marscheng@google.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <218787364.49542.1773758321128.JavaMail.zimbra@nod.at>
In-Reply-To: <abljlKim3-hPngCG@infradead.org>
References: <20260315193900.218737-1-visitorckw@gmail.com> <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at> <abhGF65wCbI7CsTm@google.com> <abljlKim3-hPngCG@infradead.org>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: lib/list_sort: introduce list_sort_nonatomic() and remove dummy cmp() calls
Thread-Index: uDEeBY8PTxKklIbTW3z36v/lSAdQYw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_073846_722286_65ED67FE 
X-CRM114-Status: UNSURE (   4.67  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBGb3IgVUJJRlMsIHRoaXMgcGF0Y2gg
ZG9lc24ndCBhbHRlciB0aGUgZnJlcXVlbmN5LCB0aW1pbmcsIG9yIGJlaGF2aW9yCj4+IG9mIHRo
ZSBjb25kX3Jlc2NoZWQoKSBjYWxscyBhdCBhbGwsIHNvIEkgYW0gY29uZmlkZW50IHRoYXQgdGhp
cyB3b24ndAo+PiBpbnRyb2R1Y2UgYW55IHJlZ3Jlc3Npb25zLgo+IAo+IEknZCBiZSB0ZW1wdGVk
IHRvIGRyb3AgdGhlIHdvcmthcm91bmQgYW5kIHJlbW92ZSB0aGUgY29uZF9yZXNjaGVkCj4gZnJv
bSB1YmlmcyBnaXZlbiB0aGF0IGVudGlyZWx5IG5vbi1wcmVlbXB0aWJsZSBzY2hlZHVsaW5nIG1v
ZGVscyBhcmUKPiBvbiB0aGVpciB3YXkgb3V0LgoKYXJtMzIgc3RpbGwgaGFzIG5vIHByZWVtcHQt
bGF6eS4KVGhpcyBpcyBvbmUgb2YgdGhlIGJpZ2dlc3QgcGxhdGZvcm1zIHdoZXJlIFVCSUZTIGlz
IHN0aWxsIHVzZWQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
