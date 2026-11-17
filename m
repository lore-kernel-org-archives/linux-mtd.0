Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDD7606A338
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BSaEVX84;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEaQdnWp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bTBN75js8wo8oGzNgIR7AYXQWk0QCzQwRORxAVH34co=; b=BSaEVX84EW1WFj1lzj+aJ48iil
	qX+JpGXcdE6d0RM8AZ1VcMv5TAr+WpItPySb2k7UR53pZbGg0MvYAkJhofaknNy/j2Jewm4e67SFX
	xlnpPpyqw8gp1UluHiOugsBecwM0tCq1Euxeg4javFCuJ4MDfQ3ogft9CGjY9exBOmpNvbD0OhcUb
	vrfbMN6973wTVneTmllQBjH1ywomsekrgtXLkUW/OK8nCjoymt3sFaUoHkacPNbsqiwO8y8pPhVeq
	r/P8N2D0PdjsCrYWKnAnBEbpwNTo252bgNhgSr5t2H5IrXjSEmvNEgnQmL54sMhuHgWRwCyPINMpm
	JVhdsGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFqW-00000005BuC-1PTY;
	Tue, 17 Nov 2026 09:51:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFqU-00000005Btv-2DZU
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:51:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4D8C40D5A;
	Tue, 17 Nov 2026 09:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4889B1F000C4;
	Tue, 17 Nov 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909081;
	bh=3jxa/kAJ15lKxFwPMTclDKch6tj8Yv9VYBIGJ7Uyr94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YEaQdnWp9hLwkYUqGOFX0ayap+gXO4krb2XydLS1lZQnWRN9mW1DgoAG4nPAJpDOy
	 pfUCmXWNeUL8Br7oRTKmpxSsIdEnpvdaX+xY3A82MHrz+bHj2tY26UM/x+F5IJwujk
	 tCIOyBrC+xbzGTypkKQbaiHAucjtsWPN9r16XNy+2psAaNcF5MSnlOPBQ6/GplVHao
	 8sD4sDgR2oqlCBHL/saxmEDR9ydixLloNRC/oo/BSGWswAyzaRYrGPXVVw4F/f6CBt
	 7UU8ZGjkiAadqywtCMlLpDyA7pp+gEoTO83zWGwc7yjQb7XSeKOCPEcvXIPjCKulnV
	 FMySy8Hm2ydEA==
Message-ID: <sashiko-outbox-218534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] gfs2: don't BUG when remounting read-only after a
 withdraw during mount
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Jan Kara" <jack@suse.com>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261116-work-fs-sb_rdonly-fixes-v1-1-95a25ce917ad@kernel.org>
References: <20261116-work-fs-sb_rdonly-fixes-v1-0-95a25ce917ad@kernel.org>
 <20261116-work-fs-sb_rdonly-fixes-v1-1-95a25ce917ad@kernel.org>
Date: Tue, 17 Nov 2026 09:51:20 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZ2ZzMjogcmFjZSBpbiBn
ZnMyX3F1ZXVlX3dpdGhkcmF3KCkgbGV0cyBmbHVzaF93b3JrKCkgcmV0dXJuCiAgYmVmb3JlIHF1
ZXVlCi0tCgpjb21taXQgM2QyODk3ZjhiNTEzMzFkYzZmN2I1MWEzN2YxM2VmNDIxYWM2NzM5YgpB
dXRob3I6IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpnZnMyOiBkb24n
dCBCVUcgd2hlbiByZW1vdW50aW5nIHJlYWQtb25seSBhZnRlciBhIHdpdGhkcmF3IGR1cmluZyBt
b3VudAoKVGhpcyBjb21taXQgaW50cm9kdWNlcyBnZnMyX3F1ZXVlX3dpdGhkcmF3KCkgZ3VhcmRl
ZCBieSBTREZfV0lUSERSQVdfUVVFVUVECmFuZCBmbHVzaGVzIHNkX3dpdGhkcmF3X3dvcmsgaW4g
Z2ZzMl9yZWNvbmZpZ3VyZSgpIGJlZm9yZSByZW1vdW50aW5nIGEKd2l0aGRyYXduIGZpbGVzeXN0
ZW0gcmVhZC1vbmx5LgoKPiBkaWZmIC0tZ2l0IGEvZnMvZ2ZzMi9vcHNfZnN0eXBlLmMgYi9mcy9n
ZnMyL29wc19mc3R5cGUuYwo+IGluZGV4IDZlYzQ3Mzc2YWVjZjIuLjNiZDU3MDI1MzVkZmUgMTAw
NjQ0Cj4gLS0tIGEvZnMvZ2ZzMi9vcHNfZnN0eXBlLmMKPiArKysgYi9mcy9nZnMyL29wc19mc3R5
cGUuYwo+IEBAIC0xNTkwLDYgKzE1OTAsMTEgQEAgc3RhdGljIGludCBnZnMyX3JlY29uZmlndXJl
KHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgCj4gIAlpZiAoKHNiLT5zX2ZsYWdzIF4gZmMtPnNi
X2ZsYWdzKSAmIFNCX1JET05MWSkgewo+ICAJCWlmIChmYy0+c2JfZmxhZ3MgJiBTQl9SRE9OTFkp
IHsKPiArCQkJLyogZ2ZzMl93aXRoZHJhdygpIGRvZXNuJ3QgcXVldWUgdGhlIHdvcmsgZHVyaW5n
IG1vdW50LiAqLwo+ICsJCQlpZiAoZ2ZzMl93aXRoZHJhd24oc2RwKSkgewo+ICsJCQkJZ2ZzMl9x
dWV1ZV93aXRoZHJhdyhzZHApOwo+ICsJCQkJZmx1c2hfd29yaygmc2RwLT5zZF93aXRoZHJhd193
b3JrKTsKPiArCQkJfQo+ICAJCQlnZnMyX21ha2VfZnNfcm8oc2RwKTsKPiAgCQl9IGVsc2Ugewo+
ICAJCQllcnJvciA9IGdmczJfbWFrZV9mc19ydyhzZHApOwo+IGRpZmYgLS1naXQgYS9mcy9nZnMy
L3V0aWwuYyBiL2ZzL2dmczIvdXRpbC5jCj4gaW5kZXggNTI5YzNlYzM3YTE4YS4uNTU1OGFmMzc0
OTk0YSAxMDA2NDQKPiAtLS0gYS9mcy9nZnMyL3V0aWwuYwo+ICsrKyBiL2ZzL2dmczIvdXRpbC5j
Cj4gQEAgLTIzOCw2ICsyMzgsMTMgQEAgdm9pZCBnZnMyX3dpdGhkcmF3X2Z1bmMoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQo+ICAJZnNfZXJyKHNkcCwgImZpbGUgc3lzdGVtIHdpdGhkcmF3blxu
Iik7Cj4gIH0KPiAgCj4gKy8qIFRoZSB3aXRoZHJhdyB3b3JrIG11c3Qgb25seSBydW4gb25jZS4g
Ki8KPiArdm9pZCBnZnMyX3F1ZXVlX3dpdGhkcmF3KHN0cnVjdCBnZnMyX3NiZCAqc2RwKQo+ICt7
Cj4gKwlpZiAoIXRlc3RfYW5kX3NldF9iaXQoU0RGX1dJVEhEUkFXX1FVRVVFRCwgJnNkcC0+c2Rf
ZmxhZ3MpKQo+ICsJCXNjaGVkdWxlX3dvcmsoJnNkcC0+c2Rfd2l0aGRyYXdfd29yayk7Cj4gK30K
PiArCj4gIHZvaWQgZ2ZzMl93aXRoZHJhdyhzdHJ1Y3QgZ2ZzMl9zYmQgKnNkcCkKPiAgewo+ICAJ
aWYgKHNkcC0+c2RfYXJncy5hcl9lcnJvcnMgPT0gR0ZTMl9FUlJPUlNfV0lUSERSQVcgfHwKPiBA
QCAtMjUzLDcgKzI2MCw3IEBAIHZvaWQgZ2ZzMl93aXRoZHJhdyhzdHJ1Y3QgZ2ZzMl9zYmQgKnNk
cCkKPiAgCQlpZiAoIShzZHAtPnNkX3Zmcy0+c19mbGFncyAmIFNCX0JPUk4pKQo+ICAJCQlyZXR1
cm47Cj4gIAkJZnNfZXJyKHNkcCwgImFib3V0IHRvIHdpdGhkcmF3IHRoaXMgZmlsZSBzeXN0ZW1c
biIpOwo+IC0JCXNjaGVkdWxlX3dvcmsoJnNkcC0+c2Rfd2l0aGRyYXdfd29yayk7Cj4gKwkJZ2Zz
Ml9xdWV1ZV93aXRoZHJhdyhzZHApOwo+ICAJCXJldHVybjsKPiAgCX0KCltTZXZlcml0eTogTWVk
aXVtXQpDYW4gZmx1c2hfd29yaygmc2RwLT5zZF93aXRoZHJhd193b3JrKSBpbiBnZnMyX3JlY29u
ZmlndXJlKCkgcmV0dXJuIGJlZm9yZQphIGNvbmN1cnJlbnQgZ2ZzMl93aXRoZHJhdygpIGhhcyBx
dWV1ZWQgc2Rfd2l0aGRyYXdfd29yaz8KCkNQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQ1BVMQpnZnMyX3dpdGhkcmF3KCkKICB0ZXN0X2FuZF9zZXRfYml0KFNERl9XSVRIRFJB
V04sIC4uLikKICBnZnMyX3F1ZXVlX3dpdGhkcmF3KCkKICAgIHRlc3RfYW5kX3NldF9iaXQoU0RG
X1dJVEhEUkFXX1FVRVVFRCwgLi4uKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdmczJfcmVjb25maWd1cmUoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGdmczJfd2l0aGRyYXduKHNkcCkpCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdmczJfcXVldWVfd2l0aGRyYXcoKQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfYW5kX3NldF9iaXQoU0RGX1dJVEhEUkFXX1FV
RVVFRCwgLi4uKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0+IGFscmVhZHkgc2V0LCBza2lwcyBzY2hlZHVsZV93b3JrKCkKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfd29yaygmc2RwLT5zZF93aXRoZHJhd193b3Jr
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tPiBub3QgcGVu
ZGluZyB5ZXQsIHJldHVybnMgZmFsc2UKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdmczJfbWFrZV9mc19ybygpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC4uLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
ZnMyX3F1b3RhX2NsZWFudXAoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tPiBoaXRzIEJVR19PTigpCiAgICBzY2hlZHVsZV93b3JrKCZzZHAtPnNkX3dpdGhk
cmF3X3dvcmspCgpCZWNhdXNlIHRlc3RfYW5kX3NldF9iaXQoU0RGX1dJVEhEUkFXX1FVRVVFRCwg
JnNkcC0+c2RfZmxhZ3MpIHJ1bnMgYmVmb3JlCnNjaGVkdWxlX3dvcmsoKSBtYXJrcyBzZF93aXRo
ZHJhd193b3JrIHBlbmRpbmcsIENQVTEncyBnZnMyX3F1ZXVlX3dpdGhkcmF3KCkKY2FuIG9ic2Vy
dmUgU0RGX1dJVEhEUkFXX1FVRVVFRCBhbHJlYWR5IHNldCBhbmQgcmV0dXJuIHdpdGhvdXQgcXVl
dWluZyB0aGUKd29yay4gIGZsdXNoX3dvcmsoKSB0aGVuIHNlZXMgYW4gaWRsZSB3b3JrIGl0ZW0g
YW5kIHJldHVybnMgaW1tZWRpYXRlbHksCmFsbG93aW5nIGdmczJfbWFrZV9mc19ybygpIC0+IGdm
czJfcXVvdGFfY2xlYW51cCgpIHRvIHByb2NlZWQgd2l0aApTREZfSk9VUk5BTF9MSVZFIHN0aWxs
IHNldCBhbmQgaGl0IGl0cyBCVUdfT04oKS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTYtd29yay1mcy1zYl9yZG9ubHktZml4
ZXMtdjEtMC05NWEyNWNlOTE3YWRAa2VybmVsLm9yZz9wYXJ0PTEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
