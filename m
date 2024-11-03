Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE66ED11188
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YSvM6pU8nXUo0tSbfKHEK0VRU7MloCJoj0w9e04DQI=; b=D0C1P9Dcx8gWUC
	ETI+juCQPkYaw6k4O65ZsO7stfY5o4AO5MSIcye1jJyGzSQxKb2m4GL3AzuXzT6CXg9myiMmSxVC4
	RIzCrLPtss5kKZsW6osn97j2YnNHHprJHCTuaHuxTR5kpSgpM1TjQOvNtfZNh6fNRFpYZv5Gxk6si
	2kuhcPqD1ZqLT/ATKHOjFOl0ghK2J1Pb2UV+C4YwJLJEXJ5lBeZN301sDksSkpmItfsf/Sla61YaB
	8VoRJ6RTgPo0iJpPiFCVPBBnAfdwlX+8n2CLFIC8ReeRxOzBFkD+xuL87gIX9ab6EfHOqREf1UZWe
	76D9b5nlNGvBxnHDap8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7f87-0000000BpqN-0mmA;
	Sun, 03 Nov 2024 18:15:15 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1t-0000000BkbR-0UeX
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=Knwg+Z2CkMm4IK1d+HsEFrKnqSyqDlXFkrBwo+TwWXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NgM/ElQmvf59/YWbjDqRbVuMEl0pDjY+ObTO6d8h7LUcSEHYmSbo42n8NiaNsD+YV
	 W/SF6kIvUGW+OWHAuixbbmiWBTAsGaJ1bUJJ75TWxvkGrAhk2IGeTOWoy2uiVdU/7n
	 BT8O0X22pGVKUUwyGIBh7YJIs16haYaygPErOxWs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:36 +0000
Subject: [PATCH v2 07/10] sysfs: treewide: constify attribute callback of
 bin_attribute::llseek()
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-7-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=1737;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Knwg+Z2CkMm4IK1d+HsEFrKnqSyqDlXFkrBwo+TwWXc=;
 b=7BBy1cB2402AMdsGbWDhocbKrbJW2MgG/pXJPZgbbTP5a7oCuUuoE2vbVvQiK5iVSTaOOfRv6
 UmT00qXCNvtDaYwwoMp7tKP4VGZJJQhLqLk6CjFCbnS/F84qc7ejcEm
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090445_353636_038D9F55 
X-CRM114-Status: GOOD (  13.06  )
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

VGhlIGxsc2VlaygpIGNhbGxiYWNrcyBzaG91bGQgbm90IG1vZGlmeSB0aGUgc3RydWN0CmJpbl9h
dHRyaWJ1dGUgcGFzc2VkIGFzIGFyZ3VtZW50LgpFbmZvcmNlIHRoaXMgYnkgbWFya2luZyB0aGUg
YXJndW1lbnQgYXMgY29uc3QuCgpBcyB0aGVyZSBhcmUgbm90IG1hbnkgY2FsbGJhY2sgaW1wbGVt
ZW50ZXJzIHBlcmZvcm0gdGhpcyBjaGFuZ2UKdGhyb3VnaG91dCB0aGUgdHJlZSBhdCBvbmNlLgoK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0Pgot
LS0KIGRyaXZlcnMvcGNpL3BjaS1zeXNmcy5jIHwgMiArLQogaW5jbHVkZS9saW51eC9zeXNmcy5o
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2ktc3lzZnMuYyBiL2RyaXZlcnMvcGNpL3Bj
aS1zeXNmcy5jCmluZGV4IDBhZDM0MjcyMjhiMTJhYTk1MzI1YzZmYzAwZTk2ODY3NDA1NTkyMzgu
LjQ5YmVlNzBmN2QzNzViY2EwNTY0NzZhY2Q2NTI4ZDE5ZWFkMmM0MTkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcGNpL3BjaS1zeXNmcy5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jCkBAIC04
NDEsNyArODQxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgcGNpX2Rl
dl9jb25maWdfYXR0cl9ncm91cCA9IHsKIHN0YXRpYyBfX21heWJlX3VudXNlZCBsb2ZmX3QKIHBj
aV9sbHNlZWtfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZpbGVwLAogCQkgICAgc3RydWN0IGtvYmpl
Y3QgKmtvYmogX19hbHdheXNfdW51c2VkLAotCQkgICAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmF0
dHIsCisJCSAgICBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwKIAkJICAgIGxvZmZf
dCBvZmZzZXQsIGludCB3aGVuY2UpCiB7CiAJcmV0dXJuIGZpeGVkX3NpemVfbGxzZWVrKGZpbGVw
LCBvZmZzZXQsIHdoZW5jZSwgYXR0ci0+c2l6ZSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3N5c2ZzLmggYi9pbmNsdWRlL2xpbnV4L3N5c2ZzLmgKaW5kZXggOWZjZGM4Y2QzMTE4ZjM1OTc0
MmJmZDhiNzA4ZDVjM2VmZjUxMTA0Mi4uY2IyYTVlMjc3YzIzODRmMmU4YWRkOGZiZjI5MDdlOGE4
MTk1NzZlYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zeXNmcy5oCisrKyBiL2luY2x1ZGUv
bGludXgvc3lzZnMuaApAQCAtMzA3LDcgKzMwNyw3IEBAIHN0cnVjdCBiaW5fYXR0cmlidXRlIHsK
IAkJCWNoYXIgKiwgbG9mZl90LCBzaXplX3QpOwogCXNzaXplX3QgKCp3cml0ZSkoc3RydWN0IGZp
bGUgKiwgc3RydWN0IGtvYmplY3QgKiwgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwKIAkJCSBjaGFy
ICosIGxvZmZfdCwgc2l6ZV90KTsKLQlsb2ZmX3QgKCpsbHNlZWspKHN0cnVjdCBmaWxlICosIHN0
cnVjdCBrb2JqZWN0ICosIHN0cnVjdCBiaW5fYXR0cmlidXRlICosCisJbG9mZl90ICgqbGxzZWVr
KShzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29iamVjdCAqLCBjb25zdCBzdHJ1Y3QgYmluX2F0dHJp
YnV0ZSAqLAogCQkJIGxvZmZfdCwgaW50KTsKIAlpbnQgKCptbWFwKShzdHJ1Y3QgZmlsZSAqLCBz
dHJ1Y3Qga29iamVjdCAqLCBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwKIAkJICAg
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
