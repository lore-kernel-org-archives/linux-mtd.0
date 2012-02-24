Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S0vZ8-0000zw-LX
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 13:52:07 +0000
Message-ID: <4F479601.9010605@parrot.com>
Date: Fri, 24 Feb 2012 14:52:01 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Patrick <kpa_info@yahoo.fr>
Subject: Re: UBI: infinite error loop
References: <1330090528.12272.YahooMailNeo@web29011.mail.ird.yahoo.com>
In-Reply-To: <1330090528.12272.YahooMailNeo@web29011.mail.ird.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patrick a écrit :
> Dear mailing-list,
> 
> I am still trying to use UBI and UBIFS on my board running a 3.0.21 kernel.
> 
> When I am doing an the ubiattach -p /dev/mtd4 command I have the following infinite error loop:
> 
> 
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes from PEB 4059:512, read 512 bytes
> UBI warning: ubi_io_read_vid_hdr: bad CRC at PEB 4059, calculated 0x9f1c9c0d, read 0x9f1c1c0d
> UBI warning: ubi_eba_copy_leb: error 4 while reading VID header back from PEB 4059
> UBI: run torture test for PEB 4059
> UBI: PEB 4059 passed torture test, do not mark it as bad
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes from PEB 4059:512, read 512 bytes
> UBI: run torture test for PEB 4059
> UBI: PEB 4059 passed torture test, do not mark it as bad
> UBI warning: ubi_io_read_vid_hdr: bad CRC at PEB 4059, calculated 0x42cdb8ed, read 0xff402946
> UBI warning: ubi_eba_copy_leb: error 4 while reading VID header back from PEB 4059
> UBI: run torture test for PEB 4059
> UBI: PEB 4059 passed torture test, do not mark it as bad
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes from PEB 4059:512, read 512 bytes
> UBI: run torture test for PEB 4059
> .....
> 
> 
> I don't think it's normal that this error loop infinitely again and again...
> 
> Any help is appreciated !
> 
> Thanks in advance
> 
What's your nand driver ?
What's your nand device ?

Look like it doesn't handle subpage reading : you have ecc error when reading
512 bytes at offset 512.

Maybe you should pass -O 2048 to ubiattach
