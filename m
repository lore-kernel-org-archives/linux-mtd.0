Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5HUX-0002b1-1L
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 13:00:49 +0000
Received: by wwb39 with SMTP id 39so1963398wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 06:00:47 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: renumber conflicting BBT flags
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
References: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 15:58:26 +0300
Message-ID: <1301576306.2828.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-18 at 21:53 -0700, Brian Norris wrote:
> The NAND_USE_FLASH_BBT_NO_OOB and NAND_CREATE_EMPTY_BBT flags conflict
> with the NAND_BBT_SCANBYTE1AND6 and NAND_BBT_DYNAMICSTRUCT flags,
> respectively. This change will allow us to utilize these options
> independently.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  include/linux/mtd/nand.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index ae67ef5..80b471b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -237,9 +237,9 @@ typedef enum {
>   * If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
>   * the OOB area.
>   */
> -#define NAND_USE_FLASH_BBT_NO_OOB	0x00100000
> +#define NAND_USE_FLASH_BBT_NO_OOB	0x00800000
>  /* Create an empty BBT with no vendor information if the BBT is available */
> -#define NAND_CREATE_EMPTY_BBT		0x00200000
> +#define NAND_CREATE_EMPTY_BBT		0x01000000

Hmm, it seems that the issue is that flags which belong to the same
"space" should be in a single file. AFAICS, we have 2 spaces:

1. Chip flags
2. BBT flags

They are 2 different things. But some of the flags are shared. And this
is quite subtle thing.

What I think we should do instead is to avoid sharing the same symbolic
constant between 2 different spaces. Is this possible?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
