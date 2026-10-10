Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70556CA9EC1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 18:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INTLJgBCNhkMRiBKnYSxeoOmxRBxcJ3oOX1TfM+qhrw=; b=p6jSR6BOBeL/dC
	pL7nRvpXDQOpl9+CX+Vh9FMKV3Q4oZAqHf0SjBUI3U4VJ81qwjAPWW3rQeVE6krLWgT0sOeRBM38Y
	/OjoyJV5L2P6ZcqTStaF93weS3iGvv5m+KYM6RRKo13MaVoAa9gkgf44Rt1SrYnTVdGXHflEDEAyo
	IBHRdqjw7ck5iwzkggaRECY1tabL2fwTo8vZacw5kvg0xZCekPj2YgWwe6GQaa45/TMMtzvl93Soe
	GOAdwdV9upxHuMswAYMLXzVX8btKuSPTJpDitiY8DH+tS+3q9Cc9txzztPqyyBXvvr4ABsXl/3/CL
	vPS3KXJFvxJ7eKgx2NMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbeV-00000008Mue-1x0m;
	Sat, 10 Oct 2026 18:18:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbeT-00000008Mu0-1ewz
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 18:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE864602C5;
	Sat, 10 Oct 2026 18:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EC11F00893;
	Sat, 10 Oct 2026 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791656311;
	bh=DABjXQsbi9RuJVFUzsnDF0bYFa+oP4wh4gikf+ijQLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1c+CjvOo71L7B1Av8FxkrevRc5fo86Vym756a7Q8j43edRtcYc+TN5SgcT7SwE66
	 Wgxl5xa8TXoNRmWcs1vfEBUZCBLxhfnbPMz2vZ3mTy6zG29XmZAU84tszQTpWcKfLn
	 Z0u0ryJT3A3+VBu6gVdCXu5ZI+0Zg4joB0WrSWEjehEAqL5i0ZAhTydz5fBcnmUNvG
	 yoPQU/9tnc1Lzjkafe7Dr5R+eaK0bymsSrmefvbodKj1MdydEuOriItElCekQLdGKy
	 7GMeIsqGtdE/Bqj0qHelMXZYhFhoX4LgPZIA3bnGN1Sm80OnFy+b2PikUU30NMYlbB
	 oYqq39/dTPaiw==
Message-ID: <sashiko-outbox-166800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] MIPS: Octeon: flash: use the simple map
 accessors without a shared eMMC
To: miquel.raynal@bootlin.com, "Orgad Shaneh" <orgads@gmail.com>, tsbogend@alpha.franken.de, richard@nod.at, vigneshr@ti.com
Cc: kaloz@openwrt.org, corbet@lwn.net, dwmw2@infradead.org, john@phrozen.org, linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linusw@kernel.org, linux-kernel@vger.kernel.org, nico@fluxnic.net, ulli.kroll@googlemail.com
In-Reply-To: <20261010180840.2152492-4-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
 <20261010180840.2152492-4-orgads@gmail.com>
Date: Sat, 10 Oct 2026 18:18:29 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbWlwczogY2F2aXVt
LW9jdGVvbjogc3RhdGljIG1hcF9pbmZvIG92ZXJ3cml0ZSBhbmQgbWVtb3J5IGxlYWsgaW4gb2N0
ZW9uX2ZsYXNoX3Byb2JlCi0tCgpjb21taXQgMmQ5YWFlNWJiM2Y2MzRmNzFiMjhkM2FlOTMwODdl
MTJlNzAxZmJlNgpBdXRob3I6IE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWlsLmNvbT4KCk1JUFM6
IE9jdGVvbjogZmxhc2g6IHVzZSB0aGUgc2ltcGxlIG1hcCBhY2Nlc3NvcnMgd2l0aG91dCBhIHNo
YXJlZCBlTU1DCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBPY3Rlb24gZmxhc2ggZHJpdmVyIHRv
IHVzZSBzaW1wbGVfbWFwX2luaXQoKQp3aGVuIHRoZSBib290IGJ1cyBpc24ndCBzaGFyZWQgd2l0
aCBhbiBlTU1DIGhvc3QsIHJlZHVjaW5nIG1vdW50IHRpbWVzCnNpZ25pZmljYW50bHkuIEl0IGFs
c28gY2hlY2tzIGZvciBzdXBwb3J0ZWQgYmFuayB3aWR0aHMgZWFybGllciBpbiB0aGUKcHJvYmUg
ZnVuY3Rpb24gdG8gYXZvaWQgaGl0dGluZyBCVUcgY2FsbHMgb24gdW5zdXBwb3J0ZWQgd2lkdGhz
LgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vZmxhc2hfc2V0dXAuYyBi
L2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2ZsYXNoX3NldHVwLmMKPiBpbmRleCAzMzk1YWNkZTRk
NjBhLi41NDQ4ZDUxMzljNjQwIDEwMDY0NAo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9u
L2ZsYXNoX3NldHVwLmMKPiArKysgYi9hcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9mbGFzaF9zZXR1
cC5jCgpbIC4uLiBdCgo+IEBAIC04NSw2ICs5NiwxMiBAQCBzdGF0aWMgaW50IG9jdGVvbl9mbGFz
aF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQpbIC4uLiBdCj4gIAkJZmxhc2hf
bWFwLnNpemUgPSAweDFmYzAwMDAwIC0gZmxhc2hfbWFwLnBoeXM7Cj4gIAkJLyogOC1iaXQgYnVz
ICgwICsgMSkgb3IgMTYtYml0IGJ1cyAoMSArIDEpICovCj4gIAkJZmxhc2hfbWFwLmJhbmt3aWR0
aCA9IHJlZ2lvbl9jZmcucy53aWR0aCArIDE7Cj4gIAkJZmxhc2hfbWFwLnZpcnQgPSBpb3JlbWFw
KGZsYXNoX21hcC5waHlzLCBmbGFzaF9tYXAuc2l6ZSk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KSWYg
bXVsdGlwbGUgZmxhc2ggZGV2aWNlcyBhcmUgcHJvYmVkLCBkb2VzIHRoaXMgdW5jb25kaXRpb25h
bGx5IG92ZXJ3cml0ZQp0aGUgc3RhdGljIGZsYXNoX21hcC52aXJ0IHdpdGggYSBuZXcgaW9yZW1h
cCgpIG1hcHBpbmc/CgpJZiBhbiBlYXJsaWVyIHByb2JlIHN1Y2Nlc3NmdWxseSByZWdpc3RlcmVk
IGFuIE1URCBkZXZpY2UsIG92ZXJ3cml0aW5nCnRoZSBzaW5nbGV0b24gZmxhc2hfbWFwIGNvdWxk
IGNvcnJ1cHQgdGhlIHByZXZpb3VzIGRldmljZSdzIG1hcHBpbmcuCgo+ICAJCXByX25vdGljZSgi
Qm9vdGJ1cyBmbGFzaDogU2V0dGluZyBmbGFzaCBmb3IgJWx1TUIgZmxhc2ggYXQgIgo+ICAJCQkg
ICIweCUwOGxseFxuIiwgZmxhc2hfbWFwLnNpemUgPj4gMjAsIGZsYXNoX21hcC5waHlzKTsKClsg
Li4uIF0KCj4gIAkJbXltdGQgPSBkb19tYXBfcHJvYmUoImNmaV9wcm9iZSIsICZmbGFzaF9tYXAp
Owo+ICAJCWlmIChteW10ZCkgewo+ICAJCQlteW10ZC0+b3duZXIgPSBUSElTX01PRFVMRTsKPiAg
CQkJbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcihteW10ZCwgcGFydF9wcm9iZV90eXBlcywKPiAg
CQkJCQkJICBOVUxMLCBOVUxMLCAwKTsKPiAgCQl9IGVsc2Ugewo+ICAJCQlwcl9lcnIoIkZhaWxl
ZCB0byByZWdpc3RlciBNVEQgZGV2aWNlIGZvciBmbGFzaFxuIik7Cj4gIAkJfQoKW1NldmVyaXR5
OiBNZWRpdW1dCklzIGFuIGlvdW5tYXAoZmxhc2hfbWFwLnZpcnQpIG5lZWRlZCBoZXJlIHdoZW4g
ZG9fbWFwX3Byb2JlKCkgZmFpbHM/CgpXaXRob3V0IGl0LCB0aGlzIGVycm9yIHBhdGggYXBwZWFy
cyB0byBsZWFrIHRoZSB2aXJ0dWFsIG1hcHBpbmcuCgpUaGUgdjIgY2hhbmdlbG9nIG1lbnRpb25z
IG9taXR0aW5nIGlvdW5tYXAoKSBiZWNhdXNlIGl0IGNvdWxkIHVubWFwIGEKbWFwcGluZyB0aGF0
IGFuIGVhcmxpZXIgcHJvYmUgcmVnaXN0ZXJlZC4gSG93ZXZlciwgc2luY2UgdGhlIHN0YXRpYwpm
bGFzaF9tYXAudmlydCBpcyB1bmNvbmRpdGlvbmFsbHkgb3ZlcndyaXR0ZW4gYnkgaW9yZW1hcCgp
IGVhcmxpZXIgaW4KdGhpcyBmdW5jdGlvbiwgd291bGRuJ3QgdGhlIHNpbmdsZXRvbiBhbHJlYWR5
IGJlIGNvcnJ1cHRlZCBpZiBhIHByaW9yCnByb2JlIGV4aXN0ZWQ/CgpTa2lwcGluZyBpb3VubWFw
KCkgaW4gdGhpcyBwYXRoIGFwcGVhcnMgdG8ganVzdCBsZWFrIG1lbW9yeSByYXRoZXIgdGhhbgpz
YWZlbHkgcHJlc2VydmluZyBhbnkgcHJldmlvdXMgbWFwcGluZy4KCj4gIAl9Cj4gIAlyZXR1cm4g
MDsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MTAxMDE4MDg0MC4yMTUyNDkyLTEtb3JnYWRzQGdtYWlsLmNvbT9wYXJ0PTMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
