Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8mR6-000654-83
 for linux-mtd@lists.infradead.org; Sat, 27 Jun 2015 09:30:09 +0000
Message-ID: <558E6CD5.70201@huawei.com>
Date: Sat, 27 Jun 2015 17:28:53 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Brian Hill <brian@houston-radar.com>, <linux-mtd@lists.infradead.org>
Subject: Re: ubifs_scan: corrupt empty space
References: <558D6251.1070603@houston-radar.com>
In-Reply-To: <558D6251.1070603@houston-radar.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 6/26/2015 10:31 PM, Brian Hill wrote:
> 
> One of our systems using Atmel ARM A5, Micron MT29F4G08ABADAWP -w- kernel 3.17 produced this error, which proved unrecoverable:
> 
> UBIFS error (pid 452): ubifs_scan: corrupt empty space at LEB 2670:125358
> UBIFS error (pid 452): ubifs_scanned_corruption: corruption at LEB 2670:125358
> UBIFS error (pid 452): ubifs_scanned_corruption: first 1618 bytes from LEB 2670:125358
> 00000000: fffffffd ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
> 
> There have been various threads on this type of error over the years, such as:
> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039254.html
> 
> The most notable comment being:
> 
>> ubifs expect empty space to be protected by ecc. But if empty page ecc is not
>> ff, this need hack in the nand driver.
> 
> I find that no, the atmel driver, unlike some others, doesn't attempt to "correct" erased pages which contain bit flips.
> Is the driver still the preferred place to address this issue?  What if the erased space has more bit flips than the ECC strength of the device?  It seems like that block should simply be retired - it has no actual user data.  Will UBIFS handle this particular condition?
> 
> I thought I might try and answer "what would happen?" myself with the nandsim kernel module, but I find it can't provide bitflips in erased data - they are always simulated as "perfect".
Nandsim can generate bitflips by setting bitflips=n. Then read will set a random
bitflip in the read buffer. But this does not always happen. You can read do_bit_flips()
in drivers/mtd/nand/nandsim.c and you will see that only if (bitflips && prandom_u32() < (1<<22)),
(but "prandom_u32() < (1 << 22)" seems unlikely happen) bitflip is generated. So if you
would like to make bitflip likely happen, you could change the condition.

thanks,
Sheng
> 
> Thanks for any input,
> -Brian Hill
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
