Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E80606A882
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tLWZwVFR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5b0v7Xr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KbhkqiwfVJHsE0pzZR62758mMXbp9BE2Qmtgw5sACjM=; b=tLWZwVFR7s2hhvRHN0PekXVb2G
	Me7ERJf/w8GjZ3gjOQo9EuT+woQCXiIJkJc0M6Y4C0kqVf4IJXV2cQNvaaaceF7pWAUKm5CDzje+E
	TtOCP5fILDYJvDcfpK6fsUZdd4fVGe0mBaKWVTsS1uiJh7HO0nLYWLY0x0regZIzuH0yUV8urCd9k
	bpzi29kfG5nQj+JV4nRt3kz/svunxm+rEnYMjpvWbL6yHWcegf96Hctfl8nt1YkoY01qjZYxkGzYt
	kvs89vUy0el7fuaPbgMPbaSFXuGj283cLABon1ARzTz4adP/1f9rMJUYgyXcKKi3lteRqSC32Y2gs
	+r9saTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTi-0000000Fyrr-3rBP;
	Sat, 14 Nov 2026 12:03:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTi-0000000FyrP-07k9
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E997626C1;
	Sat, 14 Nov 2026 12:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2781F000C5;
	Sat, 14 Nov 2026 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657809;
	bh=oge5gHl+Ji7nKy/eL+dZMpu8kpivAdHNITu7sKlcjQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5b0v7XrzA1WELCmu12+3CEzgi7O2PA8wGWyXzNM6/DMm+jeSwo7oaNtTiwWqL9Sj
	 3gPK042ci68YlqI+D+3g0OaUg+cutVM9FqYrbRFcuHLaesVhmnq25vU/sNxGRAhl04
	 lHz0EGke2a+V5t/bAXS+qhZG7iJ4YwHUvUQpE9xRz7XS8V7QPJ0pGzJkjCB4lIFZsl
	 eTaJfqrZs41T2hNOMdzBWNdHHvd2P8ZNfSec5Wn6PxaFZqKE069wvpqaCaAwQ7Zfef
	 6SVzrh26YuobiR6IehubHAymqiV5REZJzZb4qBUlYCjtdsY7Rt+Ut+g8VLdhtdgAH+
	 Ox8ubwhXVfuug==
Message-ID: <sashiko-outbox-214460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/33] fat: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-9-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-9-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:28 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIGZhdDogZmF0X2ZyZWUo
KSB6ZXJvZXMgaV9zdGFydCBvbiBkaXNrIHdoZW4KICBmYXRfZnJlZV9jbHVzdGVycygpIHJldHVy
bnMgLUVST0ZTCi0gW01lZGl1bV0gZmF0OiBkaXJlY3RvcnkgbW9kaWZpY2F0aW9ucyBwcm9jZWVk
IGFmdGVyIGZhdF9fZ2V0X2VudHJ5KCkKICBzZXRzIGVtZXJnZW5jeSBSTwotLQoKY29tbWl0IDdj
ZTAwYWFlZjFlMzQ1YTJjYTAxNDQzY2NmZjNjMTk4ODRkOWJjYzMKQXV0aG9yOiBDaHJpc3RpYW4g
QnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKZmF0OiBkb24ndCBzZXQgU0JfUkRPTkxZIGFm
dGVyIGZpbGVzeXN0ZW0gZXJyb3JzCgpUaGlzIGNvbW1pdCBzd2l0Y2hlcyBfX2ZhdF9mc19lcnJv
cigpIGZyb20gc2V0dGluZyBTQl9SRE9OTFkgb24gYSBtb3VudGVkCnN1cGVyYmxvY2sgdG8gY2Fs
bGluZyBzYl9zZXRfZW1lcmdlbmN5X3JvKCksIGFuZCBhZGRzIHNiX2VtZXJnZW5jeV9ybygpCmNo
ZWNrcyBhY3Jvc3MgRkFUIHdyaXRlLCBhbGxvY2F0aW9uLCBhbmQgc3RhdGUgcGF0aHMuCgo+IGRp
ZmYgLS1naXQgYS9mcy9mYXQvZGlyLmMgYi9mcy9mYXQvZGlyLmMKPiBpbmRleCAzNWJkYjYyOTQ0
YTJlLi41NTMwMzRiY2JlZDQwIDEwMDY0NAo+IC0tLSBhL2ZzL2ZhdC9kaXIuYwo+ICsrKyBiL2Zz
L2ZhdC9kaXIuYwo+IEBAIC0xMzI5LDYgKzEzMjksOSBAQCBpbnQgZmF0X2FkZF9lbnRyaWVzKHN0
cnVjdCBpbm9kZSAqZGlyLCB2b2lkICpzbG90cywgaW50IG5yX3Nsb3RzLAo+ICAJbG9mZl90IHBv
czsKPiAgCWJvb2wgc2F3X2VvZDsKPiAgCj4gKwlpZiAodW5saWtlbHkoc2JfZW1lcmdlbmN5X3Jv
KHNiKSkpCj4gKwkJcmV0dXJuIC1FUk9GUzsKPiArCj4gIAlzaW5mby0+bnJfc2xvdHMgPSBucl9z
bG90czsKPiAgCj4gIAkvKiBGaXJzdCBzdGFnZTogc2VhcmNoIGZyZWUgZGlyZWN0b3J5IGVudHJp
ZXMgKi8KCltTZXZlcml0eTogTWVkaXVtXQpDYW4gZmF0X2FkZF9lbnRyaWVzKCkgYW5kIGZhdF9k
aXJfZW1wdHkoKSBzdGlsbCBtb2RpZnkgZGlyZWN0b3J5IGJ1ZmZlcnMKYWZ0ZXIgYSBGQVQgZXJy
b3IgaW4gZmF0X19nZXRfZW50cnkoKSBzZXRzIFNCX1NUQVRFX0VNRVJHRU5DWV9STz8KCkluIGZh
dF9fZ2V0X2VudHJ5KCksIGEgZmF0X2JtYXAoKSBlcnJvciBjYWxscyBmYXRfZnNfZXJyb3IoKSwg
c2V0cwpzYl9lbWVyZ2VuY3lfcm8oc2IpLCBhbmQgcmV0dXJucyAtMSBqdXN0IGxpa2Ugbm9ybWFs
IEVPRi4gIEluCmZhdF9hZGRfZW50cmllcygpLCBpZiB0aGUgZmF0X2dldF9lbnRyeSgpIGxvb3Ag
aGl0cyBhIEZBVCBlcnJvciBvbiBhIGxhdGVyCmNsdXN0ZXIgYWZ0ZXIgY29sbGVjdGluZyBzb21l
IGZyZWUgc2xvdHMgKDAgPCBmcmVlX3Nsb3RzIDwgbnJfc2xvdHMpLCBpdApmYWxscyB0aHJvdWdo
IHRvIGZvdW5kOiwgd3JpdGVzIHRoZSBwYXJ0aWFsIHNsb3RzIGludG8gYmhzW10sIGZhaWxzIGlu
CmZhdF9hZGRfbmV3X2VudHJpZXMoKSAtPiBmYXRfYWxsb2NfY2x1c3RlcnMoKSB3aXRoIC1FUk9G
UywgYW5kIHRoZW4Kb3ZlcndyaXRlcyB0aGUgb3JpZ2luYWwgc2xvdHMgKGluY2x1ZGluZyAweDAw
IGVuZC1vZi1kaXJlY3RvcnkgbWFya2VycykKd2l0aCBERUxFVEVEX0ZMQUcgaW4gX19mYXRfcmVt
b3ZlX2VudHJpZXMoKS4KClNpbWlsYXJseSwgaW4gZmF0X2Rpcl9lbXB0eSgpLCBhIC0xIHJldHVy
biBmcm9tIGZhdF9nZXRfc2hvcnRfZW50cnkoKSBhZnRlcgphIEZBVCBlcnJvciBtYWtlcyBhIGNv
cnJ1cHRlZCBub24tZW1wdHkgZGlyZWN0b3J5IGFwcGVhciBlbXB0eSAocmV0dXJuIDApLAphbmQg
YmVjYXVzZSBuZWl0aGVyIGZhdF9kaXJfZW1wdHkoKSBub3IgZmF0X3JlbW92ZV9lbnRyaWVzKCkg
Y2hlY2tzCnNiX2VtZXJnZW5jeV9ybyhzYiksIHJtZGlyIGFuZCByZW5hbWUgcHJvY2VlZCB0byBk
ZWxldGUgdGhlIGRpcmVjdG9yeSBlbnRyeQpvbiBkaXNrIGFmdGVyIHRoZSBmaWxlc3lzdGVtIGhh
cyBlbnRlcmVkIGVtZXJnZW5jeSByZWFkLW9ubHkgbW9kZS4KCj4gZGlmZiAtLWdpdCBhL2ZzL2Zh
dC9mYXRlbnQuYyBiL2ZzL2ZhdC9mYXRlbnQuYwo+IGluZGV4IDJkMTBhODE1YTU3OTcuLjllNGJi
MDE0MDMyMGYgMTAwNjQ0Cj4gLS0tIGEvZnMvZmF0L2ZhdGVudC5jCj4gKysrIGIvZnMvZmF0L2Zh
dGVudC5jCgpbIC4uLiBdCgo+IEBAIC02MjAsNiArNjI2LDkgQEAgaW50IGZhdF9mcmVlX2NsdXN0
ZXJzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBjbHVzdGVyKQo+ICAJaW50IGksIGVyciwgbnJf
YmhzOwo+ICAJaW50IGZpcnN0X2NsID0gY2x1c3RlciwgZGlydHlfZnNpbmZvID0gMDsKPiAgCj4g
KwlpZiAodW5saWtlbHkoc2JfZW1lcmdlbmN5X3JvKHNiKSkpCj4gKwkJcmV0dXJuIC1FUk9GUzsK
PiArCj4gIAlucl9iaHMgPSAwOwo+ICAJZmF0ZW50X2luaXQoJmZhdGVudCk7Cj4gIAlsb2NrX2Zh
dChzYmkpOwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgcmV0dXJuaW5nIC1FUk9GUyBmcm9tIGZh
dF9mcmVlX2NsdXN0ZXJzKCkgd2l0aG91dCBndWFyZGluZyBmYXRfZnJlZSgpCmNhdXNlIGZhdF9m
cmVlKCkgdG8gemVybyBpX3N0YXJ0IG9uIGRpc2sgd2hpbGUgbGVhdmluZyB0aGUgY2x1c3RlciBj
aGFpbgphbGxvY2F0ZWQgaW4gdGhlIEZBVD8KCldoZW4gY29udF93cml0ZV9iZWdpbigpIGZhaWxz
IGR1ZSB0byBhIEZBVCBlcnJvciB0aGF0IHNldHMKc2JfZW1lcmdlbmN5X3JvKHNiKSAoZm9yIGV4
YW1wbGUgb24gYSAwLWJ5dGUgZmlsZSB3aXRoIGZhbGxvY2F0ZWQgY2x1c3RlcnMsCm9yIGFmdGVy
IGFsbG9jYXRpbmcgdGhlIGZpcnN0IGNsdXN0ZXIgb2YgYSBtdWx0aS1jbHVzdGVyIHdyaXRlKSwK
ZmF0X3dyaXRlX2JlZ2luKCkgY2FsbHMgZmF0X3dyaXRlX2ZhaWxlZCgpIC0+IGZhdF90cnVuY2F0
ZV9ibG9ja3MoaW5vZGUsIDApCi0+IGZhdF9mcmVlKGlub2RlLCAwKToKCmZzL2ZhdC9maWxlLmM6
ZmF0X2ZyZWUoKSB7CiAgICAuLi4KCWlmICghc2tpcCkgewoJCU1TRE9TX0koaW5vZGUpLT5pX3N0
YXJ0ID0gMDsKCQlNU0RPU19JKGlub2RlKS0+aV9sb2dzdGFydCA9IDA7Cgl9CglNU0RPU19JKGlu
b2RlKS0+aV9hdHRycyB8PSBBVFRSX0FSQ0g7CglmYXRfdHJ1bmNhdGVfdGltZShpbm9kZSwgTlVM
TCwgRkFUX1VQREFURV9DTVRJTUUpOwoJbWFya19pbm9kZV9kaXJ0eShpbm9kZSk7CiAgICAuLi4K
CWlub2RlLT5pX2Jsb2NrcyA9IHNraXAgPDwgKE1TRE9TX1NCKHNiKS0+Y2x1c3Rlcl9iaXRzIC0g
OSk7CgoJLyogRnJlZWluZyB0aGUgcmVtYWluZWQgY2x1c3RlciBjaGFpbiAqLwoJcmV0dXJuIGZh
dF9mcmVlX2NsdXN0ZXJzKGlub2RlLCBmcmVlX3N0YXJ0KTsKfQoKQmVjYXVzZSBmYXRfZnJlZSgp
IGNsZWFycyBpX3N0YXJ0IGFuZCBtYXJrcyB0aGUgaW5vZGUgZGlydHkgYmVmb3JlCmZhdF9mcmVl
X2NsdXN0ZXJzKCkgcmV0dXJucyAtRVJPRlMsIGFuZCBmYXRfd3JpdGVfaW5vZGUoKSBzdGF5cyBh
Y3RpdmUgaW4KZW1lcmdlbmN5IHJlYWQtb25seSBtb2RlLCB3cml0ZWJhY2sgd3JpdGVzIHN0YXJ0
ID0gMCB0byB0aGUgZGlyZWN0b3J5IGVudHJ5Cm9uIGRpc2sgYW5kIG9ycGhhbnMgdGhlIGFsbG9j
YXRlZCBjbHVzdGVycyBpbiB0aGUgRkFULgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExMy13b3JrLWZzLXNiX3Jkb25seS12My0w
LTBiZTkyYmI3MzcwOUBrZXJuZWwub3JnP3BhcnQ9OQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
