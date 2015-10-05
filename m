Received: from mail-ob0-f172.google.com ([209.85.214.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj0QL-0006L2-Oy
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2015 07:43:06 +0000
Received: by obcgx8 with SMTP id gx8so122198932obc.3
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2015 00:42:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1443782422-4515-2-git-send-email-sr@denx.de>
References: <1443782422-4515-1-git-send-email-sr@denx.de>
 <1443782422-4515-2-git-send-email-sr@denx.de>
Date: Mon, 5 Oct 2015 09:42:44 +0200
Message-ID: <CACRpkdZsmTznS=9dF3bm8+1CZs3pD6zoetGmn08UeMNRH-gXoA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: nand: fsmc: Remove BUG macros
From: Linus Walleij <linus.walleij@linaro.org>
To: Stefan Roese <sr@denx.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 2, 2015 at 12:40 PM, Stefan Roese <sr@denx.de> wrote:

> Remove the BUG macros and return with error (if possible) instead.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
