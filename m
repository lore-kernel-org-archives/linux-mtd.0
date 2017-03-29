Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctBwg-00059v-3E
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 11:39:23 +0000
Received: by mail-pf0-x22f.google.com with SMTP id o126so6500719pfb.3
 for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2017 04:39:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170328215705.438d7af8@bbrezillon>
References: <CAHCN7xJoVF+3HjHwaS_U=jDqmU_Yv201KJSQ2s8N0gSNVR8pdQ@mail.gmail.com>
 <20170328215705.438d7af8@bbrezillon>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 29 Mar 2017 06:39:00 -0500
Message-ID: <CAHCN7xKhRub4k8BpkPPjPFhjJU5c2xRd_VKPMfVOc88ZaTUmGQ@mail.gmail.com>
Subject: Re: Passing NAND mtdparts to OMAP2+ Kernel
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, "Leto, Enrico" <enrico.leto@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 28, 2017 at 2:57 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> +Roger and Enrico
>
> On Tue, 28 Mar 2017 10:43:01 -0500
> Adam Ford <aford173@gmail.com> wrote:
>
>> I posted this on the linux-omap list, and I was asked to post this on
>> the linux-mtd list:
>>
>>
>> I tried to remove the MTD partitions from the Linux device tree, and I
>> noticed that there was no partition information being pushed anymore
>> unless I changed the mtdparts name in U-Boot.
>>
>> It appears as if the MTD drivers have changed a bit.  I found a few
>> e-mails floating around that attempt to fix this
>>
>> Commit f7a8e38f07a17be907585 ("mtd: nand: assign reasonable default
>> name for NAND drivers") attempts to address this, and someone over at
>> https://patchwork.ozlabs.org/patch/707065/ attempted to address it as
>> well in a slightly different way.
>
> Can you test the patch and let me know if solves the problem. If it
> does, I'll send a clean version of the patch and queue it for 4.12.
>

I tried to apply the patch directly, but it failed.  I then manually
copy-pasted it into the proper place, but it fails to compile.

drivers/mtd/nand/omap2.c: In function =E2=80=98omap_nand_probe=E2=80=99:
drivers/mtd/nand/omap2.c:1859:14: error: implicit declaration of
function =E2=80=98devm_kasprinf=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
  mtd->name =3D devm_kasprinf(&pdev->dev, "omap2-nand.%d", info->gpmc_cs);
              ^~~~~~~~~~~~~
drivers/mtd/nand/omap2.c:1859:12: warning: assignment makes pointer
from integer without a cast [-Wint-conversion]
  mtd->name =3D devm_kasprinf(&pdev->dev, "omap2-nand.%d", info->gpmc_cs);
            ^
cc1: some warnings being treated as errors

I use buildroot to build my toolchain and I am using gcc version 6.3.0
with glibc 2.24.  Is there supposed to be an include somewhere?  I am
not familiar with devm_kasprinf.


> Thanks,

Thank you

adam
>
> Boris
