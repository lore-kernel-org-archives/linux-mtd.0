Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16AD43373
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odLXFJzd132DBd+YUCAslGihSbdgHGCh++z9UG8s/oQ=; b=V8lY9XFoviyfvI
	y1WcN/loDNCO6JxqIUyhe54S7gR7yxLnY5lpudWfLHj0u0Qi5/Z7luU4v9YnWHaQpPscdFFlPLP8t
	HNH8ngmVIKS7+Pfc13rFsgZcGgU44qmpwSjK4sJYv6YZAaIMkv40aYC/tsDagvKmuszmFFUevK1CU
	pVDPMkSiDE2JCVWqb135r8UEaBMTf2KRvVJVIEgW6B0FrKQ/yo4IPu1oFWZTi5/YoZHJh4lcwe50W
	HJtyT6L87K9FmWy0j3JyD8SFusCGQ4pElwApqR4onRkZxY7CkDj2kFUipJEojNUnmDdiMwQYaHpxR
	b34QKUkbeDIr6GMEbYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94mb-00000007UU1-0tVf;
	Thu, 07 Nov 2024 15:50:53 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94mW-00000007UT6-3mL9
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 15:50:50 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cceb8d8b4so7917815ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 07:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994647; x=1731599447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4g9pTMBWn8NYG8DJqu2aF9WChjDh3es1iM4dJmMreI=;
        b=jwrWX94FDjenxBKVm0/DQKmXKYTM0Tv05v2x6TTZGqio+w884B1t1gJ46fj/bIvYNY
         1eNQlOxAC/6Ht+pkNF0wn7SHcWImipSB2dyEMZ/13KGOJ/yFG2B93FDYwfLVLTJZn+wY
         V839loPtmvjjOMxFsxhHfkYXCKqE/ZRyGyC8I6LMqrMlfweXoGBZR5Yedd0FILFx8CdR
         HIwpYyHKDPJFY3Ap5UG1Sm/1YNsPWWpkUXuFTExxiMWc6/ujqIxmyrd9rlyBV1ePh46x
         KTOQ3dDN/o8o071vTCaG3rUbQrQS0tsbzU9h0qddU1tpw94hVU9fkVFQ4Tz4UTkshKLp
         eWFA==
X-Forwarded-Encrypted: i=1; AJvYcCVamxagF6fSs90aZXjGvDiNOtC40Uth7DaJZOBmUV/IDOo91xLnbddwj2lj489LfoHSsgiVsqL/5qQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwA/7d9+obyyqZcsEgzq/q3rAd9XN6XJGJzknx92Mjev8EfaOkZ
	0aBTloeRlP/JxLckSrMMFNnwO9ZLYOpEPirhNi6XafxEDpf5OiVe
X-Google-Smtp-Source: AGHT+IEfW8mc6K7WMilatY4cRGrx/jJrVZ2Go8Ums63B2x6oVuXb+zNT4RZMBtIqDecZElfJ9fn+6w==
X-Received: by 2002:a17:903:183:b0:210:e760:77e with SMTP id d9443c01a7336-21181184b51mr5235045ad.7.1730994647037;
        Thu, 07 Nov 2024 07:50:47 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c2ecsm13637145ad.252.2024.11.07.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:50:46 -0800 (PST)
Date: Fri, 8 Nov 2024 00:50:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
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
Message-ID: <20241107155044.GA1297107@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
 <20241106200513.GB174958@rocinante>
 <2024110726-hasty-obsolete-3780@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024110726-hasty-obsolete-3780@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075048_963264_17C75088 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

[...]
> > There exist the sysfs_update_groups(), but the BAR resource sysfs objects
> > are currently, at least not yet, added to any attribute group.
> 
> then maybe they should be added to one :)

Yeah. There is work in progress that will take care of some of this.

	Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
