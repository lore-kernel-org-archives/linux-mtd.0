Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NxJWo-0006Yr-5b
	for linux-mtd@lists.infradead.org; Thu, 01 Apr 2010 12:29:43 +0000
Subject: Re: [PATCH] [mtd, nandsim] Fix typo: struct nandsin_geometry
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
In-Reply-To: <87aaul1d67.fsf@tac.ki.iif.hu>
References: <87aaul1d67.fsf@tac.ki.iif.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Apr 2010 15:27:22 +0300
Message-ID: <1270124842.15073.61.camel@localhost>
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

On Sat, 2010-03-06 at 20:08 +0100, Ferenc Wagner wrote:
> Actually, this embedded struct (together with nandsim_regs) could as well
> remain nameless...
> 
> Signed-off-by: Ferenc Wagner <wferi@niif.hu>
> ---
>  drivers/mtd/nand/nandsim.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 7281000..803ae12 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -312,7 +312,7 @@ struct nandsim {
>  	union ns_mem buf;
>  
>  	/* NAND flash "geometry" */
> -	struct nandsin_geometry {
> +	struct nandsim_geometry {
>  		uint64_t totsz;     /* total flash size, bytes */
>  		uint32_t secsz;     /* flash sector (erase block) size, bytes */
>  		uint pgsz;          /* NAND flash page size, bytes */

Instead of taking your patch, I've made this structure anonymous as well
as few other structures. See
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/833ba5e74a8b141ea7d7b318d6ac8c112659efa6

I've referred you as the person who suggested the change.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
