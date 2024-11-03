Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB0AD11189
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVf8CeFpKJU4p0obL1kUN4snBSI9dQ/E4aeArX4aMZA=; b=Ts8umw9O+gjnbP
	LKD1E6Mm33XowJZ5lCRRfs6LEbjE7uZuN54YgnRCrG72LPF1iMCIev+QIq2WUoxFX7+miXmw1Vr/z
	Rl+GrB5lOS8LXON94qov0wm+Vk3GleZbJE/nZkmDXTGIe2IOAVwI2SnXqAdiipm/GPlUE2nRjO8Ij
	oQw7kYRr0cJUyWEa6ZKUx8iQdKRm9CEyxkXsaeEod8VIAv8vhJtE8CTlvPyNzrogF1YczSBlO3YIV
	jDWkrlq0thEJjF/CRQp96BS4kEn0RWwjL4mxRSVsMW4g816XLpnEGnjOMygaeQmp15Hd0gcn7iHkb
	YVNeL/WwrgiUl5AgkckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1w-0000000Bkf9-08Pv;
	Sun, 03 Nov 2024 17:04:48 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1p-0000000BkYW-2NYJ
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653474;
	bh=iCkq/n0ScNs19XGEBHP6SQ4H+TMRU4fkw8iLrhzrW/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jCGf7P5s53Ta360TJbHbjEX0UBWW3nHAglDu578tyRJB0eZgE5NN8zYQ0kFtr1Svt
	 pCp484/NqdkNGcCiZ9riHzuo/LXlzlPqaqdK9SPb5smzV52zn2yNPWdP3DIa10iyOa
	 KeTiE8N08tCGK9uD6gJjB4S2MSPfd5jAPy1fJsj8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:30 +0000
Subject: [PATCH v2 01/10] sysfs: explicitly pass size to
 sysfs_add_bin_file_mode_ns()
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-1-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=3118;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=iCkq/n0ScNs19XGEBHP6SQ4H+TMRU4fkw8iLrhzrW/Q=;
 b=sZzl6wOvr0Sxq3DUY1GJqR+qhFx4JBDN7tgJGJz8989wTSFCjglU0coA3+lhHK8A4oBqQa8cP
 HbptlDNYnPABVHa2o+5ifoWR29tK6teGa/60gJsy0hPwKXqLXrvxd4C
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090441_819650_E5993F64 
X-CRM114-Status: GOOD (  12.86  )
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

VXBjb21pbmcgY2hhbmdlcyB0byB0aGUgc3lzZnMgY29yZSByZXF1aXJlIHRoZSBzaXplIG9mIHRo
ZSBjcmVhdGVkIGZpbGUKdG8gYmUgb3ZlcnJpZGFibGUgYnkgdGhlIGNhbGxlci4KQWRkIGEgcGFy
YW1ldGVyIHRvIGVuYWJsZSB0aGlzLgpGb3Igbm93IGtlZXAgdXNpbmcgYXR0ci0+c2l6ZSBpbiBh
bGwgY2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3Nz
Y2h1aC5uZXQ+Ci0tLQogZnMvc3lzZnMvZmlsZS5jICB8IDggKysrKy0tLS0KIGZzL3N5c2ZzL2dy
b3VwLmMgfCAzICsrLQogZnMvc3lzZnMvc3lzZnMuaCB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3N5c2ZzL2Zp
bGUuYyBiL2ZzL3N5c2ZzL2ZpbGUuYwppbmRleCBkMTk5NWUyZDZjOTQzYTY0NGZmOWYzNGNmMjQ4
ODg2NGQ1N2RhZjgxLi42ZDM5Njk2YjQzMDY5MDEwYjBhZDBiZGFhZGNmOTAwMmNiNzBjOTJjIDEw
MDY0NAotLS0gYS9mcy9zeXNmcy9maWxlLmMKKysrIGIvZnMvc3lzZnMvZmlsZS5jCkBAIC0zMTUs
NyArMzE1LDcgQEAgaW50IHN5c2ZzX2FkZF9maWxlX21vZGVfbnMoc3RydWN0IGtlcm5mc19ub2Rl
ICpwYXJlbnQsCiB9CiAKIGludCBzeXNmc19hZGRfYmluX2ZpbGVfbW9kZV9ucyhzdHJ1Y3Qga2Vy
bmZzX25vZGUgKnBhcmVudCwKLQkJY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmJhdHRyLCB1
bW9kZV90IG1vZGUsCisJCWNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICpiYXR0ciwgdW1vZGVf
dCBtb2RlLCBzaXplX3Qgc2l6ZSwKIAkJa3VpZF90IHVpZCwga2dpZF90IGdpZCwgY29uc3Qgdm9p
ZCAqbnMpCiB7CiAJY29uc3Qgc3RydWN0IGF0dHJpYnV0ZSAqYXR0ciA9ICZiYXR0ci0+YXR0cjsK
QEAgLTM0MCw3ICszNDAsNyBAQCBpbnQgc3lzZnNfYWRkX2Jpbl9maWxlX21vZGVfbnMoc3RydWN0
IGtlcm5mc19ub2RlICpwYXJlbnQsCiAjZW5kaWYKIAogCWtuID0gX19rZXJuZnNfY3JlYXRlX2Zp
bGUocGFyZW50LCBhdHRyLT5uYW1lLCBtb2RlICYgMDc3NywgdWlkLCBnaWQsCi0JCQkJICBiYXR0
ci0+c2l6ZSwgb3BzLCAodm9pZCAqKWF0dHIsIG5zLCBrZXkpOworCQkJCSAgc2l6ZSwgb3BzLCAo
dm9pZCAqKWF0dHIsIG5zLCBrZXkpOwogCWlmIChJU19FUlIoa24pKSB7CiAJCWlmIChQVFJfRVJS
KGtuKSA9PSAtRUVYSVNUKQogCQkJc3lzZnNfd2Fybl9kdXAocGFyZW50LCBhdHRyLT5uYW1lKTsK
QEAgLTU4MCw4ICs1ODAsOCBAQCBpbnQgc3lzZnNfY3JlYXRlX2Jpbl9maWxlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLAogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWtvYmplY3RfZ2V0X293bmVyc2hpcChr
b2JqLCAmdWlkLCAmZ2lkKTsKLQlyZXR1cm4gc3lzZnNfYWRkX2Jpbl9maWxlX21vZGVfbnMoa29i
ai0+c2QsIGF0dHIsIGF0dHItPmF0dHIubW9kZSwgdWlkLAotCQkJCQkgICBnaWQsIE5VTEwpOwor
CXJldHVybiBzeXNmc19hZGRfYmluX2ZpbGVfbW9kZV9ucyhrb2JqLT5zZCwgYXR0ciwgYXR0ci0+
YXR0ci5tb2RlLAorCQkJCQkgIGF0dHItPnNpemUsIHVpZCwgZ2lkLCBOVUxMKTsKIH0KIEVYUE9S
VF9TWU1CT0xfR1BMKHN5c2ZzX2NyZWF0ZV9iaW5fZmlsZSk7CiAKZGlmZiAtLWdpdCBhL2ZzL3N5
c2ZzL2dyb3VwLmMgYi9mcy9zeXNmcy9ncm91cC5jCmluZGV4IGQyMmFkNjdhMGYzMjkxZjQ3MDJm
NDk0OTM5NTI4ZDVkMTNjMzFmYWUuLjQ1YjJlOTI5NDFkYTFmNDlkY2M3MWFmMzc4MTMxN2M2MTQ4
MGM5NTYgMTAwNjQ0Ci0tLSBhL2ZzL3N5c2ZzL2dyb3VwLmMKKysrIGIvZnMvc3lzZnMvZ3JvdXAu
YwpAQCAtODcsNiArODcsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9maWxlcyhzdHJ1Y3Qga2VybmZz
X25vZGUgKnBhcmVudCwgc3RydWN0IGtvYmplY3QgKmtvYmosCiAJaWYgKGdycC0+YmluX2F0dHJz
KSB7CiAJCWZvciAoaSA9IDAsIGJpbl9hdHRyID0gZ3JwLT5iaW5fYXR0cnM7ICpiaW5fYXR0cjsg
aSsrLCBiaW5fYXR0cisrKSB7CiAJCQl1bW9kZV90IG1vZGUgPSAoKmJpbl9hdHRyKS0+YXR0ci5t
b2RlOworCQkJc2l6ZV90IHNpemUgPSAoKmJpbl9hdHRyKS0+c2l6ZTsKIAogCQkJaWYgKHVwZGF0
ZSkKIAkJCQlrZXJuZnNfcmVtb3ZlX2J5X25hbWUocGFyZW50LApAQCAtMTA0LDcgKzEwNSw3IEBA
IHN0YXRpYyBpbnQgY3JlYXRlX2ZpbGVzKHN0cnVjdCBrZXJuZnNfbm9kZSAqcGFyZW50LCBzdHJ1
Y3Qga29iamVjdCAqa29iaiwKIAogCQkJbW9kZSAmPSBTWVNGU19QUkVBTExPQyB8IDA2NjQ7CiAJ
CQllcnJvciA9IHN5c2ZzX2FkZF9iaW5fZmlsZV9tb2RlX25zKHBhcmVudCwgKmJpbl9hdHRyLAot
CQkJCQkJCSAgIG1vZGUsIHVpZCwgZ2lkLAorCQkJCQkJCSAgIG1vZGUsIHNpemUsIHVpZCwgZ2lk
LAogCQkJCQkJCSAgIE5VTEwpOwogCQkJaWYgKGVycm9yKQogCQkJCWJyZWFrOwpkaWZmIC0tZ2l0
IGEvZnMvc3lzZnMvc3lzZnMuaCBiL2ZzL3N5c2ZzL3N5c2ZzLmgKaW5kZXggM2YyOGM5YWY1NzU2
MmY2MWEwMGE0NzkzNTU3OWYwOTM5Y2JmZDRkYy4uOGUwMTJmMjVlMWMwNmU4MDJjMzEzOGNjMjcx
NWI0NmMxZjY3ZmE0OCAxMDA2NDQKLS0tIGEvZnMvc3lzZnMvc3lzZnMuaAorKysgYi9mcy9zeXNm
cy9zeXNmcy5oCkBAIC0zMSw3ICszMSw3IEBAIGludCBzeXNmc19hZGRfZmlsZV9tb2RlX25zKHN0
cnVjdCBrZXJuZnNfbm9kZSAqcGFyZW50LAogCQljb25zdCBzdHJ1Y3QgYXR0cmlidXRlICphdHRy
LCB1bW9kZV90IGFtb2RlLCBrdWlkX3QgdWlkLAogCQlrZ2lkX3QgZ2lkLCBjb25zdCB2b2lkICpu
cyk7CiBpbnQgc3lzZnNfYWRkX2Jpbl9maWxlX21vZGVfbnMoc3RydWN0IGtlcm5mc19ub2RlICpw
YXJlbnQsCi0JCWNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICpiYXR0ciwgdW1vZGVfdCBtb2Rl
LAorCQljb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYmF0dHIsIHVtb2RlX3QgbW9kZSwgc2l6
ZV90IHNpemUsCiAJCWt1aWRfdCB1aWQsIGtnaWRfdCBnaWQsIGNvbnN0IHZvaWQgKm5zKTsKIAog
LyoKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
