Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2C3D5D674
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 18:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oUk14LFimkT+cA5R5UvYp1aKFExIgaT1QHh09Q7QLPo=; b=lKNGttN/doqXYN
	b9CgBY6yO+U2Q1ylWbQF6T7lnIkVqE6ZtvjtK93C4UwnlD57M8ebpMnQ23ClB1/oYuFaxHs9Rui4u
	fz9sVBHVUwePb75uaneIyjmfLfLh7kxfR0I6GIZ7O1IY+XsV1AlQJJzrZA2ePHnr+bqr/lWEogChI
	ls6Lo4jmtEM7kkAiqUxx0Ycx0B97CoNrBra19ium8BUyleCSBdFlCinVWVKktbRkADZ+yjY5SGcqw
	+opUzXGBXoh6SbtJisnXx1qQT0GrBiENAoW6p5iAgUu8PUjDcCqZEQfRL8pAPzQnrbGlS2MkmZfpt
	lVbtbLh5UNLTXNJ2PVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96pB-00000007t0c-26D6;
	Thu, 07 Nov 2024 18:01:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Lj-00000007dbr-2KxB
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 16:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2BFAA41F1A;
	Thu,  7 Nov 2024 16:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3AFC4CECC;
	Thu,  7 Nov 2024 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730996829;
	bh=RaF/yzDkwC/xI3JHS3wDYezLNgto4gJR15z4QCLcIec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sgq9DuN999fo+gF31O1Sog3B6QwMV6OvcPe7VPqi8sJ1TCzU/W1Ez/tliuLSn6HZv
	 H6WJr617Z9ho3vOtVhPzMb0TyqS+gb2SI7mq/C0wytQj+BYrK8SHegywRApVWEjefm
	 VrP+Uq41/kYqyiwmALEKXPYG2sF+9dXoP558MEULT3X9CJ2qlfOgYo5XQQ/akQ/Li+
	 8PC//m2NPppcQqPE5AwaE9VZUm8GEStHJrNdsbBXQj3zX2/Uw70Eqzdl18ZXk0ykpu
	 Nv3hNeVLx2kThS8Iy5jvLz2TwdYaK/p8look0JzKdaIO94mqldL4oshBd2UJ53q8QV
	 LBGXXQk7Ujmww==
Date: Thu, 7 Nov 2024 10:27:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	"David E. Box" <david.e.box@linux.intel.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 03/10] PCI/sysfs: Calculate bin_attribute size through
 bin_size()
Message-ID: <20241107162707.GA1618544@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-3-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_082712_055727_A88DF882 
X-CRM114-Status: GOOD (  20.34  )
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

T24gU3VuLCBOb3YgMDMsIDIwMjQgYXQgMDU6MDM6MzJQTSArMDAwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gU3RvcCBhYnVzaW5nIHRoZSBpc19iaW5fdmlzaWJsZSgpIGNhbGxiYWNrIHRv
IGNhbGN1bGF0ZSB0aGUgYXR0cmlidXRlCj4gc2l6ZS4gSW5zdGVhZCB1c2UgdGhlIG5ldywgZGVk
aWNhdGVkIGJpbl9zaXplKCkgb25lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KCkFja2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVs
Z2Fhc0Bnb29nbGUuY29tPgoKVGhhbmtzIGZvciBkb2luZyB0aGlzIQoKPiAtLS0KPiAgZHJpdmVy
cy9wY2kvcGNpLXN5c2ZzLmMgfCAyOCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvcGNpLXN5c2ZzLmMgYi9kcml2ZXJzL3BjaS9wY2ktc3lzZnMu
Ywo+IGluZGV4IDVkMGY0ZGIxY2FiNzg2NzRjNWU1OTA2ZjMyMWJmN2E1N2I3NDI5ODMuLjA0MGYw
MWIyYjk5OTE3NWU4ZDk4YjA1ODUxZWRjMDc4YmJhYmJlMGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9wY2kvcGNpLXN5c2ZzLmMKPiArKysgYi9kcml2ZXJzL3BjaS9wY2ktc3lzZnMuYwo+IEBAIC04
MTgsMjEgKzgxOCwyMCBAQCBzdGF0aWMgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKnBjaV9kZXZfY29u
ZmlnX2F0dHJzW10gPSB7Cj4gIAlOVUxMLAo+ICB9Owo+ICAKPiAtc3RhdGljIHVtb2RlX3QgcGNp
X2Rldl9jb25maWdfYXR0cl9pc192aXNpYmxlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAo+IC0JCQkJ
CSAgICAgIHN0cnVjdCBiaW5fYXR0cmlidXRlICphLCBpbnQgbikKPiArc3RhdGljIHNpemVfdCBw
Y2lfZGV2X2NvbmZpZ19hdHRyX2Jpbl9zaXplKHN0cnVjdCBrb2JqZWN0ICprb2JqLAo+ICsJCQkJ
CSAgIGNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICphLAo+ICsJCQkJCSAgIGludCBuKQo+ICB7
Cj4gIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoa29ial90b19kZXYoa29iaikp
Owo+ICAKPiAtCWEtPnNpemUgPSBQQ0lfQ0ZHX1NQQUNFX1NJWkU7Cj4gIAlpZiAocGRldi0+Y2Zn
X3NpemUgPiBQQ0lfQ0ZHX1NQQUNFX1NJWkUpCj4gLQkJYS0+c2l6ZSA9IFBDSV9DRkdfU1BBQ0Vf
RVhQX1NJWkU7Cj4gLQo+IC0JcmV0dXJuIGEtPmF0dHIubW9kZTsKPiArCQlyZXR1cm4gUENJX0NG
R19TUEFDRV9FWFBfU0laRTsKPiArCXJldHVybiBQQ0lfQ0ZHX1NQQUNFX1NJWkU7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIHBjaV9kZXZfY29uZmlnX2F0
dHJfZ3JvdXAgPSB7Cj4gIAkuYmluX2F0dHJzID0gcGNpX2Rldl9jb25maWdfYXR0cnMsCj4gLQku
aXNfYmluX3Zpc2libGUgPSBwY2lfZGV2X2NvbmZpZ19hdHRyX2lzX3Zpc2libGUsCj4gKwkuYmlu
X3NpemUgPSBwY2lfZGV2X2NvbmZpZ19hdHRyX2Jpbl9zaXplLAo+ICB9Owo+ICAKPiAgLyoKPiBA
QCAtMTMzMCwyMSArMTMyOSwyNiBAQCBzdGF0aWMgdW1vZGVfdCBwY2lfZGV2X3JvbV9hdHRyX2lz
X3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtvYmosCj4gIAkJCQkJICAgc3RydWN0IGJpbl9hdHRy
aWJ1dGUgKmEsIGludCBuKQo+ICB7Cj4gIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9k
ZXYoa29ial90b19kZXYoa29iaikpOwo+IC0Jc2l6ZV90IHJvbV9zaXplOwo+ICAKPiAgCS8qIElm
IHRoZSBkZXZpY2UgaGFzIGEgUk9NLCB0cnkgdG8gZXhwb3NlIGl0IGluIHN5c2ZzLiAqLwo+IC0J
cm9tX3NpemUgPSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIFBDSV9ST01fUkVTT1VSQ0UpOwo+IC0J
aWYgKCFyb21fc2l6ZSkKPiArCWlmICghcGNpX3Jlc291cmNlX2VuZChwZGV2LCBQQ0lfUk9NX1JF
U09VUkNFKSkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gLQlhLT5zaXplID0gcm9tX3NpemU7Cj4gLQo+
ICAJcmV0dXJuIGEtPmF0dHIubW9kZTsKPiAgfQo+ICAKPiArc3RhdGljIHNpemVfdCBwY2lfZGV2
X3JvbV9hdHRyX2Jpbl9zaXplKHN0cnVjdCBrb2JqZWN0ICprb2JqLAo+ICsJCQkJCWNvbnN0IHN0
cnVjdCBiaW5fYXR0cmlidXRlICphLCBpbnQgbikKPiArewo+ICsJc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSB0b19wY2lfZGV2KGtvYmpfdG9fZGV2KGtvYmopKTsKPiArCj4gKwlyZXR1cm4gcGNpX3Jl
c291cmNlX2xlbihwZGV2LCBQQ0lfUk9NX1JFU09VUkNFKTsKPiArfQo+ICsKPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgcGNpX2Rldl9yb21fYXR0cl9ncm91cCA9IHsKPiAg
CS5iaW5fYXR0cnMgPSBwY2lfZGV2X3JvbV9hdHRycywKPiAgCS5pc19iaW5fdmlzaWJsZSA9IHBj
aV9kZXZfcm9tX2F0dHJfaXNfdmlzaWJsZSwKPiArCS5iaW5fc2l6ZSA9IHBjaV9kZXZfcm9tX2F0
dHJfYmluX3NpemUsCj4gIH07Cj4gIAo+ICBzdGF0aWMgc3NpemVfdCByZXNldF9zdG9yZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+IAo+IC0tIAo+
IDIuNDcuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
