Received: from mail-ve0-f171.google.com ([209.85.128.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULQvy-0006XF-LD
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2013 04:28:59 +0000
Received: by mail-ve0-f171.google.com with SMTP id b10so238436vea.30
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2013 21:28:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1364387100-23013-1-git-send-email-tie-fei.zang@freescale.com>
References: <1364387100-23013-1-git-send-email-tie-fei.zang@freescale.com>
Date: Thu, 28 Mar 2013 21:28:56 -0700
Message-ID: <CAN8TOE-fpTYj5Z5VW=MbH6epK9Ymc+=uQkh7V6=k=76_DjouPA@mail.gmail.com>
Subject: Re: [upstream] mtd/ifc: fix ifc driver memory release issue
From: Brian Norris <computersforpeace@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linuxppc-dev@lists.ozlabs.org, galak@kernel.crashing.org,
 Li Hao <b44421@freescale.com>, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, dwmw2@infradead.org,
 Cao Yonghua <b43619@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 27, 2013 at 5:25 AM, Roy Zang <tie-fei.zang@freescale.com> wrote:
> memory is allocated by devm_kzalloc, so release it using
> devm_kfree() instead kfree();

You are correct that it should not be freed with kfree(). But the
correct solution is that it does not need to be freed (explicitly) at
all. That's the whole point of the managed allocators (i.e.,
devm_kzalloc()). Try this patch instead. Totally untested here.

From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 28 Mar 2013 21:20:27 -0700
Subject: [PATCH] mtd: fsl_ifc_nand: remove incorrect kfree()

The struct fsl_ifc_mtd is allocated with devm_kzalloc, so its memory
is "managed" automatically by the kernel. That is, we do not need to
free it explicitly; it will be freed when the device is removed. And we
*certainly* shouldn't free it with a regular kfree().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index f1f7f12..180bfa7 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -908,7 +908,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)

 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 	dev_set_drvdata(priv->dev, NULL);
-	kfree(priv);

 	return 0;
 }
-- 
1.7.9.5
