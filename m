Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FRem-0002JC-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 02:31:16 +0100
Message-ID: <3977A767.EB4AEA86@sis.com.tw>
Date: Fri, 21 Jul 2000 09:29:11 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Adi Linden <adi@adis.on.ca>, Trevor Woolven <trevw@zentropix.com>,
        Matt Hortman <mbhortman@ieee.org>, mtd@infradead.org
Subject: Re: building M-Sys DOC driver as a module
References: <Pine.LNX.4.10.10007201601430.1064-100000@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=big5
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> Modular drivers and initrd are a horrible waste of space in an embedded
> system, IMO. Far better to cut out module support completely, and even
> also block device support, putting JFFS on the DiskOnChip instead of NFTL.
> 
> The free driver isn't far off being usable in production - there's not a
> lot to do, it's just that I haven't had time to do it. Patrick is close to
> having ECC support, now we just need to properly thread the NFTL code and
> make it deal correctly with bad blocks, and for better efficiency, stick
> in the state handling for the individual flash chips, like I did for the
> CFI chips.
> 
> Trevor - Did I miss something of the TODO list that we drew up?
> 

David,
	I think we will have ext2 on NFTL on DoC Millennium configuration
for LinuxBIOS project so I am also working on revisiting the nftl.c Could
you please send me your TODO list on NFTL stuff ??

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
