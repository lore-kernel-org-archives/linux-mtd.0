Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142Vi0-00007j-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 09:45:24 +0000
Message-ID: <61855DF64794D41185DF00508BEEF7070DBA57@pc3.msys.co.il>
From: Vadim Khamlinsky <Vadimk@m-sys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: mtd@infradead.org, ollie@sis.com.tw, linuxbios@lanl.gov
Subject: RE: DiskOnChip 2000/Millennium driver merge. 
Date: Sun, 3 Dec 2000 11:45:59 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-8"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>Of course it works if I turn off CONFIG_MTD_DOCPROBE_55AA

Diskonchip 2000  always has 55aa signature at the beginning of 
the DiskOnChip window . DiskOnChip Millennium does not .
I'm not going to get into the hardware differences between these two
products . From the software point of view it depends on the DiskOnChip
Millennium low-level format .
If it was formatted with the following command :
  dformat /win:d000 /s:docxxx.exb  , then you should find 55AA signature .
If it was formatted as follows :
   dformat /win:d000 /s:docxxx.exb 

or docxxx.exb was somehow removed from the DiskOnChip Millennium
you will not see 55AA .
In short, don't depend on the 55aa probe when you work with
DiskOnChip-Millennium .

Regards,
Vadim  
 
  


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
