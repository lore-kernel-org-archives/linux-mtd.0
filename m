Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B55ECD6E4A
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h+uF1WPz8lbcm7vL68nfXSxPIuH1hS+g9n0EWzMur8c=; b=kBznvkKVHNvCl5AC6/6/QvpEEj
	ObysAMEyeggHpOsJAcaErnHGvzPkapUNW2+38LHnHtrwqRsW943umvEc81upd6lWzlqq+GV+7Bpnm
	wDuMjNZq/cQI06HQjAdv90RX003sNqOWUK7B5/3VznhN49jXz9txnu9SMMM4ivmtUzZZY3fhIXFIN
	GJUz0mxBDOrl//b2vEuDVd6zNAhZEmbarHAe3frUceYpvNEVbJDqD8WiFWXjYRrqEgm5Cj12fQE0x
	SmZr2EHauxbAjn5+7rb+d/iYaK6gfYEdcxLxMvQQbGyoW+ThuCUivT6FJYOG2Z6TXrH93wa+EtNYT
	jhODw5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2C0-0000000GHnh-178B;
	Thu, 04 Jun 2026 07:08:40 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Bx-0000000GHju-1eaC
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 07:08:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8381B298580;
	Thu,  4 Jun 2026 09:08:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id T0e8dBZzgyN4; Thu,  4 Jun 2026 09:08:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E5C87298599;
	Thu,  4 Jun 2026 09:08:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nDGq3qIq-2sE; Thu,  4 Jun 2026 09:08:22 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C6513298580;
	Thu,  4 Jun 2026 09:08:22 +0200 (CEST)
Date: Thu, 4 Jun 2026 09:08:22 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Ren Wei <n05ec@lzu.edu.cn>, linux-mtd <linux-mtd@lists.infradead.org>, 
	yuantan098 <yuantan098@gmail.com>, yifanwucs <yifanwucs@gmail.com>, 
	tomapufckgml <tomapufckgml@gmail.com>, bird <bird@lzu.edu.cn>, 
	rakukuip <rakukuip@gmail.com>
Message-ID: <1688028359.62549.1780556902621.JavaMail.zimbra@nod.at>
In-Reply-To: <838ee423-c57d-51a1-0524-6e0d585a2a29@huawei.com>
References: <cover.1780496711.git.rakukuip@gmail.com> <28e06b0bb4babfb7138beb31efa2c6bb1400ea36.1780496711.git.rakukuip@gmail.com> <838ee423-c57d-51a1-0524-6e0d585a2a29@huawei.com>
Subject: Re: [PATCH 1/1] ubifs: fix slab-out-of-bounds in pack_inode via
 xattr
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF150 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: fix slab-out-of-bounds in pack_inode via xattr
Thread-Index: edDzaykqN/O0Y3gF6xUfWCf0VqT2ZQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_000837_713262_64BD5773 
X-CRM114-Status: GOOD (  13.58  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IOWcqCAyMDI2LzYvNCAwOjM3LCBSZW4gV2VpIOWGmemB
kzoKPj4gRnJvbTogTHV4aWFvIFh1IDxyYWt1a3VpcEBnbWFpbC5jb20+Cj4+IAo+PiBBbiBpc3N1
ZSBpbiBmcy91Ymlmcy9qb3VybmFsLmMgd2FzIGZvdW5kIHdoZXJlIGEgbWFsaWNpb3VzIG9yIGNv
cnJ1cHRlZAo+PiB1YmlmcyBpbWFnZSBjb3VsZCB0cmlnZ2VyIGEgc2xhYi1vdXQtb2YtYm91bmRz
IHdyaXRlIGluIHBhY2tfaW5vZGUoKS4KPj4gCj4+IFdoZW4gYW4gaW5vZGUgd2l0aCBleHRlbmRl
ZCBhdHRyaWJ1dGVzICh4YXR0cnMpIGlzIGJlaW5nIGV2aWN0ZWQgb3IKPj4gZGVsZXRlZCAoaS5l
LiwgJ2xhc3RfcmVmZXJlbmNlJyBhbmQgJ2tpbGxfeGF0dHJzJyBhcmUgdHJ1ZSksCj4+IHViaWZz
X2pubF93cml0ZV9pbm9kZSgpIGNhbGN1bGF0ZXMgdGhlIGFsbG9jYXRpb24gc2l6ZSAnd3JpdGVf
bGVuJwo+PiBiYXNlZCBvbiAndWktPnhhdHRyX2NudCcgZnJvbSB0aGUgZGlzay4KPj4gCj4+IEhv
d2V2ZXIsIGlmICd1aS0+eGF0dHJfY250JyBpcyBtYWxpY2lvdXNseSB0YW1wZXJlZCB3aXRoIG9y
IGNvcnJ1cHRlZAo+PiB0byBiZSBzbWFsbGVyIHRoYW4gdGhlIGFjdHVhbCBudW1iZXIgb2YgeGF0
dHIgZW50cmllcyBzdG9yZWQgaW4gdGhlCj4+IFROQyAoVHJlZSBOb2RlIENhY2hlKSwga21hbGxv
YygpIHdpbGwgYWxsb2NhdGUgYW4gdW5kZXJzaXplZCBidWZmZXIuCj4+IFRoZSBzdWJzZXF1ZW50
ICd3aGlsZSAoMSknIGxvb3AgY29udGludWVzIHRvIGl0ZXJhdGUgdGhyb3VnaCBhbGwgYWN0dWFs
Cj4+IHhhdHRyIGVudHJpZXMgdmlhIHViaWZzX3RuY19uZXh0X2VudCgpLCBhZHZhbmNpbmcgdGhl
ICdpbm8nIHBvaW50ZXIKPj4gYW5kIGludm9raW5nIHBhY2tfaW5vZGUoKSBmb3IgZWFjaCBlbnRy
eS4gVGhpcyBtaXNtYXRjaCBsZWFkcyB0byBhbgo+PiBvdXQtb2YtYm91bmRzIG1lbW9yeSB3cml0
ZSwgY29ycnVwdGluZyB0aGUgc2xhYiByZWR6b25lIGFuZCB0cmlnZ2VyaW5nCj4+IGEgS0FTQU4g
cGFuaWMuCj4+IAo+PiBGaXggdGhpcyBieSBpbnRyb2R1Y2luZyBhIHN0cmljdCBjb3VudGVyICd4
YXR0cnNfZGVsZXRlZCcgd2l0aGluIHRoZQo+PiBkZWxldGlvbiBsb29wLiBUaGUgbG9vcCBpcyBh
Ym9ydGVkIHdpdGggLUVVQ0xFQU4gaWYgdGhlIG51bWJlciBvZgo+PiBwcm9jZXNzZWQgeGF0dHJz
IGV4Y2VlZHMgJ3VpLT54YXR0cl9jbnQnLCBwcmV2ZW50aW5nICdpbm8nIGZyb20KPj4gb3ZlcmZs
b3dpbmcgdGhlIGFsbG9jYXRlZCBrbWFsbG9jIGJ1ZmZlci4KPj4gCj4+IFRoZSBidWcgaXMgcmVh
Y2hhYmxlIGJ5IGEgbm9uLXJvb3QgdXNlciB2aWEgdXNlciBhbmQgbmV0IG5hbWVzcGFjZS4KCkFz
IEkgd3JvdGUgaW4gbXkgcmVwbHkgdG8gMC8xLCBJJ20gbm90IHNvIHN1cmUgYWJvdXQgdGhhdC4K
VG8gbG9hZCBhIE1URCBhbmQgbW91bnQgVUJJRlMgeW91IG5lZWQgdG8gYmUgdGhlIHJlYWwgcm9v
dC4KCj4+IAo+PiBGaXhlczogNzk1OWNmM2E3NTA2ICgidWJpZnM6IGpvdXJuYWw6IEhhbmRsZSB4
YXR0cnMgbGlrZSBmaWxlcyIpCj4+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+PiBSZXBvcnRlZC1i
eTogWXVhbiBUYW4gPHl1YW50YW4wOThAZ21haWwuY29tPgo+PiBSZXBvcnRlZC1ieTogWWlmYW4g
V3UgPHlpZmFud3Vjc0BnbWFpbC5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBKdWVmZWkgUHUgPHRvbWFw
dWZja2dtbEBnbWFpbC5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBYaW4gTGl1IDxiaXJkQGx6dS5lZHUu
Y24+Cj4+IFNpZ25lZC1vZmYtYnk6IEx1eGlhbyBYdSA8cmFrdWt1aXBAZ21haWwuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBSZW4gV2VpIDxuMDVlY0BsenUuZWR1LmNuPgo+PiAtLS0KPj4gICBmcy91
Ymlmcy9qb3VybmFsLmMgfCA5ICsrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKykKPj4gCj4gCj4gSGkgTHV4aWFvLAo+IEVhY2ggbWV0YWRhdGEoaW5vZGUvZGVudHJ5
KSBlbnRyeSB3aWxsIGNoZWNrZWQgd2l0aCBjcmMgd2hpbGUgbG9hZGluZwo+IGZyb20gZmxhc2go
c2VlIHViaWZzX3JlYWRfbm9kZS0+dWJpZnNfY2hlY2tfbm9kZSksIEkgZG9uJ3QgdGhpbmsKPiBj
b3JydXB0ZWQgaW1hZ2Ugd2lsbCB0cmlnZ2VyIHRoZSBwcm9ibGVtLCBiZWNhdXNlCj4gdWJpZnNf
bG9va3VwLT51Ymlmc19pZ2V0IHdpbGwgZmFpbCBhZnRlciBkZXRlY3RpbmcgY3JjIGVycm9yLiBV
bmxlc3MKPiBzb21lb25lIG1hbnVhbGx5IGluamVjdCB3b25nIG51bWJlciBpbnRvICd1aS0+eGF0
dHJfY250JyBmaWVsZWQgYW5kCj4gdXBkYXRlIHRoZSB3aG9sZSBpbm8gbm9kZSBjcmMsIGFuZCBJ
IGRvbid0IHRoaW5rIGl0IGlzIGEgcmVhbCBwcm9ibGVtCj4gbmVlZCB0byBiZSBmaXhlZC4gSW4g
dGhhdCBpbmplY3Rpb24gbWV0aG9kLCBubyBvbmUgZmlsZXN5c3RlbSBpcyBva2F5Lgo+IFRoZSBi
aXRmbGlwcyBoYXBwZW4gYm90aCBpbiBub2RlIGZpZWxkKGVnLiB4YXR0cl9jbnQpIGFuZCBjcmMg
ZmllbGQgaXMKPiBhbiBhbG1vc3QgaW1wb3NzaWJsZSB0aGluZy4KCldlbGwsIGlmIHdlIGNhbiBl
YXNpbHkgZGV0ZWN0IHRoaXMgY2FzZSwgbGV0J3MgZml4IGl0LiBVQklGUyB0cmllcyBoYXJkCnRv
IG1ha2Ugc3VyZSB0aGUgdW5kZXJsYXlpbmcgZGF0YSBzdHJ1Y3R1cmVzIGFyZSBjb3JyZWN0LgoK
VGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
