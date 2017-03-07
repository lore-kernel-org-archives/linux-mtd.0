Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-a.mx-relay.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clBE8-000583-O2
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 09:16:19 +0000
Received: from [145.131.171.178] (rt171bb131-145-178.routit.net
 [145.131.171.178]) by outbound01-a.mx-relay.com with ESMTP id
 u0bL8mQilgt94kzy (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Tue, 07 Mar 2017 10:15:47 +0100 (CET)
Received: from localhost (localhost.localhost [127.0.0.1])
 by router38.aimvalley.nl (Postfix) with ESMTP id 02911639F5
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 10:15:47 +0100 (CET)
Received: from mail3.aimsys.nl (mail.aimsys.nl [10.10.0.114])
 by router38.aimvalley.nl (Postfix) with ESMTPS id A0971639F1
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 10:15:46 +0100 (CET)
From: Kees Trommel <ctrommel@aimvalley.nl>
Subject: One bit flip in erased page causes uncorrectable error using
 (LS1020A) HW ECC
To: Linux MTD <linux-mtd@lists.infradead.org>
Cc: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Message-ID: <8f214368-48d1-ae21-b303-b36431abbeb9@aimvalley.nl>
Date: Tue, 7 Mar 2017 10:15:46 +0100
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

Hello,

I am doing development on a custom board with a NXP LS1020A of which the 
NAND controller supports HW ECC. Unfortunately the implementation of the 
HW ECC does not do the final XOR with the ECC of an empty page (like the 
Linux SW implementation does). This causes that a read of an empty page 
(both data and OOB) causes the HW to report an uncorrectable error. The 
Linux driver of this NAND controller (drivers/mtd/nand/fsl_ifc_nand.c) 
tries to workaround this by checking whether a page with an 
uncorrectable error is erased and if so the uncorrectable error is 
suppressed. However this work around does not work when a bit flips in 
an erased page because the page is no longer regarded as empty:(

I observed a few times that UBI reports uncorrectable errors for the 
above reason and I am wondering whether this can cause a corruption of 
the UBI/UBIFS on top of the NAND mtd?

Until now I did not observe an UBI/UBIFS corruption but I am not sure 
whether I am just lucky or whether UBI/UBIFS can deal with uncorrectable 
errors in erased pages. I am  hoping that someone with a more in depth 
knowledge of UBI/UBIFS can answer this.

Regards,

Kees Trommel.
