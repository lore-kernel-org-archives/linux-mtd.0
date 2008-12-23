Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=vm-dmz.priv.inaccessnetworks.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LF6LD-0004dM-1T
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2008 12:26:27 +0000
Received: from bender.priv.inaccessnetworks.com ([192.168.1.223])
	by vm-dmz.priv.inaccessnetworks.com with esmtp (Exim 4.69)
	(envelope-from <knakos@inaccessnetworks.com>) id 1LF6LB-0001Go-J2
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2008 14:26:25 +0200
Message-ID: <4950D8EA.7010905@inaccessnetworks.com>
Date: Tue, 23 Dec 2008 14:26:18 +0200
From: Kostas Nakos <knakos@inaccessnetworks.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ndfc driver
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list,

with respect to Sean's updated patch ( 
http://lists.infradead.org/pipermail/linux-mtd/2008-December/023932.html 
) of the ndfc driver:

We are using an AMCC PPC440EPx based board which requires the ndfc 
driver to handle the nand memory. We have encountered 2 problems with 
this latest patch:

1) Kernel oops after of_iomap() of ndfc_probe(). The external nand 
memory is bound to chip select 0. The respective dts "reg" line was 'reg 
= <0 d0000000 2000>;'. Using chip selects greater than zero do not crash 
the kernel.

2) Byte order wrong in ndfc_calculate_ecc(). ecc_code[0] and ecc_code[1] 
have been exchanged in this version of the patch which lead to ecc 
errors being reported during mounting (and of course, a failed mount 
operation).

These problems have been solved: (1) -hackish way- by using a dts line 
like this 'reg = <1 d0000000 2000>;' and calculating the chip select in 
ndfc_probe() like this 'ndfc->chip_select = reg[0] - 1;'. (2) has been 
fixed by returning to the previous byte order of ecc_code.

Cheers,
Kostas
