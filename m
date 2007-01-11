Received: from bear.ext.ti.com ([192.94.94.41])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4zRs-00062a-6t
	for linux-mtd@lists.infradead.org; Thu, 11 Jan 2007 07:54:30 -0500
Received: from dbdp30.itg.ti.com ([172.24.170.39])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id l0BCs7q0003910
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2007 06:54:18 -0600
Received: from x0019732 (localhost [127.0.0.1])
	by dbdp30.itg.ti.com (8.12.11/8.12.11) with SMTP id l0BCs4oq024821
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Jan 2007 18:24:06 +0530 (IST)
Message-ID: <010101c7357f$93feda60$5af5180a@ent.ti.com>
From: "Anand Patil" <anandpatil@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: ECC Recovery in JFFS2 and YAFFS
Date: Thu, 11 Jan 2007 18:24:03 +0530
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
        I want to know how a ECC failiure is handled by JFFS2 and YAFFS?


        What i understand from the below code ment to check ECC error is
        a Device reset is issued on the NAND device.

In Nand_base.c
In Function nand_verify_pages()
------------------------------------------------------------------------------------------------
 /*
  * Terminate the read command. We come here in case of an error
  * So we must issue a reset command.
  */
out:
 this->cmdfunc (mtd, NAND_CMD_RESET, -1, -1);
 return res;

------------------------------------------------------------------------------------------------


Warm Regards,
Anand Patil
Wipro TI ODC
Ph :- 080-28520408
Ext 4386 
