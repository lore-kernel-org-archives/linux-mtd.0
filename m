Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA4AD11182
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oT6IGHulYZtZ46pYjZzh70Pr/H/GdaXffDeGxrXifM=; b=eUFzF9xKFmMI3e
	xa8CGr0jq/CxcmP49aRcpQTIl4dSfCrB0StsVqdFy9yRBLw1Dhg/3MUfL+dcDHDED+Kxk/EycB1n6
	r8WPjioTQpGxE17fKwivErGmyjXaNG3LTeE5WVnZJTrtwDFK6petQ2JsmIVYHV3ByWaSfW4I1IWsw
	zQcSkKMrJASyQripi9ZJVAmuozhlPGTpUPEOC/OLXqaGmpC7rqcaTGlj2t8bHfeE2bFPyb6MyV2c2
	ztXrad/POzF9KSy7UC14/hFSjDkMOtDXakyWCucRwBB/OeX16zSj4USPKZoG3FMDzETgmA/ophL6V
	EJh7RLHKZfh5kfN6p7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1x-0000000Bkg4-3IVb;
	Sun, 03 Nov 2024 17:04:49 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1q-0000000BkZT-1t9m
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653480;
	bh=nl79rluqUz7qDqQxR9i496RKtXejrl6t02e4QH5qPJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MrPXyPkEuWuLaArcS1YGVn5YlgOUjnhynRsRbFHftaoVetXelMVaxQkJe+EiL6woE
	 S+0agGULjab2y5uR+7KKalE5m4IP94H8VkjxsjakcHAZy5VaYR9a0QZZyYQRSiHv+/
	 ysKDYkOHxRTXhv0Lf2m/q/BbJ0blHSQyXutxkMIo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:38 +0000
Subject: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=4652;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=nl79rluqUz7qDqQxR9i496RKtXejrl6t02e4QH5qPJI=;
 b=zRu/d/VZWP3doJBfzxqs7giw29YYNYi0iPXD2I6CuiN9W2SIlp8gheE3GiOLS245JLYo+Bia3
 qTMMFVAORK0D7GC1EfyiEnv7178teL6JXj2G6JdQ8X2UySjLYA2oPsa
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090442_692595_995D15E9 
X-CRM114-Status: GOOD (  15.58  )
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

VG8gbWFrZSBpdCBwb3NzaWJsZSB0byBwdXQgc3RydWN0IGJpbl9hdHRyaWJ1dGUgaW50byByZWFk
LW9ubHkgbWVtb3J5LAp0aGUgc3lzZnMgY29yZSBoYXMgdG8gc3RvcCBwYXNzaW5nIG11dGFibGUg
cG9pbnRlcnMgdG8gdGhlIHJlYWQoKSBhbmQKd3JpdGUoKSBjYWxsYmFja3MuCkFzIHRoZXJlIGFy
ZSBudW1lcm91cyBpbXBsZW1lbnRvcnMgb2YgdGhlc2UgY2FsbGJhY2tzIHRocm91Z2hvdXQgdGhl
CnRyZWUgaXQncyBub3QgcG9zc2libGUgdG8gY2hhbmdlIGFsbCBvZiB0aGVtIGF0IG9uY2UuClRv
IGVuYWJsZSBhIHN0ZXAtYnktc3RlcCB0cmFuc2l0aW9uLCBhZGQgbmV3IHZhcmlhbnRzIG9mIHRo
ZSByZWFkKCkgYW5kCndyaXRlKCkgY2FsbGJhY2tzIHdoaWNoIGRpZmZlciBvbmx5IGluIHRoZSBj
b25zdG5lc3Mgb2YgdGhlIHN0cnVjdApiaW5fYXR0cmlidXRlIGFyZ3VtZW50LgoKQXMgbW9zdCBi
aW5hcnkgYXR0cmlidXRlcyBhcmUgZGVmaW5lZCB0aHJvdWdoIG1hY3JvcywgZXh0ZW5kIHRoZXNl
Cm1hY3JvcyB0byB0cmFuc3BhcmVudGx5IGhhbmRsZSBib3RoIHZhcmlhbnRzIG9mIGNhbGxiYWNr
cyB0byBtaW5pbWl6ZQp0aGUgY2h1cm4gZHVyaW5nIHRoZSB0cmFuc2l0aW9uLgpBcyBzb29uIGFz
IGFsbCBoYW5kbGVycyBhcmUgc3dpdGNoIHRvIHRoZSBjb25zdCB2YXJpYW50LCB0aGUgbm9uLWNv
bnN0Cm9uZSBjYW4gYmUgcmVtb3ZlZCB0b2dldGhlciB3aXRoIHRoZSB0cmFuc2l0aW9uIG1hY2hp
bmVyeS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVo
Lm5ldD4KLS0tCiBmcy9zeXNmcy9maWxlLmMgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKy0t
LS0tCiBpbmNsdWRlL2xpbnV4L3N5c2ZzLmggfCAyNSArKysrKysrKysrKysrKysrKysrKysrKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZnMvc3lzZnMvZmlsZS5jIGIvZnMvc3lzZnMvZmlsZS5jCmluZGV4IDZkMzk2OTZi
NDMwNjkwMTBiMGFkMGJkYWFkY2Y5MDAyY2I3MGM5MmMuLjc4NTQwODg2MWMwMWM4OWZjODRjNzg3
ODQ4MjQzYTEzYzEzMzgzNjcgMTAwNjQ0Ci0tLSBhL2ZzL3N5c2ZzL2ZpbGUuYworKysgYi9mcy9z
eXNmcy9maWxlLmMKQEAgLTkxLDkgKzkxLDEyIEBAIHN0YXRpYyBzc2l6ZV90IHN5c2ZzX2tmX2Jp
bl9yZWFkKHN0cnVjdCBrZXJuZnNfb3Blbl9maWxlICpvZiwgY2hhciAqYnVmLAogCQkJY291bnQg
PSBzaXplIC0gcG9zOwogCX0KIAotCWlmICghYmF0dHItPnJlYWQpCisJaWYgKCFiYXR0ci0+cmVh
ZCAmJiAhYmF0dHItPnJlYWRfbmV3KQogCQlyZXR1cm4gLUVJTzsKIAorCWlmIChiYXR0ci0+cmVh
ZF9uZXcpCisJCXJldHVybiBiYXR0ci0+cmVhZF9uZXcob2YtPmZpbGUsIGtvYmosIGJhdHRyLCBi
dWYsIHBvcywgY291bnQpOworCiAJcmV0dXJuIGJhdHRyLT5yZWFkKG9mLT5maWxlLCBrb2JqLCBi
YXR0ciwgYnVmLCBwb3MsIGNvdW50KTsKIH0KIApAQCAtMTUyLDkgKzE1NSwxMiBAQCBzdGF0aWMg
c3NpemVfdCBzeXNmc19rZl9iaW5fd3JpdGUoc3RydWN0IGtlcm5mc19vcGVuX2ZpbGUgKm9mLCBj
aGFyICpidWYsCiAJaWYgKCFjb3VudCkKIAkJcmV0dXJuIDA7CiAKLQlpZiAoIWJhdHRyLT53cml0
ZSkKKwlpZiAoIWJhdHRyLT53cml0ZSAmJiAhYmF0dHItPndyaXRlX25ldykKIAkJcmV0dXJuIC1F
SU87CiAKKwlpZiAoYmF0dHItPndyaXRlX25ldykKKwkJcmV0dXJuIGJhdHRyLT53cml0ZV9uZXco
b2YtPmZpbGUsIGtvYmosIGJhdHRyLCBidWYsIHBvcywgY291bnQpOworCiAJcmV0dXJuIGJhdHRy
LT53cml0ZShvZi0+ZmlsZSwga29iaiwgYmF0dHIsIGJ1ZiwgcG9zLCBjb3VudCk7CiB9CiAKQEAg
LTMyMywxMyArMzI5LDE5IEBAIGludCBzeXNmc19hZGRfYmluX2ZpbGVfbW9kZV9ucyhzdHJ1Y3Qg
a2VybmZzX25vZGUgKnBhcmVudCwKIAljb25zdCBzdHJ1Y3Qga2VybmZzX29wcyAqb3BzOwogCXN0
cnVjdCBrZXJuZnNfbm9kZSAqa247CiAKKwlpZiAoYmF0dHItPnJlYWQgJiYgYmF0dHItPnJlYWRf
bmV3KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChiYXR0ci0+d3JpdGUgJiYgYmF0dHItPndy
aXRlX25ldykKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAoYmF0dHItPm1tYXApCiAJCW9wcyA9
ICZzeXNmc19iaW5fa2ZvcHNfbW1hcDsKLQllbHNlIGlmIChiYXR0ci0+cmVhZCAmJiBiYXR0ci0+
d3JpdGUpCisJZWxzZSBpZiAoKGJhdHRyLT5yZWFkIHx8IGJhdHRyLT5yZWFkX25ldykgJiYgKGJh
dHRyLT53cml0ZSB8fCBiYXR0ci0+d3JpdGVfbmV3KSkKIAkJb3BzID0gJnN5c2ZzX2Jpbl9rZm9w
c19ydzsKLQllbHNlIGlmIChiYXR0ci0+cmVhZCkKKwllbHNlIGlmIChiYXR0ci0+cmVhZCB8fCBi
YXR0ci0+cmVhZF9uZXcpCiAJCW9wcyA9ICZzeXNmc19iaW5fa2ZvcHNfcm87Ci0JZWxzZSBpZiAo
YmF0dHItPndyaXRlKQorCWVsc2UgaWYgKGJhdHRyLT53cml0ZSB8fCBiYXR0ci0+d3JpdGVfbmV3
KQogCQlvcHMgPSAmc3lzZnNfYmluX2tmb3BzX3dvOwogCWVsc2UKIAkJb3BzID0gJnN5c2ZzX2Zp
bGVfa2ZvcHNfZW1wdHk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N5c2ZzLmggYi9pbmNs
dWRlL2xpbnV4L3N5c2ZzLmgKaW5kZXggZDE3YzQ3M2MxZWYyOTI4NzU0NzViZjNiZGY2MmQwNzI0
MWMxMzg4Mi4uZDcxM2E2NDQ1YTYyNjcxNDVhNzAxNGYzMDhkZjNiYjI1YjhjMzI4NyAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9zeXNmcy5oCisrKyBiL2luY2x1ZGUvbGludXgvc3lzZnMuaApA
QCAtMzA1LDggKzMwNSwxMiBAQCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSB7CiAJc3RydWN0IGFkZHJl
c3Nfc3BhY2UgKigqZl9tYXBwaW5nKSh2b2lkKTsKIAlzc2l6ZV90ICgqcmVhZCkoc3RydWN0IGZp
bGUgKiwgc3RydWN0IGtvYmplY3QgKiwgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwKIAkJCWNoYXIg
KiwgbG9mZl90LCBzaXplX3QpOworCXNzaXplX3QgKCpyZWFkX25ldykoc3RydWN0IGZpbGUgKiwg
c3RydWN0IGtvYmplY3QgKiwgY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwKKwkJCSAgICBj
aGFyICosIGxvZmZfdCwgc2l6ZV90KTsKIAlzc2l6ZV90ICgqd3JpdGUpKHN0cnVjdCBmaWxlICos
IHN0cnVjdCBrb2JqZWN0ICosIHN0cnVjdCBiaW5fYXR0cmlidXRlICosCiAJCQkgY2hhciAqLCBs
b2ZmX3QsIHNpemVfdCk7CisJc3NpemVfdCAoKndyaXRlX25ldykoc3RydWN0IGZpbGUgKiwgc3Ry
dWN0IGtvYmplY3QgKiwKKwkJCSAgICAgY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwgY2hh
ciAqLCBsb2ZmX3QsIHNpemVfdCk7CiAJbG9mZl90ICgqbGxzZWVrKShzdHJ1Y3QgZmlsZSAqLCBz
dHJ1Y3Qga29iamVjdCAqLCBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqLAogCQkJIGxvZmZf
dCwgaW50KTsKIAlpbnQgKCptbWFwKShzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29iamVjdCAqLCBj
b25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwKQEAgLTMyNSwxMSArMzI5LDI4IEBAIHN0
cnVjdCBiaW5fYXR0cmlidXRlIHsKICAqLwogI2RlZmluZSBzeXNmc19iaW5fYXR0cl9pbml0KGJp
bl9hdHRyKSBzeXNmc19hdHRyX2luaXQoJihiaW5fYXR0ciktPmF0dHIpCiAKK3R5cGVkZWYgc3Np
emVfdCBfX3N5c2ZzX2Jpbl9yd19oYW5kbGVyX25ldyhzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29i
amVjdCAqLAorCQkJCQkgICBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqLCBjaGFyICosIGxv
ZmZfdCwgc2l6ZV90KTsKKwogLyogbWFjcm9zIHRvIGNyZWF0ZSBzdGF0aWMgYmluYXJ5IGF0dHJp
YnV0ZXMgZWFzaWVyICovCiAjZGVmaW5lIF9fQklOX0FUVFIoX25hbWUsIF9tb2RlLCBfcmVhZCwg
X3dyaXRlLCBfc2l6ZSkgewkJXAogCS5hdHRyID0geyAubmFtZSA9IF9fc3RyaW5naWZ5KF9uYW1l
KSwgLm1vZGUgPSBfbW9kZSB9LAkJXAotCS5yZWFkCT0gX3JlYWQsCQkJCQkJXAotCS53cml0ZQk9
IF93cml0ZSwJCQkJCQlcCisJLnJlYWQgPSBfR2VuZXJpYyhfcmVhZCwJCQkJCQlcCisJCV9fc3lz
ZnNfYmluX3J3X2hhbmRsZXJfbmV3ICogOiBOVUxMLAkJCVwKKwkJZGVmYXVsdCA6IF9yZWFkCQkJ
CQkJXAorCSksCQkJCQkJCQlcCisJLnJlYWRfbmV3ID0gX0dlbmVyaWMoX3JlYWQsCQkJCQlcCisJ
CV9fc3lzZnNfYmluX3J3X2hhbmRsZXJfbmV3ICogOiBfcmVhZCwJCQlcCisJCWRlZmF1bHQgOiBO
VUxMCQkJCQkJXAorCSksCQkJCQkJCQlcCisJLndyaXRlID0gX0dlbmVyaWMoX3dyaXRlLAkJCQkJ
XAorCQlfX3N5c2ZzX2Jpbl9yd19oYW5kbGVyX25ldyAqIDogTlVMTCwJCQlcCisJCWRlZmF1bHQg
OiBfd3JpdGUJCQkJCVwKKwkpLAkJCQkJCQkJXAorCS53cml0ZV9uZXcgPSBfR2VuZXJpYyhfd3Jp
dGUsCQkJCQlcCisJCV9fc3lzZnNfYmluX3J3X2hhbmRsZXJfbmV3ICogOiBfd3JpdGUsCQkJXAor
CQlkZWZhdWx0IDogTlVMTAkJCQkJCVwKKwkpLAkJCQkJCQkJXAogCS5zaXplCT0gX3NpemUsCQkJ
CQkJXAogfQogCgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
