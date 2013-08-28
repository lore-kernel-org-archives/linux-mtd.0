Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEZi3-000183-G1
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 06:58:32 +0000
Message-ID: <521D9FCC.5010104@freescale.com>
Date: Wed, 28 Aug 2013 14:59:24 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com>
In-Reply-To: <521D69B6.7070504@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8828=E6=97=A5 11:08, Brian Norris =E5=86=99=
=E9=81=93:
> Since we may see a v4 anyway, I'll make a comment here that I've been=20
> mulling over.
>
> On 08/26/2013 02:36 AM, Huang Shijie wrote:
>> Current code sets the mtd->type with MTD_NANDFLASH for both
>> SLC and MLC. So the jffs2 may supports the MLC nand, but in actually,
>> the jffs2 should not support the MLC.
>>
>> This patch uses the nand_is_slc() to check the nand cell type,
>> and set the mtd->type with the right nand type.
>>
>> After this patch, the jffs2 only can support the SLC nand.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>
> This patch doesn't note here that it is breaking the ABI: it is the=20
> first (AFAIK; I don't think onenand ever actually had MLC, right?)=20
> patch to cause an MTD to show up as MTD_MLCNANDFLASH (and "unknown" in=20
> sysfs -- but you change this later to "mlc-nand"). This should be made=20
> more clear, if we're going to do this. And you should document and=20
> explain it *before* this patch.
okay.
>
> But more importantly, you don't really answer this question I have:=20
> why we want to expose this MTD_MLCNANDFLASH type to user-space? It=20
> seems you need this for internal drivers' usage and for JFFS2 (both=20
> valid reasons). But exporting it to user-space just makes us work to=20
> change mtd-utils (and any other scripts that might rely on these=20
> types). Note that not everybody upgrades mtd-utils along with their=20
> kernel.
>
After we change the code with this patch, the SLC still expose the=20
'nand' to the user space, it's ok;
but the MLC will expose "unknown" as you said above. Some mtd-utils,=20
such as mtd_debug will not work well any more.

If we do expose the MTD_MLCNANDFLASH to use space, the mtd-utils may can=20
not work with MLC nand, some code only checks the
MTD_NANDFLASH. Please see the :
http://lists.infradead.org/pipermail/linux-mtd/2013-August/048213.html


That's why we should expose the MTD_MLCNANDFLASH to the user-space

> One argument in favor of your change: so a user can programmatically=20
> determine whether to use JFFS2 or UBIFS on a particular NAND. (But=20
> then again, SLC are getting more and more MLC-like properties that=20
> make them unsuitable for JFFS2...)
>
> So, I would recommend a few rearrangements of part of this series:
> (1) fixup the sysfs show() function and ABI documentation (in the same=20
> patch) to cover "mlc-nand". *** must clearly explain the rationale for=20
> userspace change (currently missing) ***
> (2) do any changes to JFFS2 based on the MLC type
> (3) allow nand_base.c to export MTD_MLCNANDFLASH
I will arrange the next version in this order.

thanks
Huang Shijie
