Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F412CA9EC5
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG+AeIE8SJgs5VlVwhaCywK698x+scQlbaIho7L9+mI=; b=YwlNgWMX6pgMCT
	b4kcw9lb3q9TK3vPXZze6Bz3VEFs51nHaqt3PCqY3Yh4ZUgWjlnnbqiNHv0cN+tVdHHZQQIqWxkz3
	V1NTv1whlAg9kCNrpqDveNcgyZJNya89xKwEj9H6FWjTlD4T//wub3xNA4wBJfiOl9j4BwC5qsIUX
	jnPCuGJoTDnHFvx53eMaZDypaJlk02iIo4ZIpt+dcyVajhd7rRoiGLSuYsdzsVMXihMTy9lZur8ud
	acHFYgJPPAp7W1C1RQNenqsL/TWyJ9u80WLrj+WExW7PZN2yt27ToP0WlE9TtgCEtL75+VGf4haaA
	oiuefeAV5FDOQAry1spQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGObc-0000000Bc8h-0S1z;
	Mon, 12 Oct 2026 22:34:52 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGObY-0000000Bc8F-3RuL
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 22:34:50 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8ab37e44643so13420057b3.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1791844487; x=1792449287; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71EqnmdUFPL0oyce+6aQMAYEr0rHGu143nkPC8VddIM=;
        b=P7rr9lJpq1qoWvO6CBxhGn2fH3DN0ZhjDePop48mWqCax6oFb+Ralof/AR70cEyEi+
         qcNK+TgrRP9BTR0Ecl+8WuYswl5cd1VgtgyuzvysrO++93waiR7l2pqAfHsDfLJEEpnU
         UW9n/I8eHv7fhMnuuPcV3kDF/j+6QoX/5dh7J+UsI67q/rk/BlhfjJfGOWZGZoghwL4I
         hoyQrAutpZsv7cdRQUglOoVdLxNSYL4Jsc7xQWQ/cuDeRpIq6G60x+z0HCRhReu3LVoN
         9rY/6Z7hN4LiuOsOyl7FNyvY8hrkTUl9ktxtBlxUFsTQ7xMuFCWKIVSuG0saZ/WJBCIy
         CRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791844487; x=1792449287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=71EqnmdUFPL0oyce+6aQMAYEr0rHGu143nkPC8VddIM=;
        b=XLc9NQCaVwPx4dkw9b54BTj7wzDaBQMq5+xV8xsL6zCb2FqPBmhlX9J39mF+MSdI2t
         9cfhbX4DQDFxfvv5PxcTrDRj/1QrmVuk2BK2N5ta/vS0pwwzhunD2gJaeU8FEOttoNmg
         gcr4QnilaPXHI1I2HvzzSUe2aDCR5Qlu6I8II3NUQGNQVKk1cFJqKGXHW6wCZh4OGK57
         6mACEdA0hxZMQp7CYNz08IuD9KdOdLb5uguDpLyrPmskcl1GZrvmhQfn+HwV3lq8PqJx
         CZxc+scpaIVibb/qP4ARkv9EGBcnPBDvty3uJOBBt+C5TrFZWzBbx7yYdnO6EQBgO6Tk
         iLXg==
X-Forwarded-Encrypted: i=1; AKwUvBwzNXac5UkklGa2sbiTYhqSAXlc8JL1i1nGJJTWRCFVwVQQKSveHgKsmM0dizA/1hrwPrWYskdv9Do=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZmrUA+LFdyj0yidmHNhuigzArvwz4zaOwp6dk1VyyxKgAUjEX
	Vlb8cNRSPtAmZGsBZMsXzyz1yJ7stRyfQ7v3KTTb8ka82X3WAUAO5cF5PoW0FLP8RKM=
X-Gm-Gg: AYBFou1fM+kmVEeLMHgNvMgXxwDiyis67BtjsW7gxd9CK+xDHf9NzQOCBoes5wdtpk7
	Z/JyUZ3d6llgr0fyrtO539u/URcNCANEf1FitSiUnmJU78hOP9aqU/b7V34B8eL5SQrH/6gCbpl
	RhDfDyereBMzi866NI/uOeGQFw8VSKP+sJvHy1jr4iLEhmWLNba25jgrdv3Y3p7ll4gO8cedH6Z
	9KgYKE5PesyXGpbPOHaQThhdrZmgPfvdEGTN8N6wfpQV36qGWnINPhCTa4nwaE8Gvq9LCeKakq8
	kUeizwotuoOHREcezbASasM8aEKt0mMj/yMFekpZGGM082paIW69rxL1lzgyAyk8hBfF4h6kGBs
	u3Tli6hDDPty3xMSfkRLJ8K/WPE2Ufda74clvOnQUH9ylre8yIK653ED3uFaMSubRLcL7C74LNz
	60t8ohXfB5W25+UWw6zlQ7GRCEnZnGD0PzFhvJoaSqO0HwmXOulThAPBS5oLKhxvbMHQutUydQ1
	TS3toQINhJLYyAo/nOIHJoYC8JOJkr+eSK7Z/JjXJ0xLk4oyjJ7+8VR1jHTGcwKMFesr0KLOdhE
	0NxQGkVljGEB2g4MIdXQJn/KS+Ii8ode
X-Received: by 2002:a05:690c:7108:b0:8b0:4f12:d36f with SMTP id 00721157ae682-8b07ed609b7mr36562257b3.52.1791844487244;
        Mon, 12 Oct 2026 15:34:47 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430::48? ([2600:1700:6476:1430::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0ab2e8d0fsm9306077b3.22.2026.10.12.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 15:34:46 -0700 (PDT)
Message-ID: <2e7d65d349c6691697f02f98f733a651ce3aa116.camel@dubeyko.com>
Subject: Re: [Jfs-discussion] [PATCH RFC 10/28] hfsplus: don't set SB_RDONLY
 when creating the attributes tree
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.com>
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, ntfs@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, 	ecryptfs@vger.kernel.org,
 gfs2@lists.linux.dev, exfat@lists.linux.dev, 	linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Al Viro	 <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, 	linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Date: Mon, 12 Oct 2026 15:34:42 -0700
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-10-60743a3dc326@kernel.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
	 <20261012-work-fs-sb_rdonly-v1-10-60743a3dc326@kernel.org>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.60.1 (by Flathub.org) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_153449_145148_C2F0BD7A 
X-CRM114-Status: GOOD (  24.81  )
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

T24gTW9uLCAyMDI2LTEwLTEyIGF0IDEyOjIwICswMjAwLCBDaHJpc3RpYW4gQnJhdW5lciB2aWEg
SmZzLWRpc2N1c3Npb24Kd3JvdGU6Cj4gaGZzX2J0cmVlX29wZW4oKSBzZXRzIFNCX1JET05MWSB3
aGVuIHRoZSBtYXAgcmVjb3JkIG9mIGEgYi10cmVlCj4gZG9lc24ndAo+IG1hcmsgdGhlIGhlYWRl
ciBub2RlIGFzIHVzZWQuIFRoYXQncyBmaW5lIHdoaWxlIG1vdW50aW5nIHdoZXJlIHRoZQo+IG1v
dW50ZXIgaG9sZHMgc2ItPnNfdW1vdW50LiBCdXQgaGZzcGx1c19jcmVhdGVfYXR0cmlidXRlc19m
aWxlKCkKPiBjYWxscwo+IGl0IHRvbyB3aGVuIHRoZSBmaXJzdCBleHRlbmRlZCBhdHRyaWJ1dGUg
Z2V0cyBzZXQgb24gYSBmaWxlc3lzdGVtCj4gdGhhdAo+IGRvZXNuJ3QgaGF2ZSBhbiBhdHRyaWJ1
dGVzIGZpbGUgeWV0LiBUaGF0IHJ1bnMgb24gdGhlIGxpdmUgZmlsZXN5c3RlbQo+IHdpdGhvdXQg
c191bW91bnQgYW5kIGEgZmlsZXN5c3RlbSBtdXN0IG5vdCBjaGFuZ2UgU0JfUkRPTkxZIGJlaGlu
ZAo+IHRoZQo+IFZGUycgYmFjay4KPiAKPiBoZnNwbHVzX2NyZWF0ZV9hdHRyaWJ1dGVzX2ZpbGUo
KSBvcGVucyBhIHRyZWUgaXQgaGFzIGp1c3QgY3JlYXRlZAo+IGl0c2VsZiwgd2l0aCB0aGUgaGVh
ZGVyIG5vZGUgbWFya2VkIGFzIHVzZWQuIFNvIHRoZXJlJ3Mgbm90aGluZyB0bwo+IGNoZWNrIHRo
ZXJlLiBPbmx5IGRvIHRoZSBjaGVjayB3aGlsZSB0aGUgZmlsZXN5c3RlbSBpcyBiZWluZyBtb3Vu
dGVkLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1bmVyQGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBm
cy9oZnNwbHVzL2J0cmVlLmMgfCA3ICsrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvaGZzcGx1cy9idHJl
ZS5jIGIvZnMvaGZzcGx1cy9idHJlZS5jCj4gaW5kZXggMmVhOGNkNTY1OGUxLi45NjdjNDU3ZDg0
M2QgMTAwNjQ0Cj4gLS0tIGEvZnMvaGZzcGx1cy9idHJlZS5jCj4gKysrIGIvZnMvaGZzcGx1cy9i
dHJlZS5jCj4gQEAgLTM4NSw3ICszODUsMTIgQEAgc3RydWN0IGhmc19idHJlZSAqaGZzX2J0cmVl
X29wZW4oc3RydWN0Cj4gc3VwZXJfYmxvY2sgKnNiLCB1MzIgaWQpCj4gwqAJaWYgKElTX0VSUihu
b2RlKSkKPiDCoAkJZ290byBmcmVlX2lub2RlOwo+IMKgCj4gLQlpZiAoIWhmc19ibWFwX3Rlc3Rf
Yml0KG5vZGUsIDApKSB7Cj4gKwkvKgo+ICsJICogT25seSBhIG1vdW50IG1heSBzZXQgU0JfUkRP
TkxZLCBsYXRlciB0aGF0IG5lZWRzCj4gc191bW91bnQuIEFmdGVyIHRoZQo+ICsJICogbW91bnQg
dGhpcyBvbmx5IG9wZW5zIHRoZSBhdHRyaWJ1dGVzIHRyZWUgdGhhdAo+ICsJICogaGZzcGx1c19j
cmVhdGVfYXR0cmlidXRlc19maWxlKCkganVzdCBjcmVhdGVkIHdpdGggdGhlCj4gYml0IHNldC4K
PiArCSAqLwo+ICsJaWYgKCEoc2ItPnNfZmxhZ3MgJiBTQl9CT1JOKSAmJiAhaGZzX2JtYXBfdGVz
dF9iaXQobm9kZSwgMCkpCj4gewo+IMKgCQlwcl93YXJuKCIoJXMpOiAlcyAoY25pZCAweCV4KSBt
YXAgcmVjb3JkIGludmFsaWQgb3IKPiBiaXRtYXAgY29ycnVwdGlvbiBkZXRlY3RlZCwgZm9yY2lu
ZyByZWFkLW9ubHkuXG4iLAo+IMKgCQkJCXNiLT5zX2lkLCBoZnNfYnRyZWVfbmFtZShpZCksIGlk
KTsKPiDCoAkJcHJfd2FybigiUnVuIGZzY2suaGZzcGx1cyB0byByZXBhaXIuXG4iKTsKClllcywg
d2UgY2FuIGRvIHRoaXMuIEJ1dCwgbWF5YmUsIHdlIG5lZWQgdG8gbW92ZSB0aGlzIGNoZWNrOgoK
CW5vZGUgPSBoZnNfYm5vZGVfZmluZCh0cmVlLCBIRlNQTFVTX1RSRUVfSEVBRCk7CglpZiAoSVNf
RVJSKG5vZGUpKQoJCWdvdG8gZnJlZV9pbm9kZTsKCglpZiAoIWhmc19ibWFwX3Rlc3RfYml0KG5v
ZGUsIDApKSB7CgkJcHJfd2FybigiKCVzKTogJXMgKGNuaWQgMHgleCkgbWFwIHJlY29yZCBpbnZh
bGlkIG9yCmJpdG1hcCBjb3JydXB0aW9uIGRldGVjdGVkLCBmb3JjaW5nIHJlYWQtb25seS5cbiIs
CgkJCQlzYi0+c19pZCwgaGZzX2J0cmVlX25hbWUoaWQpLCBpZCk7CgkJcHJfd2FybigiUnVuIGZz
Y2suaGZzcGx1cyB0byByZXBhaXIuXG4iKTsKCQlzYi0+c19mbGFncyB8PSBTQl9SRE9OTFk7Cgl9
CgoJaGZzX2Jub2RlX3B1dChub2RlKTsKCmludG8gaGZzcGx1c19maWxsX3N1cGVyKCkuIEJlY2F1
c2UsIHRoZW4gbWFpbiBwb2ludCBvZiB0aGlzIGNoZWNrCm5hbWVseSBjaGVjayB0aGUgYi10cmVl
cyBkdXJpbmcgbW91bnQuIElmIHdlIGNyZWF0ZSBBdHRyaWJ1dGVzIEZpbGUKZHVyaW5nIHNldHRp
bmcgYSBmaXJzdCB4YXR0ciwgdGhlbiBtYXAgcmVjb3JkIGlzIGFsd2F5cyB2YWxpZC4gSXQKc291
bmRzIHRvIG1lIGxpa2UgbW9yZSBjbGVhbiBzb2x1dGlvbi4gV2hhdCBkbyB5b3UgdGhpbms/CgpU
aGFua3MsClNsYXZhLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
