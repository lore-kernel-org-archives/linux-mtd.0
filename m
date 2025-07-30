Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0068C87FC9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmloScJ2biXVYqnfnP//8QVQpGjF1MX84dFVDX+8imM=; b=p0j0XQEUr1DpMr8ZsibmHfRkUR
	s9+1bp7xVuFXNNHnFSKi5quRZhyrE1Sw3Lv/R3IP/wzABH1zdLu4oKS5yg/JPrjhxxZmODgFo/o+p
	BOmmALfAmVeObBgGYN/O2e3yZkFzTfg4eyVviVUi6sKANJnrSajBr8kHa3X54EPZeB0Ot/FAh/8Wu
	0M8vy25o5JyKOBls+jIycwSCCTGI1H8e/xArgZqiAQXqCjVPx/iAlW3FXw8tqz+c+WDIkjxNDTzT0
	SFh6+eOOTKcUCHQOfj0WSjSDK8SK94oonDvQXB7STZUF9sQBuOusZ7Q4kMVOKwZdGjThFJNxOqEf0
	mR4vBSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1GV-00000000sl8-1qpM;
	Wed, 30 Jul 2025 07:30:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1GR-00000000skB-3xsI
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 07:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AD5E5C664D;
	Wed, 30 Jul 2025 07:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91B5C4CEE7;
	Wed, 30 Jul 2025 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753860614;
	bh=H/pqotFZUKNnyxSNnhtzvMiTrU7Ao/+haG8ZKeInaec=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=sKw4qa1WsD98Zi1U0HNE5xEtnC0Ozn/EkWRLtWlnaSRidZd97CxLS+0MtAcYIg4ef
	 HF0Y2smDLxZsM7th6pRC7roNv6IMXyWuYyEDSvyL+QmN9rRmL+zbq/jj1CbNCJP9Ky
	 JnyqtSXf/yU334XrvNzire2kjPgN2LZrTiHj2btkexq0xt4em/r6ExEtpxRX7p3RBw
	 F2+9XkPw6ONCJHkX94/McbmqNlpUFuL0i15Mg4b3yF1PD3AiCaPSe0QyB1u3CLlcma
	 /46gvngmyr659hW0jLmDeedH1ITcc4bEjF7LkoWHbMUbwwegsL+rWhk5f7ySnE4aPT
	 2SCHZQOhjQRYA==
Date: Wed, 30 Jul 2025 09:30:06 +0200
Message-Id: <DBP7P3RWX17B.14Q27IBS3T3FL@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Khairul Anuar Romli" <khairul.anuar.romli@altera.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Matthew Gerlach"
 <matthew.gerlach@altera.com>
Subject: Re: [PATCH v3 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
X-Mailer: aerc 0.16.0
References: <cover.1753839339.git.khairul.anuar.romli@altera.com>
 <566fc1168db723672ab0bc6482ec7b72b4b8fe2b.1753839339.git.khairul.anuar.romli@altera.com>
In-Reply-To: <566fc1168db723672ab0bc6482ec7b72b4b8fe2b.1753839339.git.khairul.anuar.romli@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_003016_080020_938D225E 
X-CRM114-Status: GOOD (  23.42  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9019931108262116867=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============9019931108262116867==
Content-Type: multipart/signed;
 boundary=a3e9b9de6cf3dc4c98cb83aa2206db48083b13031472f83fa1f6f0a267af;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--a3e9b9de6cf3dc4c98cb83aa2206db48083b13031472f83fa1f6f0a267af
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Jul 30, 2025 at 3:39 AM CEST, Khairul Anuar Romli wrote:
> From: kromli <khairul.anuar.romli@altera.com>
>
> Ensure that the pointer passed to module_put() in spi_nor_put_device() is
> not NULL before use. This change adds a guard clause to return early,
> preventing the kernel crash below when the cadence-qspi driver is removed
> during a dd operation:

As already asked in v2. This needs a (more detailed) description
what is going on and what is going wrong.

-michael

> [  200.448732] Unable to handle kernel NULL pointer deref
> erence at virtual address 0000000000000010
> [  200.457576] Mem abort info:
> [  200.460370]   ESR =3D 0x0000000096000004
> [  200.464136]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [  200.469527]   SET =3D 0, FnV =3D 0
> [  200.472609]   EA =3D 0, S1PTW =3D 0
> [  200.475904]   FSC =3D 0x04: level 0 translation fault
> [  200.480786] Data abort info:
> [  200.483659]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> [  200.489141]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [  200.494189]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [  200.499500] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000185df800=
0
> [  200.505932] [0000000000000010] pgd=3D0000000000000000, p4d=3D000000000=
0000000
> [  200.512720] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [  200.518968] Modules linked in: 8021q garp mrp stp llc bluetooth ecdh_g=
eneric
> ecc rfkill crct10dif_ce rtc_ds1307 at24 stratix10_soc soc64_hwmon gpio_al=
tera of
> _fpga_region fpga_region fpga_bridge uio_pdrv_genirq uio fuse drm backlig=
ht ipv6
> [  200.540016] CPU: 0 UID: 0 PID: 372 Comm: dd Not tainted 6.12.19-altera=
-gb6b26
> c4179a6 #1
> [  200.547996] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
> [  200.553292] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  200.560234] pc : spi_nor_put_device+0x30/0x60
> [  200.564594] lr : __put_mtd_device+0x8c/0x120
> [  200.568856] sp : ffff80008411bc20
> [  200.572161] x29: ffff80008411bc20 x28: ffff000185e2c500 x27: 000000000=
0000000
> [  200.579282] x26: 0000000000000000 x25: ffff000185e2cb00 x24: ffff00018=
5e2cc88
> [  200.586404] x23: ffff00018034c620 x22: 0000000000000001 x21: ffff00018=
873e080
> [  200.593524] x20: 0000000000000000 x19: ffff00018873e080 x18: fffffffff=
fffffff
> [  200.600645] x17: 0030393d524f4a41 x16: 4d0064746d3d4d45 x15: ffff00018=
5757700
> [  200.607767] x14: 0000000000000000 x13: ffff000180045010 x12: ffff00018=
57576c0
> [  200.614888] x11: 000000000000003a x10: ffff000180045018 x9 : ffff00018=
0045010
> [  200.622009] x8 : ffff80008411bb70 x7 : 0000000000000000 x6 : ffff00018=
1325048
> [  200.629129] x5 : 00000000820001cf x4 : fffffdffc60095e0 x3 : 000000000=
0000000
> [  200.636250] x2 : 0000000000000000 x1 : ffff00018873e080 x0 : 000000000=
0000000
> [  200.643371] Call trace:
> [  200.645811]  spi_nor_put_device+0x30/0x60
> [  200.649816]  __put_mtd_device+0x8c/0x120
> [  200.653731]  put_mtd_device+0x30/0x48
> [  200.657387]  mtdchar_close+0x30/0x78
> [  200.660958]  __fput+0xc8/0x2d0
> [  200.664011]  ____fput+0x14/0x20
> [  200.667146]  task_work_run+0x70/0xdc
> [  200.670718]  do_exit+0x2b4/0x8e4
> [  200.673944]  do_group_exit+0x34/0x90
> [  200.677512]  pid_child_should_wake+0x0/0x60
> [  200.681686]  invoke_syscall+0x48/0x104
> [  200.685432]  el0_svc_common.constprop.0+0xc0/0xe0
> [  200.690128]  do_el0_svc+0x1c/0x28
> [  200.693439]  el0_svc+0x30/0xcc
> [  200.696454] dw_mmc ff808000.mmc: Unexpected interrupt latency
> [  200.696485]  el0t_64_sync_handler+0x120/0x12c
> [  200.706552]  el0t_64_sync+0x190/0x194
> [  200.710213] Code: f9400000 f9417c00 f9402000 f9403400 (f9400800)
> [  200.716290] ---[ end trace 0000000000000000 ]---
> [  200.720948] Fixing recursive fault but reboot is needed!
>
> Fixes: be94215be1ab ("mtd: spi-nor: core: Fix an issue of releasing resou=
rces during read/write")
> CC: stable@vger.kernel.org # 6.12+
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
> Changes in v3:
>     - exclude !dev && !dev->driver check in spi_nor_get_device to
>       resolve kernel test robot smatchwarnings.
> Changes in v2:
>     - Move the null check prior to try_module_get().
> ---
>  drivers/mtd/spi-nor/core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ac4b960101cc..eb21d660036b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3210,6 +3210,9 @@ static int spi_nor_get_device(struct mtd_info *mtd)
>  	else
>  		dev =3D nor->dev;
> =20
> +	if (!dev->driver->owner)
> +		return -EINVAL;
> +
>  	if (!try_module_get(dev->driver->owner))
>  		return -ENODEV;
> =20
> @@ -3227,7 +3230,8 @@ static void spi_nor_put_device(struct mtd_info *mtd=
)
>  	else
>  		dev =3D nor->dev;
> =20
> -	module_put(dev->driver->owner);
> +	if (dev && dev->driver && dev->driver->owner)
> +		module_put(dev->driver->owner);
>  }
> =20
>  static void spi_nor_restore(struct spi_nor *nor)


--a3e9b9de6cf3dc4c98cb83aa2206db48083b13031472f83fa1f6f0a267af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaInJ/xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i97wGA9CAFtXIoHqpiNWKi9a7EpgDY7fGtmecV
/MppRb3od4IUHW5/vIJPK8EPO25YkAVMAX98MjA03NK1yq3Z4qVPVCWlTsxIZD3C
0Kv41gIx/WQqq4trGWkFhbdeb0t9ERUjfOE=
=fIbF
-----END PGP SIGNATURE-----

--a3e9b9de6cf3dc4c98cb83aa2206db48083b13031472f83fa1f6f0a267af--


--===============9019931108262116867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9019931108262116867==--

