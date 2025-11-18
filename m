Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F3CED63A
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRqofHI1OlPdNQG8S2IxqhMVtN2PVka6NM4pqthGRp0=; b=NAMhay78dBjRr3VLCPGUTNXeOX
	eXwozFcPjbLx+2ukHF9+j+boe/xBsWXHDWIeZmHmDXZ9+McECGenLDSSHMpg1Mp2OAto8SsVHTTqb
	bFwiGTz5x1TAEP3mNBMSoBZX61qvAnY41M40bZoGWDEpM6eQVG1MosKxyYUaY6NZgxJ7b4qBvAGSH
	dBQEAhTzoD4mfiKadSn4TuNQ2utb2ziwUkKxwIk61+/SlsimJZ4Y3pGMVzTeYucREMX3ZIewEPYGD
	lqzKYEerGTbIgxTjBAO7QkJ252I0fyIcjiLU/Pe7EGPNSEvQNn9invIRW0g/XJhcR92iwLj9akF2k
	324aolLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKl0-00000000PZO-2PRQ;
	Tue, 18 Nov 2025 12:24:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKkx-00000000PYy-0dY9
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 12:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AC8E401D0;
	Tue, 18 Nov 2025 12:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C3AC19423;
	Tue, 18 Nov 2025 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763468662;
	bh=Ujd1vHHs8n7n0Zl6KcKppsafbBUvouKTUrsZTFmdcVY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=QOhwkB+PlDbxWHVgnHGDmP2KdQV132Yt+PgGyUmfqtTquFASNlHHBPfBoojYbxq2N
	 tNz5mo5n1xvxnc95Nu3ywqyb6N+gKz/Y4euW3lp63LTSVwn2rxTeeCl2KbLIxUxtlI
	 MVNK2fomCIk5Sf0EsMGEneXJsAZeilkG+VnSaeGG19ywzPzevchPo1IOj6zRZwYi0H
	 BUka57Wf2dy9xUbaEAEIex3K/9bboAe9X7ufldLzHb94jFOPd9MTl3ZDuCfK8kdqDd
	 9GJiHWdwa32dvqzn4WxFp3WueHxOxyYL80a0d+17eJFvVWvTZjK+0gbaQ4yJUs40Oa
	 lGxmLnbB0OB/Q==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 13:24:02 +0100
Message-Id: <DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org>
Subject: Re: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking
 support
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_042423_234076_FD8EB67F 
X-CRM114-Status: GOOD (  23.76  )
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
Content-Type: multipart/mixed; boundary="===============0010624538621174199=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0010624538621174199==
Content-Type: multipart/signed;
 boundary=88b3ebf9c52789b01c7edf90a0b4102275a8c8724fa135a9cd14319e9fa4;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--88b3ebf9c52789b01c7edf90a0b4102275a8c8724fa135a9cd14319e9fa4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> As recently raised on the mailing list, it may be useful to propose a
> list of steps to go through in order to proove the devices have been
> described correctly, especially since all the block protection
> information is not stored in any kind of table and is instead filled
> manually by developpers.
>
> Use the debugfs output to ease the comparison between expectations and
> reality.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/driver-api/mtd/spi-nor.rst | 118 +++++++++++++++++++++++++=
++++++
>  1 file changed, 118 insertions(+)
>
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/dri=
ver-api/mtd/spi-nor.rst
> index 148fa4288760b6ba47d530ed72c5ef81397d598f..d56ff5c42a98af23a65097c9b=
77cd20ef2504a49 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst
> @@ -203,3 +203,121 @@ section, after the ``---`` marker.
>      mtd.writesize =3D 1
>      mtd.oobsize =3D 0
>      regions =3D 0
> +
> +5) If your flash supports locking, also follow the following test
> +   procedure to make sure it correctly behaves. These tests must be
> +   conducted with #WP high (no hardware protection) or the `no-wp`
> +   property in the DT node.

Or? If WPn is low, the no-wp property doesn't matter. It's hardware
write protected. Also there is that corner case, where you can
actually fully lock your flash: WPn hard tied to low. Be aware, that
you can enable locking even if WPn is tied low. That has the use
case to initially program the flash and then lock it forever. So we
might add a warning note, that WPn should somehow be controllable
(or be sure that is tied high) before conducting the locking tests.

> +
> +   Test full chip locking and make sure expectations, the MEMISLOCKED
> +   ioctl output, the debugfs output and experimental results are all
> +   aligned::
> +
> +    root@1:~# alias show_sectors=3D'grep -A4 "locked sectors" /sys/kerne=
l/debug/spi-nor/spi0.0/params'
> +    root@1:~# flash_lock -u /dev/mtd0
> +    root@1:~# flash_lock -i /dev/mtd0
> +    Device: /dev/mtd0
> +    Start: 0
> +    Len: 0x4000000
> +    Lock status: unlocked
> +    Return code: 0
> +    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
> +    Erased 2097152 bytes from address 0x00000000 in flash
> +    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> +    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +    root@1:~# sha256sum spi*
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_read
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_test
> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-03ffffff | unlocked | 1024
> +
> +    root@1:~# flash_lock -l /dev/mtd0
> +    root@1:~# flash_lock -i /dev/mtd0
> +    Device: /dev/mtd0
> +    Start: 0
> +    Len: 0x4000000
> +    Lock status: locked
> +    Return code: 1
> +    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
> +    Erased 2097152 bytes from address 0x00000000 in flash
> +    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +    root@1:~# sha256sum spi*
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_read
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_test
> +    root@1:~# dd if=3D/dev/urandom of=3D./spi_test2 bs=3D1M count=3D2
> +    2+0 records in
> +    2+0 records out
> +    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test2
> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> +    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read2
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +    root@1:~# sha256sum spi*
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_read
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_read2
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  sp=
i_test
> +    bea9334df51c620440f86751cba0799214a016329f1736f9456d40cf40efdc88  sp=
i_test2
> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-03ffffff |   locked | 1024
> +
> +   Once we trust the debugfs output we can use it to test various
> +   situations. Check top locking/unlocking (end of the device)::
> +
> +    root@1:~# bs=3D$(cat /sys/class/mtd/mtd0/erasesize)
> +    root@1:~# size=3D$(cat /sys/class/mtd/mtd0/size)
> +
> +    root@1:~# flash_lock -u /dev/mtd0
> +    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last tw=
o
> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-03fdffff | unlocked | 1022
> +     03fe0000-03ffffff |   locked | 2
> +    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last on=
e

huh? shouldn't that be 1 * $bs?

-michael

> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-03feffff | unlocked | 1023
> +     03ff0000-03ffffff |   locked | 1
> +
> +   If the flash features 4 block protection bits (BP), we can protect
> +   more than 4MB (typically 128 64kiB-blocks or more), with a finer
> +   grain than locking the entire device::
> +
> +    root@1:~# flash_lock -u /dev/mtd0
> +    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2**7 * $bs))) $((2**7)=
)
> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-037fffff | unlocked | 896
> +     03800000-03ffffff |   locked | 128
> +
> +   If the flash features a Top/Bottom (TB) bit, we can protect the
> +   beginning of the flash::
> +
> +    root@1:~# flash_lock -u /dev/mtd0
> +    root@1:~# flash_lock -l /dev/mtd0 0 2 # first two
> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-0001ffff |   locked | 2
> +     00020000-03ffffff | unlocked | 1022
> +    root@1:~# flash_lock -u /dev/mtd0 $bs 1 # first one
> +    root@1:~# show_sectors
> +    software locked sectors
> +     region (in hex)   | status   | #blocks
> +     ------------------+----------+--------
> +     00000000-0000ffff |   locked | 1
> +     00010000-03ffffff | unlocked | 1023


--88b3ebf9c52789b01c7edf90a0b4102275a8c8724fa135a9cd14319e9fa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRxlZBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jnWQF/YcjvJj5uDE4v8uMIMItrSnk/FG9GqcPf
m/z5ARU2xHsoJeKzfeOJZ0W2TYdXEIiwAYDWUIkyUsy+vlDZ0xg6b0g/Mc5G5hJ2
RQA4NVGzKFIfR3tVf5LDMGYvnXWIBv4sAww=
=gmqo
-----END PGP SIGNATURE-----

--88b3ebf9c52789b01c7edf90a0b4102275a8c8724fa135a9cd14319e9fa4--


--===============0010624538621174199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0010624538621174199==--

