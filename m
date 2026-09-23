Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496F3C982FA
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcIC2lmMm8WhuEnJ1DtcjcNfTRZbcnlRBVIQO81kZdM=; b=G9KroFIjRy0EvV
	tyocZyAiUZbYoAamPArWA668kxz74JR9YRKbs7dk83XLL1bYYTAXhdmYKNb36VDEobo42VmXOB86o
	NNmbHFDYl3wkShK3M8ETvCG0DNRQJRzNi7PmAaTmWY1tijS08lVbWzQIr+XJzm5uhhAG4f6j2kWth
	gMqCdjWrAylhReGq1z1FjdRO5y332K0x5sCJmbPC6F+jpoaOYjbLiSanqWVwx2ecuE5WJ2K+x6F/9
	WEf1xyrsj19mEioPK953LbUHP8WEOjQgkS5VXi1t4+g8Y12CMbYdRzxSB+aRZk048RBLwvpjKXhOM
	sJ38jAxtLd8kZrqbbPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JU3-00000007m9s-2zQQ;
	Wed, 23 Sep 2026 09:41:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JU2-00000007m9h-1MYB
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 09:41:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C3EB601F0;
	Wed, 23 Sep 2026 09:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E723B1F00893;
	Wed, 23 Sep 2026 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156505;
	bh=KIWCajMiURS7WRviggJnv1QIOiNyOS+SklvACs0UUxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K5i+AP0vSJzauqGLuX7zaQXc7Xfnmx4LtWEbRZKy0GpiMpyb0AVRC6XoyDJ+emV/y
	 utNMYE9v9JirXDG72k+gGY3SOtkLQ40VrbcY34FEwYUbxegwTfZelrUAfPWKsy6Wmp
	 UKIDUP9orIPONpumQf6tRWfbCfGj9gtL00fAqxmVQ6b85prFiuhVG1dbgCynfnp4vj
	 Joae53lL2scx/qEPbJmh4cv1ffiixZ99/T/C67CkdZ6rKOLdzx9jxgbEwzCqmfzvaG
	 ciO/SSPXvFp908BHh3+DRQ9JkqZZHN3vHGK5p35Fm56mexkCVwjkaDfAVf7KpgrMkM
	 2ddThT4F2f0+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
To: "Stephen Bancroft" <stevereaver@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Richard Weinberger" <richard@nod.at>, linux-kernel@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260923092626.873202-1-stevereaver@gmail.com>
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com>
Date: Wed, 23 Sep 2026 09:41:44 +0000
Message-Id: <20260923094144.E723B1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogbWFwczogVUFG
IG9mIG10ZF9pbmZvIGFuZCBJL08gbWVtb3J5IG9uIGRldmljZSB1bnJlZ2lzdHJhdGlvbgotLQoK
Y29tbWl0IGFkMzAxNmZlMzg5M2IyM2Y2MWFjZjlmOTY5MTNmZjUxNzI2YWMzYTAKQXV0aG9yOiBT
dGVwaGVuIEJhbmNyb2Z0IDxzdGV2ZXJlYXZlckBnbWFpbC5jb20+CgptdGQ6IG1hcHM6IGFkZCBJ
TlQwODAwIGZpcm13YXJlLWZsYXNoIG1hcCBkcml2ZXIKICAgIApBZGQgYSByZWFkLW9ubHkgbWFw
cGluZyBkcml2ZXIgdGhhdCBiaW5kcyB0aGUgQUNQSSBJTlQwODAwICJJbnRlbAo4MjgwMiBmaXJt
d2FyZSBodWIiIGRldmljZSBhbmQgZXhwb3NlcyB0aGUgc3lzdGVtIGZpcm13YXJlIGZsYXNoIGFz
IGFuCk1URCBST00gZGV2aWNlLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbWFwcy9pbnQw
ODAwLmMgYi9kcml2ZXJzL210ZC9tYXBzL2ludDA4MDAuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYzVmMTA4YWEzNDc5Nwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9kcml2ZXJzL210ZC9tYXBzL2ludDA4MDAuYwoKWyAuLi4gXQoKPiArc3RhdGljIHZvaWQg
aW50MDgwMF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewo+ICsJc3Ry
dWN0IGludDA4MDAgKmZ3ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gKwo+ICsJbXRk
X2RldmljZV91bnJlZ2lzdGVyKGZ3LT5tdGQpOwo+ICsJbWFwX2Rlc3Ryb3koZnctPm10ZCk7Cgpb
U2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyB0ZWFyZG93biBwYXRoIGZvcmNlIGEgdXNlLWFmdGVy
LWZyZWUgaWYgdGhlIGRldmljZSBpcyByZW1vdmVkCndoaWxlIGEgZmlsZSBkZXNjcmlwdG9yIGlz
IG9wZW4/CgpXaGlsZSB0aGUgZHJpdmVyIHNldHMgLnN1cHByZXNzX2JpbmRfYXR0cnMgPSB0cnVl
IHRvIHByZXZlbnQgbWFudWFsIHN5c2ZzCnVuYmluZHMsIHRoZSBkcml2ZXIgY29yZSBjYW4gc3Rp
bGwgaW52b2tlIHJlbW92ZSgpIHdoZW4gdGhlIHVuZGVybHlpbmcKZGV2aWNlIGlzIHVucmVnaXN0
ZXJlZC4gVGhpcyBjYW4gaGFwcGVuIGlmIHJvb3QgdW5iaW5kcyB0aGUgcGFyZW50IGJyaWRnZQpp
biBzeXNmcywgb3IgdmlhIEFDUEkgU1NEVCB1bmxvYWRpbmcuCgpJZiBpbnQwODAwX3JlbW92ZSgp
IGlzIGludm9rZWQgd2hpbGUgdXNlcnNwYWNlIGhvbGRzIGFuIG9wZW4gZmlsZQpkZXNjcmlwdG9y
LCBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoKSBwdXRzIHRoZSBrcmVmIGJ1dCBkb2VzIG5vdCByZWxl
YXNlCnRoZSBzdHJ1Y3QgZGV2aWNlIGJlY2F1c2UgdGhlIGNoYXJhY3RlciBkZXZpY2UgcmV0YWlu
cyBhbiBhY3RpdmUgcmVmZXJlbmNlLgoKVW5jb25kaXRpb25hbGx5IGNhbGxpbmcgbWFwX2Rlc3Ry
b3koZnctPm10ZCkgdGhlbiBmcmVlcyB0aGUgbXRkX2luZm8Kc3RydWN0dXJlLiBDb3VsZCBzdWJz
ZXF1ZW50IC9kZXYvbXRkMCByZWFkcyBvciBzeXNmcyBhY2Nlc3NlcyBkZXJlZmVyZW5jZQp0aGlz
IGZyZWVkIG1lbW9yeSBhbmQgYWNjZXNzIHVubWFwcGVkIGRldm0gSS9PIG1lbW9yeT8KCj4gK30K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA5MjMwOTI2MjYuODczMjAyLTEtc3RldmVyZWF2ZXJAZ21haWwuY29tP3BhcnQ9MQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
