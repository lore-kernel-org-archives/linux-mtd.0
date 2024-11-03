Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD3D11187
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVOn2TusauPuWfmuuzU3EkRlhozOVqC0W6wtOXo+Gec=; b=t2rcap0bMXWqlR
	P9fMX6WKwOQhXr5LX00nIRrU6xi4ibGf6qviU6XCzsdkHCkSUAYPhUNFefCzuUVEPMMhzAPv4tOMj
	i1jCsk5zt1K1a3ASZX2sGFbc32crweg7tt67k4pG7QPGSemCcelAgcoP0hB5ZBW/OjTtnVAi74rT+
	cgg88QWuEFIVu+x5kcIPjjFo4u7OQIPCBSD31LKVSfnjmmWDIvcE15p7IZBOtLCCB5ShSwvNpdYon
	6Qj+F9aXJCRPqwf+RwdQBWF8fq7WNhmE/Dgbjk1Rj8akhETOd3VO8QQioKEZLiAR7Y2WHU2kghOZG
	khRJHivvukPSKSHRLu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e20-0000000BkiV-18f4;
	Sun, 03 Nov 2024 17:04:52 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1u-0000000BkbX-0Tsf
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=i1lGRcvBSYaAkRCU3PsefBTXEi2eEGtd/RNZhauMerg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKhFlW+fXVU9iiG5WHWrfxqIg2MK5RN4rmEJ6qMm9w3609SWSEqzIiyskpf0F3SE/
	 5Hue+UAKF4NoE2Q53mkBkJ7j/9iT4JRSPm/DM+o1r+XqpuQf548H1TiWzMDARBYT4p
	 NmQ6pgjd99tSp5B6B0CVtWY1Wv6AMrStXbMf+hV8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:39 +0000
Subject: [PATCH v2 10/10] driver core: Constify attribute arguments of
 binary attributes
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-10-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2330;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=i1lGRcvBSYaAkRCU3PsefBTXEi2eEGtd/RNZhauMerg=;
 b=wjQlo57jq0Wj7AlLBOYWjC3NLTcXdQ4S/vHvyo3etlKonEvBK3xDMeXVEI2nFeo1fRBiMSJWq
 8Dy1FhYi+4pDACqaxOlIcEPw5eL4UaDS9rJJgllbu0x7Wp3mt9dGtys
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090446_420979_5882B3D0 
X-CRM114-Status: GOOD (  12.42  )
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

QXMgcHJlcGFyYXRpb24gZm9yIHRoZSBjb25zdGlmaWNhdGlvbiBvZiBzdHJ1Y3QgYmluX2F0dHJp
YnV0ZSwKY29uc3RpZnkgdGhlIGFyZ3VtZW50cyBvZiB0aGUgcmVhZCBhbmQgd3JpdGUgY2FsbGJh
Y2tzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgu
bmV0PgotLS0KIGRyaXZlcnMvYmFzZS9ub2RlLmMgICAgIHwgNCArKy0tCiBkcml2ZXJzL2Jhc2Uv
dG9wb2xvZ3kuYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL25vZGUuYyBiL2RyaXZlcnMv
YmFzZS9ub2RlLmMKaW5kZXggZWI3MjU4MDI4OGU2MjcyN2U1YjIxOThhNjQ1MWNmOWMyNTMzMjI1
YS4uM2U3NjE2MzNhYzc1ODI2YmVkYjVkZDMwYjg3OWY3Y2MxYWY5NWVjMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9iYXNlL25vZGUuYworKysgYi9kcml2ZXJzL2Jhc2Uvbm9kZS5jCkBAIC0yNyw3ICsy
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYnVzX3R5cGUgbm9kZV9zdWJzeXMgPSB7CiB9Owog
CiBzdGF0aWMgaW5saW5lIHNzaXplX3QgY3B1bWFwX3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIHN0
cnVjdCBrb2JqZWN0ICprb2JqLAotCQkJCSAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmF0dHIsIGNo
YXIgKmJ1ZiwKKwkJCQkgIGNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICphdHRyLCBjaGFyICpi
dWYsCiAJCQkJICBsb2ZmX3Qgb2ZmLCBzaXplX3QgY291bnQpCiB7CiAJc3RydWN0IGRldmljZSAq
ZGV2ID0ga29ial90b19kZXYoa29iaik7CkBAIC00OCw3ICs0OCw3IEBAIHN0YXRpYyBpbmxpbmUg
c3NpemVfdCBjcHVtYXBfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGtvYmplY3QgKmtv
YmosCiBzdGF0aWMgQklOX0FUVFJfUk8oY3B1bWFwLCBDUFVNQVBfRklMRV9NQVhfQllURVMpOwog
CiBzdGF0aWMgaW5saW5lIHNzaXplX3QgY3B1bGlzdF9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBz
dHJ1Y3Qga29iamVjdCAqa29iaiwKLQkJCQkgICBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwg
Y2hhciAqYnVmLAorCQkJCSAgIGNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICphdHRyLCBjaGFy
ICpidWYsCiAJCQkJICAgbG9mZl90IG9mZiwgc2l6ZV90IGNvdW50KQogewogCXN0cnVjdCBkZXZp
Y2UgKmRldiA9IGtvYmpfdG9fZGV2KGtvYmopOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL3Rv
cG9sb2d5LmMgYi9kcml2ZXJzL2Jhc2UvdG9wb2xvZ3kuYwppbmRleCA4OWY5OGJlNWM1Yjk5MTVi
Mjk3NGUxODRiZjg5YzRjMjVjMTgzMDk1Li4xMDkwNzUxZDdmNDU4Y2U4ZDJhNTBlODJkNjViOGNl
MzFlOTM4ZjE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jhc2UvdG9wb2xvZ3kuYworKysgYi9kcml2
ZXJzL2Jhc2UvdG9wb2xvZ3kuYwpAQCAtMjMsNyArMjMsNyBAQCBzdGF0aWMgc3NpemVfdCBuYW1l
IyNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCQkJCVwKIAogI2RlZmluZSBkZWZpbmVfc2libGlu
Z3NfcmVhZF9mdW5jKG5hbWUsIG1hc2spCQkJCQlcCiBzdGF0aWMgc3NpemVfdCBuYW1lIyNfcmVh
ZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGtvYmplY3QgKmtvYmosCQlcCi0JCQkgICBzdHJ1
Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmLAkJXAorCQkJICAgY29uc3Qgc3RydWN0
IGJpbl9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZiwJCVwKIAkJCSAgIGxvZmZfdCBvZmYsIHNp
emVfdCBjb3VudCkJCQkJXAogewkJCQkJCQkJCQlcCiAJc3RydWN0IGRldmljZSAqZGV2ID0ga29i
al90b19kZXYoa29iaik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXApAQCAtMzMs
NyArMzMsNyBAQCBzdGF0aWMgc3NpemVfdCBuYW1lIyNfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwg
c3RydWN0IGtvYmplY3QgKmtvYmosCQlcCiB9CQkJCQkJCQkJCVwKIAkJCQkJCQkJCQlcCiBzdGF0
aWMgc3NpemVfdCBuYW1lIyNfbGlzdF9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qga29i
amVjdCAqa29iaiwJXAotCQkJCXN0cnVjdCBiaW5fYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYs
CQlcCisJCQkJY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZiwJXAog
CQkJCWxvZmZfdCBvZmYsIHNpemVfdCBjb3VudCkJCQlcCiB7CQkJCQkJCQkJCVwKIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSBrb2JqX3RvX2Rldihrb2JqKTsJCQkJCVwKCi0tIAoyLjQ3LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
