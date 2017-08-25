Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlMDI-00010V-Rf
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 21:32:26 +0000
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org,
 daniel.vetter@intel.com, jani.nikula@linux.intel.com,
 seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de,
 tomas.winkler@intel.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 peda@axentia.se, kishon@ti.com, bhelgaas@google.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org,
 andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org,
 freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com,
 jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com,
 lduncan@suse.com, cleech@redhat.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org,
 heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org,
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/15] scsi: make device_type const
From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
 <1503130946-2854-14-git-send-email-bhumirks@gmail.com>
Date: Fri, 25 Aug 2017 17:30:22 -0400
In-Reply-To: <1503130946-2854-14-git-send-email-bhumirks@gmail.com> (Bhumika
 Goyal's message of "Sat, 19 Aug 2017 13:52:24 +0530")
Message-ID: <yq11snz72tt.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Bhumika,

> Make these const as they are only stored in the type field of a device
> structure, which is const.

Applied to 4.14/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
