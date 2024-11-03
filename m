Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410E1D1118A
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5tGl3wROsXsXFjNrC7R2WfFmB5lzpcVnMKAfjXZfy3M=; b=QLopLWAyxbB5Rm
	xWikPfBsf4BDJxO3LhWBPDPCmxPKjQ56174W0yhe0tgk8c4pAM8FNBpgIl/2SckyDKoHGfgpWtg7l
	9AhsUhCzo9BTM7d1pykZs49DjHJ1nVMB9XHli13YngRuQOWtFM9I8f857kGwDaQaFa4yZd7egllGK
	YsGSrZHGQ0635v8bwc4M9Tn62ru5L19ulmLRkfEzDty9/3e/WM36uLOl2PWkjyA028uwTs+GEoqFB
	hCiPKc8gRgYLO7izN/2+teiCfCKX4iHs2YsmUrEjZ4CJRUvd5Bw6jMt7VzDkpx4Aq56L4Z7dG0xFS
	ABVYuspJYEjjTeLNOcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1v-0000000BkeZ-0au0;
	Sun, 03 Nov 2024 17:04:47 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1p-0000000BkYz-1nqU
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653478;
	bh=vLmXHFQrVeANwVFZr7GPEQiJDwV80UwagiHdL+WieYg=;
	h=From:Subject:Date:To:Cc:From;
	b=LVkLlDoyAjxSEKNfss+XSXyWYJJQzcZv2JQqsJCbi9rUIOTJ4RL7OxwixFQenCjjd
	 rlVUh9qqiGz1yV+aWCGMfosXXIgbUe7lyF1Ond/E8etyVdz8oI4rmOCryfvOvF9wdn
	 hyWkvUc8pYcWGzPC5QJ3hJWaxe+zEoDAAboNa6yg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Date: Sun, 03 Nov 2024 17:03:29 +0000
Message-Id: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOGsJ2cC/22NQQ6CMBBFr2JmbU1bQasr72GIKTC1synaKSgh3
 N2KJm5cvp/89yZgjIQMx9UEEQdi6kIGvV5B4224oqA2M2ipCyW1ETyyY9F0gZOoKVxsSlFYKc1
 hVxjVyhry9RbR0XPRnqsPR7z32Z5+oydOXRyX9KDe67eyVf8rgxJSaG2UdXbvZFmeHkjM3Pjeb
 wImqOZ5fgH1E5+t0gAAAA==
X-Change-ID: 20241028-sysfs-const-bin_attr-a00896481d0b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=3861;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vLmXHFQrVeANwVFZr7GPEQiJDwV80UwagiHdL+WieYg=;
 b=Bvbt1J2LqQ69JnMU1VrxxAk0oh5wwQXMdeGiNk0LKpzFZww+HQ7ZSL0xtSH7vjejf+nvXyav9
 7mYQXMoReN6DBjpqywBjK9Kq5FxOhy2hVOb+j2ENGg6yuLHGvmQRl99
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090441_669866_A4578A0F 
X-CRM114-Status: GOOD (  10.11  )
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

c3RydWN0IGJpbl9hdHRyaWJ1dGUgY29udGFpbnMgYSBidW5jaCBvZiBwb2ludGVyIG1lbWJlcnMs
IHdoaWNoIHdoZW4Kb3ZlcndyaXR0ZW4gYnkgYWNjaWRlbnQgb3IgbWFsaWNlIGNhbiBsZWFkIHRv
IHN5c3RlbSBpbnN0YWJpbGl0eSBhbmQKc2VjdXJpdHkgcHJvYmxlbXMuCk1vdmluZyB0aGUgZGVm
aW5pdGlvbnMgb2Ygc3RydWN0IGJpbl9hdHRyaWJ1dGUgdG8gcmVhZC1vbmx5IG1lbW9yeQptYWtl
cyB0aGVzZSBtb2RpZmljYXRpb25zIGltcG9zc2libGUuClRoZSBzYW1lIGNoYW5nZSBoYXMgYmVl
biBwZXJmb3JtZWQgZm9yIG1hbnkgb3RoZXIgc3RydWN0dXJlcyBpbiB0aGUKcGFzdC4gKHN0cnVj
dCBjbGFzcywgc3RydWN0IGN0bF90YWJsZS4uLikKCkZvciB0aGUgc3RydWN0dXJlIGRlZmluaXRp
b25zIHRocm91Z2hvdXQgdGhlIGNvcmUgdG8gYmUgbW92ZWQgdG8KcmVhZC1vbmx5IG1lbW9yeSB0
aGUgZm9sbG93aW5nIHN0ZXBzIGFyZSBuZWNlc3NhcnkuCgoxKSBDaGFuZ2UgYWxsIGNhbGxiYWNr
cyBpbnZva2VkIGZyb20gdGhlIHN5c2ZzIGNvcmUgdG8gb25seSBwYXNzIGNvbnN0CiAgIHBvaW50
ZXJzCjIpIEFkYXB0IHRoZSBzeXNmcyBjb3JlIHRvIG9ubHkgd29yayBpbiB0ZXJtcyBvZiBjb25z
dCBwb2ludGVycwozKSBBZGFwdCB0aGUgc3lzZnMgY29yZSBBUElzIHRvIGFsbG93IGNvbnN0IHBv
aW50ZXJzCjQpIENoYW5nZSBhbGwgc3RydWN0dXJlIGRlZmluaXRpb25zIHRocm91Z2ggdGhlIGNv
cmUgdG8gY29uc3QKClRoaXMgc2VyaWVzIHByb3ZpZGVzIHRoZSBmb3VuZGF0aW9uIGZvciBzdGVw
IDEpIGFib3ZlLgpJdCBjb252ZXJ0cyBzb21lIGNhbGxiYWNrcyBpbiBhIHNpbmdsZSBzdGVwIHRv
IGNvbnN0IGFuZCBwcm92aWRlcyBhCmZvdW5kYXRpb24gZm9yIHRob3NlIGNhbGxiYWNrcyB3aGVy
ZSBhIHNpbmdsZSBzdGVwIGlzIG5vdCBwb3NzaWJsZS4KClBhdGNoZXMgMS01IGNoYW5nZSB0aGUg
YmluX2F0dHJpYnV0ZSBjYWxsYmFja3Mgb2YgJ3N0cnVjdAphdHRyaWJ1dGVfZ3JvdXAnLiBUaGUg
cmVtYWluaW5nIG9uZXMgdG91Y2ggJ3N0cnVjdCBiaW5fYXR0cmlidXRlJyBpdHNlbGYuCgpUaGUg
dGVjaG5pcXVlcyBlbXBsb3llZCBieSB0aGlzIHNlcmllcyBjYW4gbGF0ZXIgYmUgcmV1c2VkIGZv
ciB0aGUKc2FtZSBjaGFuZ2UgZm9yIG90aGVyIHN5c2ZzIGF0dHJpYnV0ZXMuCgpUaGlzIHNlcmll
cyBpcyBpbnRlbmRlZCB0byBiZSBtZXJnZWQgdGhyb3VnaCB0aGUgZHJpdmVyIGNvcmUgdHJlZS4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4K
LS0tCkNoYW5nZXMgaW4gdjI6Ci0gRHJvcCBSRkMgc3RhdGUKLSBSZWZ1c2UgcmVnaXN0cmF0aW9u
IG9mIGF0dHJpYnV0ZXMgd2l0aCBib3RoIHJlYWQvcmVhZF9uZXcgb3IKICB3cml0ZS93cml0ZV9u
ZXcKLSBSZW1vdmUgZG9uJ3QgZHJvcCBsbHNlZWsoKSBjYWxsYmFjaywgYXMgaXQgaXMgYWN0dWFs
bHkgdXNlZC4KICBJbnN0ZWFkIGFsc28gbWlncmF0ZSBpdCB0byAiY29uc3QiLgotIF9HZW5lcmlj
IG1hY2hpbmVyeTogU2ltcGxpZnkgYW5kIG1ha2UgbW9yZSByb2J1c3QgYWdhaW5zdCBtaXN1c2UK
LSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMDMxLXN5c2ZzLWNv
bnN0LWJpbl9hdHRyLXYxLTAtMjI4MWFmYTdmMDU1QHdlaXNzc2NodWgubmV0CgotLS0KVGhvbWFz
IFdlacOfc2NodWggKDEwKToKICAgICAgc3lzZnM6IGV4cGxpY2l0bHkgcGFzcyBzaXplIHRvIHN5
c2ZzX2FkZF9iaW5fZmlsZV9tb2RlX25zKCkKICAgICAgc3lzZnM6IGludHJvZHVjZSBjYWxsYmFj
ayBhdHRyaWJ1dGVfZ3JvdXA6OmJpbl9zaXplCiAgICAgIFBDSS9zeXNmczogQ2FsY3VsYXRlIGJp
bl9hdHRyaWJ1dGUgc2l6ZSB0aHJvdWdoIGJpbl9zaXplKCkKICAgICAgbnZtZW06IGNvcmU6IGNh
bGN1bGF0ZSBiaW5fYXR0cmlidXRlIHNpemUgdGhyb3VnaCBiaW5fc2l6ZSgpCiAgICAgIHN5c2Zz
OiB0cmVld2lkZTogY29uc3RpZnkgYXR0cmlidXRlIGNhbGxiYWNrIG9mIGJpbl9pc192aXNpYmxl
KCkKICAgICAgc3lzZnM6IHRyZWV3aWRlOiBjb25zdGlmeSBhdHRyaWJ1dGUgY2FsbGJhY2sgb2Yg
YmluX2F0dHJpYnV0ZTo6bW1hcCgpCiAgICAgIHN5c2ZzOiB0cmVld2lkZTogY29uc3RpZnkgYXR0
cmlidXRlIGNhbGxiYWNrIG9mIGJpbl9hdHRyaWJ1dGU6Omxsc2VlaygpCiAgICAgIHN5c2ZzOiBp
bXBsZW1lbnQgYWxsIEJJTl9BVFRSXyogbWFjcm9zIGluIHRlcm1zIG9mIF9fQklOX0FUVFIoKQog
ICAgICBzeXNmczogYmluX2F0dHJpYnV0ZTogYWRkIGNvbnN0IHJlYWQvd3JpdGUgY2FsbGJhY2sg
dmFyaWFudHMKICAgICAgZHJpdmVyIGNvcmU6IENvbnN0aWZ5IGF0dHJpYnV0ZSBhcmd1bWVudHMg
b2YgYmluYXJ5IGF0dHJpYnV0ZXMKCiBhcmNoL2FscGhhL2tlcm5lbC9wY2ktc3lzZnMuYyAgICAg
ICAgICAgfCAgNiArLS0KIGRyaXZlcnMvYmFzZS9ub2RlLmMgICAgICAgICAgICAgICAgICAgICB8
ICA0ICstCiBkcml2ZXJzL2Jhc2UvdG9wb2xvZ3kuYyAgICAgICAgICAgICAgICAgfCAgNCArLQog
ZHJpdmVycy9jeGwvcG9ydC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8ICAyICstCiBkcml2ZXJzL2luZmluaWJh
bmQvaHcvcWliL3FpYl9zeXNmcy5jICAgfCAgMiArLQogZHJpdmVycy9taXNjL29jeGwvc3lzZnMu
YyAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMuYyAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAg
fCAxNiArKysrLS0KIGRyaXZlcnMvcGNpL3AycGRtYS5jICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL3BjaS9wY2ktc3lzZnMuYyAgICAgICAgICAgICAgICAgfCA0MiArKysrKysr
Ky0tLS0tLS0KIGRyaXZlcnMvcGNpL3ZwZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvaHNtcC5jICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMgIHwgIDIgKy0KIGRyaXZlcnMvcGxhdGZv
cm0veDg2L2ludGVsL3Nkc2kuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL3Njc2kvc2NzaV9zeXNm
cy5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy91aW8vdWlvX2h2X2dlbmVyaWMuYyAg
ICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvdXNiL2NvcmUvc3lzZnMuYyAgICAgICAgICAgICAg
ICB8ICAyICstCiBmcy9zeXNmcy9maWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAzMCAr
KysrKysrLS0tLQogZnMvc3lzZnMvZ3JvdXAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUg
Ky0KIGZzL3N5c2ZzL3N5c2ZzLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBpbmNs
dWRlL2xpbnV4L3N5c2ZzLmggICAgICAgICAgICAgICAgICAgfCA5NCArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0KIDIyIGZpbGVzIGNoYW5nZWQsIDEzOCBpbnNlcnRpb25zKCspLCA5
MSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAzZTVlNmM5OTAwYzNkNzE4OTVlOGJkZWFj
ZmI1Nzk0NjJlOThlYmExCmNoYW5nZS1pZDogMjAyNDEwMjgtc3lzZnMtY29uc3QtYmluX2F0dHIt
YTAwODk2NDgxZDBiCgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhA
d2Vpc3NzY2h1aC5uZXQ+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
