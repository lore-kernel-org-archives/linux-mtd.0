Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEC1D59F6C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkkkI7D/OEPC7zhqi5ZZfOw+zoCD9EmAbsVASSVoYl8=; b=fwyNhlvh3O6Dpl
	Cb9tJgJkrFDgzZjPUTYv5ffyoco9SlVg217L40N/8T81uFVfmG8dCL2FPbNnVzpb8fYVFLxoHYn1i
	pbT+GpQQicrkZuavuHAo+obN+JNZMvWiDRk5r3986Sbt9/YkPow17+mPOqJRSSODiO/YLsaFlwZX8
	2UQco3ISOA4273d6QPPHLeNdzo8ksk5hFdESKjEUTA12jwxkzRYpWsGzmgo1w1upoN9SqmeXUfkqT
	AoqAKutt+uXmFGCYy6iWAuU7kyocFyvUbFTRIo3W+rVjJoNyVW+h+2ATXr3uXM86dfEb8443xT6HS
	vLkBB+LGCpaL/W+a0wQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mHp-00000004e7W-2aym;
	Wed, 06 Nov 2024 20:05:53 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mHF-00000004dxx-2O8d
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 20:05:19 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso2328535ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2024 12:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730923516; x=1731528316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57haWgxVK3Bhz2CTFQJdY/J31Debho+HXpt9b6frcmw=;
        b=q7wJe9xJZiSqrIQv+unSGAVCiU6JTPGL9srR5covLQ0HXRhWBGRkvbtn72AHyySFuE
         9Lt+EcwRoxVg/l2Fi6zPOQAOkZ1YHgXG24a5IvVaCGGB0iL25BgzMSFR0iy7y2x/QT6S
         ztBpiQm0yWEQoSePhFpl8s9f2Bnintq89lxfNUGoikNwCpkAxNJ//yvxalMPMgann+Z4
         B76tq3tLvjsWxHXPK92oW9NMbXvw4Daxg9AlJGJhRqJM+Yid0mKzAwjJw4ntGt2X3HQe
         dx88qYSOtDPuEYTcN/Loio0UbdfqgKqqq+MVnEaFioJWkg5QUY6eneD9I1Ji6GIHXFgY
         AqlA==
X-Forwarded-Encrypted: i=1; AJvYcCUDeyyzv+oFMM44F0p5zvJQTiU35ErDRymQlguchpeaN1C2zVYeZHxecNzQKwIWUW84g1ojlu/A/MI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ww21bYZxynU4bIAQczg9bFJHDiy23g1DuBmuExMHG+v2WgVx
	fgWvzRcQqnQIymjPT1lc/+iBZDYxM/wr+U5JBhzWoRocIw5Dq7g3
X-Google-Smtp-Source: AGHT+IFmoIbZw8g1IipDn3Lp+ri/9C7OdJSPor3hPH1pRa7RYRF3y6lGuH/8ZaeEQ1eFo8eAFPaCWQ==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-210c6c3ec78mr567878865ad.41.1730923515866;
        Wed, 06 Nov 2024 12:05:15 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c076bsm99997795ad.197.2024.11.06.12.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 12:05:15 -0800 (PST)
Date: Thu, 7 Nov 2024 05:05:13 +0900
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
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
Message-ID: <20241106200513.GB174958@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_120517_638985_1B764723 
X-CRM114-Status: GOOD (  15.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

> Several drivers need to dynamically calculate the size of an binary
> attribute. Currently this is done by assigning attr->size from the
> is_bin_visible() callback.
> 
> This has drawbacks:
> * It is not documented.
> * A single attribute can be instantiated multiple times, overwriting the
>   shared size field.
> * It prevents the structure to be moved to read-only memory.
> 
> Introduce a new dedicated callback to calculate the size of the
> attribute.

Would it be possible to have a helper that when run against a specific
kobject reference, then it would refresh or re-run the size callbacks?

We have an use case where we resize BARs on demand via sysfs, and currently
the only way to update the size of each resource sysfs object is to remove
and added them again, which is a bit crude, and can also be unsafe.

Hence the question.

There exist the sysfs_update_groups(), but the BAR resource sysfs objects
are currently, at least not yet, added to any attribute group.

Thank you!

	Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
