Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NxJm4-0001Yg-3b
	for linux-mtd@lists.infradead.org; Thu, 01 Apr 2010 12:45:28 +0000
Subject: Re: [PATCH] [mtd, nand] Remove stray endchoice from help text
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
In-Reply-To: <8763591d3w.fsf@tac.ki.iif.hu>
References: <8763591d3w.fsf@tac.ki.iif.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Apr 2010 15:43:00 +0300
Message-ID: <1270125780.15073.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-03-06 at 20:09 +0100, Ferenc Wagner wrote:
> Signed-off-by: Ferenc Wagner <wferi@niif.hu>
> ---
>  drivers/mtd/nand/Kconfig |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 677cd53..d68bd6e 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -358,8 +358,6 @@ config MTD_NAND_ATMEL_ECC_NONE
>  
>  	  If unsure, say N
>  
> -	  endchoice
> -
>  endchoice
>  
>  config MTD_NAND_PXA3xx

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
