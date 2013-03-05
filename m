Received: from mail-ia0-x230.google.com ([2607:f8b0:4001:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCl3L-0002qT-TT
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 06:08:45 +0000
Received: by mail-ia0-f176.google.com with SMTP id i18so5649594iac.21
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 22:08:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
Date: Tue, 5 Mar 2013 14:08:41 +0800
Message-ID: <CAMiH66GvpQZ36wLvB_cyiSk79sPPJ+vBKba1Z6WZvi5UD4X=2g@mail.gmail.com>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
From: Huang Shijie <shijie8@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 5, 2013 at 12:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
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
>
We can add a new helper like compare_nand_with_devid() to remove the
mfr_id and dev_id, only left the id[8].

The compare_nand_with_devid() can be used in places where your patch
11 does. For example:
   ..............................................................
        if (id == nand_flash_ids[i].dev_id) {

   changed to:

        if (compare_nand_with_devid(id)){

  ...............................................................

By this way, we can remove the mfr_id and dev_id.


thanks
Huang Shijie
