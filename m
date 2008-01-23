Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHYcO-0008RP-5s
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 05:57:55 +0000
Received: from dlep32.itg.ti.com ([157.170.170.70])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id m0N5vgi6005995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2008 23:57:47 -0600
Received: from dbdmail.itg.ti.com (localhost [127.0.0.1])
	by dlep32.itg.ti.com (8.13.7/8.13.7) with ESMTP id m0N5vdqS019340
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 23:57:41 -0600 (CST)
Message-ID: <2351.172.24.190.238.1201067861.squirrel@dbdmail.itg.ti.com>
Date: Wed, 23 Jan 2008 11:27:41 +0530 (IST)
Subject: mtd unlock issue
From: "iqbal" <iqbal@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: iqbal@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello list,

My flash driver unlocks the device inside the probe function for further
writes/programing, due to this my Watchdog reset is causing the kernel to
panic.

The following patch fixed my problem, but I think the fix is some where in the
cfi driver. This patch reads the first sector and make
the flash into read mode.

     /* Unlock the flash device. */
        if (info->mtd->unlock)
                info->mtd->unlock(info->mtd, 0, info->mtd->size);
+       /* HACK by a forcing a dummy read To reset the partition to readable
+        * TODO: a real fix is by fixing unlock function
+        */
+       if (info->mtd->read) {
+               u_char val;
+               size_t len = sizeof(val);
+               info->mtd->read(info->mtd, 0,len,&len, &val);
+       }


If you are aware of this fix pleae let me know how to proceed further and have
a right fix.
I work on the TI OMAP platforms.

Thanks,

Regards
Iqbal
