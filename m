Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63516F53D6C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0FAlv6QQX6WmOqq7pmHA38bRxIrtEBye61+gezzSG0E=; b=JZ9ANLtjv5Etw88kEFpiVDY9UD
	AQ0hUaOkKbuWbBICqC/QXsR+9oIbZiyCnKYNWGmGERXx64WrkvZ9Kfj9BU8CH8KRcNH9/+0ewglU1
	hKTRVk9m6BDfMhsd056R90NXuBkHSXjk8/wVJRdd/TaJ31m5m8xhAwK9V/b9ioeqAgiuxNhmSd7DK
	tQwoBRKoL1GirZZIOUxg32rPQdR8S/OblQnbgyP52dbXGBp/3fkhj1iBzGL2tQamecZI9lvD4xdYf
	JIJHf75v6QfDY/2tmJ+Cu8pYz8GvJiRPOTOo67Zgy+vrOmUfvNUE9vs11OfHJdlC9cehcrUFRQr+g
	Uq9g91jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FoO-00000004xm4-2r1i;
	Mon, 16 Mar 2026 21:49:20 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FoN-00000004xlj-01yF
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 21:49:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5675E2C14A8;
	Mon, 16 Mar 2026 22:49:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id lMfQJfoGz_p9; Mon, 16 Mar 2026 22:49:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C83722C14AA;
	Mon, 16 Mar 2026 22:49:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sWsIcl4yKtIc; Mon, 16 Mar 2026 22:49:16 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9E1F62C14A8;
	Mon, 16 Mar 2026 22:49:16 +0100 (CET)
Date: Mon, 16 Mar 2026 22:49:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>, 
	marscheng <marscheng@google.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1993407938.46075.1773697756582.JavaMail.zimbra@nod.at>
In-Reply-To: <abhGF65wCbI7CsTm@google.com>
References: <20260315193900.218737-1-visitorckw@gmail.com> <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at> <abhGF65wCbI7CsTm@google.com>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: lib/list_sort: introduce list_sort_nonatomic() and remove dummy cmp() calls
Thread-Index: 33yhQy0Rw9S3aguU5054bV9ZIJmnVA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_144919_191630_5326E76B 
X-CRM114-Status: GOOD (  10.30  )
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
aXNpdG9yY2t3QGdtYWlsLmNvbT4KPj4gPiBIb3dldmVyLCBhbiBhdWRpdCBvZiB0aGUga2VybmVs
IHRyZWUgcmV2ZWFscyB0aGF0IG9ubHkgZnMvdWJpZnMvIHJlbGllcwo+PiA+IG9uIHRoaXMgbWVj
aGFuaXNtLiBGb3IgdGhlIHZhc3QgbWFqb3JpdHkgb2YgbGlzdF9zb3J0KCkgdXNlcnMgKHN1Y2gg
YXMKPj4gPiBibG9jayBsYXllciBJTyBzY2hlZHVsZXJzIGFuZCBmaWxlIHN5c3RlbXMpLCB0aGlz
IHJlc3VsdHMgaW4gY29tcGxldGVseQo+PiA+IHdhc3RlZCBmdW5jdGlvbiBjYWxscy4gSW4gdGhl
IHdvcnN0LWNhc2Ugc2NlbmFyaW8gKG1lcmdpbmcgYW4gYWxyZWFkeQo+PiA+IHNvcnRlZCBsaXN0
IHdoZXJlICdhJyBpcyBleGhhdXN0ZWQgcXVpY2tseSksIHRoaXMgcmVzdWx0cyBpbgo+PiA+IGFw
cHJveGltYXRlbHkgKE4vMikvMjU2IHVubmVjZXNzYXJ5IGNtcCgpIGNhbGxzLgo+PiAKPj4gV2h5
IGlzbid0IHRoaXMgYSBwcm9ibGVtIGZvciBvdGhlciB1c2VycyBvZiBsaXN0X3NvcnQoKT8KPj4g
QXJlIHRoZSBsaXN0cyB0aGV5IHNvcnQgZ3VhcmFudGVlZCB0byBiZSBzaG9ydD8KPj4gCj4+IE9y
IGRpZCBub2JvZHkgdGVzdCBoYXJkIGVub3VnaCBvbiBzbG93IG1hY2hpbmVzIHdpdGhvdXQgcHJl
ZW1wdD8gOy0pCj4gCj4gVEJILCBJIGRvbid0IHJlYWxseSBoYXZlIGEgY2xlYXIgYW5zd2VyIHRv
IHRoYXQuCj4gCj4gSSB0cmllZCB0byBkaWcgaW50byB0aGUgaGlzdG9yeS4gSXQgdHVybnMgb3V0
IHRoaXMgbWVjaGFuaXNtIHdhcwo+IGludHJvZHVjZWQgMTYgeWVhcnMgYWdvIGluIGNvbW1pdCA4
MzVjYzBjODQ3N2YgKCJsaWI6IG1vcmUgc2NhbGFibGUKPiBsaXN0X3NvcnQoKSIpLiBUaGUgY29t
bWl0IG1lc3NhZ2UgZXhwbGljaXRseSBtZW50aW9uZWQgYm90aCBYRlMgYW5kCj4gVUJJRlMgYXMg
dGhlIGludGVuZGVkIHVzZXJzIGZvciB0aGlzIGxvbmctbGlzdCB3b3JrYXJvdW5kLiBIb3dldmVy
LAo+IGxvb2tpbmcgYXQgdGhlIHRyZWUgYmFjayB0aGVuLCBYRlMgbmV2ZXIgYWN0dWFsbHkgcHV0
IGEgY29uZF9yZXNjaGVkKCkKPiBpbiB0aGVpciBjbXAoKSBmdW5jdGlvbi4gSXQgc2VlbXMgVUJJ
RlMgaGFzIGJlZW4gdGhlIHNvbGUgdXNlciBvZiB0aGlzCj4gdHJpY2sgZXZlciBzaW5jZS4gR2l2
ZW4gdGhhdCBpdCBoYXMgYmVlbiB0aGlzIHdheSBmb3IgMTYgeWVhcnMsIGl0Cj4gc2VlbXMgb3Ro
ZXIgc3Vic3lzdGVtcyBoYXZlbid0IHJlYWxseSBlbmNvdW50ZXJlZCBhbnkgcHJhY3RpY2FsIGlz
c3Vlcwo+IHdpdGggaXQuCgpUcmFkaXRpb25hbGx5IGJvdGggVUJJIGFuZCBVQklGUyB1c2UgY29u
ZF9yZXNjaGVkKCkgaGVhdmlseSwgbXkgYmVzdCBndWVzcwppcyBiZWNhdXNlIHRoZWlyIG1vc3Rs
eSB1c2VkIG9uIHRpbnkgZW1iZWRkZWQgc3lzdGVtcyB3aGVyZSBzb2Z0IGxvY2t1cHMKYXJlIG1v
cmUgbGlrZWx5LgoKPiBGb3IgVUJJRlMsIHRoaXMgcGF0Y2ggZG9lc24ndCBhbHRlciB0aGUgZnJl
cXVlbmN5LCB0aW1pbmcsIG9yIGJlaGF2aW9yCj4gb2YgdGhlIGNvbmRfcmVzY2hlZCgpIGNhbGxz
IGF0IGFsbCwgc28gSSBhbSBjb25maWRlbnQgdGhhdCB0aGlzIHdvbid0Cj4gaW50cm9kdWNlIGFu
eSByZWdyZXNzaW9ucy4KClN1cmUuIEkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3Rh
bmQgd2h5IFVCSUZTIG5lZWQgc3BlY2lhbAp0cmVhdG1lbnQuCgpUaGFua3MsCi8vcmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
