Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Um1KG-0001UK-8b
 for linux-mtd@lists.infradead.org; Mon, 10 Jun 2013 12:35:56 +0000
Received: by mail-la0-f46.google.com with SMTP id eg20so5674216lab.19
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jun 2013 05:35:28 -0700 (PDT)
Message-ID: <51B5C80D.2030303@cogentembedded.com>
Date: Mon, 10 Jun 2013 16:35:25 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 6/6] mtd: ofpart: add compatible check for child nodes
References: <1370860014-1770-1-git-send-email-josh.wu@atmel.com>
 <1370860014-1770-7-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1370860014-1770-7-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello.

On 10-06-2013 14:26, Josh Wu wrote:

> If the child node has compatible property then it is a driver not partition.

> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>   drivers/mtd/ofpart.c |   14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)


> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 553d6d6..61ce1f8 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
[...]
> @@ -40,8 +44,13 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>   	/* First count the subnodes */
>   	pp = NULL;
>   	nr_parts = 0;
> -	while ((pp = of_get_next_child(node, pp)))
> +	while ((pp = of_get_next_child(node, pp))) {

    Assignment in *while*? Is scripts/checkpatch.pl happy about that?

> +		int len;

    Empty line wouldn't hurt here, after declaration.

> +		if (node_has_compatible(pp, &len))
> +			continue;
> +
>   		nr_parts++;
> +	}
>
>   	if (nr_parts == 0)
>   		return 0;

WBR, Sergei
