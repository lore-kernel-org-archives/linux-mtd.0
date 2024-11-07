Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8341BD5AE60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 05:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gC8j6I7tWi729zdjZK6ew56VO1aNxwOThkri9WRfqec=; b=CaTfldFUsh3m8G
	5KcQXEZ88BEGVC5PbgcO3cjGHI5gbreeGORxMAPeB+bQyRbYijuV17RJ3FlBWLdgUgvTU7ipIcivi
	60z3BanmIU2yvuDodXG98ZRP6jzdSoW8sWAGMmYrAEI5ODZPLV/doKBj/W2tNwm/SMkFRGUy7YnfJ
	GRgPXtOHDKTxlcJ55rzINJu8qMjsenFb5Dni+11X3h0ucBditdUM/pi+JKQXEmnwmwtLP5oJpYlWK
	jGXAO7BpLbtMtQJXIKDMT/YRVcrYhuk1B86suBXFdvGiVTkQUIIZRemqGc7kqPi/v/gWUCaud2TRi
	UAjVH4rRZQuTqIDhGnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uxR-00000005hQy-1pAa;
	Thu, 07 Nov 2024 05:21:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uxO-00000005hQV-3nxe
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 05:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE2BCA4218F;
	Thu,  7 Nov 2024 05:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064BBC4CECC;
	Thu,  7 Nov 2024 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730956880;
	bh=LcTJNuAS+0u64bln2s0a89deCwW+g5Nrojs1Slddt/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqZ6urMldxlvEBhdUM/g9ay6JBw8MxGPCgUReHarZ5Rrrup6qtaAMbkDd8Ut3yIvJ
	 TB3aWEUF8ij6xyiKo01mFPXSemUmYSpWT2Gfca8HAeh7vk2NMp5wXiqsR3jTvujmXl
	 Vml1yQf1y5lU0zvuowqmi415BENx3kOsFR8a5uB8=
Date: Thu, 7 Nov 2024 06:21:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
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
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Message-ID: <2024110726-hasty-obsolete-3780@gregkh>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
 <20241106200513.GB174958@rocinante>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106200513.GB174958@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_212123_094295_FCE2A680 
X-CRM114-Status: GOOD (  19.71  )
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

T24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDU6MDU6MTNBTSArMDkwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IEhlbGxvLAo+IAo+ID4gU2V2ZXJhbCBkcml2ZXJzIG5lZWQgdG8gZHlu
YW1pY2FsbHkgY2FsY3VsYXRlIHRoZSBzaXplIG9mIGFuIGJpbmFyeQo+ID4gYXR0cmlidXRlLiBD
dXJyZW50bHkgdGhpcyBpcyBkb25lIGJ5IGFzc2lnbmluZyBhdHRyLT5zaXplIGZyb20gdGhlCj4g
PiBpc19iaW5fdmlzaWJsZSgpIGNhbGxiYWNrLgo+ID4gCj4gPiBUaGlzIGhhcyBkcmF3YmFja3M6
Cj4gPiAqIEl0IGlzIG5vdCBkb2N1bWVudGVkLgo+ID4gKiBBIHNpbmdsZSBhdHRyaWJ1dGUgY2Fu
IGJlIGluc3RhbnRpYXRlZCBtdWx0aXBsZSB0aW1lcywgb3ZlcndyaXRpbmcgdGhlCj4gPiAgIHNo
YXJlZCBzaXplIGZpZWxkLgo+ID4gKiBJdCBwcmV2ZW50cyB0aGUgc3RydWN0dXJlIHRvIGJlIG1v
dmVkIHRvIHJlYWQtb25seSBtZW1vcnkuCj4gPiAKPiA+IEludHJvZHVjZSBhIG5ldyBkZWRpY2F0
ZWQgY2FsbGJhY2sgdG8gY2FsY3VsYXRlIHRoZSBzaXplIG9mIHRoZQo+ID4gYXR0cmlidXRlLgo+
IAo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhhdmUgYSBoZWxwZXIgdGhhdCB3aGVuIHJ1biBh
Z2FpbnN0IGEgc3BlY2lmaWMKPiBrb2JqZWN0IHJlZmVyZW5jZSwgdGhlbiBpdCB3b3VsZCByZWZy
ZXNoIG9yIHJlLXJ1biB0aGUgc2l6ZSBjYWxsYmFja3M/Cj4gCj4gV2UgaGF2ZSBhbiB1c2UgY2Fz
ZSB3aGVyZSB3ZSByZXNpemUgQkFScyBvbiBkZW1hbmQgdmlhIHN5c2ZzLCBhbmQgY3VycmVudGx5
Cj4gdGhlIG9ubHkgd2F5IHRvIHVwZGF0ZSB0aGUgc2l6ZSBvZiBlYWNoIHJlc291cmNlIHN5c2Zz
IG9iamVjdCBpcyB0byByZW1vdmUKPiBhbmQgYWRkZWQgdGhlbSBhZ2Fpbiwgd2hpY2ggaXMgYSBi
aXQgY3J1ZGUsIGFuZCBjYW4gYWxzbyBiZSB1bnNhZmUuCgpIb3cgaXMgaXQgdW5zYWZlPwoKPiBI
ZW5jZSB0aGUgcXVlc3Rpb24uCj4gCj4gVGhlcmUgZXhpc3QgdGhlIHN5c2ZzX3VwZGF0ZV9ncm91
cHMoKSwgYnV0IHRoZSBCQVIgcmVzb3VyY2Ugc3lzZnMgb2JqZWN0cwo+IGFyZSBjdXJyZW50bHks
IGF0IGxlYXN0IG5vdCB5ZXQsIGFkZGVkIHRvIGFueSBhdHRyaWJ1dGUgZ3JvdXAuCgp0aGVuIG1h
eWJlIHRoZXkgc2hvdWxkIGJlIGFkZGVkIHRvIG9uZSA6KQoKdGhhbmtzLAoKZ3JlZyBrLWgKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
