Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CR86F-0003o7-EE
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 06:54:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by mailgate.sysgo.de (Postfix) with ESMTP id E723E47B87
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Nov 2004 12:50:15 +0100 (CET)
Received: from donald.sysgo.com (unknown [172.20.1.30])
	by mailgate.sysgo.de (Postfix) with ESMTP id DAEC847B87
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Nov 2004 12:50:15 +0100 (CET)
Received: from sysgo.de (aho-test1.sysgo.com [172.22.26.11])
	by donald.sysgo.com (Postfix) with ESMTP id 6B3A8C19D1
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Nov 2004 12:54:16 +0100 (CET)
Message-ID: <418F5E68.3010200@sysgo.de>
Date: Mon, 08 Nov 2004 12:54:16 +0100
From: Alexander Hoffmann <ahoffmann@sysgo.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Usage of MTD_UADDR_UNNECESSARY broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

can anybody please explain me the exact difference between 
MTD_UADDR_DONT_CARE and MTD_UADDR_UNNECESSARY .
Because if I use MTD_UADDR_UNNECESSARY an not existing field in the 
unlock_addrs array is beeing referenced
(/drivers/mtd/chips/jedec_probe.c, function cfi_jedec_setup, line 1740):

/* Mask out address bits which are smaller than the device type */
mask = ~(p_cfi->device_type-1);
p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;

If I change MTD_UADDR_DONT_CARE to MTD_UADDR_UNNECESSARY everything 
works fine!
