Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807CFD132C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypYkplv9jQNfo/8RurBpbcdbP+8nByl/TADTHpPMTDA=; b=SS81lUibY0qzmDwoACR+jTzXrr
	nEcr9y74CgwAjYZQtHZNsyGIiE3OlDdFqvPgtv27YPhgaJjKFzCPy0Q+GHihrYnKQAN3gpBW3NGJj
	9Llsb61QEpi2DDqkDHDo0401SEMx8uWlmIaylT3j7dRM324iJ+rVs/ZBjTuXe8WYpdgY20qrVpjbi
	UHk0JYTn117PK5NSDUS/YdPBCWvCuCqZ9Y7tyJU2cnZ9QBZ/8BU2oscvbJHxMM+5/SVrWiKnOFLdV
	dYaA8Vhz0h1LHZr1gNHyPChglzd5s6+f9yIal+9K9mp4sr8SDnsPrCPo6Ql9DNEh6a+EbHhzm4tr4
	nga0XTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x9V-0000000DrrD-3fiP;
	Mon, 04 Nov 2024 13:29:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x5V-0000000Dqfx-1Evz
	for linux-mtd@bombadil.infradead.org;
	Mon, 04 Nov 2024 13:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fBu4LSRH1Ek1Kbk8PE5B4m+YFkf2qbk/d9bb550qHQ0=; b=DuKtKsWPryh33Fp0dguLmsQDE/
	SnW+39zYZyE4kRjR5Qi9yWi41S24Ysyu8+7Czp2lXDplKL9umHcRgQQP7hm80zGO5DoRHwOeGD7i9
	UsDaJpuV02mNP48P/kh86ThhyI8PVZ6eSm+GERdChmBLIMXWuklY1Uc5MS5Q3W4NOOdSj5Ml20b9a
	95rrDW4sCq7jLUX8bVgysOVdbsSFnEy7zEXqNnqL+yyltX72amm9V7lAYPeMNH7mi82pNkSQQv6Yr
	PwXcXq2sRGajhGeU3wxfYD/YvtRk1DzsjFVaQIKAaOgbJCujqgG8OfHg3mCttrgcuIipfulPzbk0w
	ndau0KPg==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x5R-0000000BKvo-3Qsv
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 13:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730726742; x=1762262742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oPBklUbvKL8bSKRIlaEBq6Ena9N6JHRIUOBA6mqrZ6c=;
  b=T6ol05GWEeBYGyB8hmfzoORYc/Q3+2xhDchBMId8eziyfUsoA1v7qW82
   dkJEckno1hDNCMVNEaVC3K3A01k20d+JUCC12hiZ/IGEQtrNsp+7Qb9t9
   7aAO0G1jh5p8rUg87rfyT3sqqPU8SXQYT3IHqaQ3sMRFZ7qLgvC6rofw6
   wzzHvcGM9kg2mAxVJD9Rg/NUB+g09TGU0I0QiNFp/lEzLbQCgCmq/Cp5o
   IM5q1MUPfeHAdtH7FbuWWGYlAFRqgRS8QqWzBO8iBUp/jCGPBIkBAdh8H
   rdTeN6XZvtOBEz62Rs0IRXFmqPUieh0OF94wCpkcaEYNDzWJpircpYpLP
   g==;
X-CSE-ConnectionGUID: KjIOyzDvRTy9+rdlAos8Ig==
X-CSE-MsgGUID: 4fYhYtRYSQG6ndJjTiua6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30275410"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30275410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:25:33 -0800
X-CSE-ConnectionGUID: v9JmlMoUQFaNhWF7H45gGQ==
X-CSE-MsgGUID: 4K1oV5FuTuelLKT3nBONXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83542204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:25:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Nov 2024 15:25:13 +0200 (EET)
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
    Davidlohr Bueso <dave@stgolabs.net>, 
    Jonathan Cameron <jonathan.cameron@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, 
    Alison Schofield <alison.schofield@intel.com>, 
    Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
    Alex Deucher <alexander.deucher@amd.com>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
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
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    "David E. Box" <david.e.box@linux.intel.com>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    "Martin K. Petersen" <martin.petersen@oracle.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
    Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
    Logan Gunthorpe <logang@deltatee.com>, 
    "K. Y. Srinivasan" <kys@microsoft.com>, 
    Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
    Dexuan Cui <decui@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
    linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
    dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
    linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
    linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
    linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback
 of bin_is_visible()
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
Message-ID: <65f4dc4e-3b48-2baa-a13b-3cc34dd51ce1@linux.intel.com>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net> <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-559502379-1730726713=:989"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_132542_379970_659CC9C0 
X-CRM114-Status: GOOD (  16.84  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-559502379-1730726713=:989
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 3 Nov 2024, Thomas Wei=C3=9Fschuh wrote:

> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
>=20
> As there are not many callback implementers perform this change
> throughout the tree at once.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/cxl/port.c                      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
>  drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
>  drivers/mtd/spi-nor/sysfs.c             |  2 +-
>  drivers/nvmem/core.c                    |  3 ++-
>  drivers/pci/pci-sysfs.c                 |  2 +-
>  drivers/pci/vpd.c                       |  2 +-
>  drivers/platform/x86/amd/hsmp.c         |  2 +-
>  drivers/platform/x86/intel/sdsi.c       |  2 +-
>  drivers/scsi/scsi_sysfs.c               |  2 +-
>  drivers/usb/core/sysfs.c                |  2 +-
>  include/linux/sysfs.h                   | 30 +++++++++++++++------------=
---
>  12 files changed, 27 insertions(+), 26 deletions(-)

> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/h=
smp.c
> index 8fcf38eed7f00ee01aade6e3e55e20402458d5aa..8f00850c139fa8d419bc1c140=
c1832bf84b2c3bd 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -620,7 +620,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  }
> =20
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -=09=09=09=09=09 struct bin_attribute *battr, int id)
> +=09=09=09=09=09 const struct bin_attribute *battr, int id)

Hi Thomas,

This driver is reworked in pdx86/for-next.

--=20
 i.


>  {
>  =09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
>  =09=09return battr->attr.mode;
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/int=
el/sdsi.c
> index 9d137621f0e6e7a23be0e0bbc6175c51c403169f..33f33b1070fdc949c1373251c=
3bca4234d9da119 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -541,7 +541,7 @@ static struct bin_attribute *sdsi_bin_attrs[] =3D {
>  };
> =20
>  static umode_t
> -sdsi_battr_is_visible(struct kobject *kobj, struct bin_attribute *attr, =
int n)
> +sdsi_battr_is_visible(struct kobject *kobj, const struct bin_attribute *=
attr, int n)
>  {
>  =09struct device *dev =3D kobj_to_dev(kobj);
>  =09struct sdsi_priv *priv =3D dev_get_drvdata(dev);

--8323328-559502379-1730726713=:989
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--8323328-559502379-1730726713=:989--

