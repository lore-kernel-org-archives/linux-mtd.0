Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e95Rh-0005Mb-3c
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 08:29:26 +0000
Date: Mon, 30 Oct 2017 09:28:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubi: fastmap: clean up the initialization of pointer p
Message-ID: <20171030092858.11100194@bbrezillon>
In-Reply-To: <20171029131426.6205-1-colin.king@canonical.com>
References: <20171029131426.6205-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 29 Oct 2017 13:14:26 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer p is being initialized with one value and a few lines
> later being set to a newer replacement value. Clean up the code by
> using the latter assignment to p as the initial value. Cleans up
> clang warning:
> 
> drivers/mtd/ubi/fastmap.c:217:19: warning: Value stored to 'p'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/fastmap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 5a832bc79b1b..9be4b94e83ad 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -214,9 +214,8 @@ static void assign_aeb_to_av(struct ubi_attach_info *ai,
>  			     struct ubi_ainf_volume *av)
>  {
>  	struct ubi_ainf_peb *tmp_aeb;
> -	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
> +	struct rb_node **p = &av->root.rb_node, *parent = NULL;
>  
> -	p = &av->root.rb_node;
>  	while (*p) {
>  		parent = *p;
>  
