Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75379D31765
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2024 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=51LbcU5PrIrH+c58NJDnPTYvDi5UTgWhpFfLKaZnnyw=; b=VXZY6YvbzvtrbV
	jTsPmZuqWYsPVWtMnB3jLcD/sggKgAupOS/qo/Rcthp+vbEWNJJ0azkmpN0GZo3ubk+DcBlkbm0jI
	2qLHp6jZ6XCQ21qXoh9u5mZGtLD3jCI7s/ZqRruTEcTTGXzat866vvOMAyE4OW7OWB5UIgUUIfjEg
	7iZr7bHvarIND4cJZDqIdGupAZ3XT9BHQtKdNEIaAy3zdu73sjctlvmfygzn+mFFZ+xtMf7Yc9ETh
	K9mVUzgKAQziWlwwwbDhjyw8yWqeYUkJZ9OdB2z8fi6LJiMskxqR/LfZemLy1HEBRVGenDKgbWirC
	bjvhsnRDM1377TxuWMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MZf-000000004Qj-3MYx;
	Tue, 05 Nov 2024 16:38:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MAS-0000000HauZ-3Ozt
	for linux-mtd@lists.infradead.org;
	Tue, 05 Nov 2024 16:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6071E5C059B;
	Tue,  5 Nov 2024 16:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8613AC4CECF;
	Tue,  5 Nov 2024 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823151;
	bh=8/GSV8GjyuHHKyHHms4DjtgdqoFellDpxdUEvj3z83A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=efs34y0VYNy9NICKxDgpHWgWNpydYg8Tg/7PuvZuy2HdJlAJM2Wjn9AMK+WfyNfd+
	 7abvMe9SP08cQSEfsedYIjbzbOK2HzqelNIN1eKQJb9dubjDgUeEe44eKLRszA/SBn
	 nb9DNpWDqli9kXtJhYGlrQ+wcOJcWmGk+D6NJdtQ/BluOlyFP/kZ0k6ogG2Z8VfR3e
	 TipHX84n4i9fBO5KBUgA0squnAzLiwW8/u6O0HLF/ocdo7anV/39ecQXgA1ti0hB1Y
	 AZeDZrlMW5tONNXXXOITCRG5wfOpNUwxWenVlcsrkD1ZymopQmBpIRzF50+TKr03+b
	 CkD8zUyzmxghw==
Date: Tue, 5 Nov 2024 10:12:30 -0600
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
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
Message-ID: <20241105161230.GA1473411@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081232_963918_9F6B024C 
X-CRM114-Status: GOOD (  27.91  )
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

T24gU3VuLCBOb3YgMDMsIDIwMjQgYXQgMDU6MDM6MzFQTSArMDAwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gU2V2ZXJhbCBkcml2ZXJzIG5lZWQgdG8gZHluYW1pY2FsbHkgY2FsY3VsYXRl
IHRoZSBzaXplIG9mIGFuIGJpbmFyeQo+IGF0dHJpYnV0ZS4gQ3VycmVudGx5IHRoaXMgaXMgZG9u
ZSBieSBhc3NpZ25pbmcgYXR0ci0+c2l6ZSBmcm9tIHRoZQo+IGlzX2Jpbl92aXNpYmxlKCkgY2Fs
bGJhY2suCgpzL2FuIGJpbmFyeS9hIGJpbmFyeS8KCj4gVGhpcyBoYXMgZHJhd2JhY2tzOgo+ICog
SXQgaXMgbm90IGRvY3VtZW50ZWQuCj4gKiBBIHNpbmdsZSBhdHRyaWJ1dGUgY2FuIGJlIGluc3Rh
bnRpYXRlZCBtdWx0aXBsZSB0aW1lcywgb3ZlcndyaXRpbmcgdGhlCj4gICBzaGFyZWQgc2l6ZSBm
aWVsZC4KPiAqIEl0IHByZXZlbnRzIHRoZSBzdHJ1Y3R1cmUgdG8gYmUgbW92ZWQgdG8gcmVhZC1v
bmx5IG1lbW9yeS4KPiAKPiBJbnRyb2R1Y2UgYSBuZXcgZGVkaWNhdGVkIGNhbGxiYWNrIHRvIGNh
bGN1bGF0ZSB0aGUgc2l6ZSBvZiB0aGUKPiBhdHRyaWJ1dGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0Pgo+IC0tLQo+ICBmcy9zeXNm
cy9ncm91cC5jICAgICAgfCAyICsrCj4gIGluY2x1ZGUvbGludXgvc3lzZnMuaCB8IDggKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2ZzL3N5c2ZzL2dyb3VwLmMgYi9mcy9zeXNmcy9ncm91cC5jCj4gaW5kZXggNDViMmU5Mjk0MWRh
MWY0OWRjYzcxYWYzNzgxMzE3YzYxNDgwYzk1Ni4uOGIwMWE3ZWRhNWZiMzIzOWUxMzgzNzI0MTdk
MDE5NjdjN2EzZjEyMiAxMDA2NDQKPiAtLS0gYS9mcy9zeXNmcy9ncm91cC5jCj4gKysrIGIvZnMv
c3lzZnMvZ3JvdXAuYwo+IEBAIC05OCw2ICs5OCw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2ZpbGVz
KHN0cnVjdCBrZXJuZnNfbm9kZSAqcGFyZW50LCBzdHJ1Y3Qga29iamVjdCAqa29iaiwKPiAgCQkJ
CWlmICghbW9kZSkKPiAgCQkJCQljb250aW51ZTsKPiAgCQkJfQo+ICsJCQlpZiAoZ3JwLT5iaW5f
c2l6ZSkKPiArCQkJCXNpemUgPSBncnAtPmJpbl9zaXplKGtvYmosICpiaW5fYXR0ciwgaSk7Cj4g
IAo+ICAJCQlXQVJOKG1vZGUgJiB+KFNZU0ZTX1BSRUFMTE9DIHwgMDY2NCksCj4gIAkJCSAgICAg
IkF0dHJpYnV0ZSAlczogSW52YWxpZCBwZXJtaXNzaW9ucyAwJW9cbiIsCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc3lzZnMuaCBiL2luY2x1ZGUvbGludXgvc3lzZnMuaAo+IGluZGV4IGM0
ZTY0ZGMxMTIwNjNmN2NiODliZjY2MDU5ZDAzMzg3MTYwODllODcuLjQ3NDZjY2NiOTU4OThiMjRk
ZjZmNTNkZTk0MjFlYTc2NDliNTU2OGYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zeXNm
cy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zeXNmcy5oCj4gQEAgLTg3LDYgKzg3LDExIEBAIGRv
IHsJCQkJCQkJXAo+ICAgKgkJU1lTRlNfR1JPVVBfVklTSUJMRSgpIHdoZW4gYXNzaWduaW5nIHRo
aXMgY2FsbGJhY2sgdG8KPiAgICoJCXNwZWNpZnkgc2VwYXJhdGUgX2dyb3VwX3Zpc2libGUoKSBh
bmQgX2F0dHJfdmlzaWJsZSgpCj4gICAqCQloYW5kbGVycy4KPiArICogQGJpbl9zaXplOgo+ICsg
KgkJT3B0aW9uYWw6IEZ1bmN0aW9uIHRvIHJldHVybiB0aGUgc2l6ZSBvZiBhIGJpbmFyeSBhdHRy
aWJ1dGUKPiArICoJCW9mIHRoZSBncm91cC4gV2lsbCBiZSBjYWxsZWQgcmVwZWF0ZWRseSBmb3Ig
ZWFjaCBiaW5hcnkKPiArICoJCWF0dHJpYnV0ZSBpbiB0aGUgZ3JvdXAuIE92ZXJ3cml0ZXMgdGhl
IHNpemUgZmllbGQgZW1iZWRkZWQKPiArICoJCWluc2lkZSB0aGUgYXR0cmlidXRlIGl0c2VsZi4K
CiJPdmVyd3JpdGVzIiBzdWdnZXN0cyB0aGF0IHdlIHdyaXRlIG92ZXIgdGhlIHNpemUgZmllbGQg
aW4gdGhlIHNpbmdsZQpzaGFyZWQgYXR0cmlidXRlLiAgQnV0IHRoYXQncyBub3Qgd2hhdCBjcmVh
dGVfZmlsZXMoKSBkb2VzLgoKY3JlYXRlX2ZpbGVzKCkgaW5zdGFudGlhdGVzIHN5c2ZzIGZpbGVz
IGZyb20gdGhlIGF0dHJpYnV0ZSB0ZW1wbGF0ZS4KUHJldmlvdXNseSBlYWNoIGluc3RhbmNlIHVz
ZWQgdGhlIHNpemUgZnJvbSB0aGUgc2hhcmVkIGF0dHJpYnV0ZS4KV2l0aCB0aGlzIHBhdGNoLCBp
ZiAtPmJpbl9zaXplKCkgZXhpc3RzLCBpdHMgcmV0dXJuIHZhbHVlIGlzIHRoZSBzaXplCm9mIHRo
aXMgcGFydGljdWxhciBpbnN0YW5jZSwgb3ZlcipyaWRpbmcqIHRoZSBkZWZhdWx0IHNpemUgZnJv
bSB0aGUKc2hhcmVkIGF0dHJpYnV0ZS4KClRoaXMgZGVzY3JpcHRpb24gZm9sbG93cyB0aGUgbGFu
Z3VhZ2Ugb2Ygb3RoZXIgZnVuY3Rpb24gcG9pbnRlcnMsCndoaWNoIHdhcyB0aGUgcmlnaHQgYXBw
cm9hY2guICBCdXQgSSB0aGluayB0aGUgZXhpc3RpbmcgbGFuZ3VhZ2Ugd291bGQKYmUgbW9yZSBo
ZWxwZnVsIGlmIGl0IGNhbGxlZCBvdXQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgYXR0cmli
dXRlCml0c2VsZiAoYSBwb3RlbnRpYWxseSByZWFkLW9ubHkgc2luZ2xldG9uIHN0cnVjdHVyZSBz
aGFyZWQgYnkgYWxsCmtvYmplY3RzIHdpdGggdGhpcyBhdHRyaWJ1dGUpIGFuZCB0aGUgaW5zdGFu
dGlhdGlvbiBvZiB0aGF0IGF0dHJpYnV0ZQpmb3IgZWFjaCBrb2JqZWN0LgoKRm9yIGV4YW1wbGUs
CgogIEBiaW5fc2l6ZToKCSAgICAgIE9wdGlvbmFsOiBGdW5jdGlvbiB0byByZXR1cm4gdGhlIHNp
emUgb2YgdGhpcyBrb2JqZWN0J3MKCSAgICAgIGluc3RhbnRpYXRpb24gb2YgYSBiaW5hcnkgYXR0
cmlidXRlLiAgSWYgcHJlc2VudCwgaXQgaXMKCSAgICAgIGNhbGxlZCBmb3IgZWFjaCBiaW5fYXR0
cmlidXRlIGluIHRoZSBncm91cCBhbmQgb3ZlcnJpZGVzCgkgICAgICB0aGUgZGVmYXVsdCBzaXpl
IGZyb20gdGhlIGJpbl9hdHRyaWJ1dGUgdGVtcGxhdGUuCgpUaGlzIGlzIG5pY2Ugd29yaywgdGhh
bmtzIGZvciBkb2luZyBpdCEKCj4gICAqIEBhdHRyczoJUG9pbnRlciB0byBOVUxMIHRlcm1pbmF0
ZWQgbGlzdCBvZiBhdHRyaWJ1dGVzLgo+ICAgKiBAYmluX2F0dHJzOglQb2ludGVyIHRvIE5VTEwg
dGVybWluYXRlZCBsaXN0IG9mIGJpbmFyeSBhdHRyaWJ1dGVzLgo+ICAgKgkJRWl0aGVyIGF0dHJz
IG9yIGJpbl9hdHRycyBvciBib3RoIG11c3QgYmUgcHJvdmlkZWQuCj4gQEAgLTk3LDYgKzEwMiw5
IEBAIHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgewo+ICAJCQkJCSAgICAgIHN0cnVjdCBhdHRyaWJ1
dGUgKiwgaW50KTsKPiAgCXVtb2RlX3QJCQkoKmlzX2Jpbl92aXNpYmxlKShzdHJ1Y3Qga29iamVj
dCAqLAo+ICAJCQkJCQkgIHN0cnVjdCBiaW5fYXR0cmlidXRlICosIGludCk7Cj4gKwlzaXplX3QJ
CQkoKmJpbl9zaXplKShzdHJ1Y3Qga29iamVjdCAqLAo+ICsJCQkJCSAgICBjb25zdCBzdHJ1Y3Qg
YmluX2F0dHJpYnV0ZSAqLAo+ICsJCQkJCSAgICBpbnQpOwo+ICAJc3RydWN0IGF0dHJpYnV0ZQkq
KmF0dHJzOwo+ICAJc3RydWN0IGJpbl9hdHRyaWJ1dGUJKipiaW5fYXR0cnM7Cj4gIH07Cj4gCj4g
LS0gCj4gMi40Ny4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
