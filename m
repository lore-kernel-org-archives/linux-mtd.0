Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjPUk-0002Si-1U
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 09:24:47 +0000
Received: by mail-wi0-f172.google.com with SMTP id bs8so1085737wib.11
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 02:24:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412259404-5202-1-git-send-email-lisovy@merica.cz>
References: <542D46A1.9090905@ti.com>
 <1412259404-5202-1-git-send-email-lisovy@merica.cz>
Date: Wed, 29 Oct 2014 10:24:23 +0100
Message-ID: <CAH6sp9M0VaH8-4NXcRNUYQS8Zuzbkra6zmgjSebjv8Awj6i0og@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: nand: omap: Synchronize the access to the ECC
 engine
From: Frans Klaver <fransklaver@gmail.com>
To: Rostislav Lisovy <lisovy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Rostislav Lisovy <lisovy@merica.cz>, Tony Lindgren <tony@atomide.com>,
 sojkam1@fel.cvut.cz,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, michal.vokac@comap.cz,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 2, 2014 at 4:16 PM, Rostislav Lisovy <lisovy@gmail.com> wrote:
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index f0dcdb6..dfae46f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -144,8 +144,13 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
>         0xac, 0x6b, 0xff, 0x99, 0x7b};
>  static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
>
> +/* Shared among all NAND instances to synchronize the access to the ECC Engine */
> +struct nand_hw_control omap_gpmc_controller = {
> +       .lock = __SPIN_LOCK_UNLOCKED(omap_gpmc_controller.lock),
> +       .wq = __WAIT_QUEUE_HEAD_INITIALIZER(omap_gpmc_controller.wq),
> +};
> +

Any reason not to make this one static?

Thanks,
Frans
