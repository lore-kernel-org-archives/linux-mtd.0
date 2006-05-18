Received: from 203-167-215-14.dsl.clear.net.nz ([203.167.215.14]
	helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgqFr-0003K3-5q
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 17:42:03 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Date: Fri, 19 May 2006 09:43:03 +1200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605190943.03913.manningc2@actrix.gen.nz>
Subject: Why are there 2 oobinfos for a NAND mtd?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are both mtd->oobinfo and
((struct nand_chip *)mtd->priv)->autooob.

There's even a memcpy from one to the other. If they're supposed to be the 
same all the time, surely there should only be one of these?

They both get used in nand_base, which is perhaps wrong. For example, 
nand_read_ecc() uses mtd->oobinfo and nand_do_read_ecc() uses the other one.

Having two gets confusing and I have seen drivers where one has been  hacked 
one but not the other  which has lead to inconsistencies and faailures.

Is there any valid reason to have two?

-- Charles
