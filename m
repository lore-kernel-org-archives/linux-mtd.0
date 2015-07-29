Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKav2-0007rm-53
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 23:37:52 +0000
Received: by igbij6 with SMTP id ij6so155958395igb.1
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jul 2015 16:37:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 30 Jul 2015 09:37:07 +1000
Message-ID: <CAGRGNgUKU5y+qN+dJ0YhGzMPKxTfJMSrqnmniMZ1831SY_Ty5A@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 4/4] mtd: nand: print full chip ID
To: Hans de Goede <hdegoede@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hans, Michal,

On Thu, Jul 30, 2015 at 3:53 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> From: Michal Suchanek <hramrach@gmail.com>
>
> Full chip ID is printed so user has data to paste from syslog in case
> of chip misidentification.
>
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mtd/nand/nand_base.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e2e2690..13e9938 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4243,7 +4243,7 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
>  }
>
>  static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
> -                  struct nand_flash_dev *type, u8 *id_data, int *busw)
> +                  struct nand_flash_dev *type, const u8 *id_data, int *busw)

Should this be in another patch?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
