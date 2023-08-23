Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2550EE49B0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHVmJFn6G0w7ORKbHCEtFEcm5lrlphcBXNJHbgAPPwA=; b=OlDr6wsmIWLBe4
	NmXdNFP9ZetbE3NcXXUHIugKRhsvkzx1URg+ChwMdHY+moiJe2rr8XFvOj4GMtSagnMfC2vuLh2b4
	bkbkxZa1b160rQIVDAa+/POLUiT5sSRAXOlmUJ/QQSH4O7eH96t9qbzt5QzbeI+yz+aitl306j/O5
	FVH3IWXUkuVCD6aYm/uxDQFu78nUrLAFT+uxWtvEbQNzaJU2BplLxzeuvyMsasmfPqeNdbTQ6d0Y7
	y7nPk9GmSGp6ISMzzsqAq290Ayxnlchb8MZ/jqE8wzeATUksbZ+BIJUcBwCaUzaOU+5OeoKxk9YJz
	/S5sgWAYAtZtslF/StRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmOx-000Tql-30;
	Wed, 23 Aug 2023 11:51:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmOv-000TpT-0F
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 11:51:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF162660C3
	for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 11:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873F7C433C8
	for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 11:51:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Oj3Lj1HY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1692791505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9S50yEi/p2rCDiQFKotCIoS/umPPt7Pl2fEpLB+hPU=;
	b=Oj3Lj1HY65EaQHFLtdgNjIcEe3MLKPMQNsIRBBkAPnTMBuaAWu5bCL/nhDb2s1/ctRnB72
	czLerSADf38Jy6EHAAAytB+fvGrIib1/s7PAd5UQSLousDmXsgLRBqZRqOP7gXo8u8Ibvn
	kQW9u1zrrbGEaLA/iMapdHRskK9qZlM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 47a5c65d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Aug 2023 11:51:44 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-79a2216a2d1so1740725241.2
        for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 04:51:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YzruP1w7jFdsTRylrXHd8kInNSA4RzM+QfvYdy9W6xhdv3Fnk1o
	8slml6VZOeVxRb4rEEc/MuWvb7LQn7dHrXwqUds=
X-Google-Smtp-Source: AGHT+IFt7G1/ZeusTY56LT7aeMj6tJiORTuiaRW4q76XBgQu2EncKhol2bejM2ffQ7Afv6eCg3gMogdKzIe6mnDS5dk=
X-Received: by 2002:a67:ba0c:0:b0:44d:40b1:9273 with SMTP id
 l12-20020a67ba0c000000b0044d40b19273mr8437282vsn.4.1692791501269; Wed, 23 Aug
 2023 04:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au> <E1qYlAB-006vJI-Cv@formenos.hmeau.com>
In-Reply-To: <E1qYlAB-006vJI-Cv@formenos.hmeau.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Aug 2023 13:48:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9qwYhM55he7WyWQZXwSg9Ri6-9K31tHHqaKcMYFEJYxTw@mail.gmail.com>
Message-ID: <CAHmME9qwYhM55he7WyWQZXwSg9Ri6-9K31tHHqaKcMYFEJYxTw@mail.gmail.com>
Subject: Re: [PATCH 11/12] wireguard: Do not include crypto/algapi.h
To: herbert@gondor.apana.org.au
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, 
	Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, 
	ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, 
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, 
	Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, 
	Ayush Sawal <ayush.sawal@chelsio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_045153_434758_C47A3476 
X-CRM114-Status: GOOD (  19.62  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTI6MzPigK9QTSBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+IHdyb3RlOgo+Cj4gVGhlIGhlYWRlciBmaWxlIGNyeXB0by9hbGdh
cGkuaCBpcyBmb3IgaW50ZXJuYWwgdXNlIG9ubHkuICBVc2UgdGhlCj4gaGVhZGVyIGZpbGUgY3J5
cHRvL3V0aWxzLmggaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhlcmJlcnQgWHUgPGhlcmJl
cnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiAtLS0KPgo+ICBkcml2ZXJzL25ldC93aXJlZ3VhcmQv
Y29va2llLmMgIHwgICAgMiArLQo+ICBkcml2ZXJzL25ldC93aXJlZ3VhcmQvbmV0bGluay5jIHwg
ICAgMiArLQo+ICBkcml2ZXJzL25ldC93aXJlZ3VhcmQvbm9pc2UuYyAgIHwgICAgMiArLQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC93aXJlZ3VhcmQvY29va2llLmMgYi9kcml2ZXJzL25ldC93aXJl
Z3VhcmQvY29va2llLmMKPiBpbmRleCA0OTU2ZjA0OTljMTkuLmY4OTU4MWI1ZThjYiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlZ3VhcmQvY29va2llLmMKPiArKysgYi9kcml2ZXJzL25l
dC93aXJlZ3VhcmQvY29va2llLmMKPiBAQCAtMTIsOSArMTIsOSBAQAo+Cj4gICNpbmNsdWRlIDxj
cnlwdG8vYmxha2Uycy5oPgo+ICAjaW5jbHVkZSA8Y3J5cHRvL2NoYWNoYTIwcG9seTEzMDUuaD4K
PiArI2luY2x1ZGUgPGNyeXB0by91dGlscy5oPgo+Cj4gICNpbmNsdWRlIDxuZXQvaXB2Ni5oPgo+
IC0jaW5jbHVkZSA8Y3J5cHRvL2FsZ2FwaS5oPgo+Cj4gIHZvaWQgd2dfY29va2llX2NoZWNrZXJf
aW5pdChzdHJ1Y3QgY29va2llX2NoZWNrZXIgKmNoZWNrZXIsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCB3Z19kZXZpY2UgKndnKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC93aXJlZ3VhcmQvbmV0bGluay5jIGIvZHJpdmVycy9uZXQvd2lyZWd1YXJkL25ldGxpbmsuYwo+
IGluZGV4IDZkMWJkOWY1MmQwMi4uMGExNTAyMTAwZThiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bmV0L3dpcmVndWFyZC9uZXRsaW5rLmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlZ3VhcmQvbmV0
bGluay5jCj4gQEAgLTEyLDEwICsxMiwxMCBAQAo+Cj4gICNpbmNsdWRlIDx1YXBpL2xpbnV4L3dp
cmVndWFyZC5oPgo+Cj4gKyNpbmNsdWRlIDxjcnlwdG8vdXRpbHMuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2lmLmg+Cj4gICNpbmNsdWRlIDxuZXQvZ2VuZXRsaW5rLmg+Cj4gICNpbmNsdWRlIDxuZXQv
c29jay5oPgo+IC0jaW5jbHVkZSA8Y3J5cHRvL2FsZ2FwaS5oPgo+Cj4gIHN0YXRpYyBzdHJ1Y3Qg
Z2VubF9mYW1pbHkgZ2VubF9mYW1pbHk7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2ly
ZWd1YXJkL25vaXNlLmMgYi9kcml2ZXJzL25ldC93aXJlZ3VhcmQvbm9pc2UuYwo+IGluZGV4IDcy
MDk1MmI5MmU3OC4uZTdhZDgxY2E0YTM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVn
dWFyZC9ub2lzZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWd1YXJkL25vaXNlLmMKPiBAQCAt
MTAsMTIgKzEwLDEyIEBACj4gICNpbmNsdWRlICJxdWV1ZWluZy5oIgo+ICAjaW5jbHVkZSAicGVl
cmxvb2t1cC5oIgo+Cj4gKyNpbmNsdWRlIDxjcnlwdG8vdXRpbHMuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3JjdXBkYXRlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9iaXRtYXAuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9oaWdobWVtLmg+Cj4gLSNpbmNsdWRlIDxjcnlwdG8vYWxnYXBpLmg+Cj4KPiAg
LyogVGhpcyBpbXBsZW1lbnRzIE5vaXNlX0lLcHNrMjoKPiAgICoKClNtYWxsIG5pdCAtIHdpdGgg
dGhlIGV4Y2VwdGlvbiBvZiB0aGUgY29va2llLmMgcmVvcmRlcmluZywgY291bGQgeW91Cm1haW50
YWluIHRoZSBleGlzdGluZyAjaW5jbHVkZSBvcmRlcmluZyBvZiB0aGUgb3RoZXIgZmlsZXM/IE5v
IG5lZWQgdG8Kc2VuZCBhIHYyIGZvciB0aGF0IGlmIHlvdSBkb24ndCB3YW50LiBBbmQgcGxlYXNl
IG1ha2UgdGhlIGVudGlyZQpjb21taXQgc3ViamVjdCBsb3dlcmNhc2UuIFdpdGggdGhvc2UgZG9u
ZSwKCkFja2VkLWJ5OiBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KCkFzIGEg
c2lkZSBub3RlLCB5b3UgbWF5IHdhbnQgdG8gZXZlbnR1YWxseSBkbyBzb21ldGhpbmcgdG8gbWFr
ZSBzdXJlCnBlb3BsZSBkb24ndCBhZGQgYmFjayBhbGdhcGkuaCwgbGlrZSBtb3ZlIGl0IHRvIGlu
dGVybmFsLyBvciBvdXQgb2YKaW5jbHVkZS8gYWxsIHRvZ2V0aGVyLiBJIGZpZ3VyZSB5b3UndmUg
YWxyZWFkeSB0aG91Z2h0IGFib3V0IHRoaXMsIGFuZAp0aGlzIHNlcmllcyBpcyBqdXN0IHRoZSBm
aXJzdCBzdGVwLgoKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
