Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFA1C79FB5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 02:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTsiYLayroA/xoLC4DrZr4nWp8XJL4mMUW2SyfoaJ64=; b=noKNszSwo73dnK
	LzJS0ETiE+Gxd+haSLGF0XSyZXkjSbSaOddzQCsjd0KYsVBYu1dPWR/RqdE3XamNuV8E2uFFnbAbl
	tRoXwDS+nU7H2u8c43zxl9i35UmEtnwJVr6G6KwPCK+yvhiKQRyC/yNQmAAlWc5qM6xBUidxC7B5D
	Rn2Ua05iM0D6ITJuT4wxhgW+p5yb7d60LI9SIvBhj0d137Qx6oxepcARpA/AKpyir32qzBufg8eUJ
	oYpCFutzbWuVNu5RtZlLl/1ZY+5tEWs/GHCnxeh2PGT0XN8cF/zvm4Pbrq2uii4Esy43pZvvChoEU
	u9qFyM+etYDymfIogy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x48Rv-0000000Agw4-00nM;
	Wed, 09 Sep 2026 02:54:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x48Rt-0000000Agvx-1ALT
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 02:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3650F601FB;
	Wed,  9 Sep 2026 02:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7494D1F00A3A;
	Wed,  9 Sep 2026 02:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788922447;
	bh=1uHlsHpRFiAQnk+tqR8TyIQ88QyOmzn6VrzQzZrizjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqkFk8IMYEaHXaXSufWPc8wDEE5LYC9IU0voM2JBGAbPM0YF+pVSyB4JSMhNJlame
	 FKf0vweuQlwUCq7nAjpNz+4l35z7lDDro90JDYtqOyuDHb01ZuIUMPGLDvvYegRISe
	 xb9VWoOmyx8wi9D1bK3iXLz/DYry8kTZL6H/MT2AD/RJyb5NdTlG1elKsIWVi6td1m
	 UazfdME7TMzv4He2FFZCUn/L9TcWRwpoxEW1Gf1jn7We3yyF+LzbjSE7PIfFt1E4cw
	 VTC6pS4yHweWP2GmR7A47qcwo+Jhgkg4TFFi8Loa1LFzcK1QB33ieRjzXRsh8upZaI
	 iA7YIOWqAi4NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] jffs: initialize inocache to NULL when initializing a
 jffs2_inode_info
To: "Lucas Jeffrey" <luquijeffrey@gmail.com>, dwmw2@infradead.org
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
In-Reply-To: <20260909023955.1642244-1-luquijeffrey@gmail.com>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
Date: Wed, 09 Sep 2026 02:54:07 +0000
Message-Id: <20260909025407.7494D1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtDcml0aWNhbF0gRG91YmxlIGZyZWUgb2YgYGYtPnRhcmdldGAgb24gZWFybHkgVkZTIGZhaWx1
cmUgcGF0aHMgZHVlIHRvIHVuaW5pdGlhbGl6ZWQgc2xhYiBtZW1vcnkuCi0tCgpjb21taXQgOWZk
MjAxMmNmZWMxYjhkMTVkZjE5M2ZlYTk3ZGVhYmRhOTlhYTVlNQpBdXRob3I6IEx1Y2FzIEplZmZy
ZXkgPGx1cXVpamVmZnJleUBnbWFpbC5jb20+CgpqZmZzOiBpbml0aWFsaXplIGlub2NhY2hlIHRv
IE5VTEwgd2hlbiBpbml0aWFsaXppbmcgYSBqZmZzMl9pbm9kZV9pbmZvCgpXaGVuIGEgamZmczJf
aW5vZGVfaW5mbyBpcyBhbGxvY2F0ZWQgdmlhIG5ld19pbm9kZSgpLCBkdWUgdG8gbWVtb3J5IHJl
dXNlIGl0CmNhbiByZXRhaW4gc3RhbGUgdmFsdWVzIGZyb20gaXRzIHByZXZpb3VzIHVzZS4KCklm
IHRoZSBuZXcgamZmczJfaW5vZGVfaW5mbyBvYmplY3QgYWxsb2NhdGVkIHJldGFpbnMgYW4gb2xk
IHJlZmVyZW5jZSB0byBhCmZyZWVkIGlub2NhY2hlLCB0aGUgZnVuY3Rpb24gamZmczJfbmV3X2lu
b2RlIG1heSBjcmFzaCBpZiBlaXRoZXIKamZmczJfaW5pdF9hY2xfcHJlIG9yIGpmZnMyX2RvX25l
d19pbm9kZSByZXR1cm5zIGFuIGVycm9yIHZhbHVlIGJlY2F1c2UKd2hlbiBjYWxsaW5nIGlwdXQo
KSB3aXRoIHRoZSBpbm9kZSBpdCB3aWxsIGV2ZW50dWFsbHkgYXR0ZW1wdCB0byBmcmVlIGFnYWlu
CnRoZSBpbm9jYWNoZS4KClJlcG9ydGVkLWJ5OiBzeXpib3QrM2E4MDk5MzIyYjA5ZDhkMDczZDFA
c3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNw
b3QuY29tL2J1Zz9leHRpZD0zYTgwOTkzMjJiMDlkOGQwNzNkMQpTaWduZWQtb2ZmLWJ5OiBMdWNh
cyBKZWZmcmV5IDxsdXF1aWplZmZyZXlAZ21haWwuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvamZm
czIvb3MtbGludXguaCBiL2ZzL2pmZnMyL29zLWxpbnV4LmgKPiBpbmRleCA4NmFiMDE0YTM0OWM1
Li40MGYxNzIxOGEyNzZiIDEwMDY0NAo+IC0tLSBhL2ZzL2pmZnMyL29zLWxpbnV4LmgKPiArKysg
Yi9mcy9qZmZzMi9vcy1saW51eC5oCj4gQEAgLTUyLDYgKzUyLDcgQEAgc3RhdGljIGlubGluZSB2
b2lkIGpmZnMyX2luaXRfaW5vZGVfaW5mbyhzdHJ1Y3QgamZmczJfaW5vZGVfaW5mbyAqZikKPiAg
ewo+ICAJZi0+aGlnaGVzdF92ZXJzaW9uID0gMDsKPiAgCWYtPmZyYWd0cmVlID0gUkJfUk9PVDsK
PiArCWYtPmlub2NhY2hlID0gTlVMTDsKPiAgCWYtPm1ldGFkYXRhID0gTlVMTDsKPiAgCWYtPmRl
bnRzID0gTlVMTDsKPiAgCWYtPnRhcmdldCA9IE5VTEw7CgpbU2V2ZXJpdHk6IENyaXRpY2FsXQpU
aGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXNuJ3QgZi0+
dGFyZ2V0IHN1ZmZlciBmcm9tCmEgc2ltaWxhciBpc3N1ZSBkdWUgdG8gdW5pbml0aWFsaXplZCBz
bGFiIG1lbW9yeSBvbiBlYXJseSBWRlMgZmFpbHVyZSBwYXRocz8KCldoZW4gdGhlIFZGUyBhbGxv
Y2F0ZXMgYSBuZXcgaW5vZGUgdmlhIGpmZnMyX2FsbG9jX2lub2RlKCkgaW4KZnMvamZmczIvc3Vw
ZXIuYywgdGhlIG9iamVjdCBpcyByZXR1cm5lZCBmcm9tIHRoZSBTTEFCIGNhY2hlIHdpdGhvdXQK
X19HRlBfWkVSTy4gSXQgcmV0YWlucyBzdGFsZSB2YWx1ZXMgZnJvbSBpdHMgcHJldmlvdXMgbGlm
ZWN5Y2xlLCBpbmNsdWRpbmcKYSBkYW5nbGluZyBwb2ludGVyIGluIGYtPnRhcmdldCwgYmVjYXVz
ZSBqZmZzMl9mcmVlX2lub2RlKCkgZnJlZXMgZi0+dGFyZ2V0CmJ1dCBkb2VzIG5vdCBudWxsaWZ5
IGl0LgoKSkZGUzIgZGVmZXJzIGluaXRpYWxpemluZyBmLT50YXJnZXQgPSBOVUxMIHRvIGpmZnMy
X2luaXRfaW5vZGVfaW5mbygpLCB3aGljaAppcyBjYWxsZWQgYWZ0ZXIgVkZTIGluaXRpYWxpemF0
aW9uIGNvbXBsZXRlcy4gSWYgdGhlIFZGUyBmYWlscyBlYXJseSAoZS5nLiwKaW5vZGVfaW5pdF9h
bHdheXMoKSBmYWlscyBkdWUgdG8gYW4gTFNNIG1lbW9yeSBhbGxvY2F0aW9uLCBvciBpZ2V0X2xv
Y2tlZCgpCmluIGZzL2lub2RlLmMgZW5jb3VudGVycyBhIGhhc2ggY29sbGlzaW9uIHJhY2UgYW5k
IGRyb3BzIHRoZSBuZXdseSBhbGxvY2F0ZWQKaW5vZGUpLCB0aGUgVkZTIGRlc3Ryb3lzIHRoZSBp
bm9kZSB2aWEgamZmczJfZnJlZV9pbm9kZSgpIGJlZm9yZSBKRkZTMiBldmVyCmluaXRpYWxpemVz
IGl0LgoKVGhpcyBjYXVzZXMgYSBkb3VibGUgZnJlZSB3aGVuIGtmcmVlKGYtPnRhcmdldCkgZXhl
Y3V0ZXMgYWdhaW4gb24gdGhlCmRhbmdsaW5nIHBvaW50ZXI6Cgpmcy9qZmZzMi9zdXBlci5jOmpm
ZnMyX2ZyZWVfaW5vZGUoKSB7CgkuLi4KCWtmcmVlKGYtPnRhcmdldCk7CglrbWVtX2NhY2hlX2Zy
ZWUoamZmczJfaW5vZGVfY2FjaGVwLCBmKTsKfQoKVXNlcnNwYWNlIGNhbiByZWxpYWJseSB0cmln
Z2VyIHRoZSBpZ2V0X2xvY2tlZCgpIGhhc2ggY29sbGlzaW9uIHJhY2UgYnkKcGVyZm9ybWluZyBj
b25jdXJyZW50IGxvb2t1cHMgKGUuZy4sIHN0YXQoKSBvciBvcGVuKCkpIG9uIHRoZSBzYW1lCm5v
bi1yZXNpZGVudCBpbm9kZToKCmZzL2lub2RlLmM6aWdldF9sb2NrZWQoKSB7CgkuLi4KCWlmICh1
bmxpa2VseSh0ZXN0X2JpdChfX0lfTkVXLCAmaW5vZGUtPmlfc3RhdGUpKSkgewoJCS8qIFVoaHVo
LCBzb21lYm9keSBlbHNlIGNyZWF0ZWQgdGhlIHNhbWUgaW5vZGUgdW5kZXIgdXMuLi4gKi8KCQlz
cGluX3VubG9jaygmaW5vZGVfaGFzaF9sb2NrKTsKCQlkZXN0cm95X2lub2RlKGlub2RlKTsKCS4u
Lgp9CgpXb3VsZCBpdCBiZSBzYWZlciB0byB6ZXJvIHRoZXNlIGZpZWxkcyBpbiBqZmZzMl9hbGxv
Y19pbm9kZSgpIG9yIGVuc3VyZQpqZmZzMl9mcmVlX2lub2RlKCkgbnVsbGlmaWVzIHRoZW0gYmVm
b3JlIHJldHVybmluZyB0aGUgb2JqZWN0IHRvIHRoZSBzbGFiCmNhY2hlPwoKLS0gClNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwOTAyMzk1
NS4xNjQyMjQ0LTEtbHVxdWlqZWZmcmV5QGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
