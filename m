Received: from www2.levante.de ([212.101.151.130] helo=www.levante.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dawt8-0000TF-TT
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 10:29:42 -0400
Received: from pd95b6420.dip0.t-ipconnect.de ([217.91.100.32]
	helo=mail.fsforth.de)
	by www.levante.de with asmtp (Exim 3.36 #1 (Debian))
	id 1Dawt5-00030O-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 May 2005 16:29:35 +0200
Received: from onyx.fsforth.de ([192.168.40.175] ident=jdietsch)
	by mail.fsforth.de with esmtp (Exim 4.50) id 1Dawt1-0005xA-Mt
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 16:29:31 +0200
Message-ID: <42948BE6.1010400@fsforth.de>
Date: Wed, 25 May 2005 16:29:58 +0200
From: Jonas <jdietsche@fsforth.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nand write problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I try to write some files within linux to my flash. But I always get the 
message
nand_write_ecc: Attempt to write not page aligned data
cp: Write Error: Invalid argument

This is my environment:
linux kernel 2.6.11
mtd-snapshot-20050524.tar.bz2
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 
3,3V 8-bit)

What I'm doing wrong?

Thanks for your help.
Jonas
