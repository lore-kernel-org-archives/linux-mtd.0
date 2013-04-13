Received: from mail-vb0-x230.google.com ([2607:f8b0:400c:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQzfF-0003go-Oj
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 12:34:42 +0000
Received: by mail-vb0-f48.google.com with SMTP id p13so2734006vbe.21
 for <linux-mtd@lists.infradead.org>; Sat, 13 Apr 2013 05:34:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1365836798-29035-2-git-send-email-shc_work@mail.ru>
References: <1365836798-29035-1-git-send-email-shc_work@mail.ru>
 <1365836798-29035-2-git-send-email-shc_work@mail.ru>
Date: Sat, 13 Apr 2013 09:34:37 -0300
Message-ID: <CAOMZO5CVtOEUk9i7LuXU+Td7qeMHfwYBwk+NZW0S-PYXfYZWsg@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: nand-gpio: Using resource-managed functions
From: Fabio Estevam <festevam@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 13, 2013 at 4:06 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> -       res1 = gpio_nand_get_io_sync(dev);
> -       if (res1) {
> -               gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
> +       res = gpio_nand_get_io_sync(pdev);
> +       if (res) {
> +               gpiomtd->io_sync = devm_request_and_ioremap(&pdev->dev, res);

Documentation/driver-model/devres.txt says

devm_request_and_ioremap() : obsoleted by devm_ioremap_resource()
