Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJDP1-0004kn-6n
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 12:29:15 -0400
Message-ID: <42540E53.8080109@ieee.org>
Date: Wed, 06 Apr 2005 12:29:07 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>	<42527DD5.4080009@infocell-its.com>	<4252EC5D.4090806@ieee.org>	<4253D280.6090308@infocell-its.com>	<4253D61C.6010109@infocell-its.com>
	<4253E056.5050603@ieee.org> <4253F6C2.1080105@infocell-its.com>
In-Reply-To: <4253F6C2.1080105@infocell-its.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zeri Virgo wrote:

> mtd.type = MTD_NANDFLASH
> mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB | MTD_ECC
> mtd.size = 67108864 (64M)
> mtd.erasesize = 16384 (16K)
> mtd.oobblock = 512
> mtd.oobsize = 16
> mtd.ecctype = (unknown ECC type - new MTD API maybe?)
> regions = 0


Looks fine.

> This may be useless, but I did a nanddump of the first 0x208000 bytes.
> 0x00 to 0xff -> data
>
> Then each of the following chunks of data (ie, not chunks of ff) are 
> preceeded by OOB Data
> (eg,
>   OOB Data: 36 7f eb 1f 3b aa ff ff ff ff ff ff ff ff ff ff
> 0x000000200: 0e cd...)
>
> 0x200 to 0x2ff -> data
> 0x400 to 0x43a -> data
> 0x600 to 0x629 -> data
> 0x800 to 0x8ff -> data
> 0xa00 to 0xa75 -> data
>
> Then a large chunk (1144949 bytes)
> 0xc00 to 0x119075 -> data
>
> Some mysterious OOB Data before 0x119200, though no normal data 
> following it.
>
> Then the rest is blank.


Sounds right, at first glance.  The OOB data actually follows each block 
(perhaps that's just a terminology issue :) )

    -Dan
