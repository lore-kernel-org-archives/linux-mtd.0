Received: from [196.12.38.67] (helo=navgw.cmcltd.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGGnY-0003cS-QN
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 08:30:25 -0500
Received: (from navint [172.16.11.11])
	by navgw.cmcltd.com (SMSSMTP 4.1.0.19) with SMTP id
	M2005032918443710042
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 18:44:37 +0530
Received: from cmcmail.cmcltd.com ([172.16.11.1])
	by navint (SMSSMTP 4.1.0.19) with SMTP id M2005032918381105324
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 18:38:11 +0530
Received: from webmail.cmcltd.com ([172.16.10.105])
	by cmcmail.cmcltd.com (8.12.10+Sun/8.12.10) with ESMTP id
	j2TDATff026550 for <linux-mtd@lists.infradead.org>;
	Tue, 29 Mar 2005 18:40:29 +0530 (IST)
Message-ID: <17771.13.13.16.2.1112102736.squirrel@13.13.16.2>
Date: Tue, 29 Mar 2005 18:55:36 +0530 (IST)
From: srkumar@cmcltd.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: S29GL128
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a problem with AMD S29GLS128 Flash.I have enabled the following in
the kernel config file.But the driver is not able to probe the flash.The
register_mtd_chip_driver() function from amd_flash.c is getting registered
into the kernel,but no probing function is called. I have added  my chip
deice ID and region info into the amd_flash_info table[]. But still not
detecting.

Help me.

kernel config file.
CONFIG_MTD_CFI=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_AMDSTD=y
CONFIG_MTD_JEDEC=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_PHYSMAP=n
