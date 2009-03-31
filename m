Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LogXr-0000oc-Qg
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 16:10:43 +0000
Received: by wf-out-1314.google.com with SMTP id 23so3072059wfg.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 09:10:34 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 Mar 2009 12:10:34 -0400
Message-ID: <25dd9bf10903310910w9525c47n424a8a08a9e96d92@mail.gmail.com>
Subject: [RFC]mtd-util flash_unlock support on NAND
From: Subramani Venkatesh <subbu31mani@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am Currently working on yaffs2 and ubifs file system testing on
omap, during which I could not do flash_unlock on NAND using mtd
utility to perform flash_eraseall.
Reading mtd nand driver shows that mtd->unlock is intialized to NULL
in nand_base.c file, is their any particular reason why there is no
nand_unlock callback function implemented?
Is their any chance to implement it in the main code base line?

Regards,
Subbu
