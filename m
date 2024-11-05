Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169FBD31765
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2024 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HtTVQoVirvYE3AG8KA8KwTsWshFgVt27yln3EdaMtD0=; b=Nd8IODLCOyIBDZ
	XMOfym8S3p3RO/MXfwXqNd1Ns4HHH9KbaZx0RtIsXI58NRZKZhAJvDfKMAcIcLiBgB1d+E5Owu8xy
	/UQGj344MSz6O3kwAUutPpYdI5yvJ2rE1ekgXa1dzoLTwPYX0cZ9S8N1uRsjcjLXU6PPPV01W8olP
	THgxoXSKxx13ywo5cFWVGpc37tXvxvT8H18gq2LTKKKWueW437JK5qJY0vZCmonYRy/O1sooas3Qu
	BKFm894quaWL1NKrwYA+yQm4w9+f8LfIte8urXApEqjHt6+9pj8qCBl3Nmk81TGDx68h94IaovXX9
	5ZhHsK4Vj4kjKImplj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mqx-000000007r4-3r2x;
	Tue, 05 Nov 2024 16:56:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MDg-000000000fa-2o4q
	for linux-mtd@lists.infradead.org;
	Tue, 05 Nov 2024 16:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 461B35C5537;
	Tue,  5 Nov 2024 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D505C4CECF;
	Tue,  5 Nov 2024 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823351;
	bh=I7deoQiI/I0s0AnBYc3st405nHQMaQq7EvD2UtzD7R0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sWLIMHKbpYnvH6vRYHC5fNsdXCCNIXg5Ll5/2V0vc6iO6jH8ObMQ4Be/2WJlSRkFO
	 96/qxRGVh6YcfDqHdyjqlzEV4fxUjiBENL+duJ1uiL+Rqhoa3pZpaqTPPM+IhiqIFZ
	 1Sk/o475+agOHv0qmgOhR36E0RtNgKxTuBr1ZJhfrXdvCOWlPgobXmSzUv+OFDnq3o
	 nfjm0YQ6eFyuk0wALiKZYhYt2TgA8p2WUZTSSBteEaJwAKQSjXx+/iCrS96AAI40Ua
	 e4I7EQ0gtyiErnCjgLdP+OJ0QkEAmXj83mHJYpDx6YeObr9yAZURKrOoBK0wWz3FbB
	 ACYyypzEASVoA==
Date: Tue, 5 Nov 2024 10:15:50 -0600
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
Subject: Re: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Message-ID: <20241105161550.GA1474637@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081552_820588_A24626E9 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBOb3YgMDMsIDIwMjQgYXQgMDU6MDM6MjlQTSArMDAwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gc3RydWN0IGJpbl9hdHRyaWJ1dGUgY29udGFpbnMgYSBidW5jaCBvZiBwb2lu
dGVyIG1lbWJlcnMsIHdoaWNoIHdoZW4KPiBvdmVyd3JpdHRlbiBieSBhY2NpZGVudCBvciBtYWxp
Y2UgY2FuIGxlYWQgdG8gc3lzdGVtIGluc3RhYmlsaXR5IGFuZAo+IHNlY3VyaXR5IHByb2JsZW1z
Lgo+IE1vdmluZyB0aGUgZGVmaW5pdGlvbnMgb2Ygc3RydWN0IGJpbl9hdHRyaWJ1dGUgdG8gcmVh
ZC1vbmx5IG1lbW9yeQo+IG1ha2VzIHRoZXNlIG1vZGlmaWNhdGlvbnMgaW1wb3NzaWJsZS4KPiBU
aGUgc2FtZSBjaGFuZ2UgaGFzIGJlZW4gcGVyZm9ybWVkIGZvciBtYW55IG90aGVyIHN0cnVjdHVy
ZXMgaW4gdGhlCj4gcGFzdC4gKHN0cnVjdCBjbGFzcywgc3RydWN0IGN0bF90YWJsZS4uLikKClRo
cm91Z2hvdXQgc2VyaWVzLCBpdCB3b3VsZCBiZSBtb3JlIHJlYWRhYmxlIGlmIHlvdSBhZGRlZCBi
bGFuayBsaW5lcwpiZXR3ZWVuIHBhcmFncmFwaHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
