Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZUFz-0006vk-Tn
 for linux-mtd@lists.infradead.org; Sat, 27 Feb 2016 02:05:21 +0000
Received: by mail-qg0-x233.google.com with SMTP id y89so79305668qge.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 18:04:59 -0800 (PST)
Date: Fri, 26 Feb 2016 23:04:53 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: Re: [PATCH v2 0/8] mtd: spi-nor: locking fixes and updates
Message-ID: <20160227020453.GA26571@laptop.cereza>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 29 Jan 11:25 AM, Brian Norris wrote:
> Hi,
> 
> These are an assortment of fixes and updates to the SPI NOR lock/unlock
> feature. The biggest new features are:
> (a) Status Register protection; I don't see why this shouldn't be enabled by
>     default. See patch 4's description.
> (b) Bottom-block protection support (via TB status bit)
> (c) Lock/unlock support for a few Winbond flash
> 
> Since v1:
>  * patches 3 and 7 are somewhat rewritten versions of patches 2 and 7 in v1
>  * fix up several corner cases, seen in some local tests (poor, slow shell
>    script appended)
>  * remove SR protection (SR_SRWD) when unlocking the entire flash
> 
> Regards,
> Brian
> 
> Brian Norris (8):
>   mtd: spi-nor: wait for SR_WIP to clear on initial unlock
>   mtd: spi-nor: silently drop lock/unlock for already locked/unlocked
>     region
>   mtd: spi-nor: make lock/unlock bounds checks more obvious and robust
>   mtd: spi-nor: disallow further writes to SR if WP# is low
>   mtd: spi-nor: use BIT() for flash_info flags
>   mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
>   mtd: spi-nor: add TB (Top/Bottom) protect support
>   mtd: spi-nor: support lock/unlock for a few Winbond chips
> 
>  drivers/mtd/spi-nor/spi-nor.c | 195 ++++++++++++++++++++++++++++++++++--------
>  include/linux/mtd/spi-nor.h   |   2 +
>  2 files changed, 159 insertions(+), 38 deletions(-)
> 
> 
> Appending badly-written shell test script. Requires latest mtd-utils
> (flash_lock / flash_unlock).
> 

Thanks for the cool script. I've tested it on Armada XP GP board,
which has a n25q128a13 flash. Tests passed, the results are
attached.

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=spi-nor-locktest

# /locktest.sh 
MTD #: 0
/dev/mtd0: unlocked device
/dev/mtd0: verified lock status 0 256 0
/dev/mtd0: locking upper half
/dev/mtd0: verified lock status 8388608 128 1
/dev/mtd0: verified lock status 0 128 0
/dev/mtd0: relocking 4th quadrant
/dev/mtd0: verified lock status 8388608 128 1
/dev/mtd0: verified lock status 0 128 0
/dev/mtd0: relocking ranges
/dev/mtd0: Range: 8388608 0
/dev/mtd0: Range: 8388608 7
/dev/mtd0: Range: 8388608 14
/dev/mtd0: Range: 8388608 21
/dev/mtd0: Range: 8388608 28
/dev/mtd0: Range: 8388608 35
/dev/mtd0: Range: 8388608 42
/dev/mtd0: Range: 8388608 49
/dev/mtd0: Range: 8388608 56
/dev/mtd0: Range: 8388608 63
/dev/mtd0: Range: 8388608 70
/dev/mtd0: Range: 8388608 77
/dev/mtd0: Range: 8388608 84
/dev/mtd0: Range: 8388608 91
/dev/mtd0: Range: 8388608 98
/dev/mtd0: Range: 8388608 105
/dev/mtd0: Range: 8388608 112
/dev/mtd0: Range: 8388608 119
/dev/mtd0: Range: 8388608 126
/dev/mtd0: Range: 8716288 0
/dev/mtd0: Range: 8716288 7
/dev/mtd0: Range: 8716288 14
/dev/mtd0: Range: 8716288 21
/dev/mtd0: Range: 8716288 28
/dev/mtd0: Range: 8716288 35
/dev/mtd0: Range: 8716288 42
/dev/mtd0: Range: 8716288 49
/dev/mtd0: Range: 8716288 56
/dev/mtd0: Range: 8716288 63
/dev/mtd0: Range: 8716288 70
/dev/mtd0: Range: 8716288 77
/dev/mtd0: Range: 8716288 84
/dev/mtd0: Range: 8716288 91
/dev/mtd0: Range: 8716288 98
/dev/mtd0: Range: 8716288 105
/dev/mtd0: Range: 8716288 112
/dev/mtd0: Range: 8716288 119
/dev/mtd0: Range: 9043968 0
/dev/mtd0: Range: 9043968 7
/dev/mtd0: Range: 9043968 14
/dev/mtd0: Range: 9043968 21
/dev/mtd0: Range: 9043968 28
/dev/mtd0: Range: 9043968 35
/dev/mtd0: Range: 9043968 42
/dev/mtd0: Range: 9043968 49
/dev/mtd0: Range: 9043968 56
/dev/mtd0: Range: 9043968 63
/dev/mtd0: Range: 9043968 70
/dev/mtd0: Range: 9043968 77
/dev/mtd0: Range: 9043968 84
/dev/mtd0: Range: 9043968 91
/dev/mtd0: Range: 9043968 98
/dev/mtd0: Range: 9043968 105
/dev/mtd0: Range: 9043968 112
/dev/mtd0: Range: 9371648 0
/dev/mtd0: Range: 9371648 7
/dev/mtd0: Range: 9371648 14
/dev/mtd0: Range: 9371648 21
/dev/mtd0: Range: 9371648 28
/dev/mtd0: Range: 9371648 35
/dev/mtd0: Range: 9371648 42
/dev/mtd0: Range: 9371648 49
/dev/mtd0: Range: 9371648 56
/dev/mtd0: Range: 9371648 63
/dev/mtd0: Range: 9371648 70
/dev/mtd0: Range: 9371648 77
/dev/mtd0: Range: 9371648 84
/dev/mtd0: Range: 9371648 91
/dev/mtd0: Range: 9371648 98
/dev/mtd0: Range: 9371648 105
/dev/mtd0: Range: 9371648 112
/dev/mtd0: Range: 9699328 0
/dev/mtd0: Range: 9699328 7
/dev/mtd0: Range: 9699328 14
/dev/mtd0: Range: 9699328 21
/dev/mtd0: Range: 9699328 28
/dev/mtd0: Range: 9699328 35
/dev/mtd0: Range: 9699328 42
/dev/mtd0: Range: 9699328 49
/dev/mtd0: Range: 9699328 56
/dev/mtd0: Range: 9699328 63
/dev/mtd0: Range: 9699328 70
/dev/mtd0: Range: 9699328 77
/dev/mtd0: Range: 9699328 84
/dev/mtd0: Range: 9699328 91
/dev/mtd0: Range: 9699328 98
/dev/mtd0: Range: 9699328 105
/dev/mtd0: Range: 10027008 0
/dev/mtd0: Range: 10027008 7
/dev/mtd0: Range: 10027008 14
/dev/mtd0: Range: 10027008 21
/dev/mtd0: Range: 10027008 28
/dev/mtd0: Range: 10027008 35
/dev/mtd0: Range: 10027008 42
/dev/mtd0: Range: 10027008 49
/dev/mtd0: Range: 10027008 56
/dev/mtd0: Range: 10027008 63
/dev/mtd0: Range: 10027008 70
/dev/mtd0: Range: 10027008 77
/dev/mtd0: Range: 10027008 84
/dev/mtd0: Range: 10027008 91
/dev/mtd0: Range: 10027008 98
/dev/mtd0: Range: 10354688 0
/dev/mtd0: Range: 10354688 7
/dev/mtd0: Range: 10354688 14
/dev/mtd0: Range: 10354688 21
/dev/mtd0: Range: 10354688 28
/dev/mtd0: Range: 10354688 35
/dev/mtd0: Range: 10354688 42
/dev/mtd0: Range: 10354688 49
/dev/mtd0: Range: 10354688 56
/dev/mtd0: Range: 10354688 63
/dev/mtd0: Range: 10354688 70
/dev/mtd0: Range: 10354688 77
/dev/mtd0: Range: 10354688 84
/dev/mtd0: Range: 10354688 91
/dev/mtd0: Range: 10682368 0
/dev/mtd0: Range: 10682368 7
/dev/mtd0: Range: 10682368 14
/dev/mtd0: Range: 10682368 21
/dev/mtd0: Range: 10682368 28
/dev/mtd0: Range: 10682368 35
/dev/mtd0: Range: 10682368 42
/dev/mtd0: Range: 10682368 49
/dev/mtd0: Range: 10682368 56
/dev/mtd0: Range: 10682368 63
/dev/mtd0: Range: 10682368 70
/dev/mtd0: Range: 10682368 77
/dev/mtd0: Range: 10682368 84
/dev/mtd0: Range: 10682368 91
/dev/mtd0: Range: 11010048 0
/dev/mtd0: Range: 11010048 7
/dev/mtd0: Range: 11010048 14
/dev/mtd0: Range: 11010048 21
/dev/mtd0: Range: 11010048 28
/dev/mtd0: Range: 11010048 35
/dev/mtd0: Range: 11010048 42
/dev/mtd0: Range: 11010048 49
/dev/mtd0: Range: 11010048 56
/dev/mtd0: Range: 11010048 63
/dev/mtd0: Range: 11010048 70
/dev/mtd0: Range: 11010048 77
/dev/mtd0: Range: 11010048 84
/dev/mtd0: Range: 11337728 0
/dev/mtd0: Range: 11337728 7
/dev/mtd0: Range: 11337728 14
/dev/mtd0: Range: 11337728 21
/dev/mtd0: Range: 11337728 28
/dev/mtd0: Range: 11337728 35
/dev/mtd0: Range: 11337728 42
/dev/mtd0: Range: 11337728 49
/dev/mtd0: Range: 11337728 56
/dev/mtd0: Range: 11337728 63
/dev/mtd0: Range: 11337728 70
/dev/mtd0: Range: 11337728 77
/dev/mtd0: Range: 11665408 0
/dev/mtd0: Range: 11665408 7
/dev/mtd0: Range: 11665408 14
/dev/mtd0: Range: 11665408 21
/dev/mtd0: Range: 11665408 28
/dev/mtd0: Range: 11665408 35
/dev/mtd0: Range: 11665408 42
/dev/mtd0: Range: 11665408 49
/dev/mtd0: Range: 11665408 56
/dev/mtd0: Range: 11665408 63
/dev/mtd0: Range: 11665408 70
/dev/mtd0: Range: 11665408 77
/dev/mtd0: Range: 11993088 0
/dev/mtd0: Range: 11993088 7
/dev/mtd0: Range: 11993088 14
/dev/mtd0: Range: 11993088 21
/dev/mtd0: Range: 11993088 28
/dev/mtd0: Range: 11993088 35
/dev/mtd0: Range: 11993088 42
/dev/mtd0: Range: 11993088 49
/dev/mtd0: Range: 11993088 56
/dev/mtd0: Range: 11993088 63
/dev/mtd0: Range: 11993088 70
/dev/mtd0: Range: 12320768 0
/dev/mtd0: Range: 12320768 7
/dev/mtd0: Range: 12320768 14
/dev/mtd0: Range: 12320768 21
/dev/mtd0: Range: 12320768 28
/dev/mtd0: Range: 12320768 35
/dev/mtd0: Range: 12320768 42
/dev/mtd0: Range: 12320768 49
/dev/mtd0: Range: 12320768 56
/dev/mtd0: Range: 12320768 63
/dev/mtd0: Range: 12648448 0
/dev/mtd0: Range: 12648448 7
/dev/mtd0: Range: 12648448 14
/dev/mtd0: Range: 12648448 21
/dev/mtd0: Range: 12648448 28
/dev/mtd0: Range: 12648448 35
/dev/mtd0: Range: 12648448 42
/dev/mtd0: Range: 12648448 49
/dev/mtd0: Range: 12648448 56
/dev/mtd0: Range: 12976128 0
/dev/mtd0: Range: 12976128 7
/dev/mtd0: Range: 12976128 14
/dev/mtd0: Range: 12976128 21
/dev/mtd0: Range: 12976128 28
/dev/mtd0: Range: 12976128 35
/dev/mtd0: Range: 12976128 42
/dev/mtd0: Range: 12976128 49
/dev/mtd0: Range: 12976128 56
/dev/mtd0: Range: 13303808 0
/dev/mtd0: Range: 13303808 7
/dev/mtd0: Range: 13303808 14
/dev/mtd0: Range: 13303808 21
/dev/mtd0: Range: 13303808 28
/dev/mtd0: Range: 13303808 35
/dev/mtd0: Range: 13303808 42
/dev/mtd0: Range: 13303808 49
/dev/mtd0: Range: 13631488 0
/dev/mtd0: Range: 13631488 7
/dev/mtd0: Range: 13631488 14
/dev/mtd0: Range: 13631488 21
/dev/mtd0: Range: 13631488 28
/dev/mtd0: Range: 13631488 35
/dev/mtd0: Range: 13631488 42
/dev/mtd0: Range: 13959168 0
/dev/mtd0: Range: 13959168 7
/dev/mtd0: Range: 13959168 14
/dev/mtd0: Range: 13959168 21
/dev/mtd0: Range: 13959168 28
/dev/mtd0: Range: 13959168 35
/dev/mtd0: Range: 13959168 42
/dev/mtd0: Range: 14286848 0
/dev/mtd0: Range: 14286848 7
/dev/mtd0: Range: 14286848 14
/dev/mtd0: Range: 14286848 21
/dev/mtd0: Range: 14286848 28
/dev/mtd0: Range: 14286848 35
/dev/mtd0: Range: 14614528 0
/dev/mtd0: Range: 14614528 7
/dev/mtd0: Range: 14614528 14
/dev/mtd0: Range: 14614528 21
/dev/mtd0: Range: 14614528 28
/dev/mtd0: Range: 14942208 0
/dev/mtd0: Range: 14942208 7
/dev/mtd0: Range: 14942208 14
/dev/mtd0: Range: 14942208 21
/dev/mtd0: Range: 15269888 0
/dev/mtd0: Range: 15269888 7
/dev/mtd0: Range: 15269888 14
/dev/mtd0: Range: 15269888 21
/dev/mtd0: Range: 15597568 0
/dev/mtd0: Range: 15597568 7
/dev/mtd0: Range: 15597568 14
/dev/mtd0: Range: 15925248 0
/dev/mtd0: Range: 15925248 7
/dev/mtd0: Range: 16252928 0
/dev/mtd0: Range: 16252928 7
/dev/mtd0: Range: 16580608 0
/dev/mtd0: verified lock status 8388608 128 1
/dev/mtd0: verified lock status 0 128 0
/dev/mtd0: unlocking 3rd quadrant
/dev/mtd0: verified lock status 12582912 64 1
/dev/mtd0: verified lock status 0 192 0
/dev/mtd0: unlocking 1st quadrant (again)
/dev/mtd0: verified lock status 12582912 64 1
/dev/mtd0: verified lock status 0 192 0
/dev/mtd0: unlocking 4th quadrant
/dev/mtd0: verified lock status 0 256 0
/dev/mtd0: locking 1st half
/dev/mtd0: verified lock status 0 128 1
/dev/mtd0: verified lock status 8388608 128 0
flash_unlock: error!: could not unlock device: /dev/mtd0

              error 22 (Invalid argument)
/dev/mtd0: saw error, expected
/dev/mtd0: verified lock status 0 128 1
/dev/mtd0: verified lock status 8388608 128 0
/dev/mtd0: unlocking 2nd quadrant
/dev/mtd0: verified lock status 0 64 1
/dev/mtd0: verified lock status 4194304 192 0
/dev/mtd0: unlocking top 3 quadrants (again)
/dev/mtd0: verified lock status 0 64 1
/dev/mtd0: verified lock status 4194304 192 0
/dev/mtd0: test complete


--tThc/1wpZn/ma/RB--
