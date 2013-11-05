Received: from mail-ve0-x22a.google.com ([2607:f8b0:400c:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdhRf-0003KL-VM
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 14:17:28 +0000
Received: by mail-ve0-f170.google.com with SMTP id oy12so2552199veb.29
 for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2013 06:17:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52785CF5.80809@freescale.com>
References: <CAOMZO5Bciab5+FoJ1q45+wUt8Kxw=+2na552KwqS9Z7yqbp+UA@mail.gmail.com>
 <52785CF5.80809@freescale.com>
Date: Tue, 5 Nov 2013 12:17:03 -0200
Message-ID: <CAOMZO5Djx5C9oV2GHWuN-M9cqXRAaP0axwcgwiAc4R3N2DSRWQ@mail.gmail.com>
Subject: Re: gpmi_nand crashes on mx23
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, Nov 5, 2013 at 12:50 AM, Huang Shijie <b32955@freescale.com> wrote:
> could you email the uboot for imx23?
>
> I have not touched the imx23 board for a long long time.

Please use U-boot 2013.10 and follow these steps to flash U-boot
binary into the SD:
http://git.denx.de/?p=u-boot.git;a=blob;f=doc/README.mxs;h=2919bbfee13fdd12096a611c26664a4a6cb7b91a;hb=HEAD

Regards,

Fabio Estevam
