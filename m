Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dX4HF-0004V3-M7
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 11:33:27 +0000
Received: by mail-qt0-x244.google.com with SMTP id v31so17782260qtb.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 04:33:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170712042304.19745-2-cyrilbur@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
 <20170712042304.19745-2-cyrilbur@gmail.com>
From: Frans Klaver <fransklaver@gmail.com>
Date: Mon, 17 Jul 2017 13:33:03 +0200
Message-ID: <CAH6sp9PgJFSPRGxk9HEtJuVK8b_4oOfBLYeu4MUbhN-UkonnCA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: powernv_flash: Use WARN_ON_ONCE() rather
 than BUG_ON()
To: Cyril Bur <cyrilbur@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 stewart@linux.vnet.ibm.com, benh@kernel.crashing.org, alistair@popple.id.au,
 David Woodhouse <dwmw2@infradead.org>, rlippert@google.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 12, 2017 at 6:22 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> BUG_ON() should be reserved in situations where we can not longer
> guarantee the integrity of the system. In the case where
> powernv_flash_async_op() receives an impossible op, we can still
> guarantee the integrity of the system.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index f5396f26ddb4..a9a20c00687c 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -78,7 +78,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
>                 rc = opal_flash_erase(info->id, offset, len, token);
>                 break;
>         default:
> -               BUG_ON(1);
> +               WARN_ON_ONCE(1);
> +               return -EIO;

Based on the fact that all three values in enum flash_op are handled,
I would go as far as stating that the default lemma adds no value and
can be removed.

Frans
