Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8BOc-0007eZ-6q
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2004 06:02:42 +0100
Received: from setabox.com (miller.setabox.com.tw [192.168.1.45])
	(authenticated bits=0)
	by pluto.setabox.com.tw (8.12.8/8.12.5) with ESMTP id i2U55610016294
	for <linux-mtd@lists.infradead.org>; Tue, 30 Mar 2004 13:05:10 +0800
Message-ID: <4068FF5A.8090207@setabox.com>
Date: Tue, 30 Mar 2004 13:02:18 +0800
From: "William J. Beksi" <wjbeksi@setabox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: ECC for Samsung nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Has anyone implemented an ECC algorithm for Samsung nand flash devices? 
The nand_ecc.c in the cvs seems to be specific for Toshiba devices.

thank you
-Bill
