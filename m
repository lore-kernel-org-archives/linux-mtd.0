Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWPCf-0004gI-AH
 for linux-mtd@lists.infradead.org; Tue, 23 Sep 2014 12:28:21 +0000
Received: by mail-ig0-f181.google.com with SMTP id h18so4438192igc.2
 for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2014 05:28:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411338793-21245-1-git-send-email-hauke@hauke-m.de>
References: <1411338793-21245-1-git-send-email-hauke@hauke-m.de>
Date: Tue, 23 Sep 2014 14:27:59 +0200
Message-ID: <CACna6rw+DmGzKhg-YKot8n+w-cYt9XoPzcUc5eK42WnDbPU39g@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: only register partitions if the trx
 header was filled
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Woodhouse,
 David" <David.Woodhouse@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 September 2014 00:33, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 8057f52..c3f4454 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -168,18 +168,22 @@ static int bcm47xxpart_parse(struct mtd_info *maste=
r,
>                                 i++;
>                         }
>
> -                       bcm47xxpart_add_part(&parts[curr_part++], "linux"=
,
> -                                            offset + trx->offset[i], 0);
> -                       i++;
> +                       if (trx->offset[i]) {
> +                               bcm47xxpart_add_part(&parts[curr_part++],=
 "linux",
> +                                                    offset + trx->offset=
[i], 0);

You may at least move "linux" to the next line to don't exceed 80
chars limit. Same for "rootfs" below.

--=20
Rafa=C5=82
