Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D3D11184
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAI6EIj1hNBz2Z65fC08gVWxQNd0wtlztP8kGhZEL1w=; b=E+/KOhIBEtcI8H
	Qbdyx0OHGKv6gg92+6W8otV2t4P991+W2eXb0x0tJNVVTTt3KZlVQOB3rxt+ycsk9yBayjFw2h0E7
	Lg5dlZTEBB4BGu//7M8a5y9WdOc5aqEb1edVtE1t5f4pqsid0oztNn2dwK8GS+r2TVJJwQXS6j53N
	t1Dj5xycVJqAyVL/EnKgpGO6qKXNT0gaTWy5YkdMLiyInBCZbULDjCZLmSz6FR+KMaw0B7V2slxrG
	0O9j7LmFv+bFZeAvr7F9M0f1IUav73nTib1njI0QgFI0dULNBwOgNm++27514trD+bTkeNG7rAixR
	bQjMHFJBI8b0aP2oiLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1t-0000000BkcL-2eeA;
	Sun, 03 Nov 2024 17:04:45 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1p-0000000BkYd-2Cnj
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653475;
	bh=vzqsMVfnVQ7g+xXQgYvHKh8WFOGMi08tymfd1lvAle8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jnQwjCquAR0qBDmeS/BwDJVhGZ6sUlQQGbmFuOa4A9M2739yz7dkzMP816T+fVMTN
	 habdRX2zL4MWpQPB/EZc2fhWd6l5iWr1VitiXAmds7L0pbHnrrKO6nxJP5pGMDdPpU
	 9SGYolS2xrGzTPAPqNh3lGCxTyletOjJlUB8aEf0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:31 +0000
Subject: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2296;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vzqsMVfnVQ7g+xXQgYvHKh8WFOGMi08tymfd1lvAle8=;
 b=+c8c3AK6YNFtR/f5MlFDxfac5E4AdcTfe/LYH8cKiLv+aN2C4MrR8vpsa2SsTXy5NHtfEpdBh
 t4Y6vgc31e8BINAGXwLU2VEDayYxRmKzGs5LRvtEfi4Ux875Z1qlOu8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090441_746654_F78EDAE7 
X-CRM114-Status: GOOD (  13.62  )
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

U2V2ZXJhbCBkcml2ZXJzIG5lZWQgdG8gZHluYW1pY2FsbHkgY2FsY3VsYXRlIHRoZSBzaXplIG9m
IGFuIGJpbmFyeQphdHRyaWJ1dGUuIEN1cnJlbnRseSB0aGlzIGlzIGRvbmUgYnkgYXNzaWduaW5n
IGF0dHItPnNpemUgZnJvbSB0aGUKaXNfYmluX3Zpc2libGUoKSBjYWxsYmFjay4KClRoaXMgaGFz
IGRyYXdiYWNrczoKKiBJdCBpcyBub3QgZG9jdW1lbnRlZC4KKiBBIHNpbmdsZSBhdHRyaWJ1dGUg
Y2FuIGJlIGluc3RhbnRpYXRlZCBtdWx0aXBsZSB0aW1lcywgb3ZlcndyaXRpbmcgdGhlCiAgc2hh
cmVkIHNpemUgZmllbGQuCiogSXQgcHJldmVudHMgdGhlIHN0cnVjdHVyZSB0byBiZSBtb3ZlZCB0
byByZWFkLW9ubHkgbWVtb3J5LgoKSW50cm9kdWNlIGEgbmV3IGRlZGljYXRlZCBjYWxsYmFjayB0
byBjYWxjdWxhdGUgdGhlIHNpemUgb2YgdGhlCmF0dHJpYnV0ZS4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KLS0tCiBmcy9zeXNmcy9ncm91
cC5jICAgICAgfCAyICsrCiBpbmNsdWRlL2xpbnV4L3N5c2ZzLmggfCA4ICsrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9zeXNmcy9ncm91
cC5jIGIvZnMvc3lzZnMvZ3JvdXAuYwppbmRleCA0NWIyZTkyOTQxZGExZjQ5ZGNjNzFhZjM3ODEz
MTdjNjE0ODBjOTU2Li44YjAxYTdlZGE1ZmIzMjM5ZTEzODM3MjQxN2QwMTk2N2M3YTNmMTIyIDEw
MDY0NAotLS0gYS9mcy9zeXNmcy9ncm91cC5jCisrKyBiL2ZzL3N5c2ZzL2dyb3VwLmMKQEAgLTk4
LDYgKzk4LDggQEAgc3RhdGljIGludCBjcmVhdGVfZmlsZXMoc3RydWN0IGtlcm5mc19ub2RlICpw
YXJlbnQsIHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCQkJCWlmICghbW9kZSkKIAkJCQkJY29udGlu
dWU7CiAJCQl9CisJCQlpZiAoZ3JwLT5iaW5fc2l6ZSkKKwkJCQlzaXplID0gZ3JwLT5iaW5fc2l6
ZShrb2JqLCAqYmluX2F0dHIsIGkpOwogCiAJCQlXQVJOKG1vZGUgJiB+KFNZU0ZTX1BSRUFMTE9D
IHwgMDY2NCksCiAJCQkgICAgICJBdHRyaWJ1dGUgJXM6IEludmFsaWQgcGVybWlzc2lvbnMgMCVv
XG4iLApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zeXNmcy5oIGIvaW5jbHVkZS9saW51eC9z
eXNmcy5oCmluZGV4IGM0ZTY0ZGMxMTIwNjNmN2NiODliZjY2MDU5ZDAzMzg3MTYwODllODcuLjQ3
NDZjY2NiOTU4OThiMjRkZjZmNTNkZTk0MjFlYTc2NDliNTU2OGYgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvc3lzZnMuaAorKysgYi9pbmNsdWRlL2xpbnV4L3N5c2ZzLmgKQEAgLTg3LDYgKzg3
LDExIEBAIGRvIHsJCQkJCQkJXAogICoJCVNZU0ZTX0dST1VQX1ZJU0lCTEUoKSB3aGVuIGFzc2ln
bmluZyB0aGlzIGNhbGxiYWNrIHRvCiAgKgkJc3BlY2lmeSBzZXBhcmF0ZSBfZ3JvdXBfdmlzaWJs
ZSgpIGFuZCBfYXR0cl92aXNpYmxlKCkKICAqCQloYW5kbGVycy4KKyAqIEBiaW5fc2l6ZToKKyAq
CQlPcHRpb25hbDogRnVuY3Rpb24gdG8gcmV0dXJuIHRoZSBzaXplIG9mIGEgYmluYXJ5IGF0dHJp
YnV0ZQorICoJCW9mIHRoZSBncm91cC4gV2lsbCBiZSBjYWxsZWQgcmVwZWF0ZWRseSBmb3IgZWFj
aCBiaW5hcnkKKyAqCQlhdHRyaWJ1dGUgaW4gdGhlIGdyb3VwLiBPdmVyd3JpdGVzIHRoZSBzaXpl
IGZpZWxkIGVtYmVkZGVkCisgKgkJaW5zaWRlIHRoZSBhdHRyaWJ1dGUgaXRzZWxmLgogICogQGF0
dHJzOglQb2ludGVyIHRvIE5VTEwgdGVybWluYXRlZCBsaXN0IG9mIGF0dHJpYnV0ZXMuCiAgKiBA
YmluX2F0dHJzOglQb2ludGVyIHRvIE5VTEwgdGVybWluYXRlZCBsaXN0IG9mIGJpbmFyeSBhdHRy
aWJ1dGVzLgogICoJCUVpdGhlciBhdHRycyBvciBiaW5fYXR0cnMgb3IgYm90aCBtdXN0IGJlIHBy
b3ZpZGVkLgpAQCAtOTcsNiArMTAyLDkgQEAgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCB7CiAJCQkJ
CSAgICAgIHN0cnVjdCBhdHRyaWJ1dGUgKiwgaW50KTsKIAl1bW9kZV90CQkJKCppc19iaW5fdmlz
aWJsZSkoc3RydWN0IGtvYmplY3QgKiwKIAkJCQkJCSAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwg
aW50KTsKKwlzaXplX3QJCQkoKmJpbl9zaXplKShzdHJ1Y3Qga29iamVjdCAqLAorCQkJCQkgICAg
Y29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwKKwkJCQkJICAgIGludCk7CiAJc3RydWN0IGF0
dHJpYnV0ZQkqKmF0dHJzOwogCXN0cnVjdCBiaW5fYXR0cmlidXRlCSoqYmluX2F0dHJzOwogfTsK
Ci0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
