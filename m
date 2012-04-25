Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SN6w5-00024O-PP
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 18:27:32 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips;
 mtd_read() returns -EUCLEAN
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
Date: Wed, 25 Apr 2012 20:27:18 +0200
In-Reply-To: <1335295105-7981-8-git-send-email-mikedunn@newsguy.com> (Mike
 Dunn's message of "Tue, 24 Apr 2012 12:18:25 -0700")
Message-ID: <871unbis55.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

One little trick with docg3 patch part:
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 3414031..7644d59 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -948,7 +949,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
>  			}
>  			if (ret > 0) {
>  				mtd->ecc_stats.corrected += ret;
> -				ret = -EUCLEAN;
> +				max_bitflips = max(max_bitflips, ret);
> +				ret = max_bitflips;
>  			}
>  		}

If you do set ret here, the next loop you'll do in the following statement
"	while (!ret && (len > 0 || ooblen > 0)) {" will exit because ret is not
0.

I think you should change :
>- 	while (!ret && (len > 0 || ooblen > 0)) {" will exit because ret is not
into
>- 	while (ret >= 0 && (len > 0 || ooblen > 0)) {".

With that change, please add my:
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert

PS: It's really a great work that bitflip serie
