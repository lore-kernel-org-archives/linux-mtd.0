Received: from mail-ob0-f178.google.com ([209.85.214.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0asj-00071y-BT
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 17:56:01 +0000
Received: by mail-ob0-f178.google.com with SMTP id uz6so515441obc.37
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 09:55:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <009301cf01e8$e3eec430$abcc4c90$%han@samsung.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
 <009301cf01e8$e3eec430$abcc4c90$%han@samsung.com>
Date: Tue, 7 Jan 2014 18:55:37 +0100
Message-ID: <CACRpkdZQe7wiFkKL0a4FOqPpejK2De=Ov0tJ8qXCoNqRvaVwMw@mail.gmail.com>
Subject: Re: [PATCH 16/23] mtd: fsmc_nand: Remove unnecessary OOM messages
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

On Thu, Dec 26, 2013 at 4:16 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
