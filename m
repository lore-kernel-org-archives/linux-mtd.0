Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD84C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 13:30:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2952075D
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 13:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fMqN3DHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E2952075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VD2jqr09zYyrFnu8H2FucZDNzeHTZMgcUBjMQ9jWcsY=; b=fMqN3DHHM/K2uX
	lTH7DKa6+AKelFKl/B9Xw+QmmKjm0wyLD4JtUpdV30KNPo+QPqN9oc/8mf30i7Ik1/RP8yOzk3PyS
	G8/USjDHkXXni93vjx211d0l+fwHeq6l+JxIG0ry4pRAOFc8DvM1i+9Rj0dwPgMj2oq90u74SedZO
	ofhUD5QBMjb7XokyidUooKTzkiP7eXfgeywLYIdBcKprD8Hu21Xu0dkyIYj0Na+nbW8Jlmjd3oPUi
	mdjtBDVEFQGlptCvbalkoLuhCubUth28taMditGTdh1csVRsDq0Kt6NfirkZrHADhIFYez4sxWh+A
	IGf8DiGYYVb1LQx5WXbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtuc6-0007GR-KS; Wed, 13 Feb 2019 13:30:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtuag-0005V7-Rm
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 13:29:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB64C271C68;
 Wed, 13 Feb 2019 13:28:36 +0000 (GMT)
Date: Wed, 13 Feb 2019 14:28:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] drivers/mtd: Fix device registration error
Message-ID: <20190213142833.2b2999fd@collabora.com>
In-Reply-To: <20190211133338.30399-2-aneesh.kumar@linux.ibm.com>
References: <20190211133338.30399-1-aneesh.kumar@linux.ibm.com>
 <20190211133338.30399-2-aneesh.kumar@linux.ibm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_052844_786460_6DF390B3 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, Alban Bedel <albeu@free.fr>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Subject prefix should be "mtd: powernv_flash: "

On Mon, 11 Feb 2019 19:03:38 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> This change helps me to get multiple mtd device registered. Without this
> I get
> 
> sysfs: cannot create duplicate filename '/bus/nvmem/devices/flash0'
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc2-00557-g1ef20ef21f22 #13
> Call Trace:
> [c0000000b38e3220] [c000000000b58fe4] dump_stack+0xe8/0x164 (unreliable)
> [c0000000b38e3270] [c0000000004cf074] sysfs_warn_dup+0x84/0xb0
> [c0000000b38e32f0] [c0000000004cf6c4] sysfs_do_create_link_sd.isra.0+0x114/0x150
> [c0000000b38e3340] [c000000000726a84] bus_add_device+0x94/0x1e0
> [c0000000b38e33c0] [c0000000007218f0] device_add+0x4d0/0x830
> [c0000000b38e3480] [c0000000009d54a8] nvmem_register.part.2+0x1c8/0xb30
> [c0000000b38e3560] [c000000000834530] mtd_nvmem_add+0x90/0x120
> [c0000000b38e3650] [c000000000835bc8] add_mtd_device+0x198/0x4e0
> [c0000000b38e36f0] [c00000000083619c] mtd_device_parse_register+0x11c/0x280
> [c0000000b38e3780] [c000000000840830] powernv_flash_probe+0x180/0x250
> [c0000000b38e3820] [c00000000072c120] platform_drv_probe+0x60/0xf0
> [c0000000b38e38a0] [c0000000007283c8] really_probe+0x138/0x4d0
> [c0000000b38e3930] [c000000000728acc] driver_probe_device+0x13c/0x1b0
> [c0000000b38e39b0] [c000000000728c7c] __driver_attach+0x13c/0x1c0
> [c0000000b38e3a30] [c000000000725130] bus_for_each_dev+0xa0/0x120
> [c0000000b38e3a90] [c000000000727b2c] driver_attach+0x2c/0x40
> [c0000000b38e3ab0] [c0000000007270f8] bus_add_driver+0x228/0x360
> [c0000000b38e3b40] [c00000000072a2e0] driver_register+0x90/0x1a0
> [c0000000b38e3bb0] [c00000000072c020] __platform_driver_register+0x50/0x70
> [c0000000b38e3bd0] [c00000000105c984] powernv_flash_driver_init+0x24/0x38
> [c0000000b38e3bf0] [c000000000010904] do_one_initcall+0x84/0x464
> [c0000000b38e3cd0] [c000000001004548] kernel_init_freeable+0x530/0x634
> [c0000000b38e3db0] [c000000000011154] kernel_init+0x1c/0x168
> [c0000000b38e3e20] [c00000000000bed4] ret_from_kernel_thread+0x5c/0x68
> mtd mtd1: Failed to register NVMEM device
> 
> With the change we now have
> 
> root@(none):/sys/bus/nvmem/devices# ls -al
> total 0
> drwxr-xr-x 2 root root 0 Feb  6 20:49 .
> drwxr-xr-x 4 root root 0 Feb  6 20:49 ..
> lrwxrwxrwx 1 root root 0 Feb  6 20:49 flash@0 -> ../../../devices/platform/ibm,opal:flash@0/mtd/mtd0/flash@0
> lrwxrwxrwx 1 root root 0 Feb  6 20:49 flash@1 -> ../../../devices/platform/ibm,opal:flash@1/mtd/mtd1/flash@1
> 
> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")

Actually it's not this commit that is at fault as mtd->name was already
given the value of device_node->name before that. I think you're
actually fixing 1cbb4a1c433a ("mtd: powernv: Add powernv flash MTD
abstraction driver").

No need to send a new version, I can fix that when applying, just let
me know if you're okay with the changes I suggested.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index 22f753e555ac..83f88b8b5d9f 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -212,7 +212,7 @@ static int powernv_flash_set_driver_info(struct device *dev,
>  	 * Going to have to check what details I need to set and how to
>  	 * get them
>  	 */
> -	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
> +	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
>  	mtd->type = MTD_NORFLASH;
>  	mtd->flags = MTD_WRITEABLE;
>  	mtd->size = size;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
