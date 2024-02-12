Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8036CC4829B
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 02:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvKUEOrzZD3G+/f/TSexXbDjuNuA1ApkURyHcqbs9vg=; b=kfiTLKS4mGGmsJ
	/o3FPwM+kNie7znBxSzfgOhUjrBxxOq/qhEOVCbtjW87g374zIDBtIFjnA4skswpjr+X9slfhGtN5
	M7SkDeEnoZISyd7DkWndRjyZs6O11SmitBSnX1NXzyRqgcj0zcw5oFpUy9rWD8pQI93Sz8zDk594g
	Qc61V3inUmYAjyLcfWU87MGdpd0JE8i7LeduepRyvDt1l8skuUaLAWPI066LikSTCvMC5wwpm+xK3
	/nFezup8fRyf2M67CIAY7Db/BcG+hcIKA2I4nv5L7rLY7AUSrovx69YLnF5ZoiwJy+VT1vPzKzTal
	XQGinAZuRceZ5ZgkPtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZLcF-000000042p0-2Eqf;
	Mon, 12 Feb 2024 02:00:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZKVH-00000003mYR-0gVg
	for linux-mtd@bombadil.infradead.org;
	Mon, 12 Feb 2024 00:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DWphKkfwjzYrjYDNrzbv614tiIy1rgaQbkrRflVaiLo=; b=UeVQ2g7IsUi21SiQkFYMUvbooQ
	sXbml1ncz3aFxpawGrieUF/ds4BJ2u4aS4a350/CRy4UR8HEACBJoVo5mYbK3KNnUIF8V6PfLupuq
	bThc4Ij7IoqUiJeG2kpcrCF+f0kA/eZz0dk9uBJpuaIFZJeTMZjzTRO31/dkTESEBq0KRFVSnFnVP
	LGEKQP9p3u46RzaBLL9VjCAx/0K5yGOI16iq6LAe20T8EsjX86OjZyYngNg1IoLsxIPvLgmf21Pxd
	YKON1NMtwhDQCThzIA9/XPPCPbRA9qR6a3hTKuuQZoWdZUMuKIicVkER/VVzzivnBV2jcYSWoJkyG
	YLch0Q5g==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZKVD-0000000F3CK-1jut
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 00:48:57 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rZKUv-0001Um-1b;
	Mon, 12 Feb 2024 00:48:37 +0000
Date: Mon, 12 Feb 2024 00:48:34 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
Subject: Re: [PATCH v7 0/7] mtd: ubi: allow UBI volumes to provide NVMEM
Message-ID: <Zclq4mG0HIBVHnyj@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1702952891.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_004855_532841_9A02B52D 
X-CRM114-Status: GOOD (  42.03  )
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

Dear MTD and UBI maintainers,

On Tue, Dec 19, 2023 at 02:31:44AM +0000, Daniel Golle wrote:
> Similar to how MAC addresses and Wi-Fi calibration data would be
> stored inside an MTD partition on devices coming with NOR flash, a UBI
> volume is used by some vendors in the same way on devices with NAND
> flash.
> 
> The goal of this series is to support such embedded Linux devices which
> got NVMEM bits stored inside a UBI volume.
> 
> Representing the UBI volume in the Device Tree and adding a phandle to
> be referenced by NVMEM consumers allows such devices to come up with
> their correct MAC addresses and device-specific Wi-Fi calibration data
> loaded.
> 

I hope I don't nag too much but please someone review (and ideally
merge) this very series, also found on Patchwork:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=387243

In case any part needs further fixing, it would be great to even only
have the dt-bindings part merged already so we can start using this
feature in OpenWrt knowing that dt-bindings will not change any more.
(instead of piling up device-specific fixup-scripts in userspace...)

A good example of why this is needed in the wild is the ASUS RT-AC58U
router which is the first device we found having almost everything
stored in UBI, including NVMEM-areas for WiFi calibration as well as
MAC addresses for both WiFi and Ethernet.

https://openwrt.org/toh/asus/rt-ac58u#flash_layout

Even more devices with all-UBI layout are likely to show up in the
near future as by now even ARM TrustedFirmware-A which is used as
first-stage loader (like MBR on PC or U-Boot SPL on ARMv7) on Aarch64
platforms by now supports UBI to load further bootloader stages. MTD
layout on such devices becomes simply something like

0x0      ~ 0x200000 : ARM TrustedFirmware-A bl2 (redundant if supported
                                                 by SoC's BootROM)
0x200000 ~ END      : UBI

See this (pending) commit adding UBI support to TF-A:
https://github.com/mtk-openwrt/arm-trusted-firmware/commit/e7a7b94373cf2b8baca66b3b0ced8e70bdbb273a


Obviously this is better than what vendors have been doing previously
(using UBI only for the rootfs, if at all) and having proper support
for that in vanilla Linux would further encourage this development.

PS: Also the planned OpenWrt One router to celebrate the 20th
anniversary of OpenWrt will use an all-UBI layout and we will hence
need to load NVMEM-bits from UBI volumes...


Thank you!


Best regards


Daniel

> In order for NVMEM bits to be available for other drivers, attaching
> UBI devices has to be moved from late_initcall (which is too late for
> other drivers) to happen earlier. As an alternative to the existing
> kernel cmdline parameter the Device Tree property 'compatible =
> "linux,ubi";' inside an MTD partition can be used to have that MTD
> device attached as UBI device. MTD partitions which serve as UBI
> devices may have a "volumes" subnode with volumes, and volumes may
> have an "nvmem-layout" object which will trigger the creation of an
> emulated NVMEM device on top of the UBI volume.
> 
> In this way, other drivers (think: Ethernet, Wi-Fi) can resolve and
> acquire NVMEM bits using the usual device tree phandle, just this time
> the NVMEM content is read from a UBI volume.
> 
> This series is a follow-up and contains most patches of the previous
> series "mtd: ubi: behave like a good MTD citizen"[1] which was meant in
> preparation for implementing the NVMEM provider.
> 
> [1]: https://patchwork.ozlabs.org/project/linux-mtd/list/?series=353177&state=%2A&archive=both
> 
> Changes since v6:
>  * dt-bindings fixes got squashed into the wrong patch, fix that and
>    newly introduced YAML white space issues
> 
> Changes since v5:
>  * fix whitespace problems in dt-schema additions
> 
> Changes since v4:
>  * split ubi_open_volume_path() breaking out reusable parts for
>    new match_volume_desc() function as suggested by Richard Weinberger.
>    Doing the same for ubi_open_volume_nm() doesn't work as we are working
>    on struct ubi_volume_info in match_volume_desc() while ubi_open_volume_nm()
>    is working on struct ubi_volume. That reduces the common part to a string
>    comparision and length check which doesn't seem worth breaking out of the
>    existing function.
>  * drop patches and changes not strictly needed for NVMEM use-case:
>    - don't handle ubi detach on MTD removal notification. It was not done
>      until now and the locking hell I was facing when trying to implement
>      that is non trivial.
>    - don't relocate the call to ubiblock device creation to the
>      notification handler
>    - change ubiblock only as far as needed to handle creation from cmdline
>      parameter when a volume is added.
>  * improve commit messages and comments
> 
> Changes since v3:
>  * dt-bindings fixes as requested
> 
> Changes since v2:
>  * include dt-bindings additions
> 
> Changes since v1:
>  * include patch to fix exiting Kconfig formatting issues
>  * fix typo and indentation in Kconfig
> 
> 
> 
> Daniel Golle (7):
>   dt-bindings: mtd: add basic bindings for UBI
>   dt-bindings: mtd: ubi-volume: allow UBI volumes to provide NVMEM
>   mtd: ubi: block: use notifier to create ubiblock from parameter
>   mtd: ubi: attach from device tree
>   mtd: ubi: introduce pre-removal notification for UBI volumes
>   mtd: ubi: populate ubi volume fwnode
>   mtd: ubi: provide NVMEM layer over UBI volumes
> 
>  .../bindings/mtd/partitions/linux,ubi.yaml    |  75 +++++++
>  .../bindings/mtd/partitions/ubi-volume.yaml   |  40 ++++
>  drivers/mtd/ubi/Kconfig                       |  12 ++
>  drivers/mtd/ubi/Makefile                      |   1 +
>  drivers/mtd/ubi/block.c                       | 136 ++++++-------
>  drivers/mtd/ubi/build.c                       | 154 ++++++++++----
>  drivers/mtd/ubi/kapi.c                        |  56 ++++--
>  drivers/mtd/ubi/nvmem.c                       | 188 ++++++++++++++++++
>  drivers/mtd/ubi/ubi.h                         |   3 +
>  drivers/mtd/ubi/vmt.c                         |  44 +++-
>  include/linux/mtd/ubi.h                       |   2 +
>  11 files changed, 579 insertions(+), 132 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
>  create mode 100644 drivers/mtd/ubi/nvmem.c
> 
> -- 
> 2.43.0
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
