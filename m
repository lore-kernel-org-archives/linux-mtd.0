Received: from arroyo.ext.ti.com ([192.94.94.40])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IjqKl-0002Ut-Ac
	for linux-mtd@lists.infradead.org; Mon, 22 Oct 2007 07:00:17 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id l9M5xoFc027051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2007 00:59:57 -0500
Received: from x0081444pc (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id l9M5xm0f029722
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Oct 2007 11:29:49 +0530 (IST)
From: "Sameer" <x0081444@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: NAND driver - spare area ecc
Date: Mon, 22 Oct 2007 11:29:47 +0530
Message-ID: <004401c81470$c128fa40$ec8818ac@ent.ti.com>
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
I am working on NAND flash driver on TI's OMAP based board.
NAND is large page nand with 8bit buswidth.
I need to calculate ecc for the spare area data.
1.Does the current linux nand driver support ecc calulation for spare area
  with hw_ecc/sw_ecc enabled?
2.If not could any one suggest on what data of the spare area info I need to
  calculate ECC?

I am a begineer working on MTD driver. Please provide your
Valuable comments.


Regards,
-Sameer
