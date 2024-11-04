Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12961D132CF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWmRNoykgLf5Zoi+kemb6NR5xAYqYxSuS5sQ4Y9//vI=; b=O+i/341WuI+BE1
	iCQePoHdjp3Imw2227GupriL57yN2YTmXVrCLcvoHS5j06o7bZVscz+NwfEl8Mq6UF1v+DzqajqOm
	EcRd8RUGbMTlLdiOftJD6fmTAdsv17AdTghdmzP6kmU+fU9HMo1Xwsv5l+PBbmg44RBVbhQoyshze
	NHsIBQ/LqY8AFZsF4P4r7JrVBkoYPAJFdCVkIkwZVNlCfcpNMDos86jKdeO889R8xQkLMy7QN/RqA
	/U3XOTicvjbGEUyWbF2WMdzjFx6XZ8M0sarXPoU/dsmfOKLr+2tK8vgBwBj+H1GFKrPihx2TuJlNM
	NLnC7MZ9zjWA9Whwrqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y5F-0000000E38j-3C7Q;
	Mon, 04 Nov 2024 14:29:33 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xVO-0000000DwXQ-3kTf
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 13:52:32 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-84fc9005dccso1252077241.3
        for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2024 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1730728349; x=1731333149; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
        b=JP1c1tJ1xTthqtexIsoCVkgTOOVxzBxdkGDokw+dYXYgcRibhOYZwNxdJndcsarXJ1
         Ugc+PmiCR5SwXQG59coAe469ek4roAW2gM5J5I3kCH3J0BndJKZB5jImU+1zYYVkw78U
         d4kL+AGoWCRqoBg7t5yCg6X/QfpGpw1vXKcPW9j6f4wWSz0duvEPRtUKGgwEuw6GK2SZ
         cqJ3TJdCuR3dE/1pKRUH9KFPojgm/NpcBszb4nE0u/kLvPV8XAUWrwRuZUP43kJWmgY1
         gmMU3k3S4pnbN42G4m8qtldWpPPAo27aAA66NVjIgsJNeImddARHhhD80AtPoSr3zkBp
         3Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728349; x=1731333149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
        b=rRF6Cm9aU4YzJvrpR/pbiCmF5kfS8TTpNzsHfErYZqqvP2R8iTQWDrrmWY3SJ9i9+j
         zNOcsuYuogAVkGqXNmekbXHM9/cNLLCtQ1JX/mzEHzfVzLaRK5xKGcUaqntS0A/+wu1D
         WCjvR6xPPBpnloc7FNC4s7zN61tDulZ/DeZ70SjzPYZ05rjPSWx3MRx68uvJXK2nhS6N
         3GRjQAhMzJwQLeATF6AVgbO8pt/dkWYimPj/ayu79NSmO1OaeZ5yTe+gpujIf7CpzOxI
         WReQcA72yreUCkPU9f+0LaHZbQLv8Ex6aO58EA/MmlWTGL8ifkHDKpx1R627Q/zO3o86
         gmmg==
X-Forwarded-Encrypted: i=1; AJvYcCXEqS8W1Tahi1N/o9PUb62ahfSilX6lnyQyI/RJn3mV1oC1K5TyuNYnXe78s/boA6gsD8YDi0Oghlc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/tVQ+ZJ1S8KehcwJ+ISUvhZVuOaiA8Ek1VEKnxfr0uM+id0oA
	5e4d13Jkeaf8KhLkYj145rYYEcn0omnHPs3TbepkZFxwuS2VSJw2VxNnFzJqwrg=
X-Google-Smtp-Source: AGHT+IFmlPTEulo8PrBSa4hLGepjHWucd1eo0mnO56qT1Ydh9XheeGVoeKHcAHFWhX+avIDDQrBpSQ==
X-Received: by 2002:a05:6102:3753:b0:4a4:8756:d899 with SMTP id ada2fe7eead31-4a9543ece24mr15248394137.29.1730728348895;
        Mon, 04 Nov 2024 05:52:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad0adffesm47192441cf.32.2024.11.04.05.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:52:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t7xVL-00000000hsn-2kgO;
	Mon, 04 Nov 2024 09:52:27 -0400
Date: Mon, 4 Nov 2024 09:52:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
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
	Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback of
 bin_is_visible()
Message-ID: <20241104135227.GE35848@ziepe.ca>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_055230_961582_2A711DCC 
X-CRM114-Status: GOOD (  13.50  )
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

T24gU3VuLCBOb3YgMDMsIDIwMjQgYXQgMDU6MDM6MzRQTSArMDAwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gVGhlIGlzX2Jpbl92aXNpYmxlKCkgY2FsbGJhY2tzIHNob3VsZCBub3QgbW9k
aWZ5IHRoZSBzdHJ1Y3QKPiBiaW5fYXR0cmlidXRlIHBhc3NlZCBhcyBhcmd1bWVudC4KPiBFbmZv
cmNlIHRoaXMgYnkgbWFya2luZyB0aGUgYXJndW1lbnQgYXMgY29uc3QuCj4gCj4gQXMgdGhlcmUg
YXJlIG5vdCBtYW55IGNhbGxiYWNrIGltcGxlbWVudGVycyBwZXJmb3JtIHRoaXMgY2hhbmdlCj4g
dGhyb3VnaG91dCB0aGUgdHJlZSBhdCBvbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPiAtLS0KPiAgZHJpdmVycy9jeGwvcG9y
dC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jIHwgIDIgKy0KPiAgZHJpdmVycy9pbmZpbmliYW5kL2h3L3FpYi9x
aWJfc3lzZnMuYyAgIHwgIDIgKy0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zeXNmcy5jICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9udm1lbS9jb3JlLmMgICAgICAgICAgICAgICAgICAg
IHwgIDMgKystCj4gIGRyaXZlcnMvcGNpL3BjaS1zeXNmcy5jICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIGRyaXZlcnMvcGNpL3ZwZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGRyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9oc21wLmMgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2ludGVsL3Nkc2kuYyAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc2Nz
aS9zY3NpX3N5c2ZzLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdXNiL2NvcmUv
c3lzZnMuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvc3lzZnMuaCAg
ICAgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAx
MiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCkZvciBp
bmZpbmliYW5kOgoKQWNrZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
