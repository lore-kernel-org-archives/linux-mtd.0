Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H79m8-0001dY-Dm
	for linux-mtd@lists.infradead.org; Wed, 17 Jan 2007 07:20:22 -0500
Received: from dbdp30.itg.ti.com ([172.24.170.39])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id l0HCJg98002868
	for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2007 06:19:48 -0600
Received: from x0019732 (localhost [127.0.0.1])
	by dbdp30.itg.ti.com (8.12.11/8.12.11) with SMTP id l0HCJe7c000809
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Jan 2007 17:49:41 +0530 (IST)
Message-ID: <062f01c73a31$c3e2d5e0$5af5180a@ent.ti.com>
From: "Anand Patil" <anandpatil@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: No Lock/unlock support for NAND Devices
Date: Wed, 17 Jan 2007 17:49:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
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
        I want to know why there is no support for Lock and Unlock 
operations of blocks
        for NAND devices ( nand_base.c)?
        I have seen several  NAND devices ( SAMSUNG ) make supporting the 
lock and unlock
        commands.

Warm Regards,
Anand Patil 
