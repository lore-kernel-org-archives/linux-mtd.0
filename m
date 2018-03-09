Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euFcw-0008Eg-OY
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2018 10:51:56 +0000
Received: by mail-io0-x243.google.com with SMTP id q24so3102172ioh.8
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2018 02:51:44 -0800 (PST)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: use put_device() if device_register fail
Date: Fri,  9 Mar 2018 16:20:47 +0530
Message-Id: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

if device_register() returned an error! Always use put_device()
to give up the reference initialized.

Arvind Yadav (2):
  [PATCH 1/2] mtd: use put_device() if device_register fail
  [PATCH 2/2] mtd: ubi: use put_device() if device_register fail

 drivers/mtd/mtdcore.c | 1 +
 drivers/mtd/ubi/vmt.c | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1
