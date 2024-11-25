Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBA4D58065
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OJR4n9E8K/g9Z0L6KrY2fgjGYMZE4hH93DOigqvAxwE=; b=p2Pc/r5/1BRcJ+xdoGUc3iMAKu
	YR1WdL8x3VXBvGl8CdK1iYU8TieJHQ4PaRQIAzodp44W1QloOIiM5oXYJB0cBatSt/qCMz5fp6oCk
	D54SFu6kgyJhZVk8ruZzPB9ZRSuTnWEzN4c3jDEhDOReQRk7YYYFTab1ur56RKaIov2njH2KdeJ2B
	vJgeAmlK1SVOCMeleQGOoBjebUeY6GHFzpFFboTd/8o/bS4FQnqANYt7IRfwIHsdjsBbGojL9V1Eq
	1TDk456zf4FybIAB+5C9VgQmiginbJADO4fnaRQmtGk0Dr3/eECOF6AlHzER3wjAPJzPky27Ceuvp
	wVbWM7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXJ7-00000007til-2qjz;
	Mon, 25 Nov 2024 11:31:09 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXJ3-00000007tgu-3Vnl
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 11:31:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B357B2E6142;
	Mon, 25 Nov 2024 12:30:59 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zBiM6kBr8mqI; Mon, 25 Nov 2024 12:30:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F0F482E613D;
	Mon, 25 Nov 2024 12:30:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6isOqRtT0GRU; Mon, 25 Nov 2024 12:30:58 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C3F6B2A87E6;
	Mon, 25 Nov 2024 12:30:58 +0100 (CET)
Date: Mon, 25 Nov 2024 12:30:58 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: cgzones@googlemail.com
Cc: LSM <linux-security-module@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, cocci <cocci@inria.fr>
Message-ID: <1045101183.70157813.1732534258584.JavaMail.zimbra@nod.at>
In-Reply-To: <20241125104011.36552-5-cgoettsche@seltendoof.de>
References: <20241125104011.36552-1-cgoettsche@seltendoof.de> <20241125104011.36552-5-cgoettsche@seltendoof.de>
Subject: Re: [PATCH 06/11] ubifs: reorder capability check last
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: reorder capability check last
Thread-Index: CIQyHdt2r7cFMRbn2TiAVM+y9UFUfA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_033106_155019_07DEE860 
X-CRM114-Status: GOOD (  16.77  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdGlhbiBHw7Z0dHNj
aGUiIDxjZ29ldHRzY2hlQHNlbHRlbmRvb2YuZGU+Cj4gY2FwYWJsZSgpIGNhbGxzIHJlZmVyIHRv
IGVuYWJsZWQgTFNNcyB3aGV0aGVyIHRvIHBlcm1pdCBvciBkZW55IHRoZQo+IHJlcXVlc3QuICBU
aGlzIGlzIHJlbGV2YW50IGluIGNvbm5lY3Rpb24gd2l0aCBTRUxpbnV4LCB3aGVyZSBhCj4gY2Fw
YWJpbGl0eSBjaGVjayByZXN1bHRzIGluIGEgcG9saWN5IGRlY2lzaW9uIGFuZCBieSBkZWZhdWx0
IGEgZGVuaWFsCj4gbWVzc2FnZSBvbiBpbnN1ZmZpY2llbnQgcGVybWlzc2lvbiBpcyBpc3N1ZWQu
Cj4gSXQgY2FuIGxlYWQgdG8gdGhyZWUgdW5kZXNpcmVkIGNhc2VzOgo+ICAxLiBBIGRlbmlhbCBt
ZXNzYWdlIGlzIGdlbmVyYXRlZCwgZXZlbiBpbiBjYXNlIHRoZSBvcGVyYXRpb24gd2FzIGFuCj4g
ICAgIHVucHJpdmlsZWdlZCBvbmUgYW5kIHRodXMgdGhlIHN5c2NhbGwgc3VjY2VlZGVkLCBjcmVh
dGluZyBub2lzZS4KPiAgMi4gVG8gYXZvaWQgdGhlIG5vaXNlIGZyb20gMS4gdGhlIHBvbGljeSB3
cml0ZXIgYWRkcyBhIHJ1bGUgdG8gaWdub3JlCj4gICAgIHRob3NlIGRlbmlhbCBtZXNzYWdlcywg
aGlkaW5nIGZ1dHVyZSBzeXNjYWxscywgd2hlcmUgdGhlIHRhc2sKPiAgICAgcGVyZm9ybXMgYW4g
YWN0dWFsIHByaXZpbGVnZWQgb3BlcmF0aW9uLCBsZWFkaW5nIHRvIGhpZGRlbiBsaW1pdGVkCj4g
ICAgIGZ1bmN0aW9uYWxpdHkgb2YgdGhhdCB0YXNrLgo+ICAzLiBUbyBhdm9pZCB0aGUgbm9pc2Ug
ZnJvbSAxLiB0aGUgcG9saWN5IHdyaXRlciBhZGRzIGEgcnVsZSB0byBwZXJtaXQKPiAgICAgdGhl
IHRhc2sgdGhlIHJlcXVlc3RlZCBjYXBhYmlsaXR5LCB3aGlsZSBpdCBkb2VzIG5vdCBuZWVkIGl0
LAo+ICAgICB2aW9sYXRpbmcgdGhlIHByaW5jaXBsZSBvZiBsZWFzdCBwcml2aWxlZ2UuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEfDtnR0c2NoZSA8Y2d6b25lc0Bnb29nbGVtYWlsLmNv
bT4KPiAtLS0KPiBkcml2ZXJzL2dwdS9kcm0vcGFudGhvci9wYW50aG9yX2Rydi5jIHwgMiArLQoK
VGhpcyBjaGFuZ2UgaXMgdW5yZWxhdGVkLCBwbGVhc2UgcmVtb3ZlIGl0LgoKPiBmcy91Ymlmcy9i
dWRnZXQuYyAgICAgICAgICAgICAgICAgICAgIHwgNSArKystLQo+IDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2Zz
L3ViaWZzL2J1ZGdldC5jIGIvZnMvdWJpZnMvYnVkZ2V0LmMKPiBpbmRleCBkNzZlYjdiMzlmNTYu
LjYxMzdhZWFkZWMzZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9idWRnZXQuYwo+ICsrKyBiL2Zz
L3ViaWZzL2J1ZGdldC5jCj4gQEAgLTI1Niw4ICsyNTYsOSBAQCBsb25nIGxvbmcgdWJpZnNfY2Fs
Y19hdmFpbGFibGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsCj4gaW50IG1pbl9pZHhfbGVi
cykKPiAgKi8KPiBzdGF0aWMgaW50IGNhbl91c2VfcnAoc3RydWN0IHViaWZzX2luZm8gKmMpCj4g
ewo+IC0JaWYgKHVpZF9lcShjdXJyZW50X2ZzdWlkKCksIGMtPnJwX3VpZCkgfHwgY2FwYWJsZShD
QVBfU1lTX1JFU09VUkNFKSB8fAo+IC0JICAgICghZ2lkX2VxKGMtPnJwX2dpZCwgR0xPQkFMX1JP
T1RfR0lEKSAmJiBpbl9ncm91cF9wKGMtPnJwX2dpZCkpKQo+ICsJaWYgKHVpZF9lcShjdXJyZW50
X2ZzdWlkKCksIGMtPnJwX3VpZCkgfHwKPiArCSAgICAoIWdpZF9lcShjLT5ycF9naWQsIEdMT0JB
TF9ST09UX0dJRCkgJiYgaW5fZ3JvdXBfcChjLT5ycF9naWQpKSB8fAo+ICsJICAgIGNhcGFibGUo
Q0FQX1NZU19SRVNPVVJDRSkpCj4gCQlyZXR1cm4gMTsKPiAJcmV0dXJuIDA7Cj4gfQoKVGhlIFVC
SUZTIHBhcnQgbG9va3Mgb2s6CgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KClNpbmNlIEkgd2FzIG5vdCBDQydlZCB0byB0aGUgd2hvbGUgc2VyaWVzLCBJIG1p
c3MgYSBsb3Qgb2YgY29udGV4dC4KV2lsbCB0aGlzIHNlcmllcyBtZXJnZWQgYXMgYSB3aG9sZT8g
Qnkgd2hvbT8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
