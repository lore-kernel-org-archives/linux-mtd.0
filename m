Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKn8x-0004kz-Hi
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2013 09:59:44 +0000
Received: by mail-ie0-f174.google.com with SMTP id aq17so7061299iec.33
 for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2013 02:59:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1364124453-899-1-git-send-email-alex@digriz.org.uk>
References: <1364124453-899-1-git-send-email-alex@digriz.org.uk>
Date: Wed, 27 Mar 2013 06:59:42 -0300
Message-ID: <CALF0-+W0L_6=+Ee0rE=0HdnbzQBR3zobow7bERXdVqmT+Q93vw@mail.gmail.com>
Subject: Re: [PATCH] mtd: plat_nand: add further DT bindings and documentation
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Alexander Clouter <alex@digriz.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Sun, Mar 24, 2013 at 8:27 AM, Alexander Clouter <alex@digriz.org.uk> wrote:
> The plat_nand driver has some devicetree support but it is currently
> unusable, especially as there is no documentation on how to use it.
>
> This patch adds the much needed documentation as well as adds some common
> properties (bank-width, chip-delay, bbt-use-flash and nr-chips) removing
> further use of the platform_nand_data struct.
>
> Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
> ---
>  .../devicetree/bindings/mtd/plat-nand.txt          |   93 ++++++++++++++++++++
>  drivers/mtd/nand/plat_nand.c                       |   53 ++++++++---
>  2 files changed, 134 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/plat-nand.txt
>

What's the difference between this patch, and the one you've sent
before with the same patch commit message?

-- 
    Ezequiel
