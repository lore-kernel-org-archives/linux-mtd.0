Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A05606A334
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqu9EFiU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VeywEVYJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EHiNSiuWXKoS7jTGKsUEYO5mWj8iUc7eessH5VQd22g=; b=cqu9EFiUe9KBy2bDFrtnQnKntt
	6WBo9tQmlR7SmQNdr08Y8QFF/IqMNltqpkuLY8FKcSLJYzDQqPPJ5TfjhUZp8+1HFhsaC8xZY15RV
	JINySEFAbxlTmclFJVVaCQR6r8sz6ggq12c30hvdVkc3xRJE/iS8mY/gJQyadXjACD3JfbR+4O7Qi
	zw/t6d1rysPKm52jSOGY9Q4Ii9s+Ye+cwtsKHD8+GaTBZ0lHH4l1cnLVBvjIPNLygZh/yTnyP2o68
	qPUeJ6E23CF4yFuJZ8GjWGAXKXz/5U4JdJyKT8pNXR+vRxdB8JbBw3ogEiuWKCWxZXkj2cWRVqmky
	NgvkLWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCU5-0000000FzDg-315h;
	Sat, 14 Nov 2026 12:03:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCU3-0000000FzBJ-2ys5
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23E936234A;
	Sat, 14 Nov 2026 12:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AE21F000C9;
	Sat, 14 Nov 2026 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657830;
	bh=En1pIhjDCbi5uQnQl7d6tI2Nsu015/E0bz+ywSlsPnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VeywEVYJqBXdIqQauniLt4BbXJa9NUpolBn3UOhybWzaDzFI4ZaNrtiKQthduaCM3
	 7ScNtsc1tbnNvJ+FYgUaC4iULaL2ypvW+KMhPtsQlS3ePlnsfyOZeBjc97Ssxutkty
	 ssbhTAZfpqXmeeyJWgW2K/JHPxrFbrLydIehy2W6oxpc7Ev7qn0avjRo7la8YpNT8z
	 McyaKX0OiHh5UYGNU93CjDuwt1lUPO7gOwhZYMIT+7fxi40zctK6QLUgIlnpCBCtlY
	 5d8n/iZcLNVBe+FIP02ys6FjECfX0PDlklCu1NziY9uadmTKvuhrQM5iEB2snrlMG5
	 luOHrjHuITL5g==
Message-ID: <sashiko-outbox-214478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 27/33] gfs2: wait for a pending withdraw before
 remounting read-only
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-27-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-27-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:49 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGdmczI6IGhhbmcgaW4gZ2Zz
Ml9tYWtlX2ZzX3JvKCkgaWYgd2l0aGRyYXcgb2NjdXJzIGJlZm9yZQogIFNCX0JPUk4KLS0KCmNv
bW1pdCBmOGI1YjFkYWY0OGUzZjgyNWE0MTUyMTU1MzZhMzc1ZmI2Y2Q4YjlkCkF1dGhvcjogQ2hy
aXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4KCmdmczI6IHdhaXQgZm9yIGEgcGVu
ZGluZyB3aXRoZHJhdyBiZWZvcmUgcmVtb3VudGluZyByZWFkLW9ubHkKClRoaXMgY29tbWl0IHNl
cmlhbGl6ZXMgc2V0dGluZyBTREZfSk9VUk5BTF9MSVZFIGluIGdmczJfbWFrZV9mc19ydygpIHdp
dGgKZG9fd2l0aGRyYXcoKSB1bmRlciBzZF9sb2dfZmx1c2hfbG9jaywgYW5kIG1ha2VzIGdmczJf
bWFrZV9mc19ybygpIHdhaXQgZm9yClNERl9KT1VSTkFMX0xJVkUgdG8gY2xlYXIgYmVmb3JlIGNh
bGxpbmcgZ2ZzMl9xdW90YV9jbGVhbnVwKCkuCgo+IGRpZmYgLS1naXQgYS9mcy9nZnMyL3N1cGVy
LmMgYi9mcy9nZnMyL3N1cGVyLmMKPiBpbmRleCAwNGJiNGNmNzg3ZDRkLi5mNjFjMzA5MzY4ZWYx
IDEwMDY0NAo+IC0tLSBhL2ZzL2dmczIvc3VwZXIuYwo+ICsrKyBiL2ZzL2dmczIvc3VwZXIuYwo+
IEBAIC0xNDYsMTIgKzE0NiwyMSBAQCBpbnQgZ2ZzMl9tYWtlX2ZzX3J3KHN0cnVjdCBnZnMyX3Ni
ZCAqc2RwKQo+ICAJfQo+ICAKPiAgCWVycm9yID0gZ2ZzMl9xdW90YV9pbml0KHNkcCk7Cj4gLQlp
ZiAoIWVycm9yICYmIGdmczJfd2l0aGRyYXduKHNkcCkpIHsKPiAtCQlnZnMyX3F1b3RhX2NsZWFu
dXAoc2RwKTsKPiArCWlmIChlcnJvcikKPiArCQlyZXR1cm4gZXJyb3I7Cj4gKwo+ICsJLyoKPiAr
CSAqIENoZWNrIGZvciBhIHdpdGhkcmF3IHVuZGVyIHRoZSBsb2NrIGRvX3dpdGhkcmF3KCkgaG9s
ZHMgd2hpbGUgaXQKPiArCSAqIHRha2VzIGEgbGl2ZSBqb3VybmFsIGRvd24sIHNvIG9uZSBvZiB0
aGVtIHNlZXMgdGhlIG90aGVyLgo+ICsJICovCj4gKwlkb3duX3dyaXRlKCZzZHAtPnNkX2xvZ19m
bHVzaF9sb2NrKTsKPiArCWlmIChnZnMyX3dpdGhkcmF3bihzZHApKQo+ICAJCWVycm9yID0gLUVJ
TzsKPiAtCX0KPiAtCWlmICghZXJyb3IpCj4gKwllbHNlCj4gIAkJc2V0X2JpdChTREZfSk9VUk5B
TF9MSVZFLCAmc2RwLT5zZF9mbGFncyk7Cj4gKwl1cF93cml0ZSgmc2RwLT5zZF9sb2dfZmx1c2hf
bG9jayk7Cj4gKwlpZiAoZXJyb3IpCj4gKwkJZ2ZzMl9xdW90YV9jbGVhbnVwKHNkcCk7Cj4gIAly
ZXR1cm4gZXJyb3I7Cj4gIH0KPiAgCj4gQEAgLTU2Nyw2ICs1NzYsOSBAQCB2b2lkIGdmczJfbWFr
ZV9mc19ybyhzdHJ1Y3QgZ2ZzMl9zYmQgKnNkcCkKPiAgCQkJCSAgIEhaICogNSk7Cj4gIAkJZ2Zz
Ml9hc3NlcnRfd2FybihzZHAsIGdmczJfbG9nX2lzX2VtcHR5KHNkcCkpOwo+ICAJfQo+ICsJLyog
QSB3aXRoZHJhdyB0aGF0IGRvX3dpdGhkcmF3KCkgZGlkbid0IGZpbmlzaCB5ZXQgbGVhdmVzIGl0
IGxpdmUuICovCj4gKwlpZiAoIXRlc3RfYml0KFNERl9OT1JFQ09WRVJZLCAmc2RwLT5zZF9mbGFn
cykpCj4gKwkJd2FpdF9vbl9iaXQoJnNkcC0+c2RfZmxhZ3MsIFNERl9KT1VSTkFMX0xJVkUsIFRB
U0tfVU5JTlRFUlJVUFRJQkxFKTsKPiAgCWdmczJfcXVvdGFfY2xlYW51cChzZHApOwo+ICB9Cgpb
U2V2ZXJpdHk6IEhpZ2hdCkNhbiB3YWl0X29uX2JpdCgpIGluIGdmczJfbWFrZV9mc19ybygpIGhh
bmcgZm9yZXZlciBpZiBhIHdpdGhkcmF3IGhhcHBlbnMKZHVyaW5nIGluaXRpYWwgbW91bnQgYWZ0
ZXIgZ2ZzMl9tYWtlX2ZzX3J3KCkgc2V0cyBTREZfSk9VUk5BTF9MSVZFLCBidXQKYmVmb3JlIHZm
c19nZXRfdHJlZSgpIHNldHMgU0JfQk9STj8KCkR1cmluZyBpbml0aWFsIHJlYWQtd3JpdGUgbW91
bnQsIGdmczJfZmlsbF9zdXBlcigpIHN0YXJ0cyB0aGUgbG9nZCBhbmQKcXVvdGFkIHRocmVhZHMs
IHJlZ2lzdGVycyB0aGUgc3lzZnMgaW50ZXJmYWNlLCBhbmQgY2FsbHMgZ2ZzMl9tYWtlX2ZzX3J3
KCkKYmVmb3JlIFNCX0JPUk4gaXMgc2V0IG9uIHNiLT5zX2ZsYWdzLiAgSWYgZ2ZzMl93aXRoZHJh
dygpIHJ1bnMgYWZ0ZXIKZ2ZzMl9tYWtlX2ZzX3J3KCkgc2V0cyBTREZfSk9VUk5BTF9MSVZFIGFu
ZCBiZWZvcmUgdmZzX2dldF90cmVlKCkgc2V0cwpTQl9CT1JOLCBpdCBzZXRzIFNERl9XSVRIRFJB
V04gYW5kIHJldHVybnMgZWFybHkgd2l0aG91dCBzY2hlZHVsaW5nCnNkX3dpdGhkcmF3X3dvcms6
Cgpmcy9nZnMyL3V0aWwuYzpnZnMyX3dpdGhkcmF3KCkgewogICAgLi4uCgkJaWYgKHRlc3RfYW5k
X3NldF9iaXQoU0RGX1dJVEhEUkFXTiwgJnNkcC0+c2RfZmxhZ3MpKQoJCQlyZXR1cm47CgoJCWR1
bXBfc3RhY2soKTsKCQkvKgoJCSAqIFRoZXJlIGlzIG5vIG5lZWQgdG8gd2l0aGRyYXcgd2hlbiB0
aGUgc3VwZXJibG9jayBoYXNuJ3QgYmVlbgoJCSAqIGZ1bGx5IGluaXRpYWxpemVkLCB5ZXQuCgkJ
ICovCgkJaWYgKCEoc2RwLT5zZF92ZnMtPnNfZmxhZ3MgJiBTQl9CT1JOKSkKCQkJcmV0dXJuOwoJ
CWZzX2VycihzZHAsICJhYm91dCB0byB3aXRoZHJhdyB0aGlzIGZpbGUgc3lzdGVtXG4iKTsKCQlz
Y2hlZHVsZV93b3JrKCZzZHAtPnNkX3dpdGhkcmF3X3dvcmspOwogICAgLi4uCn0KCkNQVTAgKG1v
dW50IC8gcmVtb3VudCkgICAgICAgICAgICBDUFUxIChrdGhyZWFkIC8gd29ya3F1ZXVlIC8gc3lz
ZnMpCnZmc19nZXRfdHJlZSgpCiAgLi4uCiAgZ2ZzMl9maWxsX3N1cGVyKCkKICAgIGdmczJfbWFr
ZV9mc19ydygpCiAgICAgIHNldF9iaXQoU0RGX0pPVVJOQUxfTElWRSkKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdmczJfd2l0aGRyYXcoKQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0ZXN0X2FuZF9zZXRfYml0KFNERl9XSVRIRFJBV04pCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghKHNfZmxhZ3MgJiBTQl9CT1JOKSkKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47CiAgc2ItPnNfZmxhZ3MgfD0g
U0JfQk9STgoKZ2ZzMl9yZWNvbmZpZ3VyZSgpCiAgZ2ZzMl9tYWtlX2ZzX3JvKCkKICAgIGdmczJf
bG9nX2ZsdXNoKCkKICAgICAgaWYgKGdmczJfd2l0aGRyYXduKHNkcCkpCiAgICAgICAgcmV0dXJu
OwogICAgd2FpdF9vbl9iaXQoLi4uLCBTREZfSk9VUk5BTF9MSVZFLCAuLi4pCiAgICAgIDwtLSBz
bGVlcHMgZm9yZXZlciBob2xkaW5nIHNiLT5zX3Vtb3VudAoKQmVjYXVzZSBTREZfV0lUSERSQVdO
IGlzIGFscmVhZHkgc2V0LCBsYXRlciBjYWxscyB0byBnZnMyX3dpdGhkcmF3KCkgYWxzbwpyZXR1
cm4gZWFybHksIHNvIGRvX3dpdGhkcmF3KCkgbmV2ZXIgcnVucyB0byBjbGVhciBTREZfSk9VUk5B
TF9MSVZFLiAgQQpzdWJzZXF1ZW50IHJlYWQtb25seSByZW1vdW50IGJhaWxzIG91dCBvZiBnZnMy
X2xvZ19mbHVzaCgpIGFuZCBibG9ja3MKZm9yZXZlciBpbiB3YWl0X29uX2JpdCgpIHdpdGggc2It
PnNfdW1vdW50IGhlbGQgaW4gd3JpdGUgbW9kZS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTMtd29yay1mcy1zYl9yZG9ubHkt
djMtMC0wYmU5MmJiNzM3MDlAa2VybmVsLm9yZz9wYXJ0PTI3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
