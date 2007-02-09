From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45CAF583.8000709@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Invalidate bufferRAM after erase
Date: Fri, 9 Feb 2007 09:16:43 +0900
Message-ID: <002f01c74bdf$98098760$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45CAF583.8000709@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

I checked it with pagetest module. Without the patch it failed.
I have two minor comments. 

Thank you,
Kyungmin Park

>  /**
> + * onenand_invalidate_bufferram_range - [GENERIC] Invalidate 
> BufferRAM information
> + * @param mtd		MTD data structure
> + * @param addr		start address to invalidate
> + * @param len		length to invalidate
> + *
> + * Invalidate BufferRAM information
> + */
> +static void onenand_invalidate_bufferram_range(struct 
> mtd_info *mtd, loff_t addr,
> +		unsigned int len)

It's name too long even though it invalidate with some range.
How about just call "onenand_invalidate_bufferram"?

> +/**
>   * onenand_get_device - [GENERIC] Get chip for selected access
>   * @param mtd		MTD device structure
>   * @param new_state	the state which is requested
> @@ -1466,6 +1489,8 @@ static int onenand_erase(struct mtd_info
>  			goto erase_exit;
>  		}
>  
> +		onenand_invalidate_bufferram_range(mtd, addr, 
> block_size);
> +
>  		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);

Place onenand_invalidate_bufferram_range here
Since erase command takes a long time, 2msec so we overlap the some cpu
works and onenand physicall works between command and wait.

>  
>  		ret = this->wait(mtd, FL_ERASING);
