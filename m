Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtYbE-0005Xi-7Z
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 05:23:33 +0000
Received: by iyf13 with SMTP id 13so1198451iyf.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 22:23:28 -0700 (PDT)
Subject: Re: [PATCH] mtd/physmap: Fix set_vpp signature in physmap_configure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 17 Aug 2011 08:25:08 +0300
In-Reply-To: <1312498433-17950-1-git-send-email-grant.likely@secretlab.ca>
References: <1312498433-17950-1-git-send-email-grant.likely@secretlab.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313558713.2679.7.camel@sauron>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Russell King <rmk+kernel@arm.linux.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-08-04 at 23:53 +0100, Grant Likely wrote:
> physmap_configure() has the wrong signature for the set_vpp callback.
> struct physmap_flash_data expects it to accpet a platform_device
> pointer.
> 
> However, I can't find any users of physmap_configure(), so maybe the
> hook should simply be removed.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

We have the following patch in l2-mtd-2.6.git waiting for being merged:

commit a0b50813e689760de9ccd85e1b29906c2540a7e0
Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date:   Thu Jun 2 18:51:14 2011 +0400

    mtd: drop physmap_configure
    
    physmap_configure() and physmap_set_partitions() have no users in kernel.
    Out of kernel users should have been converted to regular platform device
    long ago. Drop support for this obsolete API.
    
    Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f64cee4..2174d10 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -245,21 +245,6 @@ static struct platform_device physmap_flash = {
        .num_resources  = 1,
        .resource       = &physmap_flash_resource,
 };
-
-void physmap_configure(unsigned long addr, unsigned long size,
-               int bankwidth, void (*set_vpp)(struct map_info *, int))
-{
-       physmap_flash_resource.start = addr;
-       physmap_flash_resource.end = addr + size - 1;
-       physmap_flash_data.width = bankwidth;
-       physmap_flash_data.set_vpp = set_vpp;
-}
-
-void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
-{
-       physmap_flash_data.nr_parts = num_parts;
-       physmap_flash_data.parts = parts;
-}
 #endif
 
 static int __init physmap_init(void)

-- 
Best Regards,
Artem Bityutskiy
