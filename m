Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRSzy-00084V-KG
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2016 23:07:39 +0000
Received: by mail-wm0-x235.google.com with SMTP id p63so4076066wmp.1
 for <linux-mtd@lists.infradead.org>; Thu, 04 Feb 2016 15:07:17 -0800 (PST)
MIME-Version: 1.0
Sender: pku.leo@gmail.com
In-Reply-To: <1454481372-10288-1-git-send-email-raghav@freescale.com>
References: <1454481372-10288-1-git-send-email-raghav@freescale.com>
Date: Thu, 4 Feb 2016 17:07:16 -0600
Message-ID: <CADRPPNTKFA8rkynJR4wCNgAmqvmiwYwTi2Uk9hDUMB4+N7ST_Q@mail.gmail.com>
Subject: Re: [PATCH] mtd/ifc: Add support for IFC controller version 2.0
From: Li Yang <leoli@freescale.com>
To: Raghav Dogra <raghav@freescale.com>
Cc: linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, oss@buserror.net,
 prabhakar.kushwaha@nxp.com, Brian Norris <computersforpeace@gmail.com>,
 Jaiprakash Singh <b44839@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 3, 2016 at 12:36 AM, Raghav Dogra <raghav@freescale.com> wrote:
> The new IFC controller version 2.0 has a different memory map page.
> Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0 PAGE size is 64KB.
> This patch segregates the IFC global and runtime registers to appropriate
> PAGE sizes.

If the global registers and the runtime registers are so independent
that they have to be on different page boundaries, it would make more
sense for them to be defined as separate reg regions in the device
tree at the very beginning.  Then we would only need to change the
device tree now and it would be future proof for any page size.

>
> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> Signed-off-by: Raghav Dogra <raghav@freescale.com>

The patch cannot apply on latest 4.5-rc cleanly either.  Otherwise,

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
> This patch is the new version of following patch with changed title:
> https://patchwork.ozlabs.org/patch/557391/
>
> This patch is dependent on the
> "drivers/memory: Add deep sleep support for IFC" patch:
> https://patchwork.ozlabs.org/patch/564785/
>
>  drivers/memory/fsl_ifc.c        | 250 +++++++++++++++++++++-------------------
>  drivers/mtd/nand/fsl_ifc_nand.c |  72 ++++++------
>  include/linux/fsl_ifc.h         |  48 +++++---
>  3 files changed, 202 insertions(+), 168 deletions(-)

Regards,
Leo
