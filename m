Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B142D1118F
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkCF9n+eDCSvqdIHkUV8BF+OBr70x337zeY8j8a88A8=; b=nT6UqBu+n0inrt
	lBBOBerrKXpVH9uLsqUnWqrGsG31WXHsczCM9reGY3WO7LtVVIClLDrxTjzT/Be8fS6EZ2k4RtAio
	GwUZRT3IYG0I4NTwHExQNL/Rsei0Y+J/v36womkSPSIYmnymMuAx+tltJ0M8ODANNUORurcvmRSgk
	NIb+v+/MJ5VPw5kumbHLIToJMCK8I/LT35+j/EUXTjxVIG5090g+yEIOYQs3g1cYv0s2dxRHaxFja
	BHTPINt81lUbI28PqydoBJDyHK6mD/XiJcByzSUQHA4shOlwOdFPIrd9qXaZPGn6fXhdQtEFY0Yhm
	Otz0sJYzUORiN5ROJVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gnZ-0000000By4W-1E22;
	Sun, 03 Nov 2024 20:02:09 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gnW-0000000By46-3V75
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 20:02:08 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20bb39d97d1so31424695ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2024 12:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730664125; x=1731268925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjfQvqCHHfDeXG4GMQuNHaE4bkPmkI1XqjnN8lstP2Q=;
        b=cc+kcSEoELy+KPKqvyfvOBaAm9rizOGYR729x/+5Ra0hQBs8nIUwbnMuklAqu5ZkZD
         3LnlLc/v9SAUxmBpoVXTpDfAcf4JmOwoNpc4A8qeSw6eawf+E3M2uk1m7mLMZ0HLtUdI
         u7diWkrCKcuwMXNRH0wJX/P3D6eUAKucQLFiZQcEtTTyj43MNy/nm1p9D94YtDvGy7PW
         F7dzVs3XcY2bGtMvb3MvOBQl8+MjEV3mBdUySRQrGA75+Am61kNRfKFD9fHaxT9pXt8p
         PHSJpHF/j1ers0U1NvVe+3Pr2g3S6fRyvMTvyuTUn7nBNOnE3mL7KEJkOIMTnDNV6Gj+
         YErQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhX+BvuoPfrUUReEjoB+9bUVzwwlxB2v1wwcvBFV8dTjuwf+M5nrt91iMqzZ8HMUOb9rTl0yuTdJI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyR6mpZhJqgLpf0SB6qDit7b7HqPBTEnGu8bBlmqFiNTX3TPVvl
	yMXimmiV95E4w3mqJ0TWiunMLOHLfEUZSusCOEBUgFmOcljIIxrt
X-Google-Smtp-Source: AGHT+IHAS+v1ffLBb+GI+ZNM4/mlV92TQI2AYHoaDbWsFSd1zPZgooqCqKQWbVDQVnW3KjMuxbyzsA==
X-Received: by 2002:a17:902:ce91:b0:20b:6624:70b2 with SMTP id d9443c01a7336-210f75154e9mr256357005ad.19.1730664125219;
        Sun, 03 Nov 2024 12:02:05 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105707059sm49877745ad.81.2024.11.03.12.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 12:02:04 -0800 (PST)
Date: Mon, 4 Nov 2024 05:02:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
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
Message-ID: <20241103200203.GA183945@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_120206_897537_0A647185 
X-CRM114-Status: GOOD (  17.80  )
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

SGVsbG8sCgo+IHN0cnVjdCBiaW5fYXR0cmlidXRlIGNvbnRhaW5zIGEgYnVuY2ggb2YgcG9pbnRl
ciBtZW1iZXJzLCB3aGljaCB3aGVuCj4gb3ZlcndyaXR0ZW4gYnkgYWNjaWRlbnQgb3IgbWFsaWNl
IGNhbiBsZWFkIHRvIHN5c3RlbSBpbnN0YWJpbGl0eSBhbmQKPiBzZWN1cml0eSBwcm9ibGVtcy4K
PiBNb3ZpbmcgdGhlIGRlZmluaXRpb25zIG9mIHN0cnVjdCBiaW5fYXR0cmlidXRlIHRvIHJlYWQt
b25seSBtZW1vcnkKPiBtYWtlcyB0aGVzZSBtb2RpZmljYXRpb25zIGltcG9zc2libGUuCj4gVGhl
IHNhbWUgY2hhbmdlIGhhcyBiZWVuIHBlcmZvcm1lZCBmb3IgbWFueSBvdGhlciBzdHJ1Y3R1cmVz
IGluIHRoZQo+IHBhc3QuIChzdHJ1Y3QgY2xhc3MsIHN0cnVjdCBjdGxfdGFibGUuLi4pCj4gCj4g
Rm9yIHRoZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbnMgdGhyb3VnaG91dCB0aGUgY29yZSB0byBiZSBt
b3ZlZCB0bwo+IHJlYWQtb25seSBtZW1vcnkgdGhlIGZvbGxvd2luZyBzdGVwcyBhcmUgbmVjZXNz
YXJ5Lgo+IAo+IDEpIENoYW5nZSBhbGwgY2FsbGJhY2tzIGludm9rZWQgZnJvbSB0aGUgc3lzZnMg
Y29yZSB0byBvbmx5IHBhc3MgY29uc3QKPiAgICBwb2ludGVycwo+IDIpIEFkYXB0IHRoZSBzeXNm
cyBjb3JlIHRvIG9ubHkgd29yayBpbiB0ZXJtcyBvZiBjb25zdCBwb2ludGVycwo+IDMpIEFkYXB0
IHRoZSBzeXNmcyBjb3JlIEFQSXMgdG8gYWxsb3cgY29uc3QgcG9pbnRlcnMKPiA0KSBDaGFuZ2Ug
YWxsIHN0cnVjdHVyZSBkZWZpbml0aW9ucyB0aHJvdWdoIHRoZSBjb3JlIHRvIGNvbnN0Cj4gCj4g
VGhpcyBzZXJpZXMgcHJvdmlkZXMgdGhlIGZvdW5kYXRpb24gZm9yIHN0ZXAgMSkgYWJvdmUuCj4g
SXQgY29udmVydHMgc29tZSBjYWxsYmFja3MgaW4gYSBzaW5nbGUgc3RlcCB0byBjb25zdCBhbmQg
cHJvdmlkZXMgYQo+IGZvdW5kYXRpb24gZm9yIHRob3NlIGNhbGxiYWNrcyB3aGVyZSBhIHNpbmds
ZSBzdGVwIGlzIG5vdCBwb3NzaWJsZS4KPiAKPiBQYXRjaGVzIDEtNSBjaGFuZ2UgdGhlIGJpbl9h
dHRyaWJ1dGUgY2FsbGJhY2tzIG9mICdzdHJ1Y3QKPiBhdHRyaWJ1dGVfZ3JvdXAnLiBUaGUgcmVt
YWluaW5nIG9uZXMgdG91Y2ggJ3N0cnVjdCBiaW5fYXR0cmlidXRlJyBpdHNlbGYuCj4gCj4gVGhl
IHRlY2huaXF1ZXMgZW1wbG95ZWQgYnkgdGhpcyBzZXJpZXMgY2FuIGxhdGVyIGJlIHJldXNlZCBm
b3IgdGhlCj4gc2FtZSBjaGFuZ2UgZm9yIG90aGVyIHN5c2ZzIGF0dHJpYnV0ZXMuCj4gCj4gVGhp
cyBzZXJpZXMgaXMgaW50ZW5kZWQgdG8gYmUgbWVyZ2VkIHRocm91Z2ggdGhlIGRyaXZlciBjb3Jl
IHRyZWUuCgpUaGlzIGlzIHZlcnkgbmljZS4gIFRoYW5rIHlvdSEKCkZvciBQQ0kgY2hhbmdlczoK
ICBBY2tlZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+CgpUaGlzIHJl
bWluZGVkIG1lIG9mIGFuIG9sZCBkaXNjdXNzaW9ucyB3aXRoIEdyZWcgYW5kIEJqb3JuIGFib3V0
IGhvdyB0byBzZXQKc2l6ZSBjb3JyZWN0bHkgZm9yIG91ciBST00gYW5kIEJBUiBzeXNmcyBvYmpl
Y3RzLiAgTmljZSB0byBzZWUgYSB2ZXJ5IG5pY2UKYXBwcm9hY2ggaGVyZSwgaW5kZWVkLgoKCUty
enlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
