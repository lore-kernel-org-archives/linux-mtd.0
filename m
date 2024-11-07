Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB58D5D66F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6YjJXTFn1IdVKEcZEbHxWxHro2DkVJ6fusd/9tSeUc=; b=bOWXTjY6Me43V6
	ZDoOz86UymHiQFgKNvcFVPZ6TvyCQa2N05HC4M2MaIxTvZMCoPhv+4YofGmDodYJrjZgs4vyKwowr
	cLjbC8lNI86Bnil69bImb9EDEV2FdUbc2KfENv0fswHoEwwRQ1AurQVRbtsnEo9KgbG7Eq4AXfHbn
	Sa5FgUGhTcjFMN+EI+FBXrowzVvTTS7rdjJLNF+iejyqXjKCT7kXcLM8aaMoORuOsW3HGJTuA1lJw
	ffawVUTNxJZlzUhMVdX5gW1ABUdmiPIx67wZ8VAU2jJ+ofRrKwbOJOd2hN0v1jMkSukD8eMHMv/T4
	LXIRcpPkdezpyCRKOU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96F0-00000007o4y-1yI6;
	Thu, 07 Nov 2024 17:24:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96Bb-00000007nOu-466o
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 17:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76D2F5C0C36;
	Thu,  7 Nov 2024 17:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DA9C4CECC;
	Thu,  7 Nov 2024 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731000045;
	bh=cADn4ARQkTOhflqlIHhNxtca9L54H5LHvOrTgQwQP8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uirXLcMy1Qn//p7lSBnbOlzSbCL5aIT0TqEnGpIZm6Rx23BQJKj1JIwJAP4R6CQ3Y
	 BGW5ysKmLw5HxKe9TW2Kb0/MrhrtH+FEMuRdl+3jaHMQQkHCavjZQ9xWr31Ghy5ARf
	 J2TiGOLT8c6IMr+E/gnELx0660oj7VCoNS9utcB0Gb41g2oymp/+1G/7KVgOzIPwxq
	 q5/0lzC969ZrJFg9aKvlY1ckSKQVQp4pt0o8irIOJAq56q9MDR85uEDv3iCGEqltvk
	 QeOfANjQFk8pt3o4hyDqn3DINTzEn9s+ZnpBLM2/xaYcEN2lpP63yM+3MX3zh3CiMr
	 Amp7lQpjSOJ2g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>,  Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,  Davidlohr Bueso
 <dave@stgolabs.net>,  Jonathan Cameron <jonathan.cameron@huawei.com>,
  Dave Jiang <dave.jiang@intel.com>,  Alison Schofield
 <alison.schofield@intel.com>,  Vishal Verma <vishal.l.verma@intel.com>,
  Ira Weiny <ira.weiny@intel.com>,  Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  Xinhui Pan <Xinhui.Pan@amd.com>,  David Airlie <airlied@gmail.com>,
  Simona Vetter <simona@ffwll.ch>,  Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Leon Romanovsky <leon@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Naveen Krishna Chatradhi
 <naveenkrishna.chatradhi@amd.com>,  Carlos Bilbao
 <carlos.bilbao.osdev@gmail.com>,  Hans de Goede <hdegoede@redhat.com>,
  Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,  "David E.
 Box"
 <david.e.box@linux.intel.com>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Matt Turner <mattst88@gmail.com>,
  Frederic Barrat <fbarrat@linux.ibm.com>,  Andrew Donnellan
 <ajd@linux.ibm.com>,  Arnd Bergmann <arnd@arndb.de>,  Logan Gunthorpe
 <logang@deltatee.com>,  "K. Y. Srinivasan" <kys@microsoft.com>,  Haiyang
 Zhang <haiyangz@microsoft.com>,  Wei Liu <wei.liu@kernel.org>,  Dexuan Cui
 <decui@microsoft.com>,  Dan Williams <dan.j.williams@intel.com>,
  linux-kernel@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-cxl@vger.kernel.org,  amd-gfx@lists.freedesktop.org,
  dri-devel@lists.freedesktop.org,  linux-rdma@vger.kernel.org,
  linux-mtd@lists.infradead.org,  platform-driver-x86@vger.kernel.org,
  linux-scsi@vger.kernel.org,  linux-usb@vger.kernel.org,
  linux-alpha@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback
 of bin_is_visible()
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Sun, 03 Nov 2024
 17:03:34 +0000")
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
	<20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
Date: Thu, 07 Nov 2024 17:20:37 +0000
Message-ID: <mafs08qtv7yfu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_092048_211718_9E510080 
X-CRM114-Status: GOOD (  13.56  )
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

T24gU3VuLCBOb3YgMDMgMjAyNCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cgo+IFRoZSBpc19i
aW5fdmlzaWJsZSgpIGNhbGxiYWNrcyBzaG91bGQgbm90IG1vZGlmeSB0aGUgc3RydWN0Cj4gYmlu
X2F0dHJpYnV0ZSBwYXNzZWQgYXMgYXJndW1lbnQuCj4gRW5mb3JjZSB0aGlzIGJ5IG1hcmtpbmcg
dGhlIGFyZ3VtZW50IGFzIGNvbnN0Lgo+Cj4gQXMgdGhlcmUgYXJlIG5vdCBtYW55IGNhbGxiYWNr
IGltcGxlbWVudGVycyBwZXJmb3JtIHRoaXMgY2hhbmdlCj4gdGhyb3VnaG91dCB0aGUgdHJlZSBh
dCBvbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNz
c2NodWgubmV0Pgo+IC0tLQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3N5c2Zz
LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3N5c2ZzLmMKPiBpbmRleCA5NjA2NGU0YmFiZjAxZjY5
NTBjODE1ODY3NjQzODZlNzY3MWNiZjk3Li41ZTllYjI2ODA3M2QxOGUwYTQ2MDg5MDAwZjE4YTMy
MDBiNGJmMTNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMuYwo+IEBAIC04Nyw3ICs4Nyw3IEBAIHN0YXRp
YyB1bW9kZV90IHNwaV9ub3Jfc3lzZnNfaXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwK
PiAgfQo+ICAKPiAgc3RhdGljIHVtb2RlX3Qgc3BpX25vcl9zeXNmc19pc19iaW5fdmlzaWJsZShz
dHJ1Y3Qga29iamVjdCAqa29iaiwKPiAtCQkJCQkgICAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmF0
dHIsIGludCBuKQo+ICsJCQkJCSAgICBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYXR0ciwg
aW50IG4pCgpBY2tlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+ICMg
Zm9yIHNwaS1ub3IKCj4gIHsKPiAgCXN0cnVjdCBzcGlfZGV2aWNlICpzcGkgPSB0b19zcGlfZGV2
aWNlKGtvYmpfdG9fZGV2KGtvYmopKTsKPiAgCXN0cnVjdCBzcGlfbWVtICpzcGltZW0gPSBzcGlf
Z2V0X2RydmRhdGEoc3BpKTsKCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRhdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
