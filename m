Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-b.mx-relay.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daysz-0003WB-AZ
 for linux-mtd@lists.infradead.org; Fri, 28 Jul 2017 06:36:36 +0000
Received: from [145.131.171.178] (rt171bb131-145-178.routit.net
 [145.131.171.178]) by outbound01-b.mx-relay.com with ESMTP id
 xZ8l2oi4JbmeFVNE (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2017 08:36:00 +0200 (CEST)
Received: from localhost (localhost.localhost [127.0.0.1])
 by router38.aimvalley.nl (Postfix) with ESMTP id 46B0B639F5
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2017 08:36:00 +0200 (CEST)
Received: from mail5.aimvalley.nl (mail5.aimsys.nl [10.10.0.115])
 by router38.aimvalley.nl (Postfix) with ESMTPS id DFF65639F1
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2017 08:35:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail5.aimvalley.nl (Postfix) with ESMTP id C97011480047
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2017 08:35:59 +0200 (CEST)
Received: from mail5.aimvalley.nl ([127.0.0.1])
 by localhost (mail5.aimvalley.nl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mdamQrT8AVXv for <linux-mtd@lists.infradead.org>;
 Fri, 28 Jul 2017 08:35:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail5.aimvalley.nl (Postfix) with ESMTP id 897FB14805F3
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2017 08:35:59 +0200 (CEST)
Received: from mail5.aimvalley.nl ([127.0.0.1])
 by localhost (mail5.aimvalley.nl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nuk-P1FZSzed for <linux-mtd@lists.infradead.org>;
 Fri, 28 Jul 2017 08:35:59 +0200 (CEST)
Received: from linvm302.aimsys.nl (unknown [10.10.23.2])
 by mail5.aimvalley.nl (Postfix) with ESMTPSA id 739371480047
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2017 08:35:59 +0200 (CEST)
To: Linux MTD <linux-mtd@lists.infradead.org>
From: Kees Trommel <ctrommel@aimvalley.nl>
Subject: nand_flash_detect_onfi issue
Message-ID: <3067c688-35ab-113a-1875-395756118e24@aimvalley.nl>
Date: Fri, 28 Jul 2017 08:35:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

When testing with a LS1021A based custom board with NAND device the 
U-boot printed 512 times the error message "fsl_ifc_read_byte beyond end 
of buffer".

An investigation in this issue showed that the U-Boot function 
"nand_flash_detect_onfi" in "drivers/mtd/nand/nand_base.c" read beyond 
the 256 bytes written into the read buffer by the NAND chip driver as 
result of the NAND_CMD_PARAM command. This happens only in case the CRC 
of the ONFI parameter page is not correct.

My question is whether the NAND_CMD_PARAM command must be in the "for (i 
= 0; i < 3; i++)" loop or whether the NAND chip driver
(FSL IFC in this case) should read 3*256 bytes from the NAND device 
because an ONFI compatible device duplicates the ONFI parameter page.

I will continue to investigate why the CRC fails. The CRC fail itself is 
outside the scope of this email.

Kees.
