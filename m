Received: from mail-ob0-f173.google.com ([209.85.214.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtvvl-0003QT-MB
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 08:59:38 +0000
Received: by mail-ob0-f173.google.com with SMTP id gq1so2391011obb.4
 for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2013 00:59:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <001801cefd5c$09d42640$1d7c72c0$%han@samsung.com>
References: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
 <001801cefd5c$09d42640$1d7c72c0$%han@samsung.com>
Date: Fri, 20 Dec 2013 09:59:13 +0100
Message-ID: <CACRpkdZ-HNvrs4KDzDA3x9s+4_-MN-8NvmiXbdc5jrEPTVgKbw@mail.gmail.com>
Subject: Re: [PATCH 2/4] mtd: fsmc_nand: use dev_warn() instead of printk()
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

On Fri, Dec 20, 2013 at 9:18 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Use dev_warn() instead of printk() to provide a better message
> to userspace.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
