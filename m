Received: from mail-ig0-f176.google.com ([209.85.213.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8Ufq-0007b6-2v
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 14:32:10 +0000
Received: by igblr2 with SMTP id lr2so14594691igb.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jun 2015 07:31:47 -0700 (PDT)
From: Brian Hill <brian@houston-radar.com>
Message-ID: <558D6251.1070603@houston-radar.com>
Date: Fri, 26 Jun 2015 08:31:45 -0600
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubifs_scan: corrupt empty space
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


One of our systems using Atmel ARM A5, Micron MT29F4G08ABADAWP -w- kernel 3.17 produced this error, which proved unrecoverable:

UBIFS error (pid 452): ubifs_scan: corrupt empty space at LEB 2670:125358
UBIFS error (pid 452): ubifs_scanned_corruption: corruption at LEB 2670:125358
UBIFS error (pid 452): ubifs_scanned_corruption: first 1618 bytes from LEB 2670:125358
00000000: fffffffd ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff

There have been various threads on this type of error over the years, such as:
http://lists.infradead.org/pipermail/linux-mtd/2012-January/039254.html

The most notable comment being:

> ubifs expect empty space to be protected by ecc. But if empty page ecc is not
> ff, this need hack in the nand driver.

I find that no, the atmel driver, unlike some others, doesn't attempt to "correct" erased pages which contain bit flips.
Is the driver still the preferred place to address this issue?  What if the erased space has more bit flips than the ECC strength of the device?  It seems like that block should simply be retired - it has no actual user data.  Will UBIFS handle this particular condition?

I thought I might try and answer "what would happen?" myself with the nandsim kernel module, but I find it can't provide bitflips in erased data - they are always simulated as "perfect".

Thanks for any input,
-Brian Hill
