Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBHet-0007Jb-Hi
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 09:23:49 +0000
Received: from pure.maildistiller.com (unknown [10.110.50.29])
 by dispatch1-us1.ppe-hosted.com (Proofpoint Essentials ESMTP Server) with
 ESMTP id 8C5EC801F5
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 09:23:19 +0000 (UTC)
Received: from mx4-us4.ppe-hosted.com (unknown [10.110.49.251])
 by pure.maildistiller.com (Proofpoint Essentials ESMTP Server) with ESMTPS id
 1804E6004B
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 09:23:16 +0000 (UTC)
Received: from webmail.solarflare.com (uk.solarflare.com [193.34.186.16])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx4-us4.ppe-hosted.com (Proofpoint Essentials ESMTP Server) with ESMTPS id
 DB7E760056
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 09:23:15 +0000 (UTC)
Subject: [PATCH] mtdcore: Infrastructure for the device release API
From: Martin Habets <mhabets@solarflare.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 18 May 2017 10:23:11 +0100
Message-ID: <20170518092248.23934.15034.stgit@mh-desktop.uk.solarflarecom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This API adds a cleanup callback for the user of an MTD device.
Normally they will have allocated the mtd_info structure, and using
this callback they can free that memory when the last reference is
dropped.

CONFIG_DEBUG_KOBJECT_RELEASE can be used to detect users that free
the memory too early.

Signed-off-by: Martin Habets <mhabets@solarflare.com>
---
 drivers/mtd/mtdcore.c   |    7 ++++---
 include/linux/mtd/mtd.h |    1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1517da3ddd7d..c36752206edc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -96,9 +96,7 @@ static LIST_HEAD(mtd_notifiers);

 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)

-/* REVISIT once MTD uses the driver model better, whoever allocates
- * the mtd_info will probably want to use the release() hook...
- */
+/* Whoever allocates the mtd_info should populate the release() hook. */
 static void mtd_release(struct device *dev)
 {
        struct mtd_info *mtd =3D dev_get_drvdata(dev);
@@ -106,6 +104,9 @@ static void mtd_release(struct device *dev)

        /* remove /dev/mtdXro node */
        device_destroy(&mtd_class, index + 1);
+
+       if (mtd->_release)
+               (mtd->_release)(mtd);
 }

 static ssize_t mtd_type_show(struct device *dev,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 79b176eca04a..e61c30ac8fb6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -327,6 +327,7 @@ struct mtd_info {
        int (*_suspend) (struct mtd_info *mtd);
        void (*_resume) (struct mtd_info *mtd);
        void (*_reboot) (struct mtd_info *mtd);
+       void (*_release) (struct mtd_info *mtd);
        /*
         * If the driver is something smart, like UBI, it may need to maint=
ain
         * its own reference counting. The below functions are only for dri=
ver.

The information contained in this message is confidential and is intended f=
or the addressee(s) only. If you have received this message in error, pleas=
e notify the sender immediately and delete the message. Unless you are an a=
ddressee (or authorized to receive for an addressee), you may not use, copy=
 or disclose to anyone this message or any information contained in this me=
ssage. The unauthorized use, disclosure, copying or alteration of this mess=
age is strictly prohibited.
