Received: from fw1-bv.tek.com ([192.65.40.16])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mvyu-0006H3-4r
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 21:32:36 +0100
Received: from tektronix.tek.com (tektronix.tek.com [128.181.6.43])
	by fw1-bv.tek.com with ESMTP id h52KWjkL024606
	for <linux-mtd@lists.infradead.org>;
	Mon, 2 Jun 2003 13:32:45 -0700 (PDT)
Received: from us-bv-u16.global.tektronix.net (us-bv-u16.bv.tek.com
	[128.181.2.45])
	by tektronix.tek.com (8.11.6+Sun/8.11.6) with SMTP id h52KWiW15514
	for <linux-mtd@lists.infradead.org>;
	Mon, 2 Jun 2003 13:32:44 -0700 (PDT)
Message-ID: <212D7E61C1F7D511B9270002A507DE7D24B628@us-bv-m10.bv.tek.com>
From: carolyn.j.smith@exgate.tek.com
To: linux-mtd@lists.infradead.org
Date: Mon, 2 Jun 2003 13:32:44 -0700 
MIME-Version: 1.0
Content-Type: text/plain
Subject: 4 AM29LV800B's in 16-bit mode?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My board (Wind River's SBC8240) has 4 AM29LV800B chips in 16-bit mode
(verified that BYTE# is high using a scope) with buswidth 64 bits for a
total of 4 MB.

I am using the "jedec_probe" code. With the buswidth set to 8, the chips are
not detected at all. 

With the buswidth set to 4, the chips are recognized as long as I modify the
unlock addresses to be MTD_UADDR_DONT_CARE instead of
MTD_UADDR_0x0AAA_0x0555 and MTD_UADDR_0x0555_0x02AA but erasing the
resulting device fails in do_erase_oneblock. 

Any suggestions?

Carolyn
