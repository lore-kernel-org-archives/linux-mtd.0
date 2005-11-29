Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh7WB-0004TT-5X
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 15:35:43 +0000
Date: Tue, 29 Nov 2005 16:35:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-ID: <20051129153542.GA1904@wohnheim.fh-wedel.de>
References: <20051129180659.6f872e14.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20051129180659.6f872e14.vwool@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD ioctl interface rework to get rid of
	MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 November 2005 18:06:59 +0300, Vitaly Wool wrote:
> diff -uNr linux-2.6.10.orig/include/mtd/mtd-abi.h linux-2.6.10.nand/include/mtd/mtd-abi.h
> --- linux-2.6.10.orig/include/mtd/mtd-abi.h	2005-11-24 15:58:49.000000000 +0300
> +++ linux-2.6.10.nand/include/mtd/mtd-abi.h	2005-11-28 17:03:12.000000000 +0300
> @@ -102,8 +102,7 @@
>  #define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
>  #define MEMGETREGIONCOUNT	_IOR('M', 7, int)
>  #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
> -#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
> -#define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
> +#define MEMGETOOBAVAIL		_IOR('M', 10, uint32_t)
>  #define MEMGETBADBLOCK		_IOW('M', 11, loff_t)
>  #define MEMSETBADBLOCK		_IOW('M', 12, loff_t)
>  #define OTPSELECT		_IOR('M', 13, int)

You really don't want to reuse an old ioctl().  Even removing the code
to handle an old number breaks binary compatibility.  But changing the
behaviour will result in silent breakage.

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
