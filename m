Received: from mail-vc0-f174.google.com ([209.85.220.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAHrp-0006vL-T3
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 11:06:54 +0000
Received: by mail-vc0-f174.google.com with SMTP id gd11so1318942vcb.5
 for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2013 04:06:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376637633-12540-1-git-send-email-shc_work@mail.ru>
References: <1376637633-12540-1-git-send-email-shc_work@mail.ru>
Date: Fri, 16 Aug 2013 08:06:29 -0300
Message-ID: <CAOMZO5Cr7t3YE_H4N9RWhJDz3GOnkGXDw_dPJ5Hhxs427AsHAg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] mtd: nand: gpio: Use devm_gpio_request_one() where
 possible
From: Fabio Estevam <festevam@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 4:20 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

You are not doing only what you describe in the Subject line.

It would be nice to provide a commit log.
