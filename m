Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCbK9-0003wd-C4
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 19:45:26 +0000
Received: by mail-ve0-f172.google.com with SMTP id cz11so5040928veb.31
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 11:45:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 11:45:23 -0800
Message-ID: <CAN8TOE_Sb-h7zTp4rUCrx5e0rZHg44iDMM5_zKsgHQORXf3B0g@mail.gmail.com>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  include/linux/mtd/nand.h |   12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7af6600..951ea0d 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -559,7 +559,9 @@ struct nand_chip {
>  /**
>   * struct nand_flash_dev - NAND Flash Device ID Structure
>   * @name:      Identify the device type
> - * @dev_id:    device ID code
> + * @mfr_id:     manufecturer ID part of the full chip ID array (byte 0)
> + * @dev_id:     device ID part of the full chip ID array (byte 1)
> + * @id:         full device ID array
>   * @pagesize:  Pagesize in bytes. Either 256 or 512 or 0
>   *             If the pagesize is 0, then the real pagesize
>   *             and the eraseize are determined from the
> @@ -570,7 +572,13 @@ struct nand_chip {
>   */
>  struct nand_flash_dev {
>         char *name;
> -       int dev_id;
> +       union {
> +               struct {
> +                       uint8_t mfr_id;
> +                       uint8_t dev_id;
> +               };
> +               uint8_t id[8];
> +       };

I'm sorry that I was unable to fully review Huang's code while it was
being discussed earlier. But from what I read, it seemed there was
some disagreement on some of the format of the tables (e.g., Artem
wondered why the extra zeroes). Now, it seems like instead, we're
including duplicate fields. The "mfr_id" and "dev_id" are always the
first two bytes of the "id[8]" field. Does it make sense to repeat
them? And I actually don't ever see where "mfr_id" would be used.

There's also the (yet unanswered?) question of whether we reasonably
would handle in this table both those chips which have their full
information listed in conjunction with their 8-byte ID string and
those chips with minimal information in the table, and the rest must
be decoded from extended ID.

Perhaps the answer to this last question was already assumed to be
"yes." But how would we differentiate the two types of table entries?
Simply by seeing whether they filled out "dev_id" vs. "id[8]"? This
patch doesn't clearly show how the new fields could be used.

Hopefully my comments make some sense. If they don't, then that
probably means we need some more discussion before including this last
patch. If they do make sense, then that probably still means this last
patch needs to be rewritten and/or included only along with a series
that can reasonably make use of these fields (like Huang's series).

>         unsigned long pagesize;
>         unsigned long chipsize;
>         unsigned long erasesize;

Thanks,
Brian
