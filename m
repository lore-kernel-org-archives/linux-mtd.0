Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEhI-0006wa-IP
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:05:09 +0000
Received: by fxm14 with SMTP id 14so230379fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:05:06 -0700 (PDT)
Subject: Re: [PATCH 04/44] mtd: sst25l.c: use mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-5-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-5-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 12:00:49 +0300
Message-ID: <1307523649.31223.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
> Replace custom invocations of parse_mtd_partitions and mtd_device_register
> with common mtd_device_parse_register call. This would bring: standard
> handling of all errors, fallback to default partitions, etc.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/devices/sst25l.c |   32 ++++----------------------------
>  1 files changed, 4 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
> index cd095af..faa9d3b 100644
> --- a/drivers/mtd/devices/sst25l.c
> +++ b/drivers/mtd/devices/sst25l.c
> @@ -53,7 +53,6 @@ struct sst25l_flash {
>  	struct mutex		lock;
>  	struct mtd_info		mtd;
>  
> -	int 			partitioned;
>  };

How about removing the unneeded newline as well? :-)


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
