Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1Xh4-0005AK-Gh
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 07:07:08 +0000
Received: by weyr3 with SMTP id r3so875351wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2012 00:07:02 -0700 (PDT)
Date: Wed, 15 Aug 2012 10:06:55 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: kill MTD_NAND_VERIFY_WRITE
Message-ID: <20120815100655.479e2c39@pixies.home.jungo.com>
In-Reply-To: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
References: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, 14 Aug 2012 22:38:45 -0400 Huang Shijie <shijie8@gmail.com> wrote:
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 588e989..0ca7257 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -22,15 +22,6 @@ menuconfig MTD_NAND
>  
>  if MTD_NAND
>  
> -config MTD_NAND_VERIFY_WRITE
> -	bool "Verify NAND page writes"
> -	help
> -	  This adds an extra check when data is written to the flash. The
> -	  NAND flash device internally checks only bits transitioning
> -	  from 1 to 0. There is a rare possibility that even though the
> -	  device thinks the write was successful, a bit could have been
> -	  flipped accidentally due to device wear or something else.
> -

There are some defconfig files which set CONFIG_MTD_NAND_VERIFY_WRITE.

I guess you should submit an accompanying patch that removes
CONFIG_MTD_NAND_VERIFY_WRITE from all defconfig files.

(also, trimmed the CC list for this specific discussion, seems unrelated
to all of the parties)

Regards,
Shmulik
