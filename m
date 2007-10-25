Received: from soda.ext.ti.com ([198.47.26.145])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ikzwi-000840-SR
	for linux-mtd@lists.infradead.org; Thu, 25 Oct 2007 11:28:16 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by soda.ext.ti.com (8.13.7/8.13.7) with ESMTP id l9PARf0P031864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2007 05:27:48 -0500
Received: from x0081444pc (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id l9PARd3d019226
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Oct 2007 15:57:40 +0530 (IST)
From: "Sameer" <x0081444@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: Onenand sync burst mode-query
Date: Thu, 25 Oct 2007 15:57:39 +0530
Message-ID: <00b501c816f1$ac002840$ec8818ac@ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am working on onenand driver based on omap board.
Onenand is samsung onenand. I need to add the functionality for
Synchronous burst mode operation which is currently not present.
I am refering n800 board driver (arch/arm/mach-omap/board-n880-flash.c)
The function "omap2_onenand_set_sync_mode" contains the variable "fclk_offset_ns"

I am not able to relate this variable with the timing diagram of the onenand flash
Could any body specify the significance of this variable and what how it
Is related to the timing variables?

Thanks,
-Sameer
