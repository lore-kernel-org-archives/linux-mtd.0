Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NFqHY-0004bA-VR
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 14:34:21 +0000
Received: by bwz4 with SMTP id 4so224918bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Dec 2009 06:34:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
References: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 2 Dec 2009 20:03:55 +0530
Message-ID: <ce9ab5790912020633o24dbab61le9ab2d14e0b5177e@mail.gmail.com>
Subject: Re: [RFC] [PATCH] [MTD-UTILS]: flash_lock: fix length being passed
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 2, 2009 at 7:58 PM, Vimal Singh <vimal.newwork@gmail.com> wrote=
:
> This patch fixes the 'length' calculation.
> Making it:
> + =A0 =A0 =A0 mtdLockInfo.length =3D (num_sectors - 1) * mtdInfo.erasesiz=
e;
> Rather:
> - =A0 =A0 =A0 mtdLockInfo.length =3D num_sectors * mtdInfo.erasesize;
>
> Say there are 240 blocks present in the device. Then:
> offset starts from: 0x0
> and full size of device: 0x1E00000
>
> doing: 240 * 0x20000 gives -> 0x1E00000
> But last block address should be 0x1DE0000 (which spans for 0x20000
> bytes, adding upto size of 0x1E00000)
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>
> --- flash_lock.c.org =A0 =A02009-11-24 19:33:18.000000000 +0530
> +++ flash_lock.c =A0 =A0 =A0 =A02009-11-24 19:33:13.000000000 +0530

Sorry, this patch was generated using 'diff'. Below is the correct patch.
-vimal

This patch fixes the 'length' calculation.
Making it:
       mtdLockInfo.length =3D (num_sectors - 1) * mtdInfo.erasesize;
Rather:
       mtdLockInfo.length =3D num_sectors * mtdInfo.erasesize;

Say there are 240 blocks present in the device. Then:
offset starts from: 0x0
and full size of device: 0x1E00000

doing: 240 * 0x20000 gives -> 0x1E00000
But last block address should be 0x1DE0000 (which spans for 0x20000
bytes, adding upto size of 0x1E00000)

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---

--- a/flash_lock.c	2009-11-24 19:33:18.000000000 +0530
+++ b/flash_lock.c	2009-11-24 19:33:13.000000000 +0530
@@ -71,7 +71,7 @@ int main(int argc, char *argv[])
 	}

 	mtdLockInfo.start =3D ofs;
-	mtdLockInfo.length =3D num_sectors * mtdInfo.erasesize;
+	mtdLockInfo.length =3D (num_sectors - 1) * mtdInfo.erasesize;
 	if(ioctl(fd, MEMLOCK, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
@@ -81,4 +81,3 @@ int main(int argc, char *argv[])

 	return 0;
 }
-
