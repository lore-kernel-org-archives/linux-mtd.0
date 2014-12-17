Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Nq8-0005dK-0c
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 23:17:08 +0000
Received: by mail-ob0-f170.google.com with SMTP id wp18so6925291obc.1
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 15:16:45 -0800 (PST)
MIME-Version: 1.0
Sender: dehrenberg@google.com
Date: Wed, 17 Dec 2014 15:16:44 -0800
Message-ID: <CAAK6Zt2dbK1EayqrvNWsZQxiCJ97YidHYGLs-DC8pv3Ggitz1w@mail.gmail.com>
Subject: [PATCH] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Daniel Ehrenberg <dehrenberg@chromium.org>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: grundler@chromium.org, Gwendal Grignou <gwendal@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If one ubi volume is corrupted but another is not, it should be
possible to initialize that ubiblock from a kernel commandline which
includes both of them. This patch changes the error handling behavior
in initializing ubiblock to ensure that all parameters are attempted
even if one fails. If there is a failure, it returns one of the
error status codes. It also makes error messages more descriptive
by including the name of the UBI volume that failed.

Tested: Formatted ubi volume /dev/ubi5_0 in a corrupt way and
dev/ubi3_0 properly and included "ubi.block=5,0 ubi.block=3,0" on
the kernel command line. At boot, I see the following in the console:
[   21.082420] UBI error: ubiblock_create_from_param: block: can't
open volume on ubi5_0, err=-19
[   21.084268] UBI: ubiblock3_0 created from ubi3:0(rootfs)

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/ubi/block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 8876c7d..32eeeee 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -596,10 +596,11 @@ static int __init ubiblock_create_from_param(void)

                desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
                if (IS_ERR(desc)) {
-                       ubi_err("block: can't open volume, err=%ld\n",
-                               PTR_ERR(desc));
+                       ubi_err(
+                               "block: can't open volume on ubi%d_%d, err=%ld",
+                               p->ubi_num, p->vol_id, PTR_ERR(desc));
                        ret = PTR_ERR(desc);
-                       break;
+                       continue;
                }

                ubi_get_volume_info(desc, &vi);
@@ -607,9 +608,10 @@ static int __init ubiblock_create_from_param(void)

                ret = ubiblock_create(&vi);
                if (ret) {
-                       ubi_err("block: can't add '%s' volume, err=%d\n",
-                               vi.name, ret);
-                       break;
+                       ubi_err(
+                               "block: can't add '%s' volume on
ubi%d_%d, err=%d",
+                               vi.name, p->ubi_num, p->vol_id, ret);
+                       continue;
                }
        }
        return ret;


--
2.2.0.rc0.207.ga3a616c
