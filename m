Received: from bm-1a.paradise.net.nz ([202.0.58.20]
	helo=linda-1.paradise.net.nz)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CF2kp-0004Ad-RU
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2004 23:46:17 -0400
Received: from smtp-1.paradise.net.nz (smtp-1b.paradise.net.nz [202.0.32.210])
	by linda-1.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0I5500FAT94VWT@linda-1.paradise.net.nz> for
	linux-mtd@lists.infradead.org; Wed, 06 Oct 2004 16:46:08 +1300 (NZDT)
Received: from hayes.bluewaternz.com
	(203-96-159-182.paradise.net.nz [203.96.159.182])	by
	smtp-1.paradise.net.nz
	(Postfix) with ESMTP id 0786D82977	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Oct 2004 16:46:07 +1300 (NZDT)
Received: from emma.bluewaternz.com ([192.168.2.44] helo=bluewatersys.com)
	by hayes.bluewaternz.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CF2ki-0003rt-00	for <linux-mtd@lists.infradead.org>; Wed,
	06 Oct 2004 16:46:08 +1300
Date: Wed, 06 Oct 2004 16:47:33 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <41636AD5.4020403@bluewatersys.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Subject: BUG in nand_base.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all, I have been playing with large size nand devices & have found 
what I think is a bug in nand_base.c::nand_command.  I have the latest 
daily snapshot.
Starting at line 546, there is the following code
                        /* One more address cycle for higher density 
devices */
                        if (this->chipsize & 0x0c000000)
                                this->write_byte(mtd, (unsigned char) 
((page_addr >> 16) & 0x0f));
Which will correctly trap the 4th write cycle for 64 & 128MiB parts, but 
not for larger sizes of 256 & 512 MiB.
In my code I have changed the line to read
                        if (this->chipsize & 0xfc000000)

Also, I noticed that for the large page devices (nand_command_lp) a 
proper compare (>) is used instead of a mask - should one of these be 
changed to make both functions consistant?

Cheers
Brad

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Brad Beveridge                           Bluewater Systems Ltd
Phone: +64 3 3779127 (Aus +1 800 148 751)       Level 17, 119 Armagh St
Fax:   +64 3 3779135                            PO Box 13889
Email: bbeveridge@bluewatersys.com              Christchurch
Web:   http://www.bluewatersys.com              New Zealand 
