Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQKMR-0006fh-IP
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 19:42:08 +0000
Received: by mail-wm0-x242.google.com with SMTP id l66so10585706wml.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 11:41:46 -0800 (PST)
MIME-Version: 1.0
Sender: pku.leo@gmail.com
In-Reply-To: <1454323598-5149-3-git-send-email-raghav@freescale.com>
References: <1454323598-5149-1-git-send-email-raghav@freescale.com>
 <1454323598-5149-3-git-send-email-raghav@freescale.com>
Date: Mon, 1 Feb 2016 13:41:45 -0600
Message-ID: <CADRPPNThvUNOtN=2PErWVfhKz_xqBmps+HyL8GTo8+D_-eKX4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd/ifc: Segregate IFC fcm and runtime registers
From: Li Yang <leoli@freescale.com>
To: Raghav Dogra <raghav@freescale.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, oss@buserror.net,
 prabhakar.kushwaha@nxp.com, Jaiprakash Singh <b44839@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 1, 2016 at 4:46 AM, Raghav Dogra <raghav@freescale.com> wrote:

A general comment is that you should include the linux-mtd mailing
list and it's maintainers for this set of patches.  Although the
MAINTAINERS file doesn't specify a maintainer for drivers/memory
directory, it should be most related to linux-mtd, IMO.

> IFC has two set of registers viz FCM (Flash control machine)
> aka global and run time registers. These set are defined in two
> memory map PAGES. Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0
> PAGE size is 64KB

So I guess this patch is the critical change to make the fsl_ifc
driver work with the version 2.0 hardware block?  If so, it will be
better to mention this in the patch title.

>
> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> Signed-off-by: Raghav Dogra <raghav@freescale.com>
> ---
>  drivers/memory/fsl_ifc.c        | 251 +++++++++++++++++++++-------------------
>  drivers/mtd/nand/fsl_ifc_nand.c |  72 ++++++------
>  include/linux/fsl_ifc.h         |  48 +++++---
>  3 files changed, 203 insertions(+), 168 deletions(-)

Regards,
Leo
