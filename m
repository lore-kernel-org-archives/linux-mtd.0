Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D5D11183
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6RdRVNpCzn9bxMZXj/5iwFSUcNT+mufheYhqnYSo+k=; b=ejNsGaNJrU0rHi
	BzoQk680SObNiuQyK2jbf7eNNcvFqqy0dLpKSRJ2oPBx/HBNOROMGZfB7X7GKQEb0meItD1iTTU+9
	GqjTWZHUpLS6PVdJhm9Dl5shPSs0F/Aj0vKeWyAiDtzwqmqWXpZjV8yn/9VolCN4Fwbcl2ycPO8xt
	lQSpAHThDTYR8Mw0Z4ZaWMOmrE05eHW/gcu7rNyPyUNBk6D5Hmd6fozJDcIEIFXzJUf4A6AfCZEoI
	ZFm5ZVMNW4i3RKzMpccJiniYimBj2orlXcAk0raGQPprY2Gc+uX9pBWbC0+bzO8Tml+0SYgQw3xUa
	pXWcfJ7DqjLmLc2wXnyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e25-0000000Bko7-3Qgd;
	Sun, 03 Nov 2024 17:04:57 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1u-0000000Bkbb-15c5
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653482;
	bh=zDhPVchfMys7HnsVtwZsrXjRXhl5fZsRZ1XGARPtegE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H75YdV+k9aKMbCg3vYqkrITc/NSui5xg9ZVSt864cTzcQxw90svfufktDmLA8a2lW
	 /dbglWlZm61tUtLow1Q3tyjkRdeCmG3i5aMEWTFNazRPqYODgYZJAsPEMnIPlThVwG
	 y4spMmomoO7OqL8jTcXa0IsoXpoF9GwL6a0t8T0c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:33 +0000
Subject: [PATCH v2 04/10] nvmem: core: calculate bin_attribute size through
 bin_size()
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-4-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=1407;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zDhPVchfMys7HnsVtwZsrXjRXhl5fZsRZ1XGARPtegE=;
 b=LIJoZnee0F8KxWypgifoxx5C03UWzUsfKRD3mTuXEg8GZQDzU4bKngbG7gE6mho+vvHyDPpYb
 T0csHWK0CZAA7NKHFKir+h35XqhjNK7+x/o8Rk9YXpQi/8Q7SU3s9Ua
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090446_580733_8E9A5B55 
X-CRM114-Status: GOOD (  11.62  )
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
aHVoLm5ldD4KLS0tCiBkcml2ZXJzL252bWVtL2NvcmUuYyB8IDEzICsrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKaW5kZXggMzNm
ZmEyYWE0YzExNTIzOThlYzY2YjhkZDdiMzAzODRjNTM0NmE2ZS4uNjMzNzBjNzYzOTRlZTliOGQ1
MTRkYTA3NDc3OTYxN2NlZjY3YzMxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lbS9jb3JlLmMK
KysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKQEAgLTMwMywxMSArMzAzLDE5IEBAIHN0YXRpYyB1
bW9kZV90IG52bWVtX2Jpbl9hdHRyX2lzX3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtvYmosCiAJ
c3RydWN0IGRldmljZSAqZGV2ID0ga29ial90b19kZXYoa29iaik7CiAJc3RydWN0IG52bWVtX2Rl
dmljZSAqbnZtZW0gPSB0b19udm1lbV9kZXZpY2UoZGV2KTsKIAotCWF0dHItPnNpemUgPSBudm1l
bS0+c2l6ZTsKLQogCXJldHVybiBudm1lbV9iaW5fYXR0cl9nZXRfdW1vZGUobnZtZW0pOwogfQog
CitzdGF0aWMgc2l6ZV90IG52bWVtX2Jpbl9hdHRyX3NpemUoc3RydWN0IGtvYmplY3QgKmtvYmos
CisJCQkJICBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwKKwkJCQkgIGludCBpKQor
eworCXN0cnVjdCBkZXZpY2UgKmRldiA9IGtvYmpfdG9fZGV2KGtvYmopOworCXN0cnVjdCBudm1l
bV9kZXZpY2UgKm52bWVtID0gdG9fbnZtZW1fZGV2aWNlKGRldik7CisKKwlyZXR1cm4gbnZtZW0t
PnNpemU7Cit9CisKIHN0YXRpYyB1bW9kZV90IG52bWVtX2F0dHJfaXNfdmlzaWJsZShzdHJ1Y3Qg
a29iamVjdCAqa29iaiwKIAkJCQkgICAgIHN0cnVjdCBhdHRyaWJ1dGUgKmF0dHIsIGludCBpKQog
ewpAQCAtMzgzLDYgKzM5MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3Vw
IG52bWVtX2Jpbl9ncm91cCA9IHsKIAkuYmluX2F0dHJzCT0gbnZtZW1fYmluX2F0dHJpYnV0ZXMs
CiAJLmF0dHJzCQk9IG52bWVtX2F0dHJzLAogCS5pc19iaW5fdmlzaWJsZSA9IG52bWVtX2Jpbl9h
dHRyX2lzX3Zpc2libGUsCisJLmJpbl9zaXplCT0gbnZtZW1fYmluX2F0dHJfc2l6ZSwKIAkuaXNf
dmlzaWJsZQk9IG52bWVtX2F0dHJfaXNfdmlzaWJsZSwKIH07CiAKCi0tIAoyLjQ3LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
