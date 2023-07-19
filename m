Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC93EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlRpfUNAVHdLyi6BBE4utk+v28CTDiRlESrlEuCxSQY=; b=2ZlKMafmwXygmS
	uEX0ZwG35jEoIGf4EX5/Leu43CPQt5DSPMESRdRAc+qgjniC6IWFlY8hf/FobGjYKyFALwOaPhbfc
	r57+hGMaJvvTs4PKY5o7+9FLVxhjFT4nLwB+Kp1CQMVIqFo/GYMVtxtQr9v7dMSsUbtJVoRnZ2ev4
	HVFgbS4IaK3isiJrzyksPqyLv6Z6cENG2dvOLidPz4N21JRylhRUuxOPfU63TNpr6fhkxcW8sEH1R
	ENkp2sRFRMyeMwH0OieiylI/kmkOialt6tUlBJ1AFgqFhHGE/jPBi2Gl0Irev4em/HeLQlW+7R1nF
	RUqetTecYJ2f/oPD0VJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8Zv-007pJQ-1c;
	Wed, 19 Jul 2023 14:54:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8Zt-007pIl-1c
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 14:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HvscFXH0QBrrutmvsxs73II8zulO9PY8q/tloEaZuqs=; b=ngWDs9O0xQE5uCRNFKRThvnaXL
	DCQbISbWwsBAobSekz/Wqk9TwdyU6thTW/PLDTMm7kWWnLU0dNoAeDwNV58S10lmI0of4Q+xEx6hU
	PsDyrZpl6RiRt3iyGLadbhDtb6P1Y0j+7lSCwWVlJoQCtq2A5QGRe1MVKyKcf4DQYzX3h/5Vq/jVB
	k6I9Q9p1Iblk6yRiVyd/BfT0HpRMYzfcaGFcy5Iys2zs5uz8YIaJhp2QCFA5xYTIsmcPl6PTSPaUJ
	deraOFy1bD40DB+R7EWtkI2f/kvuarAfVKoX+lfbTHXHdZjjlLFxaplBf+AoSqDrWbDlcDUHcJZA5
	xzD8wT2g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8K0-00DYb7-2k
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 14:38:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB4BA6171D
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 14:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCE3C433CD
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689777506;
	bh=GezNb42kEpgmegboqOOBAyzMgqyuAvFtS/mLgu3jRUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JQGGh5TFecokR/YKhLaMZWg52yo4ZZ3M1avMllGsOMgEUKzc/OUk3I392cKcffGbF
	 OMwzv1r99z3uGG/O+qT0B88iGlu5vx56jVkkni5i8KUC2HPPZ3p90oE1s4nYFjg/0L
	 yhZ34YIsrHnwHZH6L6D59sGcRpi1RG33m+tXVrMD6gDQlHRQMf1wAKXtKsQoF683rg
	 dVYJ9CKiNUKdy92GNh8DmNn8MpQZoqlGhP5kq2k8jJR36tDit2xDdksKkszaf/mOpu
	 JjZQdo5olGWa1rCh677vPUAak9wQVdTqxZdO2AyOyg9Hobi8BzRyS9L781CjQ/Edy1
	 ibmQ54otiiz/A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b961822512so1074421fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 07:38:26 -0700 (PDT)
X-Gm-Message-State: ABy/qLYsJsLGgll4d5WnNBSQSmN6q1Kl4CKljEyn0KXwrDyZFfR/4Dbr
	CkXR/OZw3IpimSFW8e6sJ5G5rjD6STMY5HgVH4Y=
X-Google-Smtp-Source: APBJJlED2jiKRWrm/tbkjsu0sNov4aKWyhqBk9Z1aEui4cjKtLxhvU+nz2Q0ttRwt0rpd3EDFIeTI764n9rYrpoAI4M=
X-Received: by 2002:a2e:7a09:0:b0:2b5:95a8:4126 with SMTP id
 v9-20020a2e7a09000000b002b595a84126mr23133ljc.52.1689777504291; Wed, 19 Jul
 2023 07:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <20230718125847.3869700-6-ardb@kernel.org>
 <20230718223813.GC1005@sol.localdomain> <CAMj1kXE1fND2h8ts6Xtfn19wkt=vAnj1TumxvoBCuEn7z3V4Aw@mail.gmail.com>
 <3330004f-acac-81b4-e382-a17221a0a128@huawei.com>
In-Reply-To: <3330004f-acac-81b4-e382-a17221a0a128@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jul 2023 16:38:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGq=WiJXsQG6R0jEFYu_Mdom_KY+DE=NGqVSF6QmqhKeA@mail.gmail.com>
Message-ID: <CAMj1kXGq=WiJXsQG6R0jEFYu_Mdom_KY+DE=NGqVSF6QmqhKeA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to
 compression routines
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, Kees Cook <keescook@chromium.org>, 
	Haren Myneni <haren@us.ibm.com>, Nick Terrell <terrelln@fb.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Richard Weinberger <richard@nod.at>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, qat-linux@intel.com, 
	linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_153833_395658_270C29C2 
X-CRM114-Status: GOOD (  24.76  )
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

T24gV2VkLCAxOSBKdWwgMjAyMyBhdCAxNjoyMywgWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFA
aHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiDlnKggMjAyMy83LzE5IDE2OjMzLCBBcmQgQmllc2hldXZl
bCDlhpnpgZM6Cj4gPiBPbiBXZWQsIDE5IEp1bCAyMDIzIGF0IDAwOjM4LCBFcmljIEJpZ2dlcnMg
PGViaWdnZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVHVlLCBKdWwgMTgsIDIw
MjMgYXQgMDI6NTg6MzFQTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPj4+IEN1cnJl
bnRseSwgdGhlIHViaWZzIGNvZGUgYWxsb2NhdGVzIGEgd29yc3QgY2FzZSBidWZmZXIgc2l6ZSB0
bwo+ID4+PiByZWNvbXByZXNzIGEgZGF0YSBub2RlLCBidXQgZG9lcyBub3QgcGFzcyB0aGUgc2l6
ZSBvZiB0aGF0IGJ1ZmZlciB0byB0aGUKPiA+Pj4gY29tcHJlc3Npb24gY29kZS4gVGhpcyBtZWFu
cyB0aGF0IHRoZSBjb21wcmVzc2lvbiBjb2RlIHdpbGwgbmV2ZXIgdXNlCj4KPiBJIHRoaW5rIHlv
dSBtZWFuIHRoZSAnb3V0X2xlbicgd2hpY2ggZGVzY3JpYmVzIHRoZSBsZW5naCBvZiAnYnVmJyBp
cwo+IHBhc3NlZCBpbnRvIHViaWZzX2RlY29tcHJlc3MsIHdoaWNoIGVmZmVjdHMgdGhlIHJlc3Vs
dCBvZgo+IGRlY29tcHJlc3NvcihlZy4gbHo0IHVzZXMgbGVuZ3RoIHRvIGNhbGN1bGF0ZSB0aGUg
YnVmZmVyIGVuZCBwb3MpLgo+IFNvLCB3ZSBzaG91bGQgcGFzcyB0aGUgcmVhbCBsZW5naHRoIG9m
ICdidWYnLgo+CgpZZXMsIHRoYXQgaXMgd2hhdCBJIG1lYW50LgoKQnV0IEVyaWMgbWFrZXMgYSBn
b29kIHBvaW50LCBhbmQgbG9va2luZyBhIGJpdCBtb3JlIGNsb3NlbHksIHRoZXJlIGlzCnJlYWxs
eSBubyBuZWVkIGZvciB0aGUgbXVsdGlwbGljYXRpb24gaGVyZTogd2Uga25vdyB0aGUgc2l6ZSBv
ZiB0aGUKZGVjb21wcmVzc2VkIGRhdGEsIHNvIHdlIGRvbid0IG5lZWQgdGhlIGFkZGl0aW9uYWwg
c3BhY2UuCgpJIGludGVuZCB0byBkcm9wIHRoaXMgcGF0Y2gsIGFuZCByZXBsYWNlIGl0IHdpdGgg
dGhlIGZvbGxvd2luZzoKCi0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tCgpDdXJyZW50
bHksIHdoZW4gdHJ1bmNhdGluZyBhIGRhdGEgbm9kZSwgYSBkZWNvbXByZXNzaW9uIGJ1ZmZlciBp
cwphbGxvY2F0ZWQgdGhhdCBpcyB0d2ljZSB0aGUgc2l6ZSBvZiB0aGUgZGF0YSBub2RlJ3MgdW5j
b21wcmVzc2VkIHNpemUuCkhvd2V2ZXIsIHRoZSBmYWN0IHRoYXQgdGhpcyBzcGFjZSBpcyBhdmFp
bGFibGUgaXMgbm90IGNvbW11bmljYXRlZCB0bwp0aGUgY29tcHJlc3Npb24gcm91dGluZXMsIGFz
IG91dF9sZW4gaXRzZWxmIGlzIG5vdCB1cGRhdGVkLgoKVGhlIGFkZGl0aW9uYWwgc3BhY2UgaXMg
bm90IG5lZWRlZCBldmVuIGluIHRoZSB0aGVvcmV0aWNhbCB3b3JzdCBjYXNlCndoZXJlIGNvbXBy
ZXNzaW9uIG1pZ2h0IGxlYWQgdG8gaW5hZHZlcnRlbnQgZXhwYW5zaW9uOiBmaXJzdCBvZiBhbGws
CmluY3JlYXNpbmcgdGhlIHNpemUgb2YgdGhlIGlucHV0IGJ1ZmZlciBkb2VzIG5vdCBoZWxwIG1p
dGlnYXRlIHRoYXQKaXNzdWUuIEFuZCBnaXZlbiB0aGUgdHJ1bmNhdGlvbiBvZiB0aGUgZGF0YSBu
b2RlIGFuZCB0aGUgZmFjdCB0aGF0IHRoZQpvcmlnaW5hbCBkYXRhIGNvbXByZXNzZWQgd2VsbCBl
bm91Z2ggdG8gcGFzcyB0aGUgVUJJRlNfTUlOX0NPTVBSRVNTX0RJRkYKdGVzdCwgdGhlcmUgaXMg
bm8gd2F5IG9uIHRoaXMgcGFydGljdWxhciBjb2RlIHBhdGggdGhhdCBjb21wcmVzc2lvbgpjb3Vs
ZCByZXN1bHQgaW4gZXhwYW5zaW9uIGJleW9uZCB0aGUgb3JpZ2luYWwgZGVjb21wcmVzc2VkIHNp
emUsIGFuZCBzbwpubyBtaXRpZ2F0aW9uIGlzIG5lY2Vzc2FyeSB0byBiZWdpbiB3aXRoLgoKU28g
bGV0J3MganVzdCBkcm9wIFdPUlNUX0NPTVBSX0ZBQ1RPUiBoZXJlLgoKU2lnbmVkLW9mZi1ieTog
QXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9q
b3VybmFsLmMgYi9mcy91Ymlmcy9qb3VybmFsLmMKaW5kZXggZGM1MmFjMGY0YTM0NWYzMC4uMGI1
NWNiZmUwYzMwNTA1ZSAxMDA2NDQKLS0tIGEvZnMvdWJpZnMvam91cm5hbC5jCisrKyBiL2ZzL3Vi
aWZzL2pvdXJuYWwuYwpAQCAtMTQ4OSw3ICsxNDg5LDcgQEAgc3RhdGljIGludCB0cnVuY2F0ZV9k
YXRhX25vZGUoY29uc3Qgc3RydWN0CnViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAq
aW4KICAgICAgICBpbnQgZXJyLCBkbGVuLCBjb21wcl90eXBlLCBvdXRfbGVuLCBkYXRhX3NpemU7
CgogICAgICAgIG91dF9sZW4gPSBsZTMyX3RvX2NwdShkbi0+c2l6ZSk7Ci0gICAgICAgYnVmID0g
a21hbGxvY19hcnJheShvdXRfbGVuLCBXT1JTVF9DT01QUl9GQUNUT1IsIEdGUF9OT0ZTKTsKKyAg
ICAgICBidWYgPSBrbWFsbG9jKG91dF9sZW4sIEdGUF9OT0ZTKTsKICAgICAgICBpZiAoIWJ1ZikK
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
