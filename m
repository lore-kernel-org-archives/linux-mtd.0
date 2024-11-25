Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DE3E6689E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peKmCOETjmzdPldaXjZAM1vgLRIpWoR/2Fyd4xs1r60=; b=Wtcur974z3yPOB
	eeLQidjG479k2mDTVs1zGBGpbcJnuGj90vtRS1n00U5ngPYvLLTTYo24xGWXdlLuA2V/Nmao7TfrS
	CkaYnUA7LJlAG9hNI9TfMvj1js06PM1W+8eKu8oP0oeeoBxi3ttA8U/n10PXTSlo96MBImixqLN3F
	yt16la5Dkk/E8OhoAmrPmqdItpA/x+CUwioWHgI+zQZomUmdgnsPQ37MkM5RnY3Jr9nnRsWizNbAD
	URQtoVfgLyb+UbMtnFEmR9nNWuGzhcpQl1hLueUVBqLmfMAYEgnU+MgLIz8P5gcwGoxJrWGpOZJYC
	o8CskwStiG5QNTiLURHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWWL-00000007n0j-3e71;
	Mon, 25 Nov 2024 10:40:45 +0000
Received: from server02.seltendoof.de ([168.119.48.163])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWWJ-00000007mxs-1MGj
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 10:40:44 +0000
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1732531230;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BnJPwZBINKy4LES6pr7BNEYT4c7M8sYvf1DiqcmfvZQ=;
	b=renzaNjYJ9YJyG9gUtmjWqJwQ0VY7TQPB8AIE5W2eHdeqh2KtO/X4RlDCy1my/SVpQmQbZ
	wjNEjBd+3Nx5SYzGSi/4OwNEhlCfesxm4VNww0jT0OEYCfKsxUBHnyqFZjs4qmm0yXdPXf
	JQVxhmVSoR7oSv45zcTLYW4BjQnZhX+TQ9oYJfvSmhOwIXh5wbGCNS9yLVPQ//3K2TAHgl
	Eb4e91BrZZEw09F7m/z/76uD9fpDEgjnOst+2rcsjNChNW2KdjtqLgROIapy8OMfgZI/BW
	MreOsqodNcQhtkdGSCQM3CtyEM177zZSZrrnzTyeG6viMRNF26psOPQLgVZyPg==
To: linux-security-module@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Serge Hallyn <serge@hallyn.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mtd@lists.infradead.org,
	cocci@inria.fr
Subject: [PATCH 06/11] ubifs: reorder capability check last
Date: Mon, 25 Nov 2024 11:39:58 +0100
Message-ID: <20241125104011.36552-5-cgoettsche@seltendoof.de>
In-Reply-To: <20241125104011.36552-1-cgoettsche@seltendoof.de>
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_024043_506253_FDF16DE3 
X-CRM114-Status: GOOD (  13.61  )
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
Reply-To: cgzones@googlemail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2hyaXN0aWFuIEfDtnR0c2NoZSA8Y2d6b25lc0Bnb29nbGVtYWlsLmNvbT4KCmNhcGFi
bGUoKSBjYWxscyByZWZlciB0byBlbmFibGVkIExTTXMgd2hldGhlciB0byBwZXJtaXQgb3IgZGVu
eSB0aGUKcmVxdWVzdC4gIFRoaXMgaXMgcmVsZXZhbnQgaW4gY29ubmVjdGlvbiB3aXRoIFNFTGlu
dXgsIHdoZXJlIGEKY2FwYWJpbGl0eSBjaGVjayByZXN1bHRzIGluIGEgcG9saWN5IGRlY2lzaW9u
IGFuZCBieSBkZWZhdWx0IGEgZGVuaWFsCm1lc3NhZ2Ugb24gaW5zdWZmaWNpZW50IHBlcm1pc3Np
b24gaXMgaXNzdWVkLgpJdCBjYW4gbGVhZCB0byB0aHJlZSB1bmRlc2lyZWQgY2FzZXM6CiAgMS4g
QSBkZW5pYWwgbWVzc2FnZSBpcyBnZW5lcmF0ZWQsIGV2ZW4gaW4gY2FzZSB0aGUgb3BlcmF0aW9u
IHdhcyBhbgogICAgIHVucHJpdmlsZWdlZCBvbmUgYW5kIHRodXMgdGhlIHN5c2NhbGwgc3VjY2Vl
ZGVkLCBjcmVhdGluZyBub2lzZS4KICAyLiBUbyBhdm9pZCB0aGUgbm9pc2UgZnJvbSAxLiB0aGUg
cG9saWN5IHdyaXRlciBhZGRzIGEgcnVsZSB0byBpZ25vcmUKICAgICB0aG9zZSBkZW5pYWwgbWVz
c2FnZXMsIGhpZGluZyBmdXR1cmUgc3lzY2FsbHMsIHdoZXJlIHRoZSB0YXNrCiAgICAgcGVyZm9y
bXMgYW4gYWN0dWFsIHByaXZpbGVnZWQgb3BlcmF0aW9uLCBsZWFkaW5nIHRvIGhpZGRlbiBsaW1p
dGVkCiAgICAgZnVuY3Rpb25hbGl0eSBvZiB0aGF0IHRhc2suCiAgMy4gVG8gYXZvaWQgdGhlIG5v
aXNlIGZyb20gMS4gdGhlIHBvbGljeSB3cml0ZXIgYWRkcyBhIHJ1bGUgdG8gcGVybWl0CiAgICAg
dGhlIHRhc2sgdGhlIHJlcXVlc3RlZCBjYXBhYmlsaXR5LCB3aGlsZSBpdCBkb2VzIG5vdCBuZWVk
IGl0LAogICAgIHZpb2xhdGluZyB0aGUgcHJpbmNpcGxlIG9mIGxlYXN0IHByaXZpbGVnZS4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBHw7Z0dHNjaGUgPGNnem9uZXNAZ29vZ2xlbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbnRob3IvcGFudGhvcl9kcnYuYyB8IDIgKy0KIGZzL3Vi
aWZzL2J1ZGdldC5jICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKy0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFudGhvci9wYW50aG9yX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbnRob3Iv
cGFudGhvcl9kcnYuYwppbmRleCBhYzdlNTNmNmUzZjAuLjJkZTBjMzYyN2ZiZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3BhbnRob3IvcGFudGhvcl9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFudGhvci9wYW50aG9yX2Rydi5jCkBAIC03OTEsNyArNzkxLDcgQEAgc3RhdGljIGlu
dCBncm91cF9wcmlvcml0eV9wZXJtaXQoc3RydWN0IGRybV9maWxlICpmaWxlLAogCQlyZXR1cm4g
MDsKIAogCS8qIEhpZ2hlciBwcmlvcml0aWVzIHJlcXVpcmUgQ0FQX1NZU19OSUNFIG9yIERSTV9N
QVNURVIgKi8KLQlpZiAoY2FwYWJsZShDQVBfU1lTX05JQ0UpIHx8IGRybV9pc19jdXJyZW50X21h
c3RlcihmaWxlKSkKKwlpZiAoZHJtX2lzX2N1cnJlbnRfbWFzdGVyKGZpbGUpIHx8IGNhcGFibGUo
Q0FQX1NZU19OSUNFKSkKIAkJcmV0dXJuIDA7CiAKIAlyZXR1cm4gLUVBQ0NFUzsKZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL2J1ZGdldC5jIGIvZnMvdWJpZnMvYnVkZ2V0LmMKaW5kZXggZDc2ZWI3YjM5
ZjU2Li42MTM3YWVhZGVjM2YgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL2J1ZGdldC5jCisrKyBiL2Zz
L3ViaWZzL2J1ZGdldC5jCkBAIC0yNTYsOCArMjU2LDkgQEAgbG9uZyBsb25nIHViaWZzX2NhbGNf
YXZhaWxhYmxlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbWluX2lkeF9sZWJzKQog
ICovCiBzdGF0aWMgaW50IGNhbl91c2VfcnAoc3RydWN0IHViaWZzX2luZm8gKmMpCiB7Ci0JaWYg
KHVpZF9lcShjdXJyZW50X2ZzdWlkKCksIGMtPnJwX3VpZCkgfHwgY2FwYWJsZShDQVBfU1lTX1JF
U09VUkNFKSB8fAotCSAgICAoIWdpZF9lcShjLT5ycF9naWQsIEdMT0JBTF9ST09UX0dJRCkgJiYg
aW5fZ3JvdXBfcChjLT5ycF9naWQpKSkKKwlpZiAodWlkX2VxKGN1cnJlbnRfZnN1aWQoKSwgYy0+
cnBfdWlkKSB8fAorCSAgICAoIWdpZF9lcShjLT5ycF9naWQsIEdMT0JBTF9ST09UX0dJRCkgJiYg
aW5fZ3JvdXBfcChjLT5ycF9naWQpKSB8fAorCSAgICBjYXBhYmxlKENBUF9TWVNfUkVTT1VSQ0Up
KQogCQlyZXR1cm4gMTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
