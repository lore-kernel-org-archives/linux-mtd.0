Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7699D11184
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGEK5fSpttx2RLLiaIaWUNXPE1dwwt4zp2iIzFt8yb0=; b=soK0uzc1Xojcmf
	It9HAhTdAzBLpepNRwnnfrmeNaJUBJCDzdGzogwm4/FF33aCBJ9gNmknBbn49cYz0ibdPmuPOOG22
	/O/O9Ge+pjF/GV8fCgRcp5pqYrjd0I5YYYpsJ+tes4O0mniD/CPqtfVj2/njm0XyOuYz2n6eRV63F
	OTKPce5zoI0ihgepRuTow1BDtXjFfNzJn2u36pkdz7le8HO0pErrdzQgI9TMqns70x77+iMl7xvge
	TCeC8JNw1zUx9Rby2TzhNs779OT5d6+uFUT9H+u86/lIBdwltL30+F0Vw4unL54+iBx7rRAg9bYLn
	kQJVYnw6RSXW41b0p9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e2D-0000000BkwR-14mA;
	Sun, 03 Nov 2024 17:05:05 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1u-0000000Bkbj-1tBK
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653482;
	bh=omnzY7OVUHnekZ/bUX8pXaM2rzeR5oe1Izmsxqjd69Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gAex2VJyMV+OiFkklrV8IrICkrh78EMUGYE6sgF6izsK/E9bdOLP+ue1pMfx65KEP
	 daDJhG0bHjOZvxSIVoZOVufQPlLYRdXOaAnYLf8bMNfx7N7rX5CM0q0eWD9GRIOclJ
	 PZ80lLezOY62im86G8xcV8ntzX7D+eMJVrF5nUUY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:32 +0000
Subject: [PATCH v2 03/10] PCI/sysfs: Calculate bin_attribute size through
 bin_size()
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-3-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2359;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=omnzY7OVUHnekZ/bUX8pXaM2rzeR5oe1Izmsxqjd69Q=;
 b=QEHmCC4IyJCPeU5OBXq34EhCHkpPKQglOlOaOSow6b0xRNSB6n8UoneN+GL6/CGyBOY6ZhYUm
 LOb4xWNOB8AC0VTvIPxtVY0ZKdQGGSIFQEaRXg1966rzLgUpCbB+31p
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090446_773133_B62C89F7 
X-CRM114-Status: GOOD (  12.96  )
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

U3RvcCBhYnVzaW5nIHRoZSBpc19iaW5fdmlzaWJsZSgpIGNhbGxiYWNrIHRvIGNhbGN1bGF0ZSB0
aGUgYXR0cmlidXRlCnNpemUuIEluc3RlYWQgdXNlIHRoZSBuZXcsIGRlZGljYXRlZCBiaW5fc2l6
ZSgpIG9uZS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3Nj
aHVoLm5ldD4KLS0tCiBkcml2ZXJzL3BjaS9wY2ktc3lzZnMuYyB8IDI4ICsrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2ktc3lzZnMuYyBiL2RyaXZlcnMv
cGNpL3BjaS1zeXNmcy5jCmluZGV4IDVkMGY0ZGIxY2FiNzg2NzRjNWU1OTA2ZjMyMWJmN2E1N2I3
NDI5ODMuLjA0MGYwMWIyYjk5OTE3NWU4ZDk4YjA1ODUxZWRjMDc4YmJhYmJlMGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5j
CkBAIC04MTgsMjEgKzgxOCwyMCBAQCBzdGF0aWMgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKnBjaV9k
ZXZfY29uZmlnX2F0dHJzW10gPSB7CiAJTlVMTCwKIH07CiAKLXN0YXRpYyB1bW9kZV90IHBjaV9k
ZXZfY29uZmlnX2F0dHJfaXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKLQkJCQkJICAg
ICAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmEsIGludCBuKQorc3RhdGljIHNpemVfdCBwY2lfZGV2
X2NvbmZpZ19hdHRyX2Jpbl9zaXplKHN0cnVjdCBrb2JqZWN0ICprb2JqLAorCQkJCQkgICBjb25z
dCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYSwKKwkJCQkJICAgaW50IG4pCiB7CiAJc3RydWN0IHBj
aV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGtvYmpfdG9fZGV2KGtvYmopKTsKIAotCWEtPnNpemUg
PSBQQ0lfQ0ZHX1NQQUNFX1NJWkU7CiAJaWYgKHBkZXYtPmNmZ19zaXplID4gUENJX0NGR19TUEFD
RV9TSVpFKQotCQlhLT5zaXplID0gUENJX0NGR19TUEFDRV9FWFBfU0laRTsKLQotCXJldHVybiBh
LT5hdHRyLm1vZGU7CisJCXJldHVybiBQQ0lfQ0ZHX1NQQUNFX0VYUF9TSVpFOworCXJldHVybiBQ
Q0lfQ0ZHX1NQQUNFX1NJWkU7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dy
b3VwIHBjaV9kZXZfY29uZmlnX2F0dHJfZ3JvdXAgPSB7CiAJLmJpbl9hdHRycyA9IHBjaV9kZXZf
Y29uZmlnX2F0dHJzLAotCS5pc19iaW5fdmlzaWJsZSA9IHBjaV9kZXZfY29uZmlnX2F0dHJfaXNf
dmlzaWJsZSwKKwkuYmluX3NpemUgPSBwY2lfZGV2X2NvbmZpZ19hdHRyX2Jpbl9zaXplLAogfTsK
IAogLyoKQEAgLTEzMzAsMjEgKzEzMjksMjYgQEAgc3RhdGljIHVtb2RlX3QgcGNpX2Rldl9yb21f
YXR0cl9pc192aXNpYmxlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCQkJCQkgICBzdHJ1Y3QgYmlu
X2F0dHJpYnV0ZSAqYSwgaW50IG4pCiB7CiAJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lf
ZGV2KGtvYmpfdG9fZGV2KGtvYmopKTsKLQlzaXplX3Qgcm9tX3NpemU7CiAKIAkvKiBJZiB0aGUg
ZGV2aWNlIGhhcyBhIFJPTSwgdHJ5IHRvIGV4cG9zZSBpdCBpbiBzeXNmcy4gKi8KLQlyb21fc2l6
ZSA9IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgUENJX1JPTV9SRVNPVVJDRSk7Ci0JaWYgKCFyb21f
c2l6ZSkKKwlpZiAoIXBjaV9yZXNvdXJjZV9lbmQocGRldiwgUENJX1JPTV9SRVNPVVJDRSkpCiAJ
CXJldHVybiAwOwogCi0JYS0+c2l6ZSA9IHJvbV9zaXplOwotCiAJcmV0dXJuIGEtPmF0dHIubW9k
ZTsKIH0KIAorc3RhdGljIHNpemVfdCBwY2lfZGV2X3JvbV9hdHRyX2Jpbl9zaXplKHN0cnVjdCBr
b2JqZWN0ICprb2JqLAorCQkJCQljb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYSwgaW50IG4p
Cit7CisJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGtvYmpfdG9fZGV2KGtvYmop
KTsKKworCXJldHVybiBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIFBDSV9ST01fUkVTT1VSQ0UpOwor
fQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBwY2lfZGV2X3JvbV9hdHRy
X2dyb3VwID0gewogCS5iaW5fYXR0cnMgPSBwY2lfZGV2X3JvbV9hdHRycywKIAkuaXNfYmluX3Zp
c2libGUgPSBwY2lfZGV2X3JvbV9hdHRyX2lzX3Zpc2libGUsCisJLmJpbl9zaXplID0gcGNpX2Rl
dl9yb21fYXR0cl9iaW5fc2l6ZSwKIH07CiAKIHN0YXRpYyBzc2l6ZV90IHJlc2V0X3N0b3JlKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCgotLSAKMi40
Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
