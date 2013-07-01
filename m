Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtWiU-0007vx-As
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 05:31:59 +0000
Message-ID: <1372656948.22014.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: support ubi_num on mtd.ubi command line
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 08:35:48 +0300
In-Reply-To: <1367607323-30083-1-git-send-email-vapier@gentoo.org>
References: <1367607323-30083-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-05-03 at 14:55 -0400, Mike Frysinger wrote:
> I want to be able to add UBI volumes with specific numbers, but the
> command line API doesn't have that atm.  Add an additional token to
> support it.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to linux-ubi with minor tweaks:

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7e0b845..a350382 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1452,8 +1452,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
                int err = kstrtoint(token, 10, &p->ubi_num);
 
                if (err) {
-                       ubi_err("bad value for ubi_num parameter: %s",
-                               token);
+                       ubi_err("bad value for ubi_num parameter: %s", token);
                        return -EINVAL;
                }
        } else
@@ -1470,7 +1469,7 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
                      "Optional \"vid_hdr_offs\" parameter specifies UBI VID header position to be used by UBI. (default value if 0)\n"
                      "Optional \"max_beb_per1024\" parameter specifies the maximum expected bad eraseblock per 1024 eraseblocks. (default value ("
                      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0)\n"
-                     "Optional \"ubi_num\" parameter specifies UBI volume number. (default value of UBI_DEV_NUM_AUTO)\n"
+                     "Optional \"ubi_num\" parameter specifies UBI device number which have to be assigned to the newly created UBI device (assigned automatically by default)\n"
                      "\n"
                      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
                      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
-- 
Best Regards,
Artem Bityutskiy
