Received: from xproxy.gmail.com ([66.249.82.201])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7WST-0006UR-3f
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 06:56:46 -0400
Received: by xproxy.gmail.com with SMTP id i30so311113wxd
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 03:56:43 -0700 (PDT)
Message-ID: <802ad8b60508230349683751c6@mail.gmail.com>
Date: Tue, 23 Aug 2005 16:19:25 +0530
From: Suresh K <sureshkanniappan@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <802ad8b60508222243345b5e18@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <802ad8b60508222243345b5e18@mail.gmail.com>
Subject: Re: JFFS2 Mount issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hai,

I solved the JFFS2 mount time issue. The kernel version is 2.6.10. I
have faced following problems after successful mounting.

  1. Compiled the kernel with JFFS2 summary support. Created the JFFS2
image with the following command.
      mkfs.jffs2 -d testjffs2 -e 0x40000 --pad=3D0x7800000 -o jffs2.img -v

      This comand created the JFFS2 image of size 120MB.
      Copied the jffs2.img to one of the partition in Hard Disk.
Mounted
      the partition using blkmtd support. It takes around 27 seconds
to
      mount.

      Why the mount time is high even if the kernel having the "JFFS2
summary" support?.

   2. Created the JFFS2 image with summary information inbuilt support
using sumtool2 utility.
         sumtool2 -e 0x40000 -i jffs2.img -o jffs2-sum.img

       Copied the jffs2-sum.img to other partition in Hard Disk.
Mounted
       the partition using blkmtd support. It takes around 6 seconds
to
       mount.
Another problem is that "Segmentation fault" occurs when copying a
directory of size 10MB to JFFS2 partition after mount.

Following are the error posted when copying the directory.

JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!
--------------[ cut here ]-----------
kernel bug at fs/jffs2/summary.c:572
invalid operand: 0000 [#1]
....
....
Segmentation fault

Segmantation fault occured only in 2.6.10 kernel but not with 2.4.x kernel.
This is occured in both partitions. Kindly help me in this regard.=20
How to solve this problem.

Regards,
K. Suresh


On 8/23/05, Suresh K <sureshkanniappan@gmail.com> wrote:
> Hai,
>=20
> I am looking for reliable compressed R/W file system. I came to know
> that JFFS2 is the reliable one. I started implementing the same in
> 2.4.26 kernel. Created a JFFS2 image of 80MB and copied to one of
> partition in Hard Disk. I am trying to mount a 80MB JFFS2 image in
> Hard disk. The time taken to mount the JFFS2 image is 30 seconds.
>=20
> I tried with 2.6.10 kernel also. The time taken to mount the JFFS2
> image is too large. Also i am not able to create multiple JFFS2
> partition.
>         cp jffs2.imf /dev/mtdblock0 - Copied the JFFS2 image to one
> partition in Hard Disk
>         cp jffs2.imf /dev/mtdblock1 - cannot create regular file
> '/dev/mtdblock1' : No Such Device or Address
>=20
> How cai reduce the more mounting time. Kindly help me in this regard.
>=20
> Regards,
> K. Suresh
>
