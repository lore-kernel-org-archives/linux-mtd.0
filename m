Received: from ottawa-hs-64-26-171-227.s-ip.magma.ca ([64.26.171.227]
	helo=edgewater.ca)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2J31-0000F8-3u
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2004 20:32:24 -0400
From: Shamile Khan <shamile@edgewater.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1093998741.21592.22.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Tue, 31 Aug 2004 20:32:21 -0400
Content-Transfer-Encoding: 7bit
Subject: Support for Am29LV2562M NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am new to MTD so bear with me. I tried getting MTD sources (as of end
July) to autodetect Am29LV2562M chip in x32 mode (16M * 32-bit). 

This chip contains two Am29LV256M chips (16M * 16-bit). However it seems
that it cannot be modelled as two interleaved x16 chips. This is because
the data bits are connected as DQ0-7 (chip1), DQ8-15 (chip2), DQ16-23
(chip1) and DQ24-31 (chip2) i.e it alternates between chips for every
byte. As far as I understand, two x16 chips interleaved have the
configuration DQ0-DQ16 (chip 1), DQ17-31 (chip2). As a consequence, the
command sequences I require are of the form 0x0000XXXX instead of
0x00XX00XX (which MTD supports for interleaved flash chips as I verified
in another board). XX refers to the data part of the command e.g 98 for
CFI query. 

I am wondering if I am missing something here. Does MTD support the
flash geometry for Am29LV2562M? 

Thanks,
Shamile
-- 
Shamile Khan
Edgewater Computer Systems, Inc.
1125 Innovation Drive
(2nd Floor)
Kanata, Ontario, K2K 3G6
Tel: (613) 271-1101 ext. 240
Fax: (613) 271-1152
