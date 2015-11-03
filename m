Received: from mx0b-00176a03.pphosted.com ([67.231.157.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZteRF-0002rt-MM
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 16:28:02 +0000
Received: from pps.filterd (m0048299.ppops.net [127.0.0.1])
 by m0048299.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
 tA3GLvu3009576
 for <linux-mtd@lists.infradead.org>; Tue, 3 Nov 2015 11:27:39 -0500
Received: from cinmlip12.e2k.ad.ge.com ([12.71.149.1])
 by m0048299.ppops.net-00176a03. with ESMTP id 1xvrxj35da-1
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2015 11:27:39 -0500
Received: from [3.26.68.149] (unknown [3.26.68.149])
 by selma.edi.geip.ge.com (Postfix) with ESMTP id 04C4EE06D1
 for <linux-mtd@lists.infradead.org>; Tue,  3 Nov 2015 16:27:32 +0000 (GMT)
To: linux-mtd@lists.infradead.org
From: Renaud Barbier <renaud.barbier@ge.com>
Subject: nand_flash_detect_onfi error
Message-ID: <5638E074.5070800@ge.com>
Date: Tue, 3 Nov 2015 16:27:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the file drivers/mtd/nand/nand_base.c, in function
nand_flash_detect_onfi  reading the ONFI data can be run up to 3 times
when there is a CRC error detected in the onfi data:

The function call chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1); is located
outside the first for loop:

chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
for (i = 0; i < 3; i++) {
	for (j = 0; j < sizeof(*p); j++)
		((uint8_t *)p)[j] = chip->read_byte(mtd);
	if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
			le16_to_cpu(p->crc)) {
		break;
	}
}

This results in a read beyond buffer error if the data have to be read
more than once.

This error can also be found in U-boot and barebox.
