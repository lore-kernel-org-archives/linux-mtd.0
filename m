Received: from mail-oa0-f52.google.com ([209.85.219.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0atH-00074B-8F
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 17:56:35 +0000
Received: by mail-oa0-f52.google.com with SMTP id o6so559803oag.11
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 09:56:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <009d01cf01ea$f4ef4410$decdcc30$%han@samsung.com>
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
 <009d01cf01ea$f4ef4410$decdcc30$%han@samsung.com>
Date: Tue, 7 Jan 2014 18:56:13 +0100
Message-ID: <CACRpkdZJRFZYzVnKm68EZw7ahJUV2X6ctdhF5iFc5PaT20_7nA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] mtd: fsmc_nand: use dev_warn() instead of printk()
From: Linus Walleij <linus.walleij@linaro.org>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 4:31 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Use dev_warn() instead of printk() to provide a better message
> to userspace.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
